import os
from pathlib import Path
import signal
import subprocess
import time

ROOT = Path(__file__).resolve().parents[2]
RESULTS = ROOT / "test-results"


def command(*args, timeout=60, input=None, check=True, cwd=ROOT, strip=True, env=None, log_output=True):
    """Bound execution and kill the process group, including hung dialog children."""
    process = subprocess.Popen([str(a) for a in args], cwd=cwd, stdin=subprocess.PIPE,
                               stdout=subprocess.PIPE, stderr=subprocess.PIPE,
                               text=True, start_new_session=True, env=env)
    timed_out = False
    try:
        stdout, stderr = process.communicate(input, timeout=timeout)
    except subprocess.TimeoutExpired:
        os.killpg(process.pid, signal.SIGKILL)
        stdout, stderr = process.communicate()
        timed_out = True
    RESULTS.mkdir(exist_ok=True)
    with (RESULTS / "commands.log").open("a") as log:
        # Inputs may be task text; this harness uses synthetic data only.
        log.write(f"{args[0]} (exit {process.returncode})\n")
        if log_output:
            log.write(f"{stdout}\n{stderr}\n")
    if timed_out:
        raise AssertionError(f"Timed out after {timeout}s: {args[0]}\n{stdout}\n{stderr}")
    if check and process.returncode:
        raise AssertionError(f"{args[0]} exited {process.returncode}\n{stdout}\n{stderr}")
    return (stdout.strip() if strip else stdout), process.returncode


def osa(source, *args, **kwargs):
    return command("osascript", "-", *args, input=source, **kwargs)[0]


def wait_for(predicate, timeout=15):
    end = time.monotonic() + timeout
    while time.monotonic() < end:
        if predicate():
            return
        time.sleep(0.25)
    raise AssertionError("Expected application state was not observed before timeout")


def dedicated():
    if os.environ.get("MACGTD_E2E_DEDICATED") != "1":
        raise AssertionError("Use a dedicated logged-in test Mac account and set MACGTD_E2E_DEDICATED=1")
    if osa('tell application "System Events" to return UI elements enabled') != "true":
        raise AssertionError("Accessibility permission is required for the runner")
