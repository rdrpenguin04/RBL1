CC=gcc
PREFIX=/usr

CPPFLAGS=
CFLAGS=-g -fPIC $(shell sdl2-config --cflags) -Iinclude -Wno-incompatible-pointer-types
LDFLAGS=-shared
LIBS=$(shell sdl2-config --libs)

BINDIR=bin
INCDIR=include
SRCDIR=src

SRCFILES=$(SRCDIR)/main.c
HFILES=$(INCDIR)/pipeworks.h
OFILES=$(SRCFILES:.c=.o)

TARGET=$(BINDIR)/libpipeworks.so

.PHONY: all clean example exampleclean
.DEFAULT: all
.PRECIOUS: Makefile
.INTERMEDIATE: $(OFILES)
.DELETE_ON_ERROR:

all: $(TARGET)

clean:
	rm -f $(TARGET) $(OFILES)

install: $(TARGET)
	cp $(TARGET) $(PREFIX)/lib

$(TARGET): $(OFILES)
	$(CC) -o $(TARGET) $(LDFLAGS) $(OFILES) $(LIBS)

$(OFILES): $(HFILES)

example: $(TARGET)
	make -C example

exampleclean:
	make -C example clean

test: clean exampleclean all example
	sudo make install
	bin/example
