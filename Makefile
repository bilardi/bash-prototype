
BIN ?= my-script

$(BIN): test man

test:
	./$(BIN).sh -f

man:
	./$(BIN).sh -h > $(BIN).1.md; test true

.PHONY: test man
