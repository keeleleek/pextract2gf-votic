xquery version "3.1";
declare namespace map = "http://www.w3.org/2005/xpath-functions/map";
import module namespace pfile = 'http://keeleleek.ee/pextract/pfile' at 'pextract-xml/lib/pfile.xqm';
import module namespace daffodil = "edu.illinois.ncsa.daffodil" at "basex-daffodil/daffodil.xqm";
declare namespace pextract = "http://keeleleek.ee/pextract";


(: Project setup :)
let $lang := "vot"
let $base := file:parent(static-base-uri())
let $daffodil-bin := $base || "daffodil-2.0.0/bin/daffodil"
let $dfdl-parser-bin := $base || "dfdl-pextract-schema/pextract.dfdl.xsd.bin"

(: DFDL parser :)
let $dfdl-parse := daffodil:daffodil-cmd-use-saved-parser($daffodil-bin, 
                      $dfdl-parser-bin, "parse", ?, "-", "latin1")

let $pfiles := file:children($base || "pextract-votic/pextract/")[ends-with(.,".p")]

for $pfile in $pfiles
  let $pfile-name := file:name($pfile)
  let $part-of-speech := replace($pfile-name, "^"||$lang||"-(.+).p$", "$1")
  let $pfile-xml := $dfdl-parse($pfile)
  for $paradigm in $pfile-xml/pextract:paradigm-file/pextract:paradigm
    return pfile:paradigm-as-lmf-pattern($paradigm, $part-of-speech)
  