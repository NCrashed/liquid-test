{ mkDerivation, base, bytestring, Cabal, fetchgit, liquid-base
, liquidhaskell, stdenv
}:
mkDerivation {
  pname = "liquid-bytestring";
  version = "0.10.10.0";
  src = fetchgit (import ../liquid-src.nix);
  postUnpack = "sourceRoot+=/liquid-bytestring; echo source root reset to $sourceRoot";
  enableSeparateDataOutput = true;
  setupHaskellDepends = [ base Cabal liquidhaskell ];
  libraryHaskellDepends = [ bytestring liquid-base liquidhaskell ];
  homepage = "https://github.com/ucsd-progsys/liquidhaskell";
  description = "LiquidHaskell specs for the bytestring package";
  license = stdenv.lib.licenses.bsd3;
}
