{ mkDerivation, base, Cabal, fetchgit, liquid-base, liquidhaskell
, parallel, stdenv
}:
mkDerivation {
  pname = "liquid-parallel";
  version = "3.2.2.0";
  src = fetchgit (import ../liquid-src.nix);
  postUnpack = "sourceRoot+=/liquid-parallel; echo source root reset to $sourceRoot";
  enableSeparateDataOutput = true;
  setupHaskellDepends = [ base Cabal liquidhaskell ];
  libraryHaskellDepends = [ liquid-base liquidhaskell parallel ];
  homepage = "https://github.com/ucsd-progsys/liquidhaskell";
  description = "LiquidHaskell specs for the parallel package";
  license = stdenv.lib.licenses.bsd3;
}
