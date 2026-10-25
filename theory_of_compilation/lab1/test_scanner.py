import io
import os
from contextlib import redirect_stdout

from scanner import Scanner

for name in sorted(os.listdir("examples")):
    if not name.startswith("example"):
        continue

    text = open("examples/" + name).read()
    errors = io.StringIO()
    with redirect_stdout(errors):
        actual = [f"({tok.lineno}): {tok.type}({tok.value})" for tok in Scanner().tokenize(text)]

    ok = errors.getvalue() == ""

    result = "examples/result" + name[len("example"):].split(".")[0] + ".txt"
    if os.path.exists(result):
        expected = [line.strip() for line in open(result) if line.strip()]
        ok = ok and actual == expected

    print(("OK   " if ok else "FAIL ") + name)
    if errors.getvalue():
        print(errors.getvalue(), end="")
