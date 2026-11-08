import io
import os
from contextlib import redirect_stdout

from scanner import Scanner
from parser import Mparser

for name in sorted(os.listdir(".")):
    if not name.startswith("example"):
        continue

    text = open(name).read()
    errors = io.StringIO()
    with redirect_stdout(errors):
        Mparser().parse(Scanner().tokenize(text))

    print(("OK   " if errors.getvalue() == "" else "FAIL ") + name)
    if errors.getvalue():
        print(errors.getvalue(), end="")
