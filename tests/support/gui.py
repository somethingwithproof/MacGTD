"""Execute installed Automator bundles and drive their real dialogs."""
from contextlib import contextmanager
import os
from pathlib import Path
import shutil
import signal
import subprocess
import tempfile
import uuid

from support.common import RESULTS, osa, command


@contextmanager
def installed(source):
    services = Path.home() / "Library/Services"
    services.mkdir(parents=True, exist_ok=True)
    # Never replace/delete a user's installed service of the same name.
    target = services / f"MacGTD-E2E-{uuid.uuid4().hex}.workflow"
    try:
        shutil.copytree(source, target)
        yield target
    finally:
        if target.exists():
            shutil.rmtree(target)


def dialog(text=None, button="OK", expected="", step=""):
    source = '''on run argv
        set expectedTitle to item 1 of argv
        set buttonTitle to item 2 of argv
        set fieldText to item 3 of argv
        set hasField to item 4 of argv
        set stepText to item 5 of argv
        set lastFailure to "No matching dialog"
        tell application "System Events"
            repeat 80 times
                repeat with p in (application processes whose name is "com.apple.automator.runner" or name is "Automator Runner" or name is "Automator")
                    set candidateWindows to {}
                    with timeout of 2 seconds
                        try
                            set candidateWindows to windows of p
                        on error messageText
                            set lastFailure to messageText
                        end try
                    end timeout
                    repeat with w in candidateWindows
                        -- An unnamed or stale AX window must not hide another live dialog.
                        with timeout of 2 seconds
                            try
                                if name of w is expectedTitle then
                                    set correctStep to true
                                    if stepText is not "" then
                                        set allText to value of every static text of w as text
                                        set correctStep to allText contains stepText
                                    end if
                                    if correctStep then
                                        if hasField is "yes" then set value of text field 1 of w to fieldText
                                        click button buttonTitle of w
                                        return "clicked"
                                    end if
                                    set lastFailure to "Waiting for expected review step"
                                end if
                            on error messageText
                                set lastFailure to messageText
                            end try
                        end timeout
                    end repeat
                end repeat
                delay 0.25
            end repeat
        end tell
        error "Expected Automator dialog did not respond: " & expectedTitle & ": " & lastFailure
    end run'''
    osa(source, expected, button, text or "", "yes" if text is not None else "no", step, timeout=40)


def workflow(source, responses=(), cancel=False):
    with installed(source) as target, tempfile.TemporaryFile(mode="w+") as output:
        process = subprocess.Popen(["automator", str(target)], stdout=output, stderr=output,
                                   start_new_session=True, text=True)
        try:
            for response in responses:
                dialog(**response)
            code = process.wait(timeout=90)
            if code and not cancel:
                raise AssertionError(f"Automator failed ({code}); see test-results/automator.log")
        except Exception:
            command("/usr/sbin/screencapture", "-x", RESULTS / "desktop-failure.png", check=False, timeout=5)
            command("ps", "-axo", "pid,ppid,comm", check=False)
            try:
                osa('''tell application "System Events"
                    set resultText to ""
                    repeat with p in application processes
                        with timeout of 2 seconds
                            try
                                set resultText to resultText & (name of p) & ": " & (name of every window of p as text) & return
                            on error msg
                                set resultText to resultText & (name of p) & ": " & msg & return
                            end try
                        end timeout
                    end repeat
                    return resultText
                end tell''', timeout=20)
            except AssertionError:
                pass
            raise
        finally:
            if process.poll() is None:
                os.killpg(process.pid, signal.SIGKILL)
                process.wait()
            output.seek(0)
            log = output.read()
            RESULTS.mkdir(exist_ok=True)
            with (RESULTS / "automator.log").open("a") as stream:
                stream.write(f"{source.name}: exit {process.returncode}\n{log}\n")
        return log
