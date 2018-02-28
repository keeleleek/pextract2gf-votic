import module namespace daffodil = "edu.illinois.ncsa.daffodil" at "basex-daffodil/daffodil.xqm";

let $base := file:parent(static-base-uri())

let $bin    := $base || "daffodil-2.0.0/bin/daffodil"
let $schema := $base || "dfdl-pextract-schema/pextract.dfdl.xsd"
let $action := "parse"
let $infile := $base || "dfdl-pextract-schema/examples/vot_noun.p"
let $outfile := "-"
let $sys-encoding := "UTF-8"


return
  daffodil:daffodil-cmd-use-saved-parser(
    $bin,
    $schema || ".bin",
    $action,
    $infile,
    "-",
    $sys-encoding
  )
