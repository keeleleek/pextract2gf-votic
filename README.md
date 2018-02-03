# Paradigm Extract and LMF Lab

This is an experimental lab for using the morphological paradigm extractor 
tool [pextract](https://github.com/marfors/paradigmextract) together with 
the [Lexical Markup Framework](https://en.wikipedia.org/wiki/Lexical_Markup_Framework) 
to automatically create:
* a Votic morphological dictionary
* human readable documentation of the extracted morphological paradigms (in LMF)
* source code for the Votic morphology module in the [Grammatical Framework](http://grammaticalframework.org/)

The main idea is to use LMF as an extension for pextract. Paradigm extraction 
does not need much information, but a linguist does. Both input and output of
pextract is supplemented by LMF. The input is modelled on top of the Extensional 
Morphology module and can carry information about corpus attestations of 
concrete word forms. The output is modelled as LMF Morphological Patterns.



## Usage demonstration

### Initialize the whole lab 

```XQuery
lab:init-lab()
```



### Initialize a language resource for Votic

```XQuery
(: LMF GlobalInformation :)
let $language-code := "vot"
let $label   := "Votic automatically extracted morphological paradigms"
let $comment := "The morphological paradigms has been extracted with the pextract tool."
let $author  := "Kristian Kankainen"
let $languageCoding := "ISO 639-3"

return lab:init-language-resource(
  $language-code,
  $label,
  $comment,
  $author,
  $languageCoding
)
```



### Add paradigms from pfiles

```XQuery
let $base := file:parent(static-base-uri())
let $pfiles := (
  $base || "pextract-votic/pextract/vot-commonNoun.p",
  $base || "pextract-votic/pextract/vot-personalPronoun.p"
)

return lab:insert-morphological-patterns-from-pfiles("vot", $pfiles)
```



### Output the built Votic LMF language resource

```XQuery
lab:get-lexical-resource("vot")
```

This output can be seen in [examples/generated-vot-lmf.xml](examples/generated-vot-lmf.xml).
