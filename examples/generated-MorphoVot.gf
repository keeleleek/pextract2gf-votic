param
  Number = Sg | Pl ;
  Case = nominative | genitive | partitive | illative | inessive | elative | allative | adessive | ablative | translative | terminative | comitative ;

oper

  mkAapõ : Str -&gt; Noun = \aapõ -&gt; 
    case aapõ of {
      aa + "põ" =&gt; mkAapõConcrete aa ;
      _ =&gt; Predef.error "Unsuitable lemma for mkAapõ"
    } ;

  mkAapõConcrete : Str -&gt; Noun = \aa -&gt; 
    s = {
      table {
        NF singular nominative =&gt; aa + "põ" ;
        NF plural nominative =&gt; aa + "võd" ;
        NF singular genitive =&gt; aa + "va" ;
        NF plural genitive =&gt; aa + "poi" ;
        NF plural genitive =&gt; aa + "pojõ" ;
        NF singular partitive =&gt; aa + "pa" ;
        NF plural partitive =&gt; aa + "poi" ;
        NF plural partitive =&gt; aa + "poitõ" ;
        NF singular illative =&gt; aa + "paa" ;
        NF singular illative =&gt; aa + "pasõ" ;
        NF plural illative =&gt; aa + "poisõ" ;
        NF singular inessive =&gt; aa + "vaz" ;
        NF plural inessive =&gt; aa + "voiz" ;
        NF singular elative =&gt; aa + "võssõ" ;
        NF plural elative =&gt; aa + "poissõ" ;
        NF singular allative =&gt; aa + "võllõ" ;
        NF plural allative =&gt; aa + "poillõ" ;
        NF singular adessive =&gt; aa + "võl" ;
        NF plural adessive =&gt; aa + "poil" ;
        NF singular ablative =&gt; aa + "võssi" ;
        NF plural ablative =&gt; aa + "poissi" ;
        NF singular translative =&gt; aa + "passi" ;
        NF plural translative =&gt; aa + "poissi" ;
        NF singular terminative =&gt; aa + "passaa" ;
        NF plural terminative =&gt; aa + "poissaa" ;
        NF singular comitative =&gt; aa + "vaka" ;
        NF plural comitative =&gt; aa + "poika"
      }
    }


  mkPoikõ : Str -&gt; Noun = \poikõ -&gt; 
    case poikõ of {
      poi + "kõ" =&gt; mkPoikõConcrete poi ;
      _ =&gt; Predef.error "Unsuitable lemma for mkPoikõ"
    } ;

  mkPoikõConcrete : Str -&gt; Noun = \poi -&gt; 
    s = {
      table {
        NF singular nominative =&gt; poi + "kõ" ;
        NF plural nominative =&gt; poi + "gõd" ;
        NF singular genitive =&gt; poi + "ga" ;
        NF plural genitive =&gt; poi + "ki" ;
        NF plural genitive =&gt; poi + "kije" ;
        NF singular partitive =&gt; poi + "ka" ;
        NF singular partitive =&gt; poi + "kaa" ;
        NF plural partitive =&gt; poi + "ki" ;
        NF plural partitive =&gt; poi + "kitõ" ;
        NF singular illative =&gt; poi + "kaa" ;
        NF singular illative =&gt; poi + "kasõ" ;
        NF plural illative =&gt; poi + "ki" ;
        NF plural illative =&gt; poi + "kisõ" ;
        NF singular inessive =&gt; poi + "gõz" ;
        NF plural inessive =&gt; poi + "kiz" ;
        NF singular elative =&gt; poi + "gõssõ" ;
        NF plural elative =&gt; poi + "kissõ" ;
        NF singular allative =&gt; poi + "gõllõ" ;
        NF plural allative =&gt; poi + "killõ" ;
        NF singular adessive =&gt; poi + "gõl" ;
        NF plural adessive =&gt; poi + "kil" ;
        NF singular ablative =&gt; poi + "gõltõ" ;
        NF plural ablative =&gt; poi + "kiltõ" ;
        NF singular translative =&gt; poi + "gõssi" ;
        NF plural translative =&gt; poi + "kissi" ;
        NF singular terminative =&gt; poi + "kassaa" ;
        NF plural terminative =&gt; poi + "kissaa" ;
        NF singular comitative =&gt; poi + "gaka" ;
        NF plural comitative =&gt; poi + "kika"
      }
    }


  mkAikõ : Str -&gt; Noun = \aikõ -&gt; 
    case aikõ of {
      ai + "kõ" =&gt; mkAikõConcrete ai ;
      _ =&gt; Predef.error "Unsuitable lemma for mkAikõ"
    } ;

  mkAikõConcrete : Str -&gt; Noun = \ai -&gt; 
    s = {
      table {
        NF singular nominative =&gt; ai + "kõ" ;
        NF plural nominative =&gt; ai + "gõd" ;
        NF singular genitive =&gt; ai + "ga" ;
        NF plural genitive =&gt; ai + "koi" ;
        NF plural genitive =&gt; ai + "kojõ" ;
        NF singular partitive =&gt; ai + "ka" ;
        NF singular partitive =&gt; ai + "kaa" ;
        NF plural partitive =&gt; ai + "koi" ;
        NF plural partitive =&gt; ai + "koitõ" ;
        NF singular illative =&gt; ai + "ka" ;
        NF singular illative =&gt; ai + "kasõ" ;
        NF plural illative =&gt; ai + "koisõ" ;
        NF singular inessive =&gt; ai + "gõz" ;
        NF plural inessive =&gt; ai + "koiz" ;
        NF singular elative =&gt; ai + "gõssõ" ;
        NF plural elative =&gt; ai + "koissõ" ;
        NF singular allative =&gt; ai + "gõllõ" ;
        NF plural allative =&gt; ai + "koillõ" ;
        NF singular adessive =&gt; ai + "gõl" ;
        NF plural adessive =&gt; ai + "koil" ;
        NF singular ablative =&gt; ai + "gõltõ" ;
        NF plural ablative =&gt; ai + "koiltõ" ;
        NF singular translative =&gt; ai + "gõssi" ;
        NF plural translative =&gt; ai + "koissi" ;
        NF singular terminative =&gt; ai + "kassaa" ;
        NF plural terminative =&gt; ai + "koissaa" ;
        NF singular comitative =&gt; ai + "gaka" ;
        NF plural comitative =&gt; ai + "koika"
      }
    }


  mkLentüz : Str -&gt; Noun = \lentüz -&gt; 
    case lentüz of {
      lentü + "z" =&gt; mkLentüzConcrete lentü ;
      _ =&gt; Predef.error "Unsuitable lemma for mkLentüz"
    } ;

  mkLentüzConcrete : Str -&gt; Noun = \lentü -&gt; 
    s = {
      table {
        NF singular nominative =&gt; lentü + "z" ;
        NF plural nominative =&gt; lentü + "sed" ;
        NF singular genitive =&gt; lentü + "se" ;
        NF plural genitive =&gt; lentü + "si" ;
        NF singular partitive =&gt; lentü + "sse" ;
        NF plural partitive =&gt; lentü + "ssi" ;
        NF singular illative =&gt; lentü + "sesse" ;
        NF plural illative =&gt; lentü + "sisse" ;
        NF singular inessive =&gt; lentü + "sez" ;
        NF plural inessive =&gt; lentü + "siz" ;
        NF singular elative =&gt; lentü + "sse" ;
        NF plural elative =&gt; lentü + "sissõ" ;
        NF singular allative =&gt; lentü + " gõllõ" ;
        NF plural allative =&gt; lentü + " koillõ" ;
        NF singular adessive =&gt; lentü + " gõl" ;
        NF plural adessive =&gt; lentü + " koil" ;
        NF singular ablative =&gt; lentü + " gõltõ" ;
        NF plural ablative =&gt; lentü + " koiltõ" ;
        NF singular translative =&gt; lentü + " gõssi" ;
        NF plural translative =&gt; lentü + " koissi" ;
        NF singular terminative =&gt; lentü + " kassaa" ;
        NF plural terminative =&gt; lentü + " koissaa" ;
        NF singular comitative =&gt; lentü + " gaka" ;
        NF plural comitative =&gt; lentü + " koika"
      }
    }


  mkAmmõz : Str -&gt; Noun = \ammõz -&gt; 
    case ammõz of {
      am + "mõz" =&gt; mkAmmõzConcrete am ;
      _ =&gt; Predef.error "Unsuitable lemma for mkAmmõz"
    } ;

  mkAmmõzConcrete : Str -&gt; Noun = \am -&gt; 
    s = {
      table {
        NF singular nominative =&gt; am + "mõz" ;
        NF plural nominative =&gt; am + "pad" ;
        NF singular genitive =&gt; am + "pa" ;
        NF plural genitive =&gt; am + "paijõ" ;
        NF singular partitive =&gt; am + "massõ" ;
        NF plural partitive =&gt; am + "paitõ" ;
        NF singular illative =&gt; am + "pasõ" ;
        NF plural illative =&gt; am + "paisõ" ;
        NF singular inessive =&gt; am + "paz" ;
        NF plural inessive =&gt; am + "paiz" ;
        NF singular elative =&gt; am + "passõ" ;
        NF plural elative =&gt; am + "paissõ" ;
        NF singular allative =&gt; am + "pallõ" ;
        NF plural allative =&gt; am + "paillõ" ;
        NF singular adessive =&gt; am + "pal" ;
        NF plural adessive =&gt; am + "pail" ;
        NF singular ablative =&gt; am + "paltõ" ;
        NF plural ablative =&gt; am + "pailtõ" ;
        NF singular translative =&gt; am + "passi" ;
        NF plural translative =&gt; am + "paissi" ;
        NF singular terminative =&gt; am + "passaa" ;
        NF plural terminative =&gt; am + "paissaa" ;
        NF singular comitative =&gt; am + "paka" ;
        NF plural comitative =&gt; am + "paika"
      }
    }


  mkTüttö : Str -&gt; Noun = \tüttö -&gt; 
    case tüttö of {
      tüt + "t" + ö =&gt; mkTüttöConcrete tüt ö ;
      _ =&gt; Predef.error "Unsuitable lemma for mkTüttö"
    } ;

  mkTüttöConcrete : Str -&gt; Noun = \tüt,ö -&gt; 
    s = {
      table {
        NF singular nominative =&gt; tüt + "t" + ö ;
        NF plural nominative =&gt; tüt + ö + "d" ;
        NF singular genitive =&gt; tüt + ö ;
        NF plural genitive =&gt; tüt + "t" + ö + "i" ;
        NF plural genitive =&gt; tüt + "t" + ö + "je" ;
        NF singular partitive =&gt; tüt + "t" + ö + "ä" ;
        NF plural partitive =&gt; tüt + "t" + ö + "i" ;
        NF plural partitive =&gt; tüt + "t" + ö + "ite" ;
        NF singular illative =&gt; tüt + "t" + ö + "se" ;
        NF plural illative =&gt; tüt + "t" + ö + "ise" ;
        NF singular inessive =&gt; tüt + "t" + ö + "z" ;
        NF plural inessive =&gt; tüt + "t" + ö + "iz" ;
        NF singular elative =&gt; tüt + ö + "sse" ;
        NF plural elative =&gt; tüt + "t" + ö + "isse" ;
        NF singular allative =&gt; tüt + ö + "lle" ;
        NF plural allative =&gt; tüt + "t" + ö + "ille" ;
        NF singular adessive =&gt; tüt + ö + "l" ;
        NF plural adessive =&gt; tüt + "t" + ö + "il" ;
        NF singular ablative =&gt; tüt + ö + "lte" ;
        NF plural ablative =&gt; tüt + "t" + ö + "ilte" ;
        NF singular translative =&gt; tüt + ö + "ssi" ;
        NF plural translative =&gt; tüt + "t" + ö + "issi" ;
        NF singular terminative =&gt; tüt + "t" + ö + "ssaa" ;
        NF plural terminative =&gt; tüt + "t" + ö + "issaa" ;
        NF singular comitative =&gt; tüt + ö + "ka" ;
        NF plural comitative =&gt; tüt + "t" + ö + "ika"
      }
    }

