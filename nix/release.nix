let
  nixpkgs = import ./pkgs.nix;
  project = import (import ./project.nix) { inherit nixpkgs; };
in project {
  packages = {
    liquidhaskell-test = ../.;
  };
  shellTools = pkgs: with pkgs.haskellPackages; [
    cabal-install
    ghcid
    pkgs.z3
  ];
  shellHook = pkgs: ''
    configureFlags=--extra-lib-dirs=${pkgs.z3.lib}/lib # Or liquid plugin won't find z3 executable
  '';
  overlays = [
    (import ./haskell/pkgs-overlay.nix)
  ];
  overlaysAfter = [
    (import ./solver.nix)
  ];
  compiler = "ghc8102";
}
