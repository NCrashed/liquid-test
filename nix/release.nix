let
  nixpkgs = import ./pkgs.nix;
  project = import ((nixpkgs {}).fetchFromGitHub {
    owner = "NCrashed";
    repo = "haskell-nix";
    rev = "0c1c27a22daa78d359d7704448e4c6e2512cde5d";
    sha256  = "1wbf40lr4bgf0b00dmqdq299j9llngxr38zp4y4qv9j5rl4hlcz1";
  }) { inherit nixpkgs; };
in project {
  packages = {
    liquidhaskell-test = ../.;
  };
  shellTools = pkgs: with pkgs.haskellPackages; [
    cabal-install
    ghcid
  ];
  overlays = [
    (import ./haskell/pkgs-overlay.nix)
  ];
}
