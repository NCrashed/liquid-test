{ mkDerivation, base, Cabal, fetchgit, liquid-base, liquidhaskell
, stdenv, vector, z3sys
}:
mkDerivation {
  pname = "liquid-vector";
  version = "0.12.1.2";
  src = fetchgit (import ../liquid-src.nix);
  postUnpack = "sourceRoot+=/liquid-vector; echo source root reset to $sourceRoot";
  enableSeparateDataOutput = true;
  setupHaskellDepends = [ base Cabal liquidhaskell ];
  libraryHaskellDepends = [ liquid-base liquidhaskell vector ];
  homepage = "https://github.com/ucsd-progsys/liquidhaskell";
  description = "LiquidHaskell specs for the vector package";
  license = stdenv.lib.licenses.bsd3;
  librarySystemDepends = [ z3sys ];
  doHaddock = false;
}
