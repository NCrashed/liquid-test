# Overrides for haskell packages
self: super:
let haskellOld = super.haskell;
    pkgs = self;
in rec {
  haskell = haskellOld // {
    packages = haskellOld.packages // {
      ghc883 = haskellOld.packages.ghc883.extend (self: super:
        let dirOverrides = haskellOld.lib.packagesFromDirectory {
                directory = ./pkgs;
              } self super;
            manualOverrides = {
            
            };
        in dirOverrides // manualOverrides);
    };
  };
}
