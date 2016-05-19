NAME    := fry
VERSION := 0.1.6
AUTHOR  := terlar
URL     := https://github.com/$(AUTHOR)/$(NAME)

# Packaging
PKG_DIR  := pkg
PKG_NAME := $(NAME)-$(VERSION)
PKG      := $(PKG_DIR)/$(PKG_NAME).tar.gz
SIG      := $(PKG_DIR)/$(PKG_NAME).tar.gz.asc

# Installation directories
PREFIX  ?= /usr
DESTDIR ?= 
FISHDIR ?= $(PREFIX)/share/fish
MANDIR  ?= $(PREFIX)/share/fish/man

CONF_DIR     ?= "/vendor_conf.d"
COMPLETE_DIR ?= "/vendor_completions.d"
FUNCTION_DIR ?= "/vendor_functions.d"

CONF_FILES     := $(wildcard conf.d/*.fish)
COMPLETE_FILES := $(wildcard completions/*.fish)
FUNCTION_FILES := $(wildcard functions/*.fish)

pkg:
	mkdir $(PKG_DIR)

download: pkg
	wget -O $(PKG) $(URL)/archive/v$(VERSION).tar.gz

.PHONY: build
build: pkg
	git archive --output=$(PKG) --prefix=$(PKG_NAME)/ HEAD

.PHONY: sign
sign: $(PKG)
	gpg --sign --detach-sign --armor $(PKG)
	git add $(PKG).asc
	git commit $(PKG).asc -m "Added PGP signature for v$(VERSION)"
	git push

.PHONY: verify
verify: $(PKG) $(SIG)
	gpg --verify $(SIG) $(PKG)

.PHONY: clean
clean:
	rm -f $(PKG) $(SIG)

.PHONY: all
all: $(PKG) $(SIG)

.PHONY: test
test:
	fish test/runner.fish

.PHONY: tag
tag:
	git push
	git tag -s -m "Tagging $(VERSION)" v$(VERSION)
	git push --tags

.PHONY: release
release: tag download sign

.PHONY: user-install
user-install:
	$(MAKE) install \
		FISHDIR=$$HOME/.config/fish \
		MANDIR=$$HOME/.local/man \
		CONF_DIR="/conf.d" \
		COMPLETE_DIR="/completions" \
		FUNCTION_DIR="/functions"

.PHONY: install
install:
	install -m 755 -d "$(DESTDIR)$(MANDIR)"
	install -m 755 -d "$(DESTDIR)$(MANDIR)/man1"
	install -m 755 -d "$(DESTDIR)$(FISHDIR)"
	install -m 755 -d "$(DESTDIR)$(FISHDIR)$(CONF_DIR)"
	install -m 755 -d "$(DESTDIR)$(FISHDIR)$(COMPLETE_DIR)"
	install -m 755 -d "$(DESTDIR)$(FISHDIR)$(FUNCTION_DIR)"
	install -m 644 man/man1/fry.1 "$(DESTDIR)$(MANDIR)/man1/fry.1"
	for i in $(CONF_FILES:%='%'); do \
		install -m 644 $$i "$(DESTDIR)$(FISHDIR)$(CONF_DIR)/"; \
		true; \
	done;
	for i in $(COMPLETE_FILES:%='%'); do \
		install -m 644 $$i "$(DESTDIR)$(FISHDIR)$(COMPLETE_DIR)/"; \
		true; \
	done;
	for i in $(FUNCTION_FILES:%='%'); do \
		install -m 644 $$i "$(DESTDIR)$(FISHDIR)$(FUNCTION_DIR)/"; \
		true; \
	done;
	
.PHONY: user-uninstall
user-uninstall:
	$(MAKE) uninstall \
		FISHDIR=$$HOME/.config/fish \
		MANDIR=$$HOME/.local/man \
		CONF_DIR="/conf.d" \
		COMPLETE_DIR="/completions" \
		FUNCTION_DIR="/functions"

.PHONY: uninstall
uninstall:
	-if test -d "$(DESTDIR)$(FISHDIR)$(CONF_DIR)"; then \
		for i in $(CONF_FILES); do \
			basename=`basename $$i`; \
			if test -f "$(DESTDIR)$(FISHDIR)$(CONF_DIR)/$$basename"; then \
				rm "$(DESTDIR)$(FISHDIR)$(CONF_DIR)/$$basename"; \
			fi; \
		done; \
	fi;
	-if test -d "$(DESTDIR)$(FISHDIR)$(COMPLETE_DIR)"; then \
		for i in $(COMPLETE_FILES); do \
			basename=`basename $$i`; \
			if test -f "$(DESTDIR)$(FISHDIR)$(COMPLETE_DIR)/$$basename"; then \
				rm "$(DESTDIR)$(FISHDIR)$(COMPLETE_DIR)/$$basename"; \
			fi; \
		done; \
	fi;
	-if test -d "$(DESTDIR)$(FISHDIR)$(FUNCTION_DIR)"; then \
		for i in $(FUNCTION_FILES); do \
			basename=`basename $$i`; \
			if test -f "$(DESTDIR)$(FISHDIR)$(FUNCTION_DIR)/$$basename"; then \
				rm "$(DESTDIR)$(FISHDIR)$(FUNCTION_DIR)/$$basename"; \
			fi; \
		done; \
	fi;
	rm "$(DESTDIR)$(MANDIR)/man1/fry.1"

.DEFAULT_GOAL:=build
