{ mkDerivation, base, Cabal, containers, fetchgit, liquid-base
, liquidhaskell, stdenv, z3sys
}:
mkDerivation {
  pname = "liquid-containers";
  version = "0.6.2.1";
  src = fetchgit (import ../liquid-src.nix);
  postUnpack = "sourceRoot+=/liquid-containers; echo source root reset to $sourceRoot";
  enableSeparateDataOutput = true;
  setupHaskellDepends = [ base Cabal liquidhaskell ];
  libraryHaskellDepends = [ containers liquid-base liquidhaskell ];
  homepage = "https://github.com/ucsd-progsys/liquidhaskell";
  description = "LiquidHaskell specs for the containers package";
  license = stdenv.lib.licenses.bsd3;
  librarySystemDepends = [ z3sys ];
  doHaddock = false;
}
