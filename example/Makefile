BINDIR=../bin
INCDIR=../include
SRCDIR=src

SRCFILES=$(SRCDIR)/main.rbl
OFILES=$(SRCFILES:.rbl=.o)

TARGET=$(BINDIR)/example

.PHONY: all clean install
.DEFAULT: all
.PRECIOUS: Makefile

all: $(TARGET)

clean:
	rm -f $(TARGET) $(OFILES)

install: $(TARGET)
	cp $(TARGET) $(PREFIX)/lib

$(TARGET): $(OFILES)
	$(CC) -o $(TARGET) $(LDFLAGS) $(OFILES) $(LIBS)

%.o: %.rbl
	$(BINDIR)/rbl1 -c -o $@ $<
