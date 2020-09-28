{ mkDerivation, ansi-terminal, array, ascii-progress, async
, attoparsec, base, binary, boxes, cereal, cmdargs, containers
, deepseq, directory, fetchgit, fgl, filepath, git, hashable
, intern, megaparsec, mtl, nettools, ocaml, parallel
, parser-combinators, pretty, process, stdenv, stm, syb, tasty
, tasty-ant-xml, tasty-hunit, tasty-rerun, text, text-format
, transformers, unordered-containers, z3
}:
mkDerivation {
  pname = "liquid-fixpoint";
  version = "0.8.10.2.1";
  src = fetchgit (import ../liquid-src.nix);
  postUnpack = "sourceRoot+=/liquid-fixpoint; echo source root reset to $sourceRoot";
  configureFlags = [ "-fbuild-external" ];
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    ansi-terminal array ascii-progress async attoparsec base binary
    boxes cereal cmdargs containers deepseq directory fgl filepath
    hashable intern megaparsec mtl parallel parser-combinators pretty
    process syb text text-format transformers unordered-containers
  ];
  executableHaskellDepends = [ base ];
  executableSystemDepends = [ ocaml ];
  testHaskellDepends = [
    base containers directory filepath mtl process stm tasty
    tasty-ant-xml tasty-hunit tasty-rerun transformers
  ];
  testSystemDepends = [ git nettools z3 ];
  doCheck = false;
  homepage = "https://github.com/ucsd-progsys/liquid-fixpoint";
  description = "Predicate Abstraction-based Horn-Clause/Implication Constraint Solver";
  license = stdenv.lib.licenses.bsd3;
}
