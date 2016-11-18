
BIN ?= test
PREFIX ?= /usr/local
MANPREFIX ?= $(PREFIX)/share/man/man1

$(BIN): test man

test:
	./test.sh --functionals

install:
	cp $(BIN).sh $(PREFIX)/bin/$(BIN)
	cp $(BIN).1 $(MANPREFIX)/$(BIN).1

uninstall:
	rm -f $(PREFIX)/bin/$(BIN)
	rm -f $(MANPREFIX)/$(BIN).1

man:
	$(./$(BIN).sh --help > $(BIN).1.md)
	@curl -# -F page=@$(BIN).1.md -o $(BIN).1 http://mantastic.herokuapp.com
	@echo "$(BIN).1"
