self: super:
let
  ghc-override = import "${import ./project.nix}/lib/ghc-override.nix";
  pkgs = self;
in
ghc-override "ghc8102" ( self: super: {
  liquidhaskell-test = pkgs.addLiquidSolver super.liquidhaskell-test;
}) super
