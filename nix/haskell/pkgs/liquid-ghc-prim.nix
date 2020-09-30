{ mkDerivation, base, Cabal, fetchgit, ghc-prim, liquidhaskell
, stdenv, z3sys
}:
mkDerivation {
  pname = "liquid-ghc-prim";
  version = "0.6.1";
  src = fetchgit (import ../liquid-src.nix);
  postUnpack = "sourceRoot+=/liquid-ghc-prim; echo source root reset to $sourceRoot";
  enableSeparateDataOutput = true;
  setupHaskellDepends = [ base Cabal liquidhaskell ];
  libraryHaskellDepends = [ ghc-prim liquidhaskell ];
  homepage = "https://github.com/ucsd-progsys/liquidhaskell";
  description = "Drop-in ghc-prim replacement for LiquidHaskell";
  license = stdenv.lib.licenses.bsd3;
  librarySystemDepends = [ z3sys ];
  doHaddock = false;
}
