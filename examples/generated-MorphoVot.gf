param
  Number = Sg | Pl ;
  Case = nominative | genitive | partitive | illative | inessive | elative | allative | adessive | ablative | translative | terminative | comitative ;

oper

------------------------------------------------
-- Start of personalPronoun section
------------------------------------------------

  mkMiä : Str -> Noun = \miä -> 
    case miä of {
      m + "iä" => mkMiäConcrete m ;
      _ => Predef.error "Unsuitable lemma for mkMiä"
    } ;

  mkMiäConcrete : Str -> personalPronoun = \m -> 
    s = {
      table {
        NF singular nominative => m + "iä" ;
        NF plural nominative => m + "üü" ;
        NF singular genitive => m + "inu" ;
        NF plural genitive => m + "ed̕d̕e" ;
        NF plural genitive => m + "eije" ;
        NF singular partitive => m + "innua" ;
        NF plural partitive => m + "eite" ;
        NF singular illative => m + "iä" ;
        NF plural illative => m + "iä" ;
        NF singular inessive => m + "iä" ;
        NF plural inessive => m + "iä" ;
        NF singular elative => m + "inussõ" ;
        NF plural elative => m + "iä" ;
        NF singular allative => m + "illõ" ;
        NF plural allative => m + "eille" ;
        NF singular adessive => m + "ill" ;
        NF plural adessive => m + "eill" ;
        NF singular ablative => m + "iä" ;
        NF plural ablative => m + "iä" ;
        NF singular translative => m + "iä" ;
        NF plural translative => m + "iä" ;
        NF singular terminative => m + "iä" ;
        NF plural terminative => m + "iä" ;
        NF singular comitative => m + "iä" ;
        NF plural comitative => m + "iä"
      }
    }

