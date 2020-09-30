self: super:
let
  ghc-override = import "${import ./project.nix}/lib/ghc-override.nix";
  lib  = self.haskell.lib;
  addSystemLibs = drv: xs: lib.overrideCabal drv (drv: { librarySystemDepends = (drv.librarySystemDepends or []) ++ xs; });
  addSolver = drv: addSystemLibs drv [self.z3];
  dontHaddock = lib.dontHaddock;
in
ghc-override "ghc8102" ( self: super: {
  liquidhaskell-test = dontHaddock (addSolver super.liquidhaskell-test);
}) super
