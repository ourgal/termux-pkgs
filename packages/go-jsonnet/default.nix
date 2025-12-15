{
  lib,
  fetchFromGitHub,
  testers,
  go-jsonnet,
  pkgs,
}:

pkgs.pkgsCross.aarch64-multiplatform.pkgsStatic.buildGoModule rec {
  pname = "go-jsonnet";
  version = "0.21.0";

  src = fetchFromGitHub {
    owner = "google";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-J92xNDpCidbiSsN6NveS6BX6Tx+qDQqkgm6pjk1wBTQ=";
  };

  vendorHash = "sha256-Uh2rAXdye9QmmZuEqx1qeokE9Z9domyHsSFlU7YZsZw=";

  subPackages = [ "cmd/jsonnet*" ];

  passthru.tests.version = testers.testVersion {
    package = go-jsonnet;
    version = "v${version}";
  };

  ldflags =
     [
      "-linkmode external"
      ''-extldflags "-static"''
    ];

  meta = {
    description = "Implementation of Jsonnet in pure Go";
    homepage = "https://github.com/google/go-jsonnet";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [
      nshalman
      aaronjheng
    ];
    mainProgram = "jsonnet";
  };
}
