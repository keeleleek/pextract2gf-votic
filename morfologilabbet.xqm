(:~ 
  
  A simple test for a paradigm lab.
  
  @author: Kristian Kankainen
  @copyright: MTÜ Keeleleek

:)
xquery version "3.1";
module namespace lab = "https://spraakbanken.gu.se/karp/morfologilabbet";

import module namespace pfile = 'http://keeleleek.ee/pextract/pfile' at 'pextract-xml/lib/pfile.xqm';
import module namespace daffodil = "edu.illinois.ncsa.daffodil" at "basex-daffodil/daffodil.xqm";

declare namespace pextract = "http://keeleleek.ee/pextract";

(: Set up :)
declare variable $lab:base := file:parent(static-base-uri());
declare variable $lab:db-name := "lab";
declare variable $lab:dtdVersion := "16";
declare variable $lab:languageCoding := "ISO 639-3";

(: Set up DFDL :)
declare variable $lab:daffodil-bin    := $lab:base || "daffodil-2.0.0/bin/daffodil";
declare variable $lab:dfdl-parser-bin := $lab:base || "dfdl-pextract-schema/pextract.dfdl.xsd.bin";
declare variable $lab:dfdl-parse      := daffodil:daffodil-cmd-use-saved-parser($lab:daffodil-bin, 
                                           $lab:dfdl-parser-bin, "parse", ?, "-", "latin1");

(:~ Initializes the lab e.g sets up a database named $lab:db-name :)
declare updating function lab:init-lab()
{
  db:create($lab:db-name)
};



(:~ Initializes a new language resource in the lab :)
declare updating function lab:init-language-resource(
  $lang-code as xs:string,
  $label as xs:string,
  $comment as xs:string,
  $author as xs:string,
  $languageCoding as xs:string
)
{
  (: Default GlobalInformation :)
  let $label   := if($label)
                  then($label)
                  else("This language resource has no label yet")
  let $comment := if($comment)
                  then($comment)
                  else("This language resource has no comment yet.")
  let $author  := if($author)
                  then($author)
                  else("No Author Yet")
  let $languageCoding := if($languageCoding)
                         then($languageCoding)
                         else("ISO 639-3")
  
  let $lexicalresource := 
            <LexicalResource dtdVersion="{$lab:dtdVersion}">
              <Lexicon>
              <GlobalInformation>
                <feat att="label" val="{$label}"/>
                <feat att="comment" val="{$comment}"/>
                <feat att="author" val="{$author}"/>
                <feat att="languageCoding" val="{$languageCoding}"/>
              </GlobalInformation>
              <feat att="language" val="{$lang-code}"/>
              </Lexicon>
            </LexicalResource>
  
  return db:replace($lab:db-name, concat($lang-code,".xml"), $lexicalresource)
};



(:~ Inserts the morphological patterns into the resource :)
declare updating function lab:insert-morphological-patterns(
  $lang-code as xs:string,
  $morphologicalpatterns as element(MorphologicalPattern)
)
{
  insert node $morphologicalpatterns
    as last into db:open($lab:db-name, $lang-code||".xml")/LexicalResource/Lexicon
};



(:~ Inserts the morphological patterns from pfiles into the resource :)
declare updating function lab:insert-morphological-patterns-from-pfiles(
  $lang-code as xs:string,
  $pfile-paths as xs:string+
)
{
  for $pfile in $pfile-paths
    let $pfile-name := file:name($pfile)
    let $part-of-speech := replace($pfile-name, "^"||$lang-code||"-(.+).p$", "$1")
    let $pfile-xml := $lab:dfdl-parse($pfile)
    
    for $paradigm in $pfile-xml/pextract:paradigm-file/pextract:paradigm
      let $lmf-pattern := pfile:paradigm-as-lmf-pattern($paradigm, $part-of-speech)
      return lab:insert-morphological-patterns($lang-code, $lmf-pattern)
};



(:~ Returns the lexical resource of the language :)
declare function lab:get-lexical-resource($lang-code)
{
  db:open($lab:db-name, $lang-code||".xml")
};