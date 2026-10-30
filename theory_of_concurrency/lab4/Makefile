JAVA_HOME ?= /opt/homebrew/opt/openjdk
JAVAC = $(JAVA_HOME)/bin/javac
JAVA = $(JAVA_HOME)/bin/java
PYTHON ?= python3  # needs matplotlib and numpy

.PHONY: build bench plot clean

build:
	$(JAVAC) -d out src/*.java

bench: build
	mkdir -p csv
	$(JAVA) -cp out Main csv

plot:
	$(PYTHON) scripts/plot.py

clean:
	rm -rf out
