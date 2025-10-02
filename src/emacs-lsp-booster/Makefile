VERSION := $(shell cargo info --registry crates-io emacs-lsp-booster | grep ^version | cut -d ' ' -f 2)

all: install update-version create-package clean

install:
	cargo install emacs-lsp-booster

update-version:
	jq '.control.Version = "$(VERSION)"' package.json | sponge package.json

create-package:
	termux-create-package package.json

clean:
	cargo uninstall emacs-lsp-booster
