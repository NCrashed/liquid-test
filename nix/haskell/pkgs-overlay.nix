# Overrides for haskell packages
self: super:
let haskellOld = super.haskell;
    pkgs = self;
    lib  = self.haskell.lib;
    liquidSource = self.fetchgit (import ./liquid-src.nix);
    addSystemLibs = drv: xs: lib.overrideCabal drv (drv: { librarySystemDepends = (drv.librarySystemDepends or []) ++ xs; });
    addSolver = drv: addSystemLibs drv [self.z3];
    callLiquid = self: name: self.callCabal2nixWithOptions name liquidSource "--no-check --no-haddock --subpath ${name}" {};
    callLiquidRoot = self: name: self.callCabal2nixWithOptions name liquidSource "--no-check" {};
in rec {
  haskell = haskellOld // {
    packages = haskellOld.packages // {
      ghc8102 = haskellOld.packages.ghc8102.extend (self: super:
        let dirOverrides = lib.packagesFromDirectory {
                directory = ./pkgs;
              } self super;
            manualOverrides = {
              z3sys = pkgs.z3;
              liquid-base = addSolver (callLiquid self "liquid-base");
              liquid-bytestring = addSolver (callLiquid self "liquid-bytestring");
              liquid-containers = addSolver (callLiquid self "liquid-containers");
              liquid-fixpoint = callLiquid self "liquid-fixpoint";
              liquid-ghc-prim = addSolver (callLiquid self "liquid-ghc-prim");
              liquid-parallel = addSolver (callLiquid self "liquid-parallel");
              liquid-platform = callLiquid self "liquid-platform";
              liquid-prelude = addSolver (callLiquid self "liquid-prelude");
              liquid-vector = addSolver (callLiquid self "liquid-vector");
              liquidhaskell = callLiquidRoot self "liquidhaskell";
            };
        in dirOverrides // manualOverrides);
    };
  };
}
