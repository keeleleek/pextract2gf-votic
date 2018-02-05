param
  Number = Sg | Pl ;
  Case = nominative | genitive | partitive | illative | inessive | elative | allative | adessive | ablative | translative | terminative | comitative ;

oper

------------------------------------------------
-- Start of commonNoun section
------------------------------------------------

  mkAapõ : Str -> Noun = \aapõ -> 
    case aapõ of {
      aa + "põ" => mkAapõConcrete aa ;
      _ => Predef.error "Unsuitable lemma for mkAapõ"
    } ;

  mkAapõConcrete : Str -> Noun = \aa -> 
    s = {
      table {
        NF singular nominative => aa + "põ" ;
        NF plural nominative => aa + "võd" ;
        NF singular genitive => aa + "va" ;
        NF plural genitive => aa + "poi" ;
        NF plural genitive => aa + "pojõ" ;
        NF singular partitive => aa + "pa" ;
        NF plural partitive => aa + "poi" ;
        NF plural partitive => aa + "poitõ" ;
        NF singular illative => aa + "paa" ;
        NF singular illative => aa + "pasõ" ;
        NF plural illative => aa + "poisõ" ;
        NF singular inessive => aa + "vaz" ;
        NF plural inessive => aa + "voiz" ;
        NF singular elative => aa + "võssõ" ;
        NF plural elative => aa + "poissõ" ;
        NF singular allative => aa + "võllõ" ;
        NF plural allative => aa + "poillõ" ;
        NF singular adessive => aa + "võl" ;
        NF plural adessive => aa + "poil" ;
        NF singular ablative => aa + "võssi" ;
        NF plural ablative => aa + "poissi" ;
        NF singular translative => aa + "passi" ;
        NF plural translative => aa + "poissi" ;
        NF singular terminative => aa + "passaa" ;
        NF plural terminative => aa + "poissaa" ;
        NF singular comitative => aa + "vaka" ;
        NF plural comitative => aa + "poika"
      }
    }


  mkPoikõ : Str -> Noun = \poikõ -> 
    case poikõ of {
      poi + "kõ" => mkPoikõConcrete poi ;
      _ => Predef.error "Unsuitable lemma for mkPoikõ"
    } ;

  mkPoikõConcrete : Str -> Noun = \poi -> 
    s = {
      table {
        NF singular nominative => poi + "kõ" ;
        NF plural nominative => poi + "gõd" ;
        NF singular genitive => poi + "ga" ;
        NF plural genitive => poi + "ki" ;
        NF plural genitive => poi + "kije" ;
        NF singular partitive => poi + "ka" ;
        NF singular partitive => poi + "kaa" ;
        NF plural partitive => poi + "ki" ;
        NF plural partitive => poi + "kitõ" ;
        NF singular illative => poi + "kaa" ;
        NF singular illative => poi + "kasõ" ;
        NF plural illative => poi + "ki" ;
        NF plural illative => poi + "kisõ" ;
        NF singular inessive => poi + "gõz" ;
        NF plural inessive => poi + "kiz" ;
        NF singular elative => poi + "gõssõ" ;
        NF plural elative => poi + "kissõ" ;
        NF singular allative => poi + "gõllõ" ;
        NF plural allative => poi + "killõ" ;
        NF singular adessive => poi + "gõl" ;
        NF plural adessive => poi + "kil" ;
        NF singular ablative => poi + "gõltõ" ;
        NF plural ablative => poi + "kiltõ" ;
        NF singular translative => poi + "gõssi" ;
        NF plural translative => poi + "kissi" ;
        NF singular terminative => poi + "kassaa" ;
        NF plural terminative => poi + "kissaa" ;
        NF singular comitative => poi + "gaka" ;
        NF plural comitative => poi + "kika"
      }
    }


  mkAikõ : Str -> Noun = \aikõ -> 
    case aikõ of {
      ai + "kõ" => mkAikõConcrete ai ;
      _ => Predef.error "Unsuitable lemma for mkAikõ"
    } ;

  mkAikõConcrete : Str -> Noun = \ai -> 
    s = {
      table {
        NF singular nominative => ai + "kõ" ;
        NF plural nominative => ai + "gõd" ;
        NF singular genitive => ai + "ga" ;
        NF plural genitive => ai + "koi" ;
        NF plural genitive => ai + "kojõ" ;
        NF singular partitive => ai + "ka" ;
        NF singular partitive => ai + "kaa" ;
        NF plural partitive => ai + "koi" ;
        NF plural partitive => ai + "koitõ" ;
        NF singular illative => ai + "ka" ;
        NF singular illative => ai + "kasõ" ;
        NF plural illative => ai + "koisõ" ;
        NF singular inessive => ai + "gõz" ;
        NF plural inessive => ai + "koiz" ;
        NF singular elative => ai + "gõssõ" ;
        NF plural elative => ai + "koissõ" ;
        NF singular allative => ai + "gõllõ" ;
        NF plural allative => ai + "koillõ" ;
        NF singular adessive => ai + "gõl" ;
        NF plural adessive => ai + "koil" ;
        NF singular ablative => ai + "gõltõ" ;
        NF plural ablative => ai + "koiltõ" ;
        NF singular translative => ai + "gõssi" ;
        NF plural translative => ai + "koissi" ;
        NF singular terminative => ai + "kassaa" ;
        NF plural terminative => ai + "koissaa" ;
        NF singular comitative => ai + "gaka" ;
        NF plural comitative => ai + "koika"
      }
    }


  mkLentüz : Str -> Noun = \lentüz -> 
    case lentüz of {
      lentü + "z" => mkLentüzConcrete lentü ;
      _ => Predef.error "Unsuitable lemma for mkLentüz"
    } ;

  mkLentüzConcrete : Str -> Noun = \lentü -> 
    s = {
      table {
        NF singular nominative => lentü + "z" ;
        NF plural nominative => lentü + "sed" ;
        NF singular genitive => lentü + "se" ;
        NF plural genitive => lentü + "si" ;
        NF singular partitive => lentü + "sse" ;
        NF plural partitive => lentü + "ssi" ;
        NF singular illative => lentü + "sesse" ;
        NF plural illative => lentü + "sisse" ;
        NF singular inessive => lentü + "sez" ;
        NF plural inessive => lentü + "siz" ;
        NF singular elative => lentü + "sse" ;
        NF plural elative => lentü + "sissõ" ;
        NF singular allative => lentü + " gõllõ" ;
        NF plural allative => lentü + " koillõ" ;
        NF singular adessive => lentü + " gõl" ;
        NF plural adessive => lentü + " koil" ;
        NF singular ablative => lentü + " gõltõ" ;
        NF plural ablative => lentü + " koiltõ" ;
        NF singular translative => lentü + " gõssi" ;
        NF plural translative => lentü + " koissi" ;
        NF singular terminative => lentü + " kassaa" ;
        NF plural terminative => lentü + " koissaa" ;
        NF singular comitative => lentü + " gaka" ;
        NF plural comitative => lentü + " koika"
      }
    }


  mkAmmõz : Str -> Noun = \ammõz -> 
    case ammõz of {
      am + "mõz" => mkAmmõzConcrete am ;
      _ => Predef.error "Unsuitable lemma for mkAmmõz"
    } ;

  mkAmmõzConcrete : Str -> Noun = \am -> 
    s = {
      table {
        NF singular nominative => am + "mõz" ;
        NF plural nominative => am + "pad" ;
        NF singular genitive => am + "pa" ;
        NF plural genitive => am + "paijõ" ;
        NF singular partitive => am + "massõ" ;
        NF plural partitive => am + "paitõ" ;
        NF singular illative => am + "pasõ" ;
        NF plural illative => am + "paisõ" ;
        NF singular inessive => am + "paz" ;
        NF plural inessive => am + "paiz" ;
        NF singular elative => am + "passõ" ;
        NF plural elative => am + "paissõ" ;
        NF singular allative => am + "pallõ" ;
        NF plural allative => am + "paillõ" ;
        NF singular adessive => am + "pal" ;
        NF plural adessive => am + "pail" ;
        NF singular ablative => am + "paltõ" ;
        NF plural ablative => am + "pailtõ" ;
        NF singular translative => am + "passi" ;
        NF plural translative => am + "paissi" ;
        NF singular terminative => am + "passaa" ;
        NF plural terminative => am + "paissaa" ;
        NF singular comitative => am + "paka" ;
        NF plural comitative => am + "paika"
      }
    }


  mkTüttö : Str -> Noun = \tüttö -> 
    case tüttö of {
      tüt + "t" + ö => mkTüttöConcrete tüt ö ;
      _ => Predef.error "Unsuitable lemma for mkTüttö"
    } ;

  mkTüttöConcrete : Str -> Noun = \tüt,ö -> 
    s = {
      table {
        NF singular nominative => tüt + "t" + ö ;
        NF plural nominative => tüt + ö + "d" ;
        NF singular genitive => tüt + ö ;
        NF plural genitive => tüt + "t" + ö + "i" ;
        NF plural genitive => tüt + "t" + ö + "je" ;
        NF singular partitive => tüt + "t" + ö + "ä" ;
        NF plural partitive => tüt + "t" + ö + "i" ;
        NF plural partitive => tüt + "t" + ö + "ite" ;
        NF singular illative => tüt + "t" + ö + "se" ;
        NF plural illative => tüt + "t" + ö + "ise" ;
        NF singular inessive => tüt + "t" + ö + "z" ;
        NF plural inessive => tüt + "t" + ö + "iz" ;
        NF singular elative => tüt + ö + "sse" ;
        NF plural elative => tüt + "t" + ö + "isse" ;
        NF singular allative => tüt + ö + "lle" ;
        NF plural allative => tüt + "t" + ö + "ille" ;
        NF singular adessive => tüt + ö + "l" ;
        NF plural adessive => tüt + "t" + ö + "il" ;
        NF singular ablative => tüt + ö + "lte" ;
        NF plural ablative => tüt + "t" + ö + "ilte" ;
        NF singular translative => tüt + ö + "ssi" ;
        NF plural translative => tüt + "t" + ö + "issi" ;
        NF singular terminative => tüt + "t" + ö + "ssaa" ;
        NF plural terminative => tüt + "t" + ö + "issaa" ;
        NF singular comitative => tüt + ö + "ka" ;
        NF plural comitative => tüt + "t" + ö + "ika"
      }
    }

