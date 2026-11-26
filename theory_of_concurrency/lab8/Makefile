JAVA_HOME ?= /opt/homebrew/opt/openjdk
JAVAC = $(JAVA_HOME)/bin/javac
JAVA = $(JAVA_HOME)/bin/java
PYTHON ?= uv run python  # matplotlib and numpy come from the repo uv project

.PHONY: build bench verify plot clean

build:
	$(JAVAC) -d out src/*.java

bench: build
	mkdir -p csv raport/img
	$(JAVA) -Djava.awt.headless=true -cp out Main csv raport/img/mandelbrot.png | tee bench.log

verify: build
	$(JAVA) -Djava.awt.headless=true -cp out Verify csv

plot:
	$(PYTHON) scripts/plot.py

clean:
	rm -rf out
