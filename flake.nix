{
  description = "Gevulot Stuff";

  inputs.nixpkgs.url = "nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:

    # Add dependencies that are only needed for development
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = import nixpkgs {
            inherit system;
          };

          riscvPkgs = import nixpkgs {
              localSystem = "${system}";
              crossSystem = {
                  config = "riscv32-unknown-linux-gnu";
                  abi = "ilp32";
              };
          };
        in
        {
          devShells.default = pkgs.mkShell {
              buildInputs =
              [
                pkgs.rustup
                riscvPkgs.buildPackages.gcc
              ];
            };
        });
}
