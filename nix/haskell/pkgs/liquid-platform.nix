{ mkDerivation, fetchgit, stdenv }:
mkDerivation {
  pname = "liquid-platform";
  version = "0.8.10.2";
  src = fetchgit (import ../liquid-src.nix);
  postUnpack = "sourceRoot+=/liquid-platform; echo source root reset to $sourceRoot";
  isLibrary = false;
  isExecutable = true;
  configureFlags = [ "devel" ];
  homepage = "https://github.com/ucsd-progsys/liquidhaskell";
  description = "A battery-included platform for LiquidHaskell";
  license = stdenv.lib.licenses.bsd3;
}
