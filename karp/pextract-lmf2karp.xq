(:~
 Simple translator from pextract-xml to Karp json documents
 @author Kristian Kankainen
 @copyright MTÜ Keeleleek 2017
 :)

xquery version "3.1";
import module namespace lmf-karp = "http://keeleleek.ee/lmf-karp"
  at "lmf2karp.xqm";


(: basic environment variables :)
let $base-dir := file:parent(static-base-uri())

(: project variables :)
(:~
  now the LMF is split into two files:
  * the lexicon is held in the LMF Extensional Morphology module
  * the pextract paradigms are held in the LMF Morphological Patterns module
:)
let $lmf-extmorph  := doc($base-dir || "../pextract-votic/votic-extensional.xml")
  /LexicalResource
(:let $lmf-morphpatt := doc($base-dir || "examples/generated-vot-lmf.xml")
  /LexicalResource:)
let $lexiconName   := $lmf-extmorph//Lexicon/@language/data()
let $lexiconOrder := 0
(: simple function for cleaning written forms :)
let $clean := function($string) { translate($string,".", "")}


(:~ Specific options that shouldn't be tampered :)
let $json-options := map {
  "format": "xquery"
}


(: generate the Karp json document for the lexicon :)
let $entries := lmf-karp:lexicon-json(
  $lmf-extmorph,
  $lexiconName,
  $lexiconOrder,
  $clean
)

(: generate the Karp json document for the pextract paradigms :)
(: @todo: not needed? :)


return json:serialize($entries, $json-options)