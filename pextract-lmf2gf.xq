xquery version "3.1";
declare namespace map = "http://www.w3.org/2005/xpath-functions/map";
import module namespace functx = 'http://www.functx.com';
import module namespace pfile = 'http://keeleleek.ee/pextract/pfile' at 'pextract-xml/lib/pfile.xqm';
declare namespace p = "http://keeleleek.ee/pextract";


(:~ 
 : This converts a pextract-lmf file into Grammatical Framework code.
 : 
 : @author Kristian Keeleleek
 : @version 1.0.0
 : @see https://github.com/keeleleek/pextract2gf-votic
 :)



(:~ Serialize the $params-map as a GF param statement
 : @since 1.0.0
 :)
declare function p:serialize-params ($params-map) as xs:string {
  string-join(
      (for $param-feature in map:keys($params-map)
         let $values := string-join(
             for $value in $params-map?($param-feature)
               return p:translate($translate-grammatical-features, $value),
             " | ")
        return concat(
          "  ", p:translate($translate-grammatical-features, $param-feature), " = ", $values, " ;")
      )
    , out:nl()
  )
};



(:~ Simple translation map for stuff like 'singular' = 'Sg'
 : @since 1.0.0
 :)
declare variable $translate-grammatical-features := map {
  "singular" : "Sg",
  "plural"   : "Pl",
  "grammaticalNumber" : "Number",
  "grammaticalCase"   : "Case"
};
declare variable $translate := $translate-grammatical-features;

declare variable $pos-to-gf-type := map {
  "commonNoun" : "Noun"
};

declare function p:translate($translation-map, $string)
{
  if($translation-map?($string))
  then($translation-map?($string))
  else($string)
};


(:~ Serialize the paradigm patterns as GF operations
 : @since 1.0.0
 :)
declare function p:serialize-opers-old($pattern-map) as xs:string {
  let $pfile := doc("examples/vot_noun.tdml") (: @todo: remove hardcoded file name :)
  
  return
  string-join(
    ("oper" || out:nl(),
    string-join(
      for $paradigm in ($pfile//p:paradigm)
        let $distinct-variables := distinct-values($paradigm//p:pattern-part[matches(., "\d+")])
        let $num-of-variables := count($distinct-variables)
        let $first-attested-variables-map := pfile:get-attested-var-values-maps($paradigm)
        let $constants := ($paradigm//p:pattern-part[matches(., "\D+")])
        let $lemma := pfile:get-attested-wordforms(
                                  ($paradigm//p:paradigm-cell)[1], (: @todo remove hardcoded selector :)
                                  $paradigm//p:variable-values
                                )[1]
        
        (: generate GF table with each paradigm-cell element :)
        let $GF-wordform-table :=
          concat(
            (: generate code for the abstract paradigm function that acts on a lemma :)
            concat(
              (: pattern match lemma as input for the concrete paradigm function :)
              (:
                  mkTüttö : Str -> Noun = \tüttö ->
                    case tüttö of {
                      tüt + "t" + ö => mkTüttöConcrete tüt ö
                      _ => Predef.error "Given lemma doesn't pattern match this paradigm function >:("
                    }
              :)
              "  mk" || functx:capitalize-first(
                              $lemma
                        ) || " : Str -> Noun = \"  || $lemma,
                        " -> " || out:nl(),
                        "    case " || $lemma,
                        " of {" || out:nl(),
                        (: placeholder for tüt + "t" + ö => mkTüttöConcrete tüt ö :)
                        "      ",
                        string-join(
                            let $paradigm-pattern := ($paradigm//p:paradigm-cell)[1]
                            let $last := count($paradigm-pattern//p:pattern/p:pattern-part/data())
                            for $pattern-part at $position in $paradigm-pattern//p:pattern/p:pattern-part/data()
                              return 
                                (: treat the last variable differently :)
                                if ($position ne $last)
                                then (
                                  (: if non-number then constant else get attestation for variable num :)
                                  if (matches($pattern-part, "\D+"))
                                  then(string('"' || $pattern-part || '"'))
                                  else(string($first-attested-variables-map?(xs:integer($pattern-part))[1]))
                                )
                                else (
                                  (: if non-number then constant else get attestation for variable num :)
                                  if (matches($pattern-part, "\D+"))
                                  then(string('"' || $pattern-part || '"'))
                                  else(
                                    (: pattern for making last constant match greedily i.e match the last occurrence :)
                                    let $last-attested-variable := $paradigm-pattern//p:pattern/p:pattern-part[last() - 1]
                                    return
                                      string($first-attested-variables-map?(xs:integer($pattern-part))[1])
                                      || "@" || '(-(_+"' || $last-attested-variable || '"+_))'
                                  )
                                )
                            , " + "
                        ) || " => " || "mk" || functx:capitalize-first(
                                                             $lemma || "Concrete "
                        ),
                        string-join(
                            let $paradigm-pattern := ($paradigm//p:paradigm-cell)[1]
                            for $pattern-part in $paradigm-pattern//p:pattern/p:pattern-part/data()
                              return 
                                if (matches($pattern-part, "\D+"))
                                then()
                                else(string($first-attested-variables-map?(xs:integer($pattern-part))[1]))
                            , " "
                        )
                        , " ; " || out:nl(),
                        (: useful error message :)
                        '      _ => Predef.error "Unsuitable lemma for ',
                        "mk" || functx:capitalize-first(
                              $lemma
                        ) || '"',
                        out:nl(),
                        "    } ;" || out:nl() || out:nl()
            ),
            
            (: generate code for the concrete paradigm-function :)
            concat("  mk",
                        functx:capitalize-first(
                              $lemma || "Concrete"
                        ),
                        " : ",
                        (: string-join("Str", " -> ") for $num-of-variables :)
                        string-join(for $i in 1 to $num-of-variables return "Str", " -> "),
                        " -> Noun = ", (: @todo remove hardcoded POS :)
                        "\", (: the lambda definition :) 
                        (: tü,tö :)
                        string-join(for $variable in $distinct-variables
                                          return $first-attested-variables-map?(xs:integer($variable))[1], ","),
                        " -> ",
                        out:nl())
            
            (: record with inflection table :)
            ,"    { s = ", out:nl(),
            "      table {", out:nl(),
            (: for loop that constructs the content of the table:)
            string-join( for $paradigm-pattern in $paradigm//p:paradigm-cell
              return
                concat(
                  (: @todo we could insert the wordform as documentation here but it seems unnecessary
                  "        -- " || p:reconstruct-wordform($paradigm-pattern, $paradigm//p:variable-values) || out:nl(), :)
                  (: msd-description serialized as NF Pl genitive => :)
                  "        NF ",
                  string-join(
                     for $pattern-msd-feature in $paradigm-pattern//p:msd-description/p:feature
                       let $feature := $pattern-msd-feature/p:value
                       return (
                         (: @todo use translate map for singual=Sg etc :)
                         if (matches($feature, "singular|plural"))
                         then ($translate?($feature))
                         else ($feature)
                       )
                       ," "),
                  " => ",
                  (: poi + "ki" | poi + "kije" :) (: @todo generalize for variants! :)
                  string-join(
                    for $pattern-part in $paradigm-pattern//p:pattern/p:pattern-part/data()
                      return 
                        if (matches($pattern-part, "\D+"))
                        then(string('"' || $pattern-part || '"'))
                        else(string($first-attested-variables-map?(xs:integer($pattern-part))[1]))
                    , " + ")
                )
            , " ; " || out:nl() ) (: end of table content string-join :)
            , out:nl()
            , "      }", out:nl()
            , "    } ;", out:nl()
          )
        
        return $GF-wordform-table
        
    || out:nl() || out:nl() || "-------------------------" || out:nl() || out:nl())
    )
    , out:nl()
  )
};





let $lmf-file := doc("examples/generated-vot-lmf.xml")
(: @todo instead of just the first POS, loop through all :)
let $part-of-speeches := distinct-values($lmf-file//feat[@att="partOfSpeech"]/@val)[1]

for $part-of-speech in $part-of-speeches
return
  
  let $morphological-patterns := $lmf-file//MorphologicalPattern[./feat[@att="partOfSpeech" and @val=$part-of-speech]]
  
  (: Generate the GF param section :)
  (: Collect a map of parameter feature names and values :)
  let $params-map := map:merge(
    let $grammatical-features := $morphological-patterns/TransformSet/GrammaticalFeatures
    for $label in distinct-values($grammatical-features/feat/@att)
      return map:entry(
        $label,
        distinct-values($grammatical-features/feat[@att=$label]/@val)
      )
  )
  
  return
  string-join((
    (: the params list :)
    "param",
    p:serialize-params($params-map),
    "",
    "oper",
    "",
    (: generate abstract and concrete functions for each paradigm :)
    for $paradigm in $morphological-patterns
      (: @todo choose lemma here :)
      let $lemma-transformset := ($paradigm/TransformSet)[1]
      let $lemma := $paradigm/feat[@att="example"]/@val (: @todo generate lemma instead :)
      let $lemma-capitalized := functx:capitalize-first($lemma)
      let $lemma-mk := "mk" || $lemma-capitalized
      let $variables-list := $lemma-transformset/Process/feat[@att="variableNumber"]/@val
      let $first-attested-values := map:merge(
        for $variable in ($paradigm/AttestedParadigmVariableSets)[1]/AttestedParadimVariableSet/feat
          return map:entry(
            xs:string($variable/@att),
            $variable/@val
          )
      )
      
      let $abstract-function := string-join((
        "  mk" || $lemma-capitalized || " : Str -> Noun = \" || $lemma || " -> " || out:nl(),
        "    case " || $lemma || " of {" || out:nl(),
        (: pattern match for appropriate case :)
        "      ",
        string-join((
            for $process in $lemma-transformset/Process
              let $constant := $process/feat[@att="stringValue"]/@val
              let $variable := $process/feat[@att="variableNumber"]/@val
              return
                if($constant)
                then('"' || $constant || '"')
                else(p:translate($first-attested-values, $variable))
          ), " + ")
        , " => mk" || $lemma-capitalized || "Concrete " || string-join((for $var in $variables-list return p:translate($first-attested-values, $var)), " ") || " ;"
        , out:nl(),
        (: default case for inappropriate pattern match :)
        '      _ => Predef.error "Unsuitable lemma for ' || $lemma-mk || '"', out:nl(),
        "    } ;"
      ))
      
      let $concrete-function := string-join((
        "  mk" || $lemma-capitalized || "Concrete : Str -> ",
        p:translate($pos-to-gf-type, $part-of-speech),
        " = \" || string-join((
          for $var in $variables-list
            return p:translate($first-attested-values, $var)
          ), ",") || " -> " || out:nl(),
        "    s = {" || out:nl(),
        "      table {" || out:nl(),
        string-join((
          for $transformset in $paradigm/TransformSet
            return string-join((
              "        NF ",
              (: join grammatical features :)
              string-join((
              for $gram-feat in $transformset/GrammaticalFeatures/feat
                return $gram-feat/@val/data()
              ), " "),
              " => ",
              (: join pattern variables and constants :)
              string-join((
                for $process in $transformset/Process
                return
                  if($process/feat/@att = "variableNumber")
                  then(
                    p:translate(
                      $first-attested-values,
                      $process/feat[@att="variableNumber"]/@val)
                    )
                  else('"' || $process/feat[@att="stringValue"]/@val || '"')
              ), " + ")
            ))
          ), " ;" || out:nl()),
        out:nl() || "      }" || out:nl(),
        "    }"
      ))
      
      return 
        string-join((
          $abstract-function,
          $concrete-function,
          ""
        ), out:nl() || out:nl() )
  ), out:nl()
  )



(:
return concat(
  p:serialize-params($params-map), out:nl(), out:nl():)
  (:,p:serialize-opers($paradigm-pattern):) (: @todo: pass pfile here :)
(:):)
