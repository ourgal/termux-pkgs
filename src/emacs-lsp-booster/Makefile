all: build create-package

build:
	nix-build -E 'with import <nixpkgs> {}; pkgsCross.aarch64-multiplatform.pkgsStatic.emacs-lsp-booster'

create-package:
	termux-create-package package.json
