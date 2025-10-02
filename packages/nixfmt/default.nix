# This file has been autogenerate with cabal2nix.
# Update via ./update.sh
{ pkgs, lib, ... }:
pkgs.pkgsStatic.haskellPackages.mkDerivation {
  pname = "nixfmt";
  version = "1.0.0";
  src = pkgs.fetchzip {
    url = "https://github.com/nixos/nixfmt/archive/v1.0.0.tar.gz";
    sha256 = "0iy2p893b2b5y4mvhy0d62675a7nd8fc6jm9mr32v9h2baj9ii3p";
  };
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = with pkgs.pkgsMusl.haskellPackages; [
    base
    megaparsec
    mtl
    parser-combinators
    pretty-simple
    scientific
    text
    transformers
  ];
  executableHaskellDepends = with pkgs.pkgsMusl.haskellPackages; [
    base
    bytestring
    cmdargs
    directory
    file-embed
    filepath
    process
    safe-exceptions
    text
    transformers
    unix
  ];
  configureFlags = [
    "--ghc-option=-optl=-static"
    "--extra-lib-dirs=${pkgs.gmp.override { withStatic = true; }}/lib"
    "--extra-lib-dirs=${
      pkgs.libffi.overrideAttrs (old: {
        dontDisableStatic = true;
      })
    }/lib"
  ];
  enableSharedExecutables = false;
  enableSharedLibraries = false;
  jailbreak = true;
  homepage = "https://github.com/NixOS/nixfmt";
  description = "Official formatter for Nix code";
  license = lib.licenses.mpl20;
  mainProgram = "nixfmt";
}
