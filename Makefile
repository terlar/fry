NAME=fry
VERSION=0.1.6
AUTHOR=terlar
URL=https://github.com/$(AUTHOR)/$(NAME)

# Packaging
PKG_DIR=pkg
PKG_NAME=$(NAME)-$(VERSION)
PKG=$(PKG_DIR)/$(PKG_NAME).tar.gz
SIG=$(PKG_DIR)/$(PKG_NAME).tar.gz.asc

# Installation directories
PREFIX ?= /usr
DESTDIR ?= 
MANDIR ?= $(PREFIX)/share/man
FISHDIR ?= $(DESTDIR)$(PREFIX)/share/fish

COMPLETIONS_DIR_FILES := $(wildcard completions/*.fish)
FUNCTIONS_DIR_FILES := $(wildcard functions/*.fish)

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

.PHONY: install
install:
	install -D -m644 man/man1/fry.1 "$(DESTDIR)$(MANDIR)/man1/fry.1"
	install -D -m644 $(CURDIR)/conf.d/fry.fish $(FISHDIR)/vendor_conf.d/
	for i in $(COMPLETIONS_DIR_FILES:%='%'); do \
		install -D -m644 $$i $(FISHDIR)/vendor_completions.d/; \
		true; \
	done;
	for i in $(FUNCTIONS_DIR_FILES:%='%'); do \
		install -D -m644 $$i $(FISHDIR)/vendor_functions.d/; \
		true; \
	done;
	
.PHONY: uninstall
uninstall:
	-rm -f $(FISHDIR)/vendor_conf.d/fry.fish
	-if test -d $(FISHDIR)/vendor_completions.d; then \
		for i in $(COMPLETIONS_DIR_FILES); do \
			basename=`basename $$i`; \
			if test -f $(FISHDIR)/vendor_completions.d/$$basename; then \
				rm $(FISHDIR)/vendor_completions.d/$$basename; \
			fi; \
		done; \
	fi;
	-if test -d $(FISHDIR)/vendor_functions.d; then \
		for i in $(FUNCTIONS_DIR_FILES); do \
			basename=`basename $$i`; \
			if test -f $(FISHDIR)/vendor_functions.d/$$basename; then \
				rm $(FISHDIR)/vendor_functions.d/$$basename; \
			fi; \
		done; \
	fi;
	rm -rf $(MANDIR)/man1/fry.1

.DEFAULT_GOAL:=build
