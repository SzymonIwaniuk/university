JAVA_HOME ?= /opt/homebrew/opt/openjdk
JAVAC = $(JAVA_HOME)/bin/javac
JAVA = $(JAVA_HOME)/bin/java
PYTHON ?= uv run python  # matplotlib and numpy come from the repo uv project

.PHONY: build bench plot clean

build:
	$(JAVAC) -d out src/*.java

bench: build
	mkdir -p csv
	$(JAVA) -cp out Main csv | tee bench.log

plot:
	$(PYTHON) scripts/plot.py

clean:
	rm -rf out
