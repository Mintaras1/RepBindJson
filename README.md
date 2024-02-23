Keybindo versijos:

v4.2.5 - 2024-02-23

    [🟣] Suremontuotas GetVehID() funkcijos random crashas
    [🟢] April fools
    [🟣] [Atidaryti chatą su "/" mygtuku.] ir [Atvykus pas žaidėją į iškvietimą, duoti jam:] turėjo tą patį id. Fixed.
    [🔴] Panaikinta funkcija: "Pardavus žaidėjui skelbimų, tikrinti senus skelbimus su to žaidėjo nicku."

v4.2.4 - 2023-11-21

    [🟣] Atsiradus iškvietimui, chatą su /važiuoju nebeatidarinės jeigu jau turi paėmęs iškvietimą. 
    [🟢] Nustatymai >> Papildomos funkcijos >> Random >> Prie žaidėjų nickų pridėti [ID] (a.k.a. ChatID). 

v4.2.2 - 2023-11-11

    [🟣] Pataisytas bugas dėl scripto perkrovimo būnant AFK režime.
    [🟢] Nustatymai >> Papildomos funkcijos >> Iškvietimai >> Blokuoti /tp komandą jeigu esi arčiau iškvietimo negu būtum padaręs /tp.
    [🟢] Nustatymai >> Papildomos funkcijos >> Iškvietimai >> Jeigu iškvietėjas yra pasidaręs /offto, parašyti jam į /sms kad pasidarytu /onto (1 kartą per iškv.).
    [🟢] Nustatymai >> Papildomos funkcijos >> Iškvietimai >> Supypseti kai atsiranda iškvietimas.
    [🟣] Praplėsta į šonus /senisk lentelė.
    [🟢] Per /senisk lentelę rodys paskelbto skelbimo datą.
    [🟢] Nustatymai >> Papildomos funkcijos >> Skelbimai >> Pardavus žaidėjui skelbimų, tikrinti senus skelbimus su to žaidėjo nicku.

v4.2.1 - 2023-10-23

    [🟢] Nustatymai >> Papildomos funkcijos >> Iškvietimai >> Atvykus į iškvietimą, rašyti pasisveikinimo žinutę.
    [🟣] Patvarkytas bugas dėl kurio išsijungdavo keybindas, kai bandydavo žaidėją informuoti jog jam baigėsi skelbimai.

v4.2 - 2023-10-15

    [🟢] Nustatymas kuris perkelinėjo sekimo lentelę į dešinę pusę taippat perkels ir GPS lentelę.
    [🟢] F3 >> Nustatymai >> Papildomos funkcijos >> Komandos >> Sutrumpinti "/bendradarbiai" komandą į "/bendr" bei "/kolegos".
    [🟢] Sukurtas naujas įrankis palengvinantis keybindo įrašymą.
    [🟣] Tekstas kuris viršija 128simbolius bus apkarpytas, kad tilptu į chatą (nerodė teksto dėl per daug simbolių).
    [🟢] Nauja komanda "/repbind.import.ebinds" kuri įkelia informacija iš /ebinds keybindo į Rep Binder keybindą.

v4.1.2 - 2023-09-23

    [🟣] Supaprastintos kaikurios funkcijos.
    [🟣] Sutvarkytas bugas dėl kurio perkrovus visus scriptus su Ctrl + R išsicrashindavo rep bindas.
    [🟣] Panaikintas DEBUG tekstas iš F2 knopkės (RIP Gaw_Gaw, taip ir negavo 500€).

v4.1.1 - 2023-04-28

    [🟢] Pridėtas nustatymas (Nustatymai >> Papildomos funkcijos >> Iškvietimai) Rankiniu būdu atsitelinti į paskutinį paimtą iškvietimą.
    [🟢] Pridėtas nustatymas (Nustatymai >> Papildomos funkcijos >> Random) Atidaryti chatą su "/" mygtuku.
    [🟢] Pridėtas nustatymas (Nustatymai >> Papildomos funkcijos >> Iškvietimai) Atvykus pas žaidėją į iškvietimą, duoti jam xxxxx €.

v4.1 - 2023-04-15

    [🟣] Sutvarkyta AutoUpdate funkcija
    [🟣] Sutvarkyta problema dėl MultiThread crashų
    [🟢] Naudojant /xx arba /x komandas (su auto sk idėjimu) galima rašyti skelbėjo ID vietoj pilno V_P
    [🟢] Pridėtas nustatymas (Nustatymai >> Papildomos funkcijos >> Iškvietimai) "Sekimo lentelė kitoje ekrano pusėje"
    [🔴] Neberašys iškvID/iškvFIX į sampfuncs consolę
    [🟣] Kad atidarytu chatą su /vaziuoju, nebereikės buti įjungus IškvFix funkcijos
    [🟣] AutoRR pradės siūsti senus skelbimus į šiukšlyną
    [🟢] Po scripto restarto AutoSK funkcija nedirbs 10sec (kad nespamintu jeigu katik buvo sk)
    [🟢] Atnaujinta skelbimų sinchronizavimo funkcija
    [🟢] Pridėjau funkciją, kad galėčiau visiems uždėti Premium funkcijas (ne tik vienam asmeniui)
    [🟢] Išjungs aktyvius skelbimus jeigu bandys skelbti skelbimus nedirbant reporteriu
    [🟢] Sukurtas settings.json backupas, jeigu susicorruptintu nustatymai (kaikurie kažkaip sugeba)
    [🟣] Perdaryta nick aptikimo sistema
    [🟣] /vaziuoju rašymas į chatą funkcija tikrins, ar žaidėjas turi aktyvų premium keybind
    [🟢] Jeigu darbuotojas idės 1k į dfondą su tekstu, rašys į chatą jo tekstą (fake [racija] žinutė)

v4.0 - 2022-05-12

    [🟢] Skalbenkė perrašyta iš .ahk į .lua (+Linux palaikymas)
    [🟢] Skalbenkės valdymas žaidime (Default "F3" arba "/repbind")
    [🟢] Pridėta nauja funkcija, kurią įjungus, bus nusiūtas sms'as klientui, jog jo skelbimai pasibaigė.
    [🟢] Prie papildomų funkcijų pridėta funkcija kad paėmus iškvietimą daryt /to pas klientą.
    [🟣] Atnaujintos darbinės tr. priemonės.Pakeistos
    [🟢] Nauja komanda: /ap.
    [🟢] Jeigu skelbiamo teksto V_P yra prisijungęs, rašys jo ID (kad nesipjautu su chatid.sf ir nenupjautu eilutės).
    [🟡] Pridėta galimybė nusipirkti papildomų funkcijų ant savo nicko:
        [🟡] Premium skalbenkė (automatinis skelbimas bet kurioje mašinoje)
        [🟡] Premium skalbenkė (automatinis skelbimas nebūnant mašinoje)
        [🟡] Premium keybind (galimybė loopint bet kokį tekstą/komandą)
        [🟡] Premium skaičiuoklė (vietoj vnt kainos galima rašyt paslaugos tipą pagal dienos/nakties tarifą.)
    [🟢] Nauja komanda: /premium
    [🔴] Paprasto keybindo automatinę funkciją bus galima naudoti tik su nustatytomis komandomis.
    [🟢] SeniSkelbimai tab'e, pridėtas paieškos laukelis.
    [🟢] Pridėta nauja funkcija, IškvID ir IškvFIX (pirmoji sutvarko iškvietusio nicką ir prirašo ID, antroji tik sutvarko nicką).
    [🔴] Panaikinta galimybė siūsti tekstą serveriui per "T" raidę.
    [🟢] Pridėta AutoRR funkcija (baigus skelbt skelbimus, už jus paspaus RR mygtuką).
    [🟢] Galimybė paslėpt savo skelbiamus skelbimus.
    [🟢] Galimybė paslėpt "Paskelbėte * skelbimų su komanda /x".
    [🟢] Galimybė nustatymuose pasikeist, po kiek vienodų skelbimų paslėpt skelbimus.
    [🟢] "Paskelbėte * skelbimų su komanda /x *" rašys paskelbtus skelbimus pagal rep bindą.
    [🟢] Skelbiant automatiškai, rašys apytiksliai, kiek laiko skelbs skelbimus.
    [🟢] Paspaudus RR kai nebaigta skelbti skelbimu, automagiškai parašys "/restartuoti x".
    [🟢] Galimybė sutrumpint "/dstatistika" komandą į "/dstat".
