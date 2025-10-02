all: build create-package

build:
	nix-build -E 'with import <nixpkgs> {}; pkgsCross.aarch64-multiplatform.pkgsStatic.haskellPackages.callPackage ./default.nix {}'

create-package:
	termux-create-package package.json
