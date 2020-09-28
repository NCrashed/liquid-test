# Overrides for haskell packages
self: super:
let haskellOld = super.haskell;
    pkgs = self;
    lib  = self.haskell.lib;
    addSystemLibs = drv: xs: lib.overrideCabal drv (drv: { librarySystemDepends = (drv.librarySystemDepends or []) ++ xs; });
    addSolver = drv: addSystemLibs drv [pkgs.z3];
in rec {
  haskell = haskellOld // {
    packages = haskellOld.packages // {
      ghc8102 = haskellOld.packages.ghc8102.extend (self: super:
        let dirOverrides = haskellOld.lib.packagesFromDirectory {
                directory = ./pkgs;
              } self super;
            manualOverrides = {
              liquid-ghc-prim = addSolver super.liquid-ghc-prim;
            };
        in dirOverrides // manualOverrides);
    };
  };
}
