{ mkDerivation, aeson, base, binary, bytestring, Cabal, cereal
, cmdargs, containers, data-default, deepseq, Diff, directory
, extra, fetchgit, filepath, fingertree, ghc, ghc-boot, ghc-paths
, ghc-prim, githash, gitrev, hashable, hscolour, liquid-fixpoint
, megaparsec, mtl, optics, optparse-applicative, optparse-simple
, pretty, process, split, stdenv, stm, string-conv, syb, tagged
, tasty, tasty-ant-xml, tasty-golden, tasty-hunit, tasty-rerun
, template-haskell, temporary, text, time, transformers
, unordered-containers, vector, z3, th-compat
}:
mkDerivation {
  pname = "liquidhaskell";
  version = "0.8.10.2.1";
  src = fetchgit (import ../liquid-src.nix);
  isLibrary = true;
  isExecutable = true;
  enableSeparateDataOutput = true;
  libraryHaskellDepends = [
    aeson base binary bytestring Cabal cereal cmdargs containers
    data-default deepseq Diff directory extra filepath fingertree ghc
    ghc-boot ghc-paths ghc-prim githash gitrev hashable hscolour
    liquid-fixpoint megaparsec mtl optics optparse-applicative
    optparse-simple pretty split syb template-haskell temporary text
    time transformers unordered-containers vector th-compat
  ];
  executableHaskellDepends = [ base ];
  testHaskellDepends = [
    base containers directory extra filepath ghc liquid-fixpoint
    megaparsec mtl optparse-applicative process stm string-conv syb
    tagged tasty tasty-ant-xml tasty-golden tasty-hunit tasty-rerun
    text transformers
  ];
  testSystemDepends = [ z3 ];
  doCheck = false;
  homepage = "https://github.com/ucsd-progsys/liquidhaskell";
  description = "Liquid Types for Haskell";
  license = stdenv.lib.licenses.bsd3;
}
