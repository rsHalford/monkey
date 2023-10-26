{
  description = "Monkey Programming Language";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
        with pkgs; {
          devShell = pkgs.mkShell {
            buildInputs = with pkgs; [
              golangci-lint
              gopls
            ];
          };
        }
    );
}
