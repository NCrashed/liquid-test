let
  nixpkgs = import ./pkgs.nix;
  project = import (import ./project.nix) { inherit nixpkgs; };
in project rec {
  packages = {
    liquidhaskell-test = ../.;
  };
  shellHook = pkgs: ''
    ${pkgs.addLiquidSolverHook}
  '';
  overlays = [ (import (import ./liquidhaskell.nix) { inherit compiler; }) ];
  overlaysAfter = [ (import ./solver.nix) ];
  compiler = "ghc8102";
}
