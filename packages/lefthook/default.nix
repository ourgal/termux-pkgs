{
  lib,
  fetchFromGitHub,
  installShellFiles,
  pkgs,
}:

let
  pname = "lefthook";
  version = "1.12.4";
in
pkgs.pkgsCross.aarch64-multiplatform.pkgsStatic.buildGoModule {
  inherit pname version;

  src = fetchFromGitHub {
    owner = "evilmartians";
    repo = "lefthook";
    rev = "v${version}";
    hash = "sha256-GP1pd+ZEJxArjWHtNM+wU/nCzQIvfqCIvRMcWc+iUiw=";
  };

  vendorHash = "sha256-n+5tIEI/s32w8oWws6loFrtc8CSb2d368uqKZRkVuJs=";

  nativeBuildInputs = [ installShellFiles ];

  ldflags = [
    "-s"
    "-w"
  ]
  ++ [
    "-linkmode external"
    ''-extldflags "-static"''
  ];

  doCheck = false;

  meta = {
    description = "Fast and powerful Git hooks manager for any type of projects";
    homepage = "https://github.com/evilmartians/lefthook";
    changelog = "https://github.com/evilmartians/lefthook/raw/v${version}/CHANGELOG.md";
    license = lib.licenses.mit;
    mainProgram = "lefthook";
    maintainers = with lib.maintainers; [ ];
  };
}
