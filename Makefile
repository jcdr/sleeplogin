PRG=sleeplogin
PKG=
CFLAGS+=-std=gnu11 -Wall -Wextra -Wshadow -Werror -pedantic-errors -O6
LDFLAGS+=

SRC=$(shell find -type f -iname "*.c")
HDR=$(shell find -type f -iname "*.h")
OBJ=$(patsubst %.c,%.o,$(SRC))

ifneq (,$(PKG))
PKG_CONFIG?=pkg-config
CFLAGS+=$(shell $(PKG_CONFIG) --cflags $(PKG))
LDFLAGS+=$(shell $(PKG_CONFIG) --libs $(PKG))
endif

INSTALL?=install
PREFIX?=/usr/local

# Use V=1 to show verboses commands.
override P:=$(if $(V),@true,@echo)
override V:=$(if $(V),,@)

all: $(PRG)

$(PRG)::  $(OBJ)
	$(P) "  LINK  $@"
	$(V) $(CC) -o $@ $^ $(LDFLAGS)

%.o: %.c
	$(V) mkdir -p $(dir $@)
	$(P) "  CC    $@"
	$(V) $(CC) $(CFLAGS) -c -o $@ $<

.PHONY: install clean distclean

install: $(PRG)
	$(P) "  INSTALL"
	$(V) $(INSTALL) -D -v -m 0744 $(PRG) $(PREFIX)/bin/$(PRG)

clean:
	$(P) "  CLEAN"
	$(V) $(RM) $(PRG) $(OBJ)

distclean: clean
	$(P) "  DISTCLEAN"
	$(V) $(RM) *.o *.xz *~

.DEFAULT:
	@true
