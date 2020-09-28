{ mkDerivation, base, bytestring, Cabal, containers, fetchgit
, liquid-base, liquidhaskell, stdenv
}:
mkDerivation {
  pname = "liquid-prelude";
  version = "0.8.10.2";
  src = fetchgit (import ../liquid-src.nix);
  postUnpack = "sourceRoot+=/liquid-prelude; echo source root reset to $sourceRoot";
  setupHaskellDepends = [ base Cabal liquidhaskell ];
  libraryHaskellDepends = [
    bytestring containers liquid-base liquidhaskell
  ];
  homepage = "https://github.com/ucsd-progsys/liquidhaskell";
  description = "General utility modules for LiquidHaskell";
  license = stdenv.lib.licenses.bsd3;
}
