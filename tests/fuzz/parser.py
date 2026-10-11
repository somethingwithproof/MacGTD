"""Fuzz the real parser without calling its record-creation entry point.

Atheris guides mutations through the Python oracle, not AppleScript bytecode.
Each sample reaches compiled production AppleScript with a process deadline.
"""
from pathlib import Path
import sys
import tempfile

import atheris

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from support.common import ROOT, command, osa

DRIVER = '''use AppleScript version "2.4"
use scripting additions
on run argv
    set parser to load script POSIX file (item 1 of argv)
    set inputText to item 2 of argv
    try
        set parsed to parser's parseTaskInput(inputText)
    on error messageText number errorNumber
        if errorNumber is not -2700 then error messageText number errorNumber
        if messageText is "Unsupported or invalid due date" or messageText is "Invalid ISO date" or messageText is "Invalid calendar date" or messageText starts with "Invalid time: " then return "rejected"
        error messageText number errorNumber
    end try
    if originalText of parsed is not inputText then error "Original input was changed"
    if priority of parsed < 0 or priority of parsed > 3 then error "Invalid priority"
    if hasDueTime of parsed and dueDate of parsed is missing value then error "Time without date"
    if context of parsed is not "" and context of parsed does not start with "@" then error "Invalid context"
    if item 3 of argv is not "" then
        if taskText of parsed is not item 3 of argv then error "Incorrect task title"
        if context of parsed is not item 4 of argv then error "Incorrect context"
        if project of parsed is not item 5 of argv then error "Incorrect project"
        if priority of parsed is not (item 6 of argv as integer) then error "Incorrect priority"
    end if
    return priority of parsed as text
end run
'''


@atheris.instrument_func
def test_one_input(data):
    text = data[:1024].decode("utf-8", errors="replace").replace("\0", "\uFFFD")
    expected = ["", "", "", "0"]
    marker = text.strip().removeprefix("Safe title ")
    if text.strip().startswith("Safe title "):
        if marker in ("!1", "!2", "!3"):
            expected = ["Safe title", "", "", marker[1]]
        elif marker == "@home":
            expected = ["Safe title", "@home", "", "0"]
        elif marker == "+work":
            expected = ["Safe title", "", "work", "0"]
    result = osa(DRIVER, COMPILED, text, *expected, timeout=10)
    if result == "rejected":
        return
    assert result in ("0", "1", "2", "3")
    if expected[0]:
        assert result == expected[3]


if __name__ == "__main__":
    with tempfile.TemporaryDirectory(prefix="macgtd-fuzz-") as directory:
        (ROOT / "test-results/fuzz").mkdir(parents=True, exist_ok=True)
        COMPILED = Path(directory) / "parser.scpt"
        command("osacompile", "-o", COMPILED,
                ROOT / "workflows/alfred/workflow/scripts/natural_language_task.scpt")
        atheris.Setup(sys.argv, test_one_input)
        atheris.Fuzz()
