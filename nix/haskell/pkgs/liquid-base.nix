{ mkDerivation, base, Cabal, fetchgit, liquid-ghc-prim
, liquidhaskell, stdenv
}:
mkDerivation {
  pname = "liquid-base";
  version = "4.14.1.0";
  src = fetchgit (import ../liquid-src.nix);
  postUnpack = "sourceRoot+=/liquid-base; echo source root reset to $sourceRoot";
  enableSeparateDataOutput = true;
  setupHaskellDepends = [ base Cabal liquidhaskell ];
  libraryHaskellDepends = [ base liquid-ghc-prim liquidhaskell ];
  homepage = "https://github.com/ucsd-progsys/liquidhaskell";
  description = "Drop-in base replacement for LiquidHaskell";
  license = stdenv.lib.licenses.bsd3;
}
