# Overrides for haskell packages
self: super:
let haskellOld = super.haskell;
    pkgs = self;
    lib  = self.haskell.lib;
in rec {
  haskell = haskellOld // {
    packages = haskellOld.packages // {
      ghc8102 = haskellOld.packages.ghc8102.extend (self: super:
        let dirOverrides = lib.packagesFromDirectory {
                directory = ./pkgs;
              } self super;
            manualOverrides = {
              z3sys = pkgs.z3;
            };
        in dirOverrides // manualOverrides);
    };
  };
}
