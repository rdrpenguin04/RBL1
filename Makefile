CC=gcc
CXX=g++
PREFIX=/usr

CPPFLAGS=
CFLAGS=-g -Iinclude -Wno-incompatible-pointer-types
CXXFLAGS=-g
LDFLAGS=
LIBS=

BINDIR=bin
INCDIR=include
SRCDIR=src

SRCFILES=$(SRCDIR)/main.cpp
HFILES=$(INCDIR)/rbl1.h
OFILES=$(SRCFILES:.cpp=.o)

TARGET=$(BINDIR)/rbl1

.PHONY: all clean install example exampleclean
.DEFAULT: all
.PRECIOUS: Makefile

all: $(TARGET)

clean:
	rm -f $(TARGET) $(OFILES)

install: $(TARGET)
	cp $(TARGET) $(PREFIX)/lib

$(TARGET): $(OFILES)
	$(CXX) -o $(TARGET) $(LDFLAGS) $(OFILES) $(LIBS)

$(OFILES): $(HFILES)

example: $(TARGET)
	make -C example

exampleclean:
	make -C example clean
