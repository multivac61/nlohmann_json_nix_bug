{
  description = "C++ library packaged and consumed by nix";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable-small";
  };

  outputs = { self, nixpkgs, flake-parts }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-darwin" ];

      perSystem = { pkgs, system, ... }:
        {
          packages.default = pkgs.callPackage ./default.nix { };
          packages.with-fetch-content = pkgs.callPackage ./with-fetch-content.nix { };
        };
    };
}

