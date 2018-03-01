xquery version "3.1";
module namespace lmf-karp = "http://keeleleek.ee/lmf-karp";

(: generate the json document for the lexicon :)
declare function lmf-karp:lexicon-json(
  $lmf as element(LexicalResource),
  $lexiconName as xs:string,
  $lexiconOrder as xs:integer,
  $clean as item()?
) {
  let $entries := array {
    for $entry in $lmf//LexicalEntry
      return map {
        "lexiconName":  $lexiconName,
        "lexiconOrder": $lexiconOrder,
        "partOfSpeech": $entry/@partOfSpeech/data(),
        "wordforms": array {
          for $wordform in $entry/WordForm
            return map:merge((
              map:entry(
                "writtenform",
                $wordform/@writtenForm/data()=> $clean()
              ),
              for $attribute in $wordform/(@* except @writtenForm)
                let $key := local-name($attribute)
                let $val := $attribute/data() => $clean()
                return map:entry($key, $val)
              )
            )
          }
      }
  }
  return $entries
};