//
//  ViewController.swift
//  Priručnik za posmatranje izbora
//
//  Created by Mirza Horman on 17. 4. 2022..
//

import UIKit
import AVFoundation
import AVKit
import CoreLocation




class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var manager: CLLocationManager?
    var longitude: CLLocationDegrees = 0.0;
    var latitude: CLLocationDegrees = 0.0;

    var naslov1 = "ODSUSTVO ČLANOVA BO"
    var text1="Svi članovi biračkog odbora (BO) moraju doći na biračko mjesto (BM) najmanje sat vremena prije početka glasanja (u 06:00h). Prije otvaranja BM, samo članovi BO i akreditovani posmatrači mogu biti prisutni na biračkom mjestu. Predsjednik BO zadužen je izvršiti jasnu raspodjelu zadataka članovima BO. \n\n" +
    "Članovi B.O. na vidnom mjestu objavljuju spisak članova biračkog odbora sa naznakom političkog subjekta koji ih je nominirao.\n\n" +
    "!BO osigurava uređenje biračkog mjesta na način koji omogućava kružno, nesmetano kretanje birača od ulaska na BM do ubacivanja glasačkih listića u glasačku kutiju!\n";
    var s1 = "Svi clanovi birackog odbora (BO) moraju doci na biracko mjesto (BM) najmanje sat vremena prije pocetka glasanja (u 06:00h). Prije otvaranja BM, samo clanovi BO i akreditovani posmatraci mogu biti prisutni na birackom mjestu. Predsjednik BO zaduzen je izvrsiti jasnu raspodjelu zadataka clanovima BO. \n\n" +
    "!BO osigurava uredenje birackog mjesta na nacin koji omogucava kruzno, nesmetano kretanje biraca od ulaska na BM do ubacivanja glasackih listica u glasacku kutiju!\n ODSUSTVO CLANOVA BO"
    
    var naslov2="PLAKATI POLITIČKIH SUBJEKATA U OKOLINI BM";
    var text2="Pod BM i njegovom okolinom smatra se BM, kao i prostor u krugu od 50 metara od ulaza u zgradu u kojoj se nalazi BM. Na BM i njegovoj okolini nije dozvoljeno isticati bilo kakve materijale koji se mogu dovesti u vezu sa bilo kojim političkim subjektom. Dozvoljeno je postavljanje samo službenih obilježja izbora koje propiše CIK BiH. To su:\n\n" +
    "•\tplakati sa izgledom glasačkih listića na kojima se glasa,\n" +
    "•\tplakati sa uputom o načinu glasanja i plakati sa informativnim sadržajima za birače, \n" +
    "•\tplakat sa izvodima iz krivičnih zakona.\n\n" +
    "!BM ne može se nalaziti u vjerskom objektu, zgradi organa vlasti, zgradi koja je vlasništvo političke stranke ili u kojoj je sjedište političke stranke ili mjestu gdje se služi ili konzumira alkohol!\n";
    var s2 = "PLAKATI POLITICKIH SUBJEKATA U OKOLINI BM Pod BM i njegovom okolinom smatra se BM, kao i prostor u krugu od 50 metara od ulaza u zgradu u kojoj se nalazi BM. Na BM i njegovoj okolini nije dozvoljeno isticati bilo kakve materijale koji se mogu dovesti u vezu sa bilo kojim politickim subjektom. Dozvoljeno je postavljanje samo sluzbenih obiljezja izbora koje propise CIK BiH. To su:\n\n" +
    "•\tplakati sa izgledom glasackih listica na kojima se glasa,\n" +
    "•\tplakati sa uputom o nacinu glasanja i plakati sa informativnim sadržajima za birace, \n" +
    "•\tplakat sa izvodima iz krivicnih zakona.\n\n" +
    "!BM ne moze se nalaziti u vjerskom objektu, zgradi organa vlasti, zgradi koja je vlasnistvo politicke stranke ili u kojoj je sjediste politicke stranke ili mjestu gdje se sluzi ili konzumira alkohol!\n";
    var naslov3="NEDOSTATAK ILI NESTANAK IZBORNOG MATERIJALA";
      var text3="Birački materijal se u noći prije otvaranja biračkog mjesta čuva u zaključanim prostorijama na lokaciji biračkog mjesta kojeg osigurava policija na lokacijama biračkih mjesta. " +
    "\n\n" +
    "Prije početka glasanja, BO će u prisustvu akreditovanih posmatrača:\n\n" +
    "•\tprebrojati i upisati u odgovarajuće obrasce ukupan broj birača za biračko mjesto na osnovu izvoda iz Centralnog biračkog spiska,\n" +
    "•\tprekontrolisati sav zaprimljeni izborni materijal,\n" +
    "•\tprebrojati i upisati u odgovarajuće obrasce ukupan broj svih glasačkih listića koji su zaprimljeni za to biračko mjesto,\n" +
    "•\turediti biračko mjesto po propisima,\n" +
    "•\tpodijeliti pojedinačne zadatke za svakog člana BO, \n" +
    "•\tizložiti prazne glasačke kutije i zapečatiti ih.\n";
    var s3 = "Biracki materijal se u noci prije otvaranja birackog mjesta cuva u zakljucanim prostorijama na lokaciji birackog mjesta kojeg osigurava policija na lokacijama birackih mjesta. Prije pocetka glasanja, BO ce u prisustvu akreditovanih posmatraca:\n\n" +
    "•\tprebrojati i upisati u odgovarajuce obrasce ukupan broj biraca za biracko mjesto na osnovu izvoda iz Centralnog birackog spiska,\n" +
    "•\tprekontrolisati sav zaprimljeni izborni materijal,\n" +
    "•\tprebrojati i upisati u odgovarajuce obrasce ukupan broj svih glasackih listica koji su zaprimljeni za to biracko mjesto,\n" +
    "•\turediti biracko mjesto po propisima,\n" +
    "•\tpodijeliti pojedinacne zadatke za svakog clana BO, \n" +
    "•\tizloziti prazne glasacke kutije i zapecatiti ih.\n NEDOSTATAK ILI NESTANAK IZBORNOG MATERIJALA";
    var naslov4="GLASAČKA KUTIJA NIJE POKAZANA PRAZNA I PROPISNO ZAPEČAĆENA";
    var text4="Prije početka glasanja, BO će u prisustvu akreditovanih posmatrača pokazati da je glasačka kutija prazna i potom je propisno zapečatiti na način da praznu glasačku kutiju zatvori, a potom da otvor glasačke kutije osigura odgovarajućim pečatom.";
    var s4 = "GLASAcKA KUTIJA NIJE POKAZANA PRAZNA I PROPISNO ZAPEcAcENA Prije pocetka glasanja, BO ce u prisustvu akreditovanih posmatraca pokazati da je glasacka kutija prazna i potom je propisno zapecatiti na nacin da praznu glasacku kutiju zatvori, a potom da otvor glasacke kutije osigura odgovarajucim pecatom.";
    var naslov5="TAJNOST GLASANJA";
    var text5="BO osigurava tajnost glasanja na način da je kabina za glasanje postavljena tako da onemogućava druge da imaju uvid u to kako glasač ispunjava glasački listić. To znači da paravani za glasanje moraju biti postavljeni na stolove tako da se nalaze ispred birača koji glasa i onemogućavaju uvid u to za koga birač glasa. Birački odbor određuje mjesto za svaku glasačku kabinu na način da se otvor glasačke kabine okrene prema članovima biračkog odbora i posmatračima, i da bude dovoljno udaljena od članova B.O. , posmatrača ili birača kako bi se omogućila tajnost glasanja.\n";
    var s5 = "tajnost glasanja BO osigurava tajnost glasanja na nacin da je kabina za glasanje postavljena tako da onemogucava druge da imaju uvid u to kako glasac ispunjava glasacki listic. To znaci da paravani za glasanje moraju biti postavljeni na stolove tako da se nalaze ispred biraca koji glasa i onemogucavaju uvid u to za koga birac glasa. Biracki odbor odredjuje odreduje mjesto za svaku glasacku kabinu na nacin da se otvor glasacke kabine okrene prema clanovima birackog odbora i posmatracima, i da bude dovoljno udaljena od clanova B.O. , posmatraca ili biraca kako bi se omogucila tajnost glasanja.";
    var naslov6="!ZABRANA ILI ONEMOGUĆAVANJE POSMATRANJA!";
    var text6="BO ne smije uskratiti posmatranje akreditovanom posmatraču izbora ukoliko je isti akreditovan za posmatranje izbora na biračkom mjestu od strane CIK-a ili OIK-a za osnovnu izbornu jedinicu u kojoj pristupa posmatranju, nalazi se na listi akreditovanih posmatrača, ima važeću akreditaciju i ima važeće bosanskohercegovačke lične dokumente na osnovu kojih je moguće utvrditi identitet posmatrača.\n\n" +
            "BO može uskratiti posmatranje akreditovanom posmatraču samo ukoliko fizička lokacija/prostorija u kojoj je smješteno BM nije adekvatna da primi sve akreditovane posmatrače (premala prostorija u koju ne mogu biti smješteni svi posmatrači zbog nedostatka prostora usljed čega bi se stvorila veća gužva na BM i remetio izborni proces).   \n" +
            "Prisustvo posmatrača ima za cilj zaštitu integriteta izbornog procesa i glasova svih birača. \n\n" +
            "Nastojte ostvariti korektne odnose sa svim osobama na biračkom mjestu – time ćete i sebi i drugima olakšati rad i dugotrajan boravak na biračkom mjestu.\n";
    var s6 = "!ZABRANA ILI ONEMOGUcAVANJE POSMATRANJA! BO ne smije uskratiti posmatranje akreditovanom posmatracu izbora ukoliko je isti akreditovan za posmatranje izbora na birackom mjestu od strane CIK-a ili OIK-a za osnovnu izbornu jedinicu u kojoj pristupa posmatranju, nalazi se na listi akreditovanih posmatraca, ima vazecu akreditaciju i ima vazece bosanskohercegovacke licne dokumente na osnovu kojih je moguce utvrditi identitet posmatraca.\n" +
    "BO moze uskratiti posmatranje akreditovanom posmatracu samo ukoliko fizicka lokacija/prostorija u kojoj je smjesteno BM nije adekvatna da primi sve akreditovane posmatrace (premala prostorija u koju ne mogu biti smjesteni svi posmatraci zbog nedostatka prostora usljed cega bi se stvorila veca guzva na BM i remetio izborni proces).   \n" +
    "Prisustvo posmatraca ima za cilj zastitu integriteta izbornog procesa i glasova svih biraca. \n" +
    "Nastojte ostvariti korektne odnose sa svim osobama na birackom mjestu – time cete i sebi i drugima olaksati rad i dugotrajan boravak na birackom mjestu.";
    var naslov7="KAŠNJENJE U OTVARANJU BM";
    var text7="Biračka mjesta se otvaraju u 07:00h, ostaju otvorena neprekidno 12 sati, zatvaraju se u 19:00h. Ako BM iz opravdanih razloga nije otvoreno na vrijeme, a kašnjenje je trajalo do 3 sata, glasanje će se produžiti za onoliko vremena koliko je trajalo kašnjenje. Ako je kašnjenje trajalo duže od 3 sata, predsjednik BO obavještava lokalnu izbornu komisiju o razlogu zbog kojeg je došlo do kašnjenja u otvaranju BM ili do prekida glasanja na BM, nakon čega o dužini vremena za koje se glasanje produžava odlučuje lokalna izborna komisija.\n" +
    "Zakon propisuje da birački odbori imaju tri ili pet članova te da svi članovi moraju biti prisutni kod otvaranja biračkog mjesta.\n";
    var s7 = "KAsNJENJE U OTVARANJU BM Biracka mjesta se otvaraju u 07:00 h, ostaju otvorena neprekidno 12 sati, zatvaraju se u 19:00 h. Ako BM iz opravdanih razloga nije otvoreno na vrijeme, a kasnjenje je trajalo do 3 sata, glasanje ce se produziti za onoliko vremena koliko je trajalo kasnjenje. Ako je kasnjenje trajalo duze od 3 sata, predsjednik BO obavjestava lokalnu izbornu komisiju o razlogu zbog kojeg je doslo do kasnjenja u otvaranju BM ili do prekida glasanja na BM, nakon cega o duzini vremena za koje se glasanje produzava odlucuje lokalna izborna komisija.\n" +
    "Zakon propisuje da biracki odbori imaju tri ili pet clanova te da svi clanovi moraju biti prisutni kod otvaranja birackog mjesta.";
       var naslov8="PRISUSTVO NEOVLAŠTENIH LICA";
       var text8="Na biračkom mjestu smiju biti prisutni samo članovi biračkog odbora (BO), akreditovani posmatrači i glasači koji trenutno glasaju ili se vrši provjera nijhovog identiteta prije nego pristupe glasanju. Prisustvo i zadržavanje drugih neovlaštenih lica nije dozvoljeno. Toleriše se i kratko prisustvo medija i viših izbornih komisija, ukoliko se ne remeti proces glasanja.";
    var s8 = "PRISUSTVO NEOVLAsTENIH LICA Na birackom mjestu smiju biti prisutni samo clanova irackog odbora (BO), akreditovani posmatraci i glasaci koji trenutno glasanju ili se vrsi provjera nijhovog identiteta prije nego pristupe glasanju. Prisustvo i zadrzavanje drugih neovlastenih lica nije dozvoljenom. Tolerise se i kratko prisustvo medija i visih izbornih komisija, ukoliko se ne remeti proces glasanja.";
    
    var naslov9="MANIPULACIJE PRI IDENTIFIKACIJI BIRAČA I IZDAVANJU GLASAČKIH LISTIĆA";
    var text9="Članovi biračkog odbora svjesno učestvuju u manipulacijama, tako što pojedinim glasačima izdaju više od jednog listića po izbornoj utrci ili dozvoljavaju da jedna osoba glasa više puta u svoje ime u ime drugog birača koji se nije pojavio na biračkom mjestu.";
    var s9 = "MANIPULACIJE PRI IDENTIFIKACIJI BIRAcA I IZDAVANJU GLASAcKIH LISTIcA clanovi birackog odbora svjesno ucestvuju u manipulacijama, tako sto pojedinim glasacima izdaju vise od jednog listica po izbornoj utrci ili dozvoljavaju da jedna osoba glasa vise puta u svoje ime ili u ime drugog biraca koji se nije pojavio na birackom mjestu."
    
    var naslov10="GLASANJE BEZ PROPISANOG IDENTIFICIRANJA BIRAČA";
    var text10="Može se dogoditi da članovi BO ne traže bilo kakve dokumente za identifikaciju glasača, ili da prihvataju one koji nisu adekvatni (indeks, ribolovačka dozvola, klupske članske karte, odnosno bilo šta osim važeće bosanskohercegovačke lične karte, pasoša i vozačke dozvole). Ukoliko je učestalost ove pojave velika, to više nije proceduralni propust nego sumnja na manipulaciju.\n" +
    "\n" +
    "Birački odbor dužan je izvršiti provjeru identifikacionih dokumenata kako bi utvrdio identitet birača. Pratite da li birački odbor to radi redovno. Ukoliko je bilo nekoliko sporadičnih slučajeva neutvrđivanja identiteta birača, posebno ako se radi o  starijim osobama,  to ne mora biti problematično.\n" +
    "\n" +
    "Procijeniti radi li se o proceduralnoj greški (npr. član BO prepoznao komšiju pa mu nije pogledao dokumente) ili o manipulaciji (dogodilo se više od 5 puta tokom dana). Imate mogućnost reagovanja primjedbom u ZARBO.\n" +
    "\n" +
    "Član BO zadužen za identifikaciju birača ne smije naglas izgovarati ime i prezime birača na način da svi koji su se zatekli na BM isto mogu jasno čuti.\n" +
    "\n" +
    "Član BO zadužen za identifikaciju birača dužan je upozoriti birača da se u Izvod iz CBS-a mora potpisati identično kao na priloženom identifikacionom dokumentu.\n" +
    "\n" +
    "Birački odbor dužan je vratiti birače bez odgovarajućih isprava kao i birače koji nisu na Izvodu iz Centralnog biračkog spiska za to biračko mjesto. Bilježite broj birača koji je vraćen i razlog njihovog vraćanja sa BM.\n";
    var s10 = "GLASANJE BEZ PROPISANOG IDENTIFICIRANJA BIRAcA Moze se dogoditi da zlanovi BO ne traze bilo kakve dokumente za identifikaciju glasaca, ili da prihvataju one koji nisu adekvatni (indeks, ribolovazka dozvola, klupske zlanske karte, odnosno bilo sta osim vazece bosanskohercegovacke licne karte, pasosa i vozacke dozvole). Ukoliko je uzestalost ove pojave velika, to vise nije proceduralni propust nego sumnja na manipulaciju.\n" +
    "\n" +
    "Biracki odbor duzan je izvrsiti provjeru identifikacionih dokumenata kako bi utvrdio identitet biraca. Pratite da li biracki odbor to radi redovno. Ukoliko je bilo nekoliko sporadicnih slucajeva neutvrdjivanja  neutvrdivanja  identiteta biraca, posebno ako se radi o  starijim osobama,  to ne mora biti problematicno.\n" +
    "Procijeniti radi li se o proceduralnoj greski (npr. clan BO prepoznao komsiju pa mu nije pogledao dokumente) ili o manipulaciji (dogodilo se vise od 5 puta tokom dana). Imate mogucnost reagovanja primjedbom u ZARBO.  \n" +
    "clan BO zaduzen za identifikaciju biraca ne smije naglas izgovarati ime i prezime biraca na nacin da svi koji su se zatekli na BM isto mogu jasno cuti.\n" +
    "clan BO zaduzen za identifikaciju biraca duzan je upozoriti biraca da se u Izvod iz CBS-a mora potpisati identicno kao na prilozenom identifikacionom dokumentu.\n" +
    "Biracki odbor duzan je vratiti birace bez odgovarajucih isprava kao i birace koji nisu na Izvodu iz Centralnog birackog spiska za to biracko mjesto. Biljezite broj biraca koji je vracen i razlog njihovog vracanja sa BM.";
    

    var naslov11="KRAĐA ILI IZNOŠENJA GLASAČKIH LISTIĆA VAN BM";
    var text11="Član biračkog odbora zadužen za izdavanje glasačkih listića na prednjoj strani glasačkog listića u donjem lijevom uglu stavlja otisak štembilja pored kojeg se i potpisuje.\n\n" +
    "Protivzakonito je svako iznošenje glasačkih listića izvan biračkog mjesta od strane bilo kojeg učesnika u izbornom procesu. Svaki glasač mora označiti glasački listić unutar kabine za glasanje na biračkom mjestu. Unošenje ranije označenih listića je protivzakonito. Jedan glasač može dobiti samo po jedan listić za jedan izborni nivo.\n";
    var s11 = "KRAdjA krada ILI IZNOsENJA GLASAcKIH LISTIcA VAN BM clan birackog odbora zaduzen za izdavanje glasackih listica na prednjoj strani glasackog listica u donjem lijevom uglu stavlja otisak stembilja pored kojeg se i potpisuje.\n" +
    "Protivzakonito je svako iznosenje glasackih listica izvan birackog mjesta od strane bilo kojeg ucesnika u izbornom procesu. Svaki glasac mora oznaciti glasacki listic unutar kabine za glasanje na birackom mjestu. Unocenje ranije oznacenih listica je protivzakonito. Jedan glasac moze dobiti samo po jedan listic za jedan izborni nivo.";


    var naslov12="PRITISCI NA BIRAČE I ZASTRAŠIVANJE";
    var text12="Iako je izborni dan i dan izborne šutnje, događaju se pokušaji nagovaranja, zastrašivanja i pritisaka na birače na samom biračkom mjestu i oko njega, a od strane aktivista pojedinih političkih subjekata.\n" +
    "\n" +
    "Dobro pogledajte prostor u i oko biračkog mjesta. Ako primijetite ljude koji učestalo zaustavljaju glasače, pričaju sa njima na neprimjeren način, svađaju se, dobacuju i sl., pokušajte ustanoviti šta se tačno događa.\n";
    var s12 = "PRITISCI NA BIRAČE I ZASTRAŠIVANJE Iako je izborni dan i dan izborne sutnje, dogadaju se pokusaji nagovaranja, zastrasivanja i pritisaka na birace na samom birackom mjestu i oko njega, a od strane aktivista pojedinih politickih subjekata.\n" +
    "\n" +
    "Dobro pogledajte prostor u i oko birackog mjesta. Ako primijetite ljude koji ucestalo zaustavljaju glasace, pricaju sa njima na neprimjeren nacin, svadaju se, dobacuju i sl., pokusajte ustanoviti sta se tacno dogada."


    var naslov13="KUPOVINA GLASOVA";
    var text13="Zabranjen je svaki oblik davanja novca, usluge ili neke druge protuvrijednosti glasačima u zamjenu za glas za nekog kandidata ili političkog subjekta na izborni dan.";
    var s13 = "kupovina glasova Zabranjen je svaki oblik davanja novca, usluge ili neke druge protuvrijednosti glasacima u zamjenu za glas za nekog kandidata ili politickog subjekta na izborni dan. "


    var naslov14="PORODIČNO GLASANJE";
    var text14="Ova situacija ne implicira manipulaciju, nego proceduralne propuste biračkog odbora. Iako nije dozvoljeno zakonom, događa se da u pojedinim ruralnim krajevima „glava kuće“ ide u kabinu zajedno sa članovima porodice, često glasajući za njih ili direktno sugerišući za koga glasati. Predstavlja vid tradicionalnog nasljeđa ne samo u BiH, međutim, ako je učestalost velika može ostaviti snažan uticaj na izborni proces.\n" +
    "\n" +
    "Skrenite pažnju BO da porodično glasanje nije dozvoljeno. U slučaju da BO ne reagira, već sistemski dopušta porodično glasanje imate mogućnost reagovanja primjedbom u ZARBO.\n";
    var s14 = "porodicno glasanje Ova situacija ne implicira manipulaciju, nego proceduralne propuste birackog odbora. Iako nije dozvoljeno zakonom, dogada se da u pojedinim ruralnim krajevima „glava kuce“ ide u kabinu zajedno sa clanovima porodice, cesto glasajuci za njih ili direktno sugerisuci za koga glasati. Predstavlja vid tradicionalnog nasljeda ne samo u BiH, medutim, ako je ucestalost velika moze ostaviti snazan uticaj na izborni proces.\n" +
    "\n" +
    "Skrenite paznju BO da porodicno glasanje nije dozvoljeno. U slucaju da BO ne reagira, vec sistemski dopusta porodicno glasanje imate mogucnost reagovanja primjedbom u ZARBO.\n";

    var naslov15="FOTOGRAFISANJE GLASAČKIH LISTIĆA";
    var text15="Zabranjeno je fotografisanje glasačkih listića u glasačkoj kabini. To se smatra ozbiljnim kršenjem tajnosti glasanja jer indirektno upućuje na pritisk na glasače ili kupovinu glasova za što se od glasača traži dokumentovanje načina na koji je glasao.";
    var s15 = "fotografisanje glasackih listica Zabranjeno je fotografisanje glasackih listica u glasackoj kabini. To se smatra ozbiljnim krsenjem tajnosti glasanja jer indirektno upucuje na pritisk na glasace ili kupovinu glasova za sto se od glasaca trazi dokumentovanje nacina na koji je glasao.";


    var naslov16="KRUŽNO GLASANJE (TZV. BUGARSKI VOZ) – CARUSEL VOTING";
    var text16="Politički subjekti, želeći biti sigurni da će birač glasati za njih, pribavljaju prazan glasački listić, odnosno set listića za sve nivoe koji se biraju. Potom birača šalju na biračko mjesto sa već popunjenim listićima, a on sa biračkog mjesta donosi novi set praznih listića – i tako u krug.\n\n" +
    "Obratite pažnju po dolasku na biračko mjesto je li pakovanje glasačkih listića možda oštećeno i je li birački odbor ručno brojao listiće prije otvaranja BM, te da li prebrojano odgovara onome što stoji u Zapisniku o preuzimanju materijala od OIK/GIK-a.\n\n" +
    "Na Opštim/Općim izborima 2022. svaki glasač/birač će dobiti 4 glasačka listića* stoga obratite pažnju vrše li neki birači, posebno u prijepodnevnim satima, ubacivanje glasačkih listića tako što ih sve presaviju i odjednom ubace u kutiju. Ovo može biti indicija da upravo ti birači iznose 1 ili više praznih listića. Diskretno skrenite pažnju predsjedniku BO da bi možda glasači trebali ubacivati jedan po jedan listić u kutiju.\n\n" +
    "Obratite pažnju da li neki birači koji su iza paravana, šuškaju i izvlače eventualno već popunjene glasačke listiće iz džepa, a prazne ostavljaju kod sebe. Budite obzirni da ne pređete granicu ugrožavanja tajnosti glasanja. Koristite zdrav razum!\n\n" +
    "*Glasački listići u Federaciji BiH i Brčko Distriktu koji su odabrali opciju Federacija:\n" +
    "1.\tPredsjedništvo BiH \n" +
    "2.\tPredstavnički dom Parlamentarne skupštine BiH\n" +
    "3.\tPredstavnički dom Parlamenta Federacije BiH i \n" +
    "4.\tSkupštine kantona u FBiH.\n\n" +
    "*Glasački listići u Republici Srpskoj i Brčko Distriktu koji su odabrali opciju RS:\n" +
    "1.\tPredsjedništvo BiH \n" +
    "2.\tPredstavnički dom Parlamentarne skupštine BiH\n" +
    "3.\tPredsjednik i podpredsjednici RS i \n" +
    "4.\tNarodna skupština RS.\n ";
    var s16 = "KRUzNO GLASANJE (TZV. BUGARSKI VOZ) – CARUSEL VOTING Politicki subjekti, zeleci biti sigurni da će birac glasati za njih, pribavljaju prazan glasacki listic, odnosno set listica za sve nivoe koji se biraju. Potom biraca salju na biracko mjesto sa vec popunjenim listicima, a on sa birackog mjesta donosi novi set praznih listica – i tako u krug.\n" +
    "Obratite pacnju po dolasku na biracko mjesto je li pakovanje glasackih listica mozda osteceno i je li biracki odbor rucno brojao listice prije otvaranja BM, te da li prebrojano odgovara onome sto stoji u Zapisniku o preuzimanju materijala od OIK/GIK-a.\n" +
    "Na Opstim/Opcim izborima 2022. svaki glasac/birac ce dobiti 4 glasacka listica* stoga obratite paznju vrse li neki biraci, posebno u prijepodnevnim satima, ubacivanje glasackih listica tako što ih sve presaviju i odjednom ubace u kutiju. Ovo moze biti indicija da upravo ti biraci iznose 1 ili vise praznih listica. Diskretno skrenite paznju predsjedniku BO da bi mozda glasaci trebali ubacivati jedan po jedan listic u kutiju.\n" +
    "Obratite paznju da li neki biraci koji su iza paravana, suskaju i izvlace eventualno vec popunjene glasacke listice iz dzepa djepa, a prazne ostavljaju kod sebe. Budite obzirni da ne predjete predete granicu ugrozavanja tajnosti glasanja. Koristite zdrav razum!\n" +
    "*Glasacki listici u Federaciji BiH i Brcko Distriktu koji su odabrali opciju Federacija:\n" +
    "1.\tPredsjednistvo BiH \n" +
    "2.\tPredstavnicki dom Parlamentarne skupstine BiH\n" +
    "3.\tPredstavnicki dom Parlamenta Federacije BiH i \n" +
    "4.\tSkupstine kantona u FBiH.\n" +
    "*Glasacki listici u Republici Srpskoj i Brcko Distriktu koji su odabrali opciju RS:\n" +
    "1.\tPredsjedništvo BiH \n" +
    "2.\tPredstavnicki dom Parlamentarne skupštine BiH\n" +
    "3.\tPredsjednik i podpredsjednici RS i \n" +
    "4.\tNarodna skupština RS.\n"


    var naslov17="ZLOUPOTREBA POMAGAČA PRI GLASANJU";
    var text17="Glasanje je lično i svako smije glasati samo jednom. Svako smije glasati samo u svoje ime. Jedini izuzetak je pomoć pri glasanju. \n\n" +
    "Izuzetak od ličnog glasanja - Na zahtjev birača koji je slijep, nepismen ili fizički nesposoban, predsjednik BO odobrava primjenu postupka po kojem druga osoba, koju izabere birač koji nije u mogućnosti glasati, pomaže tom biraču pri potpisivanju izvoda iz CBS-a, kao i pri glasanju. Osoba koja pomaže pri glasanju ne može biti član biračkog odbora ili akreditovani posmatrač. Osoba koja pomaže biraču glasati napisaće svoje ime štampanim slovima na izvod iz CBS-a do imena birača kojem je pomagao i potpisati se. Osoba koja pomaže tom biraču ne mora biti upisana u CBS kao birač. Jedna osoba može pomagati samo jednom biraču.\n\n" +
    "Jedna osoba (a da to nije član biračkog odbora ni posmatrač) može pomoći samo jednom glasaču s posebnim potrebama. Zakon propisuje da se pomoć obezbjeđuje na zahtjev birača i to birača koji je slijep, nepismen ili fizički nesposoban.\n\n" +
    "Predsjednik biračkog odbora vodi evidenciju o situacijama u kojima se koristi pomoć drugog lica (PDL) na PDL obrascu. Dokaz da se radi o slijepom, nepismenom ili fizički nesposobnom licu je rješenje ili uvjerenje/potvrda nadležne ustanove, instituta ili komisije. Izborna komisija je obavezna da za svako biračko mjesto odštampa po 10 PDL obrazaca. B.O. će sve iskorištene obrasce PDL ubaciti u providnu plastičnu foliju.\n\n" +
    "Problem se javlja kod organizovanih pomagača, koji uz dopuštenje biračkog odbora pomažu većem broju ljudi, što je protivzakonito. Koristeći se ovom manipulacijom, aktivisti političkih stranaka često sami dovode veći broj ljudi na biračko mjesto da bi im „pomogli“ da glasaju.\n\n" +
    "Ukoliko primijetite ovakvu situaciju, procijenite je li proceduralna i zanemariva (npr. unuka pomaže i djedu i baki pri glasanju), ili je sistemska pojava i potencijalna manipulacija. Imate mogućnost reagovanja primjedbom u ZARBO.\n\n";
    var s17 = "ZLOUPOTREBA POMAGAcA PRI GLASANJU Glasanje je licno i svako smije glasati samo jednom. Svako smije glasati samo u svoje ime. Jedini izuzetak je pomoc pri glasanju. \n" +
    "Izuzetak od licnog glasanja - Na zahtjev biraca koji je slijep, nepismen ili fizicki nesposoban, predsjednik BO odobrava primjenu postupka po kojem druga osoba, koju izabere birac koji nije u mogucnosti glasati, pomaze tom biracu pri potpisivanju izvoda iz CBS-a, kao i pri glasanju. Osoba koja pomaze pri glasanju ne moze biti clan birackog odbora ili akreditovani posmatrac. Osoba koja pomaze biracu glasati napisace svoje ime stampanim slovima na izvod iz CBS-a do imena biraca kojem je pomagao i potpisati se. Osoba koja pomaze tom biracu ne mora biti upisana u CBS kao birac. Jedna osoba moze pomagati samo jednom biracu.\n" +
    "Jedna osoba (a da to nije clan birackog odbora ni posmatrac) moze pomoci samo jednom glasacu s posebnim potrebama. Zakon propisuje da se pomoc obezbjeđuje na zahtjev biraca i to biraca koji je slijep, nepismen ili fizicki nesposoban.\n" +
    "Predsjednik birackog odbora vodi evidenciju o situacijama u kojima se koristi pomoc drugog lica (PDL) na PDL obrascu. Dokaz da se radi o slijepom, nepismenom ili fizicki nesposobnom licu je rjesenje ili uvjerenje/potvrda nadlezne ustanove, instituta ili komisije. Izborna komisija je obavezna da za svako biracko mjesto odstampa po 10 PDL obrazaca. B.O. ce sve iskoristene obrasce PDL ubaciti u providnu plasticnu foliju.\n" +
    "Problem se javlja kod organizovanih pomagaca, koji uz dopustenje birackog odbora pomazu vecem broju ljudi, sto je protivzakonito. Koristeci se ovom manipulacijom, aktivisti politickih stranaka cesto sami dovode veci broj ljudi na biracko mjesto da bi im „pomogli“ da glasaju.\n" +
    "Ukoliko primijetite ovakvu situaciju, procijenite je li proceduralna i zanemariva (npr. unuka pomaze i djedu i baki pri glasanju), ili je sistemska pojava i potencijalna manipulacija. Imate mogucnost reagovanja primjedbom u ZARBO.\n";


    var naslov18="FIZIČKO NASILJE NA BM";
    var text18="Svako nasilje na biračkom mjestu predstavlja ozbiljno kršenje izbornih procedura. Važno je misliti na vlastitu sigurnost, udaljiti se sa biračkog mjesta i pozvati nadležne organe bezbjednosti.";
    var s18 = "FIZIČKO NASILJE NA BM Svako nasilje na birackom mjestu je predstavlja ozbiljno krsenje izbornih procedura. Vazno je misliti na vlastitu sigurnost, udaljiti se sa birackog mjesta i pozvati nadlezne organe bezbjednosti.";
    
    var naslov19="KAŠNJANJE U ZATVARANJU BM";
       var text19="Biračka mjesta se po pravilu zatvaraju u 19:00h. U slučaju kašnjenja u otvaranju, velike gužve i / ili dužeg prekida glasanja na biračkom mjestu, birački odbor može produžiti proces glasanja. Oni birači koji se zateknu u redu za glasanje u 19:00h mogu glasati. Procedura zatvaranja je sljedeća: predsjednik BO objavljuje 15 minuta prije zatvaranja BM svim prisutnim u i ispred BM vrijeme zatvaranja. Član BO zadužen za kontrolu reda u vrijeme zatvaranja BM staje na kraj reda kako bi se osiguralo da se nijedna osoba ne priključi nakon 19:00h. Nakon što posljednji birač iz reda glasa, zatvaraju se vrata BM. Predsjednik u Zapisnik unosi vrijeme zatvaranja biračkog mjesta, a nakon čega zatvara otvor glasačke kutije samoljepljivom trakom i potpisuje je. Prilikom zatvaranja biračkog mjesta predsjednik u Zapisnik evidentira prisutne posmatrače.\n" +
    "Svi članovi biračkog odbora moraju biti prisutni na zatvaranju biračkog mjesta. \n" +
    "Nakon zatvaranja, na biračkom mjestu mogu biti prisutni samo članovi biračkog odbora i akreditovani posmatrači. Ulazak i izlazak s biračkog mjesta u toku utvrđivnja rezultata glasanja nije dozvoljen.\n";
    var s19 = "KASNJANJE U ZATVARANJU BM Biracka mjesta se po pravilu zatvaraju u 19:00h. U slucaju kasnjenja u otvaranju, velike guzve i / ili duzeg prekida glasanja na birackom mjestu, biracki odbor moze produziti proces glasanja. Oni biraci koji se zateknu u redu za glasanje u 19:00h mogu glasati. Procedura zatvaranja je sljedeca: predsjednik BO objavljuje 15 minuta prije zatvaranja BM svim prisutnim u i ispred BM vrijeme zatvaranja. Član BO zaduzen za kontrolu reda u vrijeme zatvaranja BM staje na kraj reda kako bi se osiguralo da se nijedna osoba ne prikljuci nakon 19:00h. Nakon sto posljednji birac iz reda glasa, zatvaraju se vrata BM. Predsjednik u Zapisnik unosi vrijeme zatvaranja birackog mjesta, a nakon cega zatvara otvor glasacke kutije samoljepljivom trakom i potpisuje je. Prilikom zatvaranja birackog mjesta predsjednik u Zapisnik evidentira prisutne posmatrace.\n" +
    "Svi clanovi birackog odbora moraju biti prisutni na zatvaranju birackog mjesta. \n" +
    "Nakon zatvaranja, na birackom mjestu mogu biti prisutni samo clanovi birackog odbora i akreditovani posmatraci. Ulazak i izlazak s birackog mjesta u toku utvrdivnja rezultata glasanja nije dozvoljen."

    var naslov20="NISU OBAVLJENE SVE PRIPREME ZA BROJANJE GLASAČKIH LISTIĆA";
     var text20="Prije otvaranja kutije sa glasovima, BO pristupa utvrđivanju broja izašlih glasača na tom BM, te utvrđuje broj neiskorištenih listića i broj listića oštećenih/upropaštenih tokom glasanja. Svaki od ovih brojeva se utvrđuje posebno za svaku izbornu utrku. Uloga posmatrača je da te brojeve prepiše iz Obrasca za brojno stanje nakon što član BO unese taj podatak na odgovarajuće mjesto.\n" +
             "Neiskorišteni glasački listići pakuju se u originalne kutije. Oštećeni glasački listići pakuju se u koverte. Sve olovke, osim onih crvene boje/tinte, odlažu se u zaštitnu vreću zajedno sa neiskorištenim listićima i kovertom sa oštećenim listićima. \n" +
             "Svim akreditovanim posmatračima mora biti omogućeno nesmetano posmatranje cijelog procesa utvrđivanja rezultata i to sa mjesta s kojega imaju dobar uvid u sve radnje koje se poduzimaju.\n" +
             "Osobe koje broje glasove ne bi trebale imati hemijske ili bilo kakve druge olovke kojima mogu stavljati bilo kakve oznake na glasačke listiće.\n";
    var s20 = "NISU OBAVLJENE SVE PRIPREME ZA BROJANJE GLASAČKIH LISTIcA Prije otvaranja kutije sa glasovima, BO pristupa utvrdivanju broja izaslih glasaca na tom BM, te utvrduje broj neiskoristenih listica i broj listica ostecenih/upropastenih tokom glasanja. Svaki od ovih brojeva se utvrduje posebno za svaku izbornu utrku. Uloga posmatraca je da te brojeve prepise iz Obrasca za brojno stanje nakon sto clan BO unese taj podatak na odgovarajuce mjesto.\n" +
    "Neiskoristeni glasacki listici pakuju se u originalne kutije. Osteceni glasacki listici pakuju se u koverte. Sve olovke, osim onih crvene boje/tinte, odlazu se u zastitnu vrecu zajedno sa neiskoristenim listicima i kovertom sa ostecenim listicima. \n" +
    "Svim akreditovanim posmatracima mora biti omoguceno nesmetano posmatranje cijelog procesa utvrdivanja rezultata i to sa mjesta s kojega imaju dobar uvid u sve radnje koje se poduzimaju.\n" +
    "Osobe koje broje glasove ne bi trebale imati hemijske ili bilo kakve druge olovke kojima mogu stavljati bilo kakve oznake na glasacke listice.";
    
    
    var naslov21="NESLAGANJA U TESTU TAČNOSTI";
    var text21="Obratite pažnju da se brojevi koje birački odbor utvrđuje i upisuje u odgovrajuće obrasce moraju „slagati“. U tom kontekstu važno je znati da:\n" +
            "-\tBroj zaprimljenih listića za svaki izborni nivo mora biti veći od broja birača upisanih u birački spisak;\n" +
            "-\tBroj zaprimljenih listića mora biti jednak zbiru Broja listića u glasačakoj kutiji (iskorištenih), Broja nesikorištenih listića i Broja oštećenih listića za svaki izborni nivo posebno;\n" +
            "-\tBroj lisitića u glasačkoj kutiji mora biti jednak zbiru Važećih i Nevažećih glasačkih listića za svaki izborni nivo posebno;\n" +
            "-\tZbroj važećih i nevažećih listića trebao bi biti jednak broju birača koji su pristupili glasanju, odnosno broju potpisa na izvodu iz Centralnog biračkog spiska.\n" +
            "-\tBroj važećih listića mora biti jednak zbiru glasova svakih kandidata za za svaki izborni nivo posebno.\n" +
            "\n";
    var s21 = "NESLAGANJA U TESTU TAČNOSTI Obratite paznju da se brojevi koje biracki odbor utvrduje i upisuje u odgovrajuce obrasce moraju „slagati“. U tom kontekstu vazno je znati da:\n" +
    "-\tBroj zaprimljenih listica za svaki izborni nivo mora biti veci od broja biraca upisanih u biracki spisak;\n" +
    "-\tBroj zaprimljenih listica mora biti jednak zbiru Broja listica u glasacakoj kutiji (iskoristenih), Broja nesikoristenih listica i Broja ostecenih listica za svaki izborni nivo posebno;\n" +
    "-\tBroj lisitica u lasackoj kutiji mora biti jednak zbiru Vazecih i Nevazecih glasackih listica listica za svaki izborni nivo posebno;\n" +
    "-\tZbroj vazecih i nevazecih listica trebao bi biti jednak broju biraca koji su pristupili glasanju, odnosno broju potpisa na izvodu iz Centralnog birackog spiska.\n" +
    "-\tBroj vazecih listica mora biti jednak zbiru glasova svakih kandidata za za svaki izborni nivo posebno.";
    
    var naslov22="OLOVKE TOKOM BROJANJA GLASOVA";
    var text22="Tokom procesa brojanja glasova na stolu za brojanje dozvoljene su samo olovke crvene boje/tinte.";
    var s22 = "Tokom procesa brojanja glasavo na stolu za brojanje dozvoljene su samo olovke crvene boje/tinte.";
    
    
    var naslov23="NE POŠTUJE SE REDOSLIJED BROJANJA GLASAČKIH LISTIĆA";
    var text23="Glasački listići se broje tačno definisanim redoslijedom. Na Opštim/Općim izborima 2022. brojanje glasova vrši se po sljedećem redoslijedu:\n" +
    "1. Predsjedništvo BiH\n" +
    "2. Predstavnički dom Parlamentarne skupštine BiH\n" +
    "\n" +
    "Zatim se u Republici Srpskoj pristupa brojanju glasova za:\n" +
    "3. Predsjednika i potpredsjednike Republike Srpske; i\n" +
    "4. Narodnu skupštinu Republike Srpske\n" +
    "\n" +
    "Odnosno u Federaciji BiH pristupa se brojanju glasova za:\n" +
    "3. Predstavnički dom Parlamenta Federacije BiH; i \n" +
    "4. Kantonalne skupštine u Federaciji BiH\n" +
    "\n" +
    "U Brčko distriktu BiH prvo se broje glasovi po rasporedu brojanja predviđenom za entitet Republika Srpska, a odmah potom za entitet Federacija BiH.\n" +
    "Eventualni prekid rada u brojanju glasačkih listića predsjednik ili zamjenik predsjednika evidentira u zapisnik o radu B.O. u dio Z8. Također, ukoliko budu ispunjeni tehnički uvjeti, predsjednik B.O. na pogodan način dostavlja (komunikacijom putem adekvatne aplikacije) izbornoj komisiji preliminarne rezultate po političkim subjektima, odmah nakon prebrojavanja svakog nivoa koji se prebroji i popunjava obrazac za preliminarne rezultate, izuzetno ukoliko za navedeno ne budu ispunjeni uvjeti, preliminarni rezultati će se dostaviti u skladu sa članom 70. Pravilnika o provođenju izbora.\n";
    var s23 = "NE POŠTUJE SE REDOSLIJED BROJANJA GLASAČKIH LISTIĆA Glasacki listici se broje tacno definisanim redoslijedom. Na Opstim/Opcim izborima 2022. brojanje glasova vrsi se po sljedecem redoslijedu:\n" +
    "1. Predsjednistvo BiH\n" +
    "2. Predstavnicki dom Parlamentarne skupstine BiH\n" +
    "\n" +
    "Zatim se u Republici Srpskoj pristupa brojanju glasova za:\n" +
    "3. Predsjednika i potpredsjednike Republike Srpske; i\n" +
    "4. Narodnu skupstinu Republike Srpske\n" +
    "\n" +
    "Odnosno u Federaciji BiH pristupa se brojanju glasova za:\n" +
    "3. Predstavnicki dom Parlamenta Federacije BiH; i \n" +
    "4. Kantonalne skupstine u Federaciji BiH\n" +
    "\n" +
    "U Brcko distriktu BiH prvo se broje glasovi po rasporedu brojanja predvidjenom predvidenom za entitet Republika Srpska, a odmah potom za entitet Federacija BiH.\n" +
    "Eventualni prekid rada u brojanju glasackih listica predsjednik ili zamjenik predsjednika evidentira u zapisnik o radu B.O. u dio Z8. Takodjer Takoder, ukoliko budu ispunjeni tehnicki uvjeti, predsjednik B.O. na pogodan nacin dostavlja (komunikacijom putem adekvatne aplikacije) izbornoj komisiji preliminarne rezultate po politickim subjektima, odmah nakon prebrojavanja svakog nivoa koji se prebroji i popunjava obrazac za preliminarne rezultate, izuzetno ukoliko za navedeno ne budu ispunjeni uvjeti, preliminarni rezultati ce se dostaviti u skladu sa clanom 70. Pravilnika o provodjenju provodenju izbora.";
    
    var naslov24="PROGLAŠAVANJE NEVAŽEĆIH GLASAČKIH LISTIĆA";
    var text24="Listić je nevažeći ako je na njemu označeno 2 ili više političkih subjekata, ako nije ispunjen (neoznačen) ili je ispunjen tako da nije moguće sa sigurnošću utvrditi kojem kandidatu / političkom subjektu je birač dao svoj glas, ako je glasački listić toliko oštećen da se sa sigurnošću ne može utvrditi kojem kandidatu / političkom subjektu je birač dao glas; ako se na osnovu oznaka koje je birač dopisao na glasački listić, kao što je potpis, može utvrditi njegov identitet; ako su dopisana imena kandidata; ako je u pitanju skenirani, kopirani i / ili listić koji ne pripada tom biračkom mjestu, odnosno opciji glasanja (glasački listić za glasanje poštom). Svi članovi BO učestvuju u odlučivanju o (ne)ispravnosti glasačkih listića. Ovi listići se pakuju u kovertu predviđenu za nevažeće listiće.";
    var s24 = "PROGLASAVANJE NEVAZECIH GLASACKIH LISTICA   Listic je nevazeci ako je na njemu oznaceno 2 ili vise politickih subjekata; ako nije ispunjen (neoznacen) ili je ispunjen tako da nije moguce sa sigurnoscu utvrditi kojem kandidatu / politickom subjektu je birac dao svoj glas; ako je glasacki listic toliko ostecen da se sa sigurnoscu ne moze utvrditi kojem kandidatu / politickom subjektu je birac dao glas; ako se na osnovu oznaka koje je birac dopisao na glasacki listic, kao sto je potpis, moze utvrditi njegov identitet; ako su dopisana imena kandidata; ako je u pitanju skenirani, kopirani i / ili listic koji ne pripada tom birackom mjestu, odnosno opciji glasanja (glasacki listic za glasanje postom). Svi clanovi BO ucestvuju u odlucivanju o (ne)ispravnosti glasackih listica. Ovi listici se pakuju u kovertu predvidenu za nevazece listice.";
    
    var naslov25="ZLOUPOTREBA NEISKORIŠTENIH GLASAČKIH LISTIĆA";
    var text25="Prije početka otvaranja glasačkih kutija i brojanja neiskorišteni glasački listići pakuju se u originalne kutije te se zajedno sa oštećenim glasačkim listićima, olovkama (osim onih crvene boje/tinte) i neiskorištenim listićima odlažu u zaštitnu vreću.\n" +
    "Glasački listići koji se trenutno ne broje pakuju se u providne plastične vreće, posebno za svaki nivo i odlažu na način da ih svi prisutni mogu vidjeti. Prebrojani listići se pakuju u za to predviđene, neprovidne vreće koje bojom odgovaraju boji glasačkog listića\n";
    var s25 = "ZLOUPOTREBA NEISKORIsTENIH GLASAcKIH LISTIcA Prije pocetka ovaranja glasackih kutija i brojanja neiskoristeni glasacki listici pakuju se u originalne kutije te se zajedno sa ostecenim glasackim listicima, olovkama (osim onih crvene boje/tinte) i neiskoristenim listicima odlazu u zastitnu vrecu.\n" +
    "Glasacki listici koji se trenutno ne broje pakuju se u providne plasticne vrece, posebno za svaki nivo i odlazu na nacin da ih svi prisutni mogu vidjeti. Prebrojani listici se pakuju u za to predvidene, neprovidne vrece koje bojom odgovaraju boji glasackog listica\n";
    
    var naslov26="NAMJERNA INVALIDACIJA/PONIŠTAVANJE GLASOVA ZA POLITIČKE OPONENTE";
    var text26="Tokom prebrojavanja glasačkih listića vrši se poništavanje važećih dopisivanjem glasova za druge političke subjekte ili jednostavno „švrljanjem“ po listiću. Ovakve radnje događaju se u situacijama kada pojedini članovi BO po zadatku svojih političkih stranaka žele smanjiti broj glasova koje je dobio protivnik.";
    var s26 = "Tokom prebrojavanja glasackih listica vrsi se ponistavanje vazecih dopisivanjem glasova za druge politicke subjekte ili jednostavno „svrljanjem“ po listicu. Ovakve radnje dogadaju se u situacijama kada pojedini clanovi BO po zadatku svojih politickih stranaka zele smanjiti broj glasova koje je dobio protivnik. NAMJERNA INVALIDACIJA/PONIŠTAVANJE GLASOVA ZA POLITIcKE OPONENTE";
    
    var naslov27="DOPISIVANJE LIČNIH/PREFERENCIJALNIH GLASOVA KANDIDATIMA/KINJAMA";
    var text27="Prilikom brojanja glasova, članovi biračkog odbora dopisuju preferencije na otvorenim listama. Pored klasičnog dopisivanja hemijskom olovkom, postoje glasine sa ranijih izbora da su bili korišteni posebni prstenovi sa tintom na vrhu kojima su neki članovi BO dopisivali „iksiće“ za kandidate. Ova manipulacija je vrlo moguća na biračkim mjestima gdje su članovi BO iz jedne ili srodnih stranaka. \n" +
    "\n" +
    "Druga mogućnost za ovakvu manipulaciju je prilikom brojanja glasova za pojedine kandidate (drugi krug brojanja za izbor zastupnika/poslanika u zakonodavnim tijelima) – bez dopisivanja na liste. Član BO koji čita sa listića i onaj koji ga kontroliše daje lažnu informaciju za druga dva člana BO koji zapisuju brojeve glasova po kandidatima.\n\n" +
    "Obratite pažnju da niko od članova BO ne drži olovku ili neki drugi „alat“ kojim se može označiti listić, npr. prstenovi sa tintom i sl. Ukoliko ste primijetili ovu manipulaciju, imate mogućnost reagovanja primjedbom u ZARBO.  \n";
    var s27 = "DOPISIVANJE LIcNIH/PREFERENCIJALNIH GLASOVA KANDIDATIMA/KINJAMA Prilikom brojanja glasova, clanovi birackog odbora dopisuju preferencije na otvorenim listama. Pored klasicnog dopisivanja hemijskom olovkom, postoje glasine sa ranijih izbora da su bili koristeni posebni prstenovi sa tintom na vrhu kojima su neki clanovi BO dopisivali „iksice“ za kandidate. Ova manipulacija je vrlo moguca na birackim mjestima gdje su clanovi BO iz jedne ili srodnih stranaka. \n" +
    "\n" +
    "Druga mogucnost za ovakvu manipulaciju je prilikom brojanja glasova za pojedine kandidate (drugi krug brojanja za izbor zastupnika/poslanika u zakonodavnim tijelima) – bez dopisivanja na liste. clan BO koji cita sa listica i onaj koji ga kontrolise daje laznu informaciju za druga dva clana BO koji zapisuju brojeve glasova po kandidatima.\n" +
    "Obratite paznju da niko od clanova BO ne drzi olovku ili neki drugi „alat“ kojim se moze oznaciti listic, npr. prstenovi sa tintom i sl. Ukoliko ste primijetili ovu manipulaciju, imate mogucnost reagovanja primjedbom u ZARBO. ";
    
    
    var naslov28="ODBIJANJE PREDSJEDNIKA/CE BO DA UNESE VAŠU PRIMJEDBU";
    var text28="U skladu sa vašim statusom imate pravo na unošenje primjedbi/prigovora u ZARBO. Svako uskraćivanje ovog prava smatra se ozbiljnim kršenjem i o tome trebate hitno izvjestiti centrali ili drugi nadležni organ.\n" +
    "Obrazložene primjedbe unose se u ZARBO na mjesto koje je predviđeno za primjedbe posmatrača, a što je posmatračima dužan pokazati i omogućiti predsjednik biračkog odbora. Nakon što upišete primjedbu u ZARBO istu fotografišite ukoliko imate mobilni aparat koji posjeduje kameru.\n" +
    "Gdje god je to moguće, kod opisa primjedbe važno je kvantifikovati - navesti na koji način i sa koliko glasova je primjerom navedena nepravilnost utjecala na rezultat izbora. Vi ste najvažnija karika u ovom procesu, a važno je znati da ono što nije formalno zabilježeno kao da se nije ni dogodilo.  \n";
    var s28 = "ODBIJANJE PREDSJEDNIKA/CE BO DA UNESE VAsU PRIMJEDBU U skladu sa vasim statusom imate pravo na unosenje primjedbi/prigovora u ZARBO. Svako uskracivanje ovog prava smatra se ozbiljnim krsenjem i o tome trebate hitno izvjestiti centrali uli drugi nadlezni organ.\n" +
    "Obrazlozene primjedbe unose se u ZARBO na mjesto koje je predvideno za primjedbe posmatraca, a sto je posmatracima duzan pokazati i omoguciti predsjednik birackog odbora. Nakon sto upisete primjedbu u ZARBO istu fotografisite ukoliko imate mobilni aparat koji posjeduje kameru.\n" +
    "Gdje god je to moguce, kod opisa primjedbe vazno je kvantifikovati - navesti na koji nacin i sa koliko glasova je primjerom navedena nepravilnost utjecala na rezultat izbora. Vi ste najvaznija karika u ovom procesu, a vazno je znati da ono sto nije formalno zabiljezeno kao da se nije ni dogodilo. ";
    
    var naslov29="NEPRAVILNO PAKOVANJE IZBORNOG MATERIJALA";
    var text29="Nakon završenog brojanja i pakovanja listića u odgovarajuće vreće, predsjednik BO u manju providnu vreću, na kojoj je obavezno upisana šifra biračkog mjesta, pakuje sljedeći materijal: Zapisnik o radu biračkog odbora – original, izvod iz Centralnog biračkog spiska, pomoćne obrasce za brojanje na kojim su evidentirani glasovi po kandidatima što se odnosi na izbornu utrku za SO u RS, OV u FBiH, odnosno Skupštinu BD BiH. Predsjednik i članovi biračkog odbora dužni su potpisati zapisnike i obrasce koje koriste tokom izbornog dana, a čime garantuju za tačnost unesenih podataka. Član BO ima pravo odbiti potpisati se u zapisnike i/ili obrasce.  ";
    var s29 = "Nakon zavrsenog brojanja i pakovanja listica u odgovarajuce vrece, predsjednik BO u manju providnu vrecu, na kojoj je obavezno upisana sifra birackog mjesta, pakuje sljedeci materijal: Zapisnik o radu birackog odbora – original; izvod iz Centralnog birackog spiska; pomocne obrasce za brojanje na kojim su evidentirani glasovi po kandidatima sto se odnosi na izbornu utrku za SO u RS, OV u FBiH, odnosno Skupstinu BD BiH. Predsjednik i clanovi birackog odbora duzni su potpisati zapisnike i obrasce koje koriste tokom izbornog dana, a cime garantuju za tacnost unesenih podataka. Član BO ima pravo odbiti potpisati se u zapisnike i/ili obrasce.";
    
    var naslov30="PROBLEMI PRILIKOM TRANSPORTA IZBORNOG MATERIJALA";
    var text30="BO odmah, a najkasnije 12 sati nakon zatvaranja biračkog mjesta, dostavlja sav izborni materijal lokalnoj  izbornoj komisiji. Posmatrači imaju pravo pratiti izborni materijal od biračkog mjesta do lokalne izborne komisije";
    var s30 = "BO odmah, a najkasnije 12 sati nakon zatvaranja birackog mjesta, dostavlja sav izborni materijal lokalnoj  izbornoj komisiji. Posmatraci imaju pravo pratiti izborni materijal od birackog mjesta do lokalne izborne komisije";
    
    
    var naslov31 = "VRSTE GLASAČKIH LISTIĆA"
    var text31="Članovi Predsjedništva BiH, predsjednik i potpredsjednici RS biraju se po većinskom sistemu, odnosno sistem proste većine - 'prvi dobija mjesto'. To znači da je izabran onaj kandidat koji u prvom i jedinom izbornom krugu osvoji barem jedan glas više od svih ostalih kandidata\n\n" +
    "Zastupnici/poslanici u zakonodavna tijela na svim nivoima u BiH se biraju po sistemu proporcionalne zastupljenosti. Glasači tom prilikom svoj glas mogu dati jednoj političkoj stranci, listi nezavisnih kandidata, pojedinačnom kandidatu, kao i stranci/listi nezavisnih kandidata i jednom ili više kandidata, predstavniku nacionalnih manjina tamo gdje se biraju, ali samo u okviru te političke stranke/ liste nezavisnih kandidata, odnosno predstavnika nacionalne manjine.";
    var s31 = "VRSTE GLASAcKIH LISTIcA Nacelnici/Gradonacelnici biraju se po vecinskom sistemu, odnosno sistem proste vecine - \"prvi dobija mjesto\". To znaci da je izabran onaj kandidat koji u prvom i jedinom izbornom krugu osvoji barem jedan glas vise od svih ostalih kandidata. \n" +
    "\n" +
    "Vijecnici/Odbornici se biraju po sistemu proporcionalne zastupljenosti. Glasaci tom prilikom svoj glas mogu dati jednoj politickoj stranci, listi nezavisnih kandidata, pojedinacnom kandidatu, kao i stranci/listi nezavisnih kandidata i jednom ili vise kandidata, predstavniku nacionalnih manjina tamo gdje se biraju, ali samo u okviru te politicke stranke/ liste nezavisnih kandidata, odnosno predstavnika nacionalne manjine.";
    
    var naslov32="ZAPISNICI I OBRASCI NA BM"
    var text32="Zapisnik o radu biračkog odbora (ZARBO) - Tokom izbornog dana vodi se Zapisnik o radu biračkog odbora. U Zapisnik se unose sljedeći podaci: popis i količina izbornog materijala dostavljena biračkom mjestu; popis svih akreditovanih posmatrača na biračkom mjestu; zapažanja o svim važnim događajima do kojih dođe na biračkom mjestu.\n" +
    "\n" +
    "Postoje dva zapisnika u koje se unose sljedeći podaci:\n" +
    "\n" +
    "1. Zapisnik o radu biračkog odbora na dan uoči održavanja izbora – ZARBO I: popis izbornog materijala; način skladištenja preuzetog izbornog materijala od trenutka preuzimanja do trenutka početka rada biračkog odbora.\n" +
    "\n" +
    "2. Zapisnik o radu biračkog odbora na dan održavanja izbora – ZARBO II: evidencija o prisustvu članova biračkog odbora; evidencija o akreditovanim posmatračima; zapažanja tokom glasanja; mišljenja ili primjedbe; informacija o udaljavanju osoba s biračkog mjesta; vrijeme zatvaranja biračkog mjesta.\n" +
    "\n" +
    "Obrazac za brojno stanje u koji BO prije otvaranja BM unosi podatke o broju zaprimljenih listića, te ukupan broj birača za biračko mjesto na osnovu izvoda iz Centralnog biračkog spiska (CBS). Prije pristupanja samom brojanju glasova u Obrazac za brojno stanje se unose broj neiskorištenih i oštećenih listića koji se pakiraju u providnu zaštitnu vreću posebno za svaku izbornu utrku, te ukupan broj potpisa glasača s izvoda iz CBS-a. Predsjednik i članovi BO potpisuju ovaj Obrazac (Vidi prilog 3).\n" +
    "\n" +
    "Obrazac za zbirne rezultate (ZR) je obrazac u koji birački odbor unosi rezultate za sve razine glasanja na biračkom mjestu. Pravi se u 4 primjerka, pri čemu se žuta kopija vidno ističe na biračkom mjestu. U nedostatku dovoljnog broja primjeraka da bi svaki posmatrač dobio po jedan, CIK je u okviru izbornog materijala pripremio obrasce koje će posmatrači moći popuniti na osnovu žute kopije ZR obrasca, a predsjednik BO dužan je da im isti potpiše.\n\n" +
    "PDL Obrazac je obrazac u kojem Predsjednik biračkog odbora vodi evidenciju svakog pojedinačnog slučaja pomoći drugog lica pri glasanju.\n" +
    "\n" +
    "Samo predsjednik biračkog odbora je ovlašten za ispunjavanje zapisnika i obrazaca!\n";
    var s32 = "Zapisnik o radu birackog odbora (ZARBO) - Tokom izbornog dana vodi se Zapisnik o radu birackog odbora. U Zapisnik se unose sljedeci podaci: popis i kolicina izbornog materijala dostavljena birackom mjestu; popis svih akreditovanih posmatraca na birackom mjestu; zapazanja o svim vaznim dogadjajima dogadajima do kojih dodje dode na birackom mjestu.\n" +
    "\n" +
    "Postoje dva zapisnika u koje se unose sljedeci podaci:\n" +
    "\n" +
    "1. Zapisnik o radu birackog odbora na dan uoci odrzavanja izbora – ZARBO I: popis izbornog materijala; nacin skladistenja preuzetog izbornog materijala od trenutka preuzimanja do trenutka pocetka rada birackog odbora.\n" +
    "\n" +
    "2. Zapisnik o radu birackog odbora na dan odrzavanja izbora – ZARBO II: evidencija o prisustvu clanova birackog odbora; evidencija o akreditovanim posmatracima; zapazanja tokom glasanja; misljenja ili primjedbe; informacija o udaljavanju osoba s birackog mjesta; vrijeme zatvaranja birackog mjesta.\n" +
    "\n" +
    "Obrazac za brojno stanje u koji BO prije otvaranja BM unosi podatke o broju zaprimljenih listica, te ukupan broj biraca za biracko mjesto na osnovu izvoda iz Centralnog biračkog spiska (CBS). Prije pristupanja samom brojanju glasova u Obrazac za brojno stanje se unose broj neiskorištenih i ostecenih listica koji se pakiraju u providnu zastitnu vrecu posebno za svaku izbornu utrku, te ukupan broj potpisa glasaca s izvoda iz CBS-a. Predsjednik i članovi BO potpisuju ovaj Obrazac (Vidi prilog 3).\n" +
    "\n" +
    "Obrazac za zbirne rezultate (ZR) je obrazac u koji biracki odbor unosi rezultate za sve razine glasanja na birackom mjestu. Pravi se u 4 primjerka, pri cemu se zuta kopija vidno istice na birackom mjestu. U nedostatku dovoljnog broja primjeraka da bi svaki posmatrac dobio po jedan, CIK je u okviru izbornog materijala pripremio obrasce koje će posmatraci moci popuniti na osnovu zute kopije ZR obrasca, a predsjednik BO duzan je da im isti potpise.\n" +
    "PDL Obrazac je obrazac u kojem Predsjednik birackog odbor vodi evidenciju svakog pojedinacnog slucaja pomoci drugog lica pri glasanju.\n" +
    "\n" +
    "Samo predsjednik birackog odbora je ovlasten za ispunjavanje zapisnika i obrazaca!";
    
    
    var naslov33="PRAVA POSMATRAČA"
    var text33="Pravo na nesmetano posmatranje cjelokupnog procesa\n" +
    "\n" +
    "B.O. mora omogućiti akreditiranim posmatračima nesmetano promatranje cijelog procesa glasanja i prebrojavanja glasačkih listića i upisa primjedbi u Zapisnik o radu biračkog odbora.\n" +
    "\n" +
"Pristup dokumentima\n" +
"\n" +
"Posmatrači moraju imati pristup svim dokumentima koji se na dan izbora nalaze na biračkom mjestu (izvod iz Centralnog biračkog spisa, obrasci, zapisnici, itd.). Naravno, ovo podrazumijeva ljubazno ponašanje, pristojnu komunikaciju sa ovlaštenima, te pravi izbor vremena da se neki zahtjev ovog tipa i postavi. Procijenite je li pravo vrijeme tražiti da pogledate neki dokument u trenutku kada je nadležna osoba izuzetno zauzeta redovnim aktivnostima na biračkom mjestu ili u izbornoj komisiji!\n" +
"\n" +
"\n" +
"Stavljanje primjedbi u Zapisnik o radu biračkog odbora (ZARBO)\n" +
"\n" +
"Bitno formalno pravo posmatrača izbornog dana je i stavljanje obrazloženih primjedbi na rad biračkog odbora i opštinske izborne komisije. Važno je naglasiti da samo ono što uđe u ZARBO može biti iskorišteno za ulaganje formalnog prigovora. Ono što nije uneseno u Zapisnik, kao da se nije ni dogodilo! Prilikom ulaganja primjedbe, gdje god je to moguće, važno je kvantificirati - navesti na koji način i sa koliko glasova je nepravilnost navedena primjerom uticala na rezultat izbora.\n" +
"Posmatrač ima pravo zahtijevati prepis zapisnika o radu organa nadležnog za provedbu izbora čiji rad je posmatrao .\n" +
"\n" +
"\n" +
"Kopija rezultata glasanja sa biračkog mjesta\n" +
"\n" +
"Pravo posmatrača je i dobiti službene rezultate glasanja. Obrazac koji služi za tu namjenu (ZR) nema dovoljno kopija da bi svaki posmatrač mogao dobiti primjerak. Alternativno možete fotografisati javno istaknutu žutu kopiju ili napraviti prepis u formulare koji će biti dostavljeni uz birački materijal i ljubazno zamoliti predsjednika BO da se potpiše na prepis.\n";
    var s33 = "Zapisnik o radu birackog odbora (ZARBO) - Tokom izbornog dana vodi se Zapisnik o radu birackog odbora. U Zapisnik se unose sljedeci podaci: popis i kolicina izbornog materijala dostavljena birackom mjestu; popis svih akreditovanih posmatraca na birackom mjestu; zapazanja o svim vaznim dogadjajima dogadajima do kojih dodje dode na birackom mjestu.\n" +
    "\n" +
    "Postoje dva zapisnika u koje se unose sljedeci podaci:\n" +
    "\n" +
    "1. Zapisnik o radu birackog odbora na dan uoci odrzavanja izbora – ZARBO I: popis izbornog materijala; nacin skladistenja preuzetog izbornog materijala od trenutka preuzimanja do trenutka pocetka rada birackog odbora.\n" +
    "\n" +
    "2. Zapisnik o radu birackog odbora na dan odrzavanja izbora – ZARBO II: evidencija o prisustvu clanova birackog odbora; evidencija o akreditovanim posmatracima; zapazanja tokom glasanja; misljenja ili primjedbe; informacija o udaljavanju osoba s birackog mjesta; vrijeme zatvaranja birackog mjesta.\n" +
    "\n" +
    "Obrazac za brojno stanje u koji BO prije otvaranja BM unosi podatke o broju zaprimljenih listica, te ukupan broj biraca za biracko mjesto na osnovu izvoda iz Centralnog biračkog spiska (CBS). Prije pristupanja samom brojanju glasova u Obrazac za brojno stanje se unose broj neiskorištenih i ostecenih listica koji se pakiraju u providnu zastitnu vrecu posebno za svaku izbornu utrku, te ukupan broj potpisa glasaca s izvoda iz CBS-a. Predsjednik i članovi BO potpisuju ovaj Obrazac (Vidi prilog 3).\n" +
    "\n" +
    "Obrazac za zbirne rezultate (ZR) je obrazac u koji biracki odbor unosi rezultate za sve razine glasanja na birackom mjestu. Pravi se u 4 primjerka, pri cemu se zuta kopija vidno istice na birackom mjestu. U nedostatku dovoljnog broja primjeraka da bi svaki posmatrac dobio po jedan, CIK je u okviru izbornog materijala pripremio obrasce koje će posmatraci moci popuniti na osnovu zute kopije ZR obrasca, a predsjednik BO duzan je da im isti potpise.\n" +
    "PDL Obrazac je obrazac u kojem Predsjednik birackog odbor vodi evidenciju svakog pojedinacnog slucaja pomoci drugog lica pri glasanju.\n" +
    "\n" +
    "Samo predsjednik birackog odbora je ovlasten za ispunjavanje zapisnika i obrazaca!";
    
    
    var naslov34="PRINCIPI RADA POSMATRAČA"
    var text34="Svi posmatrači izbornog dana trebaju se pridržavati sljedećih principa rada:\n" +
    "\n" +
    "Nepristrasnost\n" +
    "\n" +
    "Na biračkom mjestu zabranjeno je nošenje bilo kakvih obilježja koja bi posmatrača mogla povezati sa određenim političkim subjektima. Lično ste odgovorni za svoje ponašanje tokom posmatranja izbornog procesa na izborni dan. Nije dozvoljeno vršenje bilo kakvog uticaja na glasače u vezi sa njihovim odabirom biračke opcije. U svakom momentu pridržavajte ste potpisanog obrasca ‘Pravila ponašanja i izjava o poštivanju tajnosti’. U suprotnom, predsjednik biračkog odbora Vas može odstraniti sa biračkog mjesta, a izborna komisija koja je izdala akreditaciju može oduzeti svojstvo posmatrača i poništiti akreditaciju.  \n" +
    "\n" +
    "\n" +
    "Ne ometajte i ne miješajte se u izborni proces\n" +
    "\n" +
    "Tokom boravka na biračkom mjestu, posmatrač se ne smije ni na koji način miješati u izborni proces. Iako je uloga posmatrača veoma važna, ona ne podrazumijeva: intervencije koje bi zaustavile proces glasanja, uvođenje reda na biračkom mjestu, ometanje rada članova biračkih odbora ili drugih posmatrača ili bilo kakvo drugo miješanje u izborni proces. Vaša prava i dužnosti na biračkom mjestu ograničena su pravima i dužnostima drugih prisutnih! Vi ste tu da posmatrate i izvještavate, a ne da pomažete ili odmažete!\n" +
    "\n" +
    "Kada budete postavljali pitanja predsjedniku biračkog odbora ili ukazivali na neku nepravilnost, sačekajte pogodan trenutak kada nema birača na biračkom mjestu ili kada predsjednik nije zauzet.\n" +
    "VAŽNO! \n" +
    "Na biračkim mjestima ne očekuju se bilo kakvi sigurnosni problemi. Međutim, ukoliko u bilo kojem trenutku osjetite da ste u opasnosti, izađite ispred biračkog mjesta. Ne ulazite u sukobe – Vaša sigurnost je najvažnija!\n" +
    "\n" +
    "\n" +
    "Poštujte tajnost glasanja\n" +
    "\n" +
    "Tajnost glasanja neprikosnovena je u svakom smislu. Posmatrač ne smije biti iza kabine ili zavirivati u trenucima kada je birač tu. Istovremeno, u trenucima kada nema nikoga iza kabine, posmatrač može uz konsultaciju sa predsjednikom biračkog odbora, diskretno pregledati stanje i vidjeti da li npr. postoje neke parole i poruke ispisane sa unutrašnje strane, oznake političkh stranaka i sl., i na to ukazati predsjedniku biračkog odbora.\n" +
    "\n" +
    "\n" +
    "Ne dirajte izborni materijal\n" +
    "\n" +
    "Posmatrač ima pravo uvida u cjelokupni izborni materijal na biračkom mjestu. Iako ćete vjerovatno biti u prilici, nemojte dirati bilo kakav izborni materijal. Ovo se posebno odnosi na glasačke listiće. Kada smatrate da je potrebno pregledati određeni materijal, ljubazno zamolite predsjednika biračkog odbora da vam ga pokaže.\n";
    var s34 = "Svi posmatraci izbornog dana trebaju se pridrzavati sljedecih principa rada:\n" +
    "\n" +
    "Nepristrasnost\n" +
    "\n" +
    "Na birackom mjestu zabranjeno je nosenje bilo kakvih obiljezja koja bi posmatraca mogla povezati sa odredenim politickim subjektima. Licno ste odgovorni za svoje ponasanje tokom posmatranja izbornog procesa na izborni dan. Nije dozvoljeno vrsenje bilo kakvog uticaja na glasace u vezi sa njihovim odabirom biracke opcije. U svakom momentu pridrzavajte ste potpisanog obrasca ‘Pravila ponasanja i izjava o postivanju tajnosti’. U suprotnom, predsjednik birackog odbora Vas moze odstraniti sa birackog mjesta, a izborna komisija koja je izdala akreditaciju moze oduzeti svojstvo posmatraca i ponistiti akreditaciju.  \n" +
    "\n" +
    "\n" +
    "Ne ometajte i ne mijesajte se u izborni proces\n" +
    "\n" +
    "Tokom boravka na birackom mjestu, posmatrac se ne smije ni na koji nacin mijesati u izborni proces. Iako je uloga posmatraca veoma vazna, ona ne podrazumijeva: intervencije koje bi zaustavile proces glasanja,uvodjenje uvodenje reda na birackom mjestu, ometanje rada clanova birackih odbora ili drugih posmatraca ili bilo kakvo drugo mijesanje u izborni proces. Vasa prava i duznosti na birackom mjestu ogranicena su pravima i duznostima drugih prisutnih! Vi ste tu da posmatrate i izvjestavate, a ne da pomazete ili odmazete!\n" +
    "\n" +
    "Kada budete postavljali pitanja predsjedniku birackog odbora ili ukazivali na neku nepravilnost, sacekajte pogodan trenutak kada nema biraca na birackom mjestu ili kada predsjednik nije zauzet.\n" +
    "VAZNO! \n" +
    "Na birackim mjestima ne ocekuju se bilo kakvi sigurnosni problemi. Medutim Medjutim, ukoliko u bilo kojem trenutku osjetite da ste u opasnosti izadite izadjite ispred birackog mjesta. Ne ulazite u sukobe – Vasa sigurnost je najvaznija!\n" +
    "\n" +
    "\n" +
    "Postujte tajnost glasanja\n" +
    "\n" +
    "Tajnost glasanja neprikosnovena je u svakom smislu. Posmatrac ne smije biti iza kabine ili zavirivati u trenucima kada je birac tu. Istovremeno, u trenucima kada nema nikoga iza kabine, posmatrac moze uz konsultaciju sa predsjednikom birackog odbora, diskretno pregledati stanje i vidjeti da li npr. postoje neke parole i poruke ispisane sa unutrasnje strane, oznake politickh stranaka i sl., i na to ukazati predsjedniku birackog odbora.\n" +
    "\n" +
    "\n" +
    "Ne dirajte izborni materijal\n" +
    "\n" +
    "Posmatrac ima pravo uvida u cjelokupni izborni materijal na birackom mjestu. Iako cete vjerovatno biti u prilici, nemojte dirati bilo kakav izborni materijal. Ovo se posebno odnosi na glasacke listice. Kada smatrate da je potrebno pregledati odredeni odredjeni materijal, ljubazno zamolite predsjednika birackog odbora da vam ga pokaze. principi rada posmatraca";
    
    var naslov35="ŠTA JE KORISNO IMATI TOKOM POSMATRANJA IZBORA NA BM"
    var text35="-\tVažeći ident. dokument\n" +
    "-\tAkreditaciju\n" +
    "-\tPriručnik\n" +
    "-\tObrasce\n" +
    "-\tHemijsku olovku\n" +
    "-\tNapunjen mob. telefon\n" +
    "-\tPunjač za mob. telefon\n" +
    "-\tHranu i piće\n" +
    "-\tToplu odjeću i obuću\n" +
    "-\tBaterijsku lampu (po potrebi)\n" +
    "-\tKišobran (po potrebi)\n";
    var s35 = "sTA JE KORISNO IMATI TOKOM POSMATRANJA IZBORA NA BM -\tVažeći ident. dokument\n" +
    "-\tAkreditaciju\n" +
    "-\tPriručnik\n" +
    "-\tObrasce\n" +
    "-\tHemijsku olovku\n" +
    "-\tNapunjen mob. telefon\n" +
    "-\tPunjač za mob. telefon\n" +
    "-\tHranu i piće\n" +
    "-\tToplu odjeću i obuću\n" +
    "-\tBaterijsku lampu (po potrebi)\n" +
    "-\tKišobran (po potrebi)\n";
    
    
    var naslov36="KORIŠTENE SKRAČENICE"
    var text36="BM – Biračko mjesto\n" +
    "BO – Birački odbor\n" +
    "CIK BiH – Centralna izborna komisija Bosne i Hercegovine\n" +
    "OIK/GIK – opštinska, odnosno gradska izborna komisija\n" +
    "LIK – lokalna izborna komisija (opštinska, gradska ili Izborna komisija Brčko distrikta)\n" +
    "CBS – Centralni birački spisak\n" +
    "FBiH – Federacija Bosne i Hercegovine\n" +
    "RS – Republika Srpska\n" +
    "BDBiH – Brčko Distrikt Bosne i Hercegovine\n" +
    "PD PSBiH – Predstavnički dom Parlamentarne skupštine BiH\n" +
    "NSRS – Narodna skupština Republike Srpske\n" +
    "PD PFBiH – Predstavnički dom Parlamenta Federacije Bosne i Hercegovine \n" +
    "ZARBO – Zapisnik o radu biračkog odbora\n" +
    "ZR – Obrazac za zbirne rezultate\n" +
    "PDL – Pomoć drugog lica\n";
    var s36 = "KORISTENE SKRACENICE BM – Biracko mjesto\\n\" +\n" +
    "            \"BO – Biracki odbor\\n\" +\n" +
    "            \"CIK BiH – Centralna izborna komisija Bosne i Hercegovine\\n\" +\n" +
    "            \"OIK/GIK – opstinska, odnosno gradska izborna komisija\\n\" +\n" +
    "            \"LIK – lokalna izborna komisija (opstinska, gradska ili Izborna komisija Brcko distrikta)\\n\" +\n" +
    "            \"CBS – Centralni biracki spisak\\n\" +\n" +
    "            \"FBiH – Federacija Bosne i Hercegovine\\n\" +\n" +
    "            \"RS – Republika Srpska\\n\" +\n" +
    "            \"BDBiH – Brcko Distrikt Bosne i Hercegovine\\n\" +\n" +
    "            \"PD PSBiH – Predstavnicki dom Parlamentarne skupstine BiH\\n\" +\n" +
    "            \"NSRS – Narodna skupstina Republike Srpske\\n\" +\n" +
    "            \"PD PFBiH – Predstavnicki dom Parlamenta Federacije Bosne i Hercegovine \\n\" +\n" +
    "            \"ZARBO – Zapisnik o radu birackog odbora\\n\" +\n" +
    "            \"ZR – Obrazac za zbirne rezultate\\n pomoc drugog lica PDL POMOC DRUGIH LICA";
    var naslov37="!ULAGANJE PRIMJEDBI I PRIGOVORA!"
    var text37="Izborni zakon BiH u članu 17.9 navodi bitno formalno pravo posmatrača da ulažu primjedbe na rad organa nadležnog za provođenje izbora čiji rad posmatraju. Posmatrač, tako, može stavljati obrazložene primjedbe na rad organa nadležnog za provođenje izbora u pisanoj formi koje se prilažu u zapisnik o radu datog organa. Na osnovu ovako uloženih primjedbi, politički subjekt ima formalno pravo ulaganja prigovora izbornoj komisiji. \n" +
    "\n" +
    "Kod ulaganja primjedbi važno je da iste sadrže sve one elemente koji mogu poslužiti političkom subjektu za ulaganje prigovora, ali i izbornoj komisiji za naknadnu ocjenu rada biračkog odbora i eventualno sankcionisanje:\n\n" +
    "•\tIme i prezime posmatrača koji ulaže primjedbu\n" +
    "•\tBroj biračkog mjesta na kojem posmatrač posmatra, odnosno naziv organa čiji rad posmatra\n" +
    "•\tDatum i vrijeme podnošenja/ulaganja primjedbe\n" +
    "•\tNa šta se primjedba odnosi: npr. Na rad predsjednika BO, rad predsjednika OIK-a, proces otvaranja BM, proces glasanja na BM, proces zatvaranja i brojanja glasova, itd.\n" +
    "•\tKonkretno i precizno obrazloženje situacije na koju primjedbuje gdje se posmatrač treba uzdržati od davanja paušalnih i generalnih izjava, te pokušati kvantifikovati uočenu nepravilnost i njen uticaj na proces glasanja, odnosno utvrđivanja rezultata\n" +
    "•\tTražiti od predsjednika BO da Vam potpiše jedan primjerak uložene primjedbe, a koju čuvate kod sebe i dostavljate svom političkom subjektu \n" +
    "\n" +
    "VAŽNO!\n" +
    "Politički subjekt čije je pravo ustanovljeno Izbornim zakonom BiH povrijeđeno može uložiti prigovor izbornoj komisiji U ROKU OD 24 SATA od učinjene povrede u izbornom periodu.\n\n" +
    "!NE ZABORAVITE - VAŠA SIGURNOST JE NA PRVOM MJESTU!";

    var s37 = "Izborni zakon BiH u clanu 17.9 navodi bitno formalno pravo posmatraca da ulazu primjedbe na rad organa nadleznog za provodenje izbora ciji rad posmatraju. Posmatrac, tako, moze stavljati obrazlozene primjedbe na rad organa nadleznog za provodenje izbora u pisanoj formi koje se prilazu u zapisnik o radu datog organa. Na osnovu ovako ulozenih primjedbi, politicki subjekt ima formalno pravo ulaganja prigovora izbornoj komisiji. \n" +
    "\n" +
    "Kod ulaganja primjedbi vazno je da iste sadrze sve one elemente koji mogu posluziti politickom subjektu za ulaganje prigovora, ali i izbornoj komisiji za naknadnu ocjenu rada birackog odbora i eventualno sankcionisanje:\n\n" +
    "•\tIme i prezime posmatraca koji ulaze primjedbu\n" +
    "•\tBroj birackog mjesta na kojem posmatrac posmatra, odnosno naziv organa ciji rad posmatra\n" +
    "•\tDatum i vrijeme podnosenja/ulaganja primjedbe\n" +
    "•\tNa sta se primjedba odnosi: npr. Na rad predsjednika BO; rad predsjednika OIK-a, proces otvaranja BM, proces glasanja na BM, proces zatvaranja i brojanja glasova, itd.\n" +
    "•\tKonkretno i precizno obrazlozenje situacije na koju primjedbuje gdje se posmatrac treba uzdrzati od davanja pausalnih i generalnih izjava, te pokusati kvantifikovati uocenu nepravilnost i njen uticaj na proces glasanja, odnosno utvrdivanja rezultata\n" +
    "•\tTraziti od predsjednika BO da Vam potpise jedan primjerak ulozene primjedbe, a koju cuvate kod sebe i dostavljate svom politickom subjektu \n" +
    "\n" +
    "VAŽNO!\n" +
    "Politicki subjekt cije je pravo ustanovljeno Izbornim zakonom BiH povrijedeno moze uloziti prigovor izbornoj komisiji U ROKU OD 24 SATA od ucinjene povrede u izbornom periodu.";
    
    var mjera1="Najvažnija je vaša sigurnost! U slučaju da ste procjenili da je vaša sigurnost ugrožena poduzmite sve mjere kako bi se zaštitili, a nakon toga obavjestite nadležne institucije.";
    var mjera2="Ukoliko se dešava nasilje na BM ili je ugoržana vaša sigurnost ili sigurnost drugih učesnika izbornog procesa o tome odmah  obavjestite policiju. Broj policije je 122. ";
    var mjera3="U skladu sa organizacijskom strukturom i/ili internim procedurama posmatračke misije, izvjestite nadležnu osobu o uočenim izbornim nepravilnostima ili propustima u radu BO.";
    var mjera4="Ukoliko se dešava sistemsko kršenje izbornog procesa, veće nepravilnosti ili se propusti ponavljaju uprkos vašem upozorenju unesite primjedbu u Zapisnik o radu BO u skladu sa procedurom. Na kraju izbornog dana tražirte prepis zapisnika o radu BO. Samo na osnovu vaše evidentirane primjedbe moguće je pokretati dalje procese u cilju zaštite izbornih prava.";
    var mjera5="Za svaku izbornu neprvilnost ili učestale propuste poželjno je imati dokaze kojima se ista potkrepljuje. Pokušajte prikupiti što više informacija i dokaza (prekršioce ili učesnike događaja, detaljan opis nepravilnosti, kopije obrazaca, fotografije, video i sl.) pri tome vodite računa da se pridržavate zakona i procedura i ne ugrozite vlastitu sigurnost.";
    var mjera6="Skrenite pažnju predsjedniku Biračkog odobra na uočenu izbornu nepravilnost ili propust u radu članova BO. Odaberite pogodan trenutak, kada predsjednik BO nije zauzet drugim važnijim aktivnostima kako ne bi remetili proces glasanja.";
    var mjera7="Ukoliko su vam uskraćena prava posmatrača ili se ne poduzimaju koraci u cilju otklanjanja nepravlnosti, uprkos vašim upozorenjima, o tome možete obavjestiti nadležnu loklanu izbornu komisiju, u skladu sa organizacijskom strukturuom i/ili internim procedurama posmatračke misije.";
    var mjera8="Akreditovani posmatrač može zahtjevati da CIK BiH ponovo broji glasačke listiće na BM na kojem je bio posmatrač u skladu sa procedurom. Zahtjev za ponovno brojanje glasačkih listića podnosi se u pisanoj formi CIK-u BiH u roku od tri dana od objave izbornih rezultata. Ponovno brojanje se obavlja u glavnom centru za brojanje glasova a akreditovani posmatrači mogu biti pristni u toku ponovnog brojanja glasova.";
    var mjera9="Pravo posmatrača je i dobiti službene rezultate glasanja. Obrazac koji služi za tu namjenu (ZR) nema dovoljno kopija da bi svaki posmatrač mogao dobiti primjerak. Alternativno možete fotografisati javno istaknutu žutu kopiju ili napraviti prepis u formulare koji će biti dostavljeni uz birački materijal i ljubazno zamoliti predsjednika BO da se potpiše na prepis.";

    var mjera1a="Najvaznija je vaca sigurnost! U slucaju da ste procjenili da je vaca sigurnost ugrozena poduzmite sve mjere kako bi se zactitili, a nakon toga obavjestite nadlezne institucije.";
    var mjera2a="Ukoliko se decava nasilje na BM ili ugorzana vaca sigurnost ili sigurnost drugih ucesnika izbornog procesa o tome odmah  obavjestite policiju. Broj policije je 122. ";
    var mjera3a="U skladu sa organizacijskom strukturuom i/ili internim procedurama posmatracke misije, izvjestite nadleznu osobu o uocenim izbornim nepravilnostima ili propustima u radu BO.";
    var mjera4a="Ukoliko se decava sistemsko krsenje izbornog procesa, vece nepravilnosti ili se proposti ponavljaju uprkos vacem upozorenju unesite primjedbu u Zapisnik o radu BO u skladu sa procedurom. Na kraju izbornog dana trazirte prepis zapisnika o radu BO. Samo na osnovu vace evidentirane primjedbe moguce je pokretati dalje procese u cilju zactite izbornih prava.";
    var mjera5a="Za svaku izbornu neprvilnost ili ucestale propuste pozeljno je imati dokaze kojima se ista potkrepljuje. Pokucajte prikupiti cto vice informacija I dokaza (prekrcioce ili ucesnike dogadaja, detaljan opis nepravilnosti, kopije obrazaca, fotografije, video i sl.) pri tome vodite racuna da se pridrzavate zakona i procedura i ne ugrozite vlastitu sigurnost.";
    var mjera6a="Skrenite paznju predsjedniku Birackog odobra na uocenu izbornu nepravilnost ili propust u radu clanova BO. Odaberite pogodan trenutak, kada predsjednik BO nije zauzet drugim vaznijim aktivnostima kako ne bi remetili proces glasanja.\n";
    var mjera7a="Ukoliko su vam uskracena prava posmatraca ili se ne poduzimaju koraci u cilju otklanjanja nepravlnosti, uprkos vacim upozorenjima, o tome mozete obavjestiti nadleznu loklanu izbornu komisiju, a skladu sa organizacijskom strukturuom i/ili internim procedurama posmatracke misije.";
    var mjera8a="Akreditovani posmatrac moze zahtjevati da CIK BiH ponovo broji glasacke listice na BM na kojem je bio posmatrac u skladu sa procedurom. Zahtjev za ponovno brojanje glasackih listica podnosi se u pisanoj formi CIK-u BiH u roku od tri dana od objave izbornih rezultata. Ponovno brojanje se obavlja u glavnom centru za brojanje glasova a akreditovani posmatraci mogu biti pristni u toku ponovnog brojanja glasova.";
    var mjera9a="Pravo posmatraca je i dobiti sluzbene rezultate glasanja. Obrazac koji sluzi za tu namjenu (ZR) nema dovoljno kopija da bi svaki posmatrac mogao dobiti primjerak. Alternativno mozete fotografisati javno istaknutu zutu kopiju ili napraviti prepis u formulare koji ce biti dostavljeni uz biracki materijal i ljubazno zamoliti predsjednika BO da se potpice na prepis.";
    


    func closeAll() {
        homeView.isHidden = true
        measuresView.isHidden = true
        searchView.isHidden = true
        subHome.isHidden = true
        measuresListView.isHidden = true
        G1.isHidden = true
        G2.isHidden = true
        G3.isHidden = true
        G4.isHidden = true
        G5.isHidden = true
        G6.isHidden = true
        G8.isHidden = true
        post.isHidden = true
        customPost.isHidden = true
        customPost1.isHidden = true
        uzorak.isHidden = true
        mainTitle.isHidden = false
    }
    func clearResult() {
        mainTitle.isHidden = true
        search1.isHidden = true
        search2.isHidden = true
        search3.isHidden = true
        search4.isHidden = true
        search5.isHidden = true
        search6.isHidden = true
        search7.isHidden = true
        search8.isHidden = true
        search9.isHidden = true
        search10.isHidden = true
        search11.isHidden = true
        search12.isHidden = true
        search13.isHidden = true
        search14.isHidden = true
        search15.isHidden = true
        search16.isHidden = true
        search17.isHidden = true
        search18.isHidden = true
        search19.isHidden = true
        search20.isHidden = true
        search21.isHidden = true
        search22.isHidden = true
        search23.isHidden = true
        search24.isHidden = true
        search25.isHidden = true
        search26.isHidden = true
        search27.isHidden = true
        search28.isHidden = true
        search29.isHidden = true
        search30.isHidden = true
        search31.isHidden = true
        search32.isHidden = true
        search33.isHidden = true
        search34.isHidden = true
        search35.isHidden = true
        search36.isHidden = true
        search37.isHidden = true
        search38.isHidden = true
        search39.isHidden = true
        search40.isHidden = true
        search41.isHidden = true
        search42.isHidden = true
        search43.isHidden = true
        search44.isHidden = true
        search45.isHidden = true
        search46.isHidden = true
        search47.isHidden = true
        search48.isHidden = true
        search49.isHidden = true
        search50.isHidden = true
        search51.isHidden = true
        search52.isHidden = true
        search53.isHidden = true
        search54.isHidden = true
        search55.isHidden = true
        search56.isHidden = true
        search57.isHidden = true
        search58.isHidden = true
        search59.isHidden = true
        errorMessage1.text = ""
        
    }
    
    func closeAllSteps() {
        korak1.isHidden = true
        korak2.isHidden = true
        korak3.isHidden = true
        korak4.isHidden = true
        korak5.isHidden = true
        korak6.isHidden = true
    }
    func closeAllLabels() {
        korak1text.isHidden = true
        korak2text.isHidden = true
        korak3text.isHidden = true
        korak4text.isHidden = true
        korak5text.isHidden = true
        korak6text.isHidden = true
        korak1img.image = UIImage(systemName: "chevron.down" )
        korak2img.image = UIImage(systemName: "chevron.down" )
        korak3img.image = UIImage(systemName: "chevron.down" )
        korak4img.image = UIImage(systemName: "chevron.down" )
        korak5img.image = UIImage(systemName: "chevron.down" )
        korak6img.image = UIImage(systemName: "chevron.down" )
    }

    @IBOutlet weak var homeView: UIView!
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var uzorak: UITextField!
    @IBOutlet weak var searchView: UIView!
    
    
    @IBOutlet weak var subHome: UIView!
    @IBOutlet weak var measuresListView: UIView!
    @IBOutlet weak var G1: UIView!
    @IBOutlet weak var G2: UIView!
    @IBOutlet weak var G3: UIView!
    @IBOutlet weak var G4: UIView!
    @IBOutlet weak var G5: UIView!
    @IBOutlet weak var G6: UIView!
    @IBOutlet weak var G8: UIView!
    @IBOutlet weak var post: UIView!
    @IBOutlet weak var customPostTxt: UILabel!
    @IBOutlet weak var customPost: UIView!
    @IBOutlet weak var customPostTitle: UILabel!
    
    @IBOutlet weak var customPost1: UIView!
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postText: UILabel!
    @IBOutlet weak var gif: UIImageView!
    @IBOutlet weak var gif2: UIImageView!
    
    
    @IBOutlet weak var measuresView: UIView!
    @IBOutlet weak var korak1: UIView!
    @IBOutlet weak var korak2: UIView!
    @IBOutlet weak var korak3: UIView!
    @IBOutlet weak var korak4: UIView!
    @IBOutlet weak var korak5: UIView!
    @IBOutlet weak var korak6: UIView!
    
    @IBOutlet weak var korak1broj: UILabel!
    @IBOutlet weak var korak1naslov: UILabel!
    @IBOutlet weak var korak2broj: UILabel!
    @IBOutlet weak var korak2naslov: UILabel!
    @IBOutlet weak var korak3broj: UILabel!
    @IBOutlet weak var korak3naslov: UILabel!
    @IBOutlet weak var korak4naslov: UILabel!
    @IBOutlet weak var korak5naslov: UILabel!
    @IBOutlet weak var korak6naslov: UILabel!

    @IBOutlet weak var korak1text: UILabel!
    @IBOutlet weak var korak2text: UILabel!
    @IBOutlet weak var korak3text: UILabel!
    @IBOutlet weak var korak4text: UILabel!
    @IBOutlet weak var korak5text: UILabel!
    @IBOutlet weak var korak6text: UILabel!
    
    @IBOutlet weak var korak1img: UIImageView!
    @IBOutlet weak var korak2img: UIImageView!
    @IBOutlet weak var korak3img: UIImageView!
    @IBOutlet weak var korak4img: UIImageView!
    @IBOutlet weak var korak5img: UIImageView!
    @IBOutlet weak var korak6img: UIImageView!
    @IBOutlet weak var koraciNaslov: UILabel!
    
    
    @IBOutlet weak var search1: UIView!
    @IBOutlet weak var search2: UIView!
    @IBOutlet weak var search3: UIView!
    @IBOutlet weak var search4: UIView!
    @IBOutlet weak var search5: UIView!
    @IBOutlet weak var search6: UIView!
    @IBOutlet weak var search7: UIView!
    @IBOutlet weak var search8: UIView!
    @IBOutlet weak var search9: UIView!
    @IBOutlet weak var search10: UIView!
    @IBOutlet weak var search11: UIView!
    @IBOutlet weak var search12: UIView!
    @IBOutlet weak var search13: UIView!
    @IBOutlet weak var search14: UIView!
    @IBOutlet weak var search15: UIView!
    @IBOutlet weak var search16: UIView!
    @IBOutlet weak var search17: UIView!
    @IBOutlet weak var search18: UIView!
    @IBOutlet weak var search19: UIView!
    @IBOutlet weak var search20: UIView!
    @IBOutlet weak var search21: UIView!
    @IBOutlet weak var search22: UIView!
    @IBOutlet weak var search23: UIView!
    @IBOutlet weak var search24: UIView!
    @IBOutlet weak var search25: UIView!
    @IBOutlet weak var search26: UIView!
    @IBOutlet weak var search27: UIView!
    @IBOutlet weak var search28: UIView!
    @IBOutlet weak var search29: UIView!
    @IBOutlet weak var search30: UIView!
    @IBOutlet weak var search31: UIView!
    @IBOutlet weak var search32: UIView!
    @IBOutlet weak var search33: UIView!
    @IBOutlet weak var search34: UIView!
    @IBOutlet weak var search35: UIView!
    @IBOutlet weak var search36: UIView!
    @IBOutlet weak var search37: UIView!
    @IBOutlet weak var search38: UIView!
    @IBOutlet weak var search39: UIView!
    @IBOutlet weak var search40: UIView!
    @IBOutlet weak var search41: UIView!
    @IBOutlet weak var search42: UIView!
    @IBOutlet weak var search43: UIView!
    @IBOutlet weak var search44: UIView!
    @IBOutlet weak var search45: UIView!
    @IBOutlet weak var search46: UIView!
    @IBOutlet weak var search47: UIView!
    @IBOutlet weak var search48: UIView!
    @IBOutlet weak var search49: UIView!
    @IBOutlet weak var search50: UIView!
    @IBOutlet weak var search51: UIView!
    @IBOutlet weak var search52: UIView!
    @IBOutlet weak var search53: UIView!
    @IBOutlet weak var search54: UIView!
    @IBOutlet weak var search55: UIView!
    @IBOutlet weak var search56: UIView!
    @IBOutlet weak var search57: UIView!
    @IBOutlet weak var search58: UIView!
    @IBOutlet weak var search59: UIView!
    
    @IBOutlet weak var errorMessage1: UILabel!
    
    var fontSize  = 16
    var player: AVPlayer?
    var counter = 0

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if(counter == 0) {
            playVideo()
        }
        counter += 1
        }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        get {
            return .portrait
        }
    }
    
//    func callAPI(){
//        guard let url = URL(string: "https://creativocentar.ba/data.json") else{
//            return
//        }
//
//
//        let task = URLSession.shared.dataTask(with: url){ [self]
//            data, response, error in
//            guard let data = data, error == nil else { return }
//            do {
//                   let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:Any]
//                   let data = json["data"] as? [[String: Any]] ?? []
//
//                //
//               } catch let error as NSError {
//                   print(error)
//               }
//
//        }
//
//        task.resume()
//    }
    
    override func viewDidLoad() {
        gif2.loadGif(name : "megafon")
//        callAPI()
    }
    
 
        let playerController = AVPlayerViewController()
        private func playVideo() {
            guard let path = Bundle.main.path(forResource: "pocetna", ofType:"mp4") else {
                debugPrint("splash.m4v not found")
                return
            }
            let player = AVPlayer(url: URL(fileURLWithPath: path))
            playerController.showsPlaybackControls = false
            playerController.player = player
            playerController.videoGravity = .resizeAspectFill
            NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerController.player?.currentItem)
            present(playerController, animated: true) {
                player.play()
            }
        }
        @objc func playerDidFinishPlaying(note: NSNotification) {
            print("Method , video is finished ")
            playerController.dismiss(animated: false)
        }
 

    
    
    
    
    
    
    
    
    
    
    
    @IBAction func homeBtn(_ sender: UIControl) {
        closeAll()
        homeView.isHidden = false
    }

    // otvara search
    @IBAction func searchBtn(_ sender: UIControl) {
        var resultCounter = 0
        if(searchView.isHidden == false && uzorak.text!.isEmpty) {
            clearResult()
            errorMessage1.text = "Unesite pojam za pretragu!"
            return
        }
        if (searchView.isHidden == true) {
            closeAll()
            mainTitle.isHidden = true
            searchView.isHidden = false
            uzorak.isHidden = false
        }
        if(!uzorak.text!.isEmpty) {
            clearResult()
            if(naslov1.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               text1.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               s1.lowercased().contains(uzorak.text?.lowercased() ?? "")){
                search1.isHidden = false
                resultCounter+=1
            }
            if(naslov2.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               text2.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               s2.lowercased().contains(uzorak.text?.lowercased() ?? "")){
                search2.isHidden = false
                resultCounter+=1

            }
            if(naslov3.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               text3.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               s3.lowercased().contains(uzorak.text?.lowercased() ?? "")){
                search3.isHidden = false
                resultCounter+=1

            }
            if(naslov4.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               text4.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               s4.lowercased().contains(uzorak.text?.lowercased() ?? "")){
                search4.isHidden = false
                resultCounter+=1

            }
            if(naslov5.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               text5.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               s5.lowercased().contains(uzorak.text?.lowercased() ?? "")){
                search5.isHidden = false
                resultCounter+=1

            }
            if(naslov6.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               text6.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               s6.lowercased().contains(uzorak.text?.lowercased() ?? "")){
                search6.isHidden = false
                resultCounter+=1

            }
            if(naslov7.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               text7.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               s7.lowercased().contains(uzorak.text?.lowercased() ?? "")){
                search7.isHidden = false
                resultCounter+=1

            }
            if(naslov8.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               text8.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               s8.lowercased().contains(uzorak.text?.lowercased() ?? "")){
                search8.isHidden = false
                resultCounter+=1

            }
            if(naslov9.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               text9.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               s9.lowercased().contains(uzorak.text?.lowercased() ?? "")){
                search9.isHidden = false
                resultCounter+=1

            }
            if(naslov10.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               text10.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               s10.lowercased().contains(uzorak.text?.lowercased() ?? "")){
                search10.isHidden = false
                resultCounter+=1

            }
            
            
            if(naslov11.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               text11.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               s11.lowercased().contains(uzorak.text?.lowercased() ?? "")){
                search11.isHidden = false
                resultCounter+=1

            }
            if(naslov12.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               text12.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               s12.lowercased().contains(uzorak.text?.lowercased() ?? "")){
                search12.isHidden = false
                resultCounter+=1

            }
            if(naslov13.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               text13.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               s13.lowercased().contains(uzorak.text?.lowercased() ?? "")){
                search13.isHidden = false
                resultCounter+=1

            }
            if(naslov14.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               text14.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               s14.lowercased().contains(uzorak.text?.lowercased() ?? "")){
                search14.isHidden = false
                resultCounter+=1

            }
            if(naslov15.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
                 text15.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
                 s15.lowercased().contains(uzorak.text?.lowercased() ?? "")){
                  search15.isHidden = false
                resultCounter+=1

              }
            if(naslov16.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               text16.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               s16.lowercased().contains(uzorak.text?.lowercased() ?? "")){
                search16.isHidden = false
                resultCounter+=1

            }
            if(naslov17.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               text17.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               s17.lowercased().contains(uzorak.text?.lowercased() ?? "")){
                search17.isHidden = false
                resultCounter+=1

            }
            if(naslov18.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               text18.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               s18.lowercased().contains(uzorak.text?.lowercased() ?? "")){
                search18.isHidden = false
                resultCounter+=1

            }
            if(naslov19.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               text19.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               s19.lowercased().contains(uzorak.text?.lowercased() ?? "")){
                search19.isHidden = false
                resultCounter+=1

            }
            if(naslov20.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               text20.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               s20.lowercased().contains(uzorak.text?.lowercased() ?? "")){
                search20.isHidden = false
                resultCounter+=1

            }
            if(naslov21.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               text21.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               s21.lowercased().contains(uzorak.text?.lowercased() ?? "")){
                search21.isHidden = false
                resultCounter+=1

            }
            if(naslov22.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               text22.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               s22.lowercased().contains(uzorak.text?.lowercased() ?? "")){
                search22.isHidden = false
                resultCounter+=1

            }
            if(naslov23.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               text23.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               s23.lowercased().contains(uzorak.text?.lowercased() ?? "")){
                search23.isHidden = false
                resultCounter+=1

            }
            if(naslov24.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               text24.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               s24.lowercased().contains(uzorak.text?.lowercased() ?? "")){
                search24.isHidden = false
                resultCounter+=1

            }
            if(naslov25.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               text25.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               s25.lowercased().contains(uzorak.text?.lowercased() ?? "")){
                search25.isHidden = false
                resultCounter+=1

            }
            if(naslov26.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               text26.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               s26.lowercased().contains(uzorak.text?.lowercased() ?? "")){
                search26.isHidden = false
                resultCounter+=1

            }
            if(naslov27.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               text27.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               s27.lowercased().contains(uzorak.text?.lowercased() ?? "")){
                search27.isHidden = false
                resultCounter+=1

            }
            if(naslov28.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               text28.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               s28.lowercased().contains(uzorak.text?.lowercased() ?? "")){
                search28.isHidden = false
                resultCounter+=1

            }
            if(naslov29.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               text29.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               s29.lowercased().contains(uzorak.text?.lowercased() ?? "")){
                search29.isHidden = false
                resultCounter+=1

            }
            if(naslov30.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               text30.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               s30.lowercased().contains(uzorak.text?.lowercased() ?? "")){
                search30.isHidden = false
                resultCounter+=1

            }
            if(naslov31.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               text31.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               s31.lowercased().contains(uzorak.text?.lowercased() ?? "")){
                search31.isHidden = false
                resultCounter+=1

            }
            if(naslov32.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               text32.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               s32.lowercased().contains(uzorak.text?.lowercased() ?? "")){
                search32.isHidden = false
                resultCounter+=1

            }
            if(naslov33.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               text33.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               s33.lowercased().contains(uzorak.text?.lowercased() ?? "")){
                search33.isHidden = false
                resultCounter+=1

            }
            if(naslov34.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               text34.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               s34.lowercased().contains(uzorak.text?.lowercased() ?? "")){
                search34.isHidden = false
                resultCounter+=1

            }
            if(naslov35.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               text35.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               s35.lowercased().contains(uzorak.text?.lowercased() ?? "")){
                search35.isHidden = false
            }
            if(naslov36.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               text36.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               s36.lowercased().contains(uzorak.text?.lowercased() ?? "")){
                search36.isHidden = false
                resultCounter+=1

            }
            if(naslov37.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               text37.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               s37.lowercased().contains(uzorak.text?.lowercased() ?? "")){
                search37.isHidden = false
                resultCounter+=1

            }
            if(mjera1.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera1a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera3.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera3a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera4.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera4a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera5.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera5a.lowercased().contains(uzorak.text?.lowercased() ?? "") ){
               search38.isHidden = false
                resultCounter+=1

            }
            if(mjera6.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera6a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera3.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera3a.lowercased().contains(uzorak.text?.lowercased() ?? "")){
               search39.isHidden = false
                resultCounter+=1

            }
            if(mjera6.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera6a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera3.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera3a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera4.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera4a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera5.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera5a.lowercased().contains(uzorak.text?.lowercased() ?? "") ){
               search40.isHidden = false
                resultCounter+=1

            }
            if(mjera3.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera3a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera5.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera5a.lowercased().contains(uzorak.text?.lowercased() ?? "")){
               search41.isHidden = false
                resultCounter+=1

            }
            if(mjera6.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera6a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera3.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera3a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera5.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera5a.lowercased().contains(uzorak.text?.lowercased() ?? "")){
               search42.isHidden = false
                resultCounter+=1

            }
            if(mjera6.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera6a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera3.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera3a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera4.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera4a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera5.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera5a.lowercased().contains(uzorak.text?.lowercased() ?? "") ){
               search43.isHidden = false
                resultCounter+=1

            }
            if(mjera6.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera6a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera3.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera3a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera4.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera4a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera5.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera5a.lowercased().contains(uzorak.text?.lowercased() ?? "") ){
               search44.isHidden = false
                resultCounter+=1

            }
            if(mjera6.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera6a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera3.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera3a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera4.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera4a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera5.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera5a.lowercased().contains(uzorak.text?.lowercased() ?? "") ){
               search45.isHidden = false
                resultCounter+=1

            }
            if(mjera6.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera6a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera9.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera9a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera3.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera3a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera4.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera4a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera5a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera5a.lowercased().contains(uzorak.text?.lowercased() ?? "") ){
               search46.isHidden = false
                resultCounter+=1

            }
            if(mjera6.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera6a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera3.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera3a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera4.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera4a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera5.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera5a.lowercased().contains(uzorak.text?.lowercased() ?? "") ){
               search47.isHidden = false
                resultCounter+=1

            }
            if(mjera6.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera6a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera3.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera3a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera4.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera4a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera5.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera5a.lowercased().contains(uzorak.text?.lowercased() ?? "") ){
               search48.isHidden = false
                resultCounter+=1

            }
            if(mjera3.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera3a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera4.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera4a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera5.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera5a.lowercased().contains(uzorak.text?.lowercased() ?? "") ){
               search49.isHidden = false
                resultCounter+=1

            }
            if(mjera6.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera6a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera3.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera3a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera4.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera4a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera5.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera5a.lowercased().contains(uzorak.text?.lowercased() ?? "") ){
               search50.isHidden = false
                resultCounter+=1

            }
            if(mjera6.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera6a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera3.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera3a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera4.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera4a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera5.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera5a.lowercased().contains(uzorak.text?.lowercased() ?? "") ){
               search51.isHidden = false
                resultCounter+=1

            }
            if(mjera6.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera6a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera3.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera3a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera4.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera4a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera5.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera5a.lowercased().contains(uzorak.text?.lowercased() ?? "") ){
               search52.isHidden = false
                resultCounter+=1

            }
            if(mjera6.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera6a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera3.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera3a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera4.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera4a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera5.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera5a.lowercased().contains(uzorak.text?.lowercased() ?? "") ){
               search53.isHidden = false
                resultCounter+=1

            }
            if(mjera6.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera6a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera3.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera3a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera4.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera4a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera5.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera5a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera9.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera9a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera8a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera8a.lowercased().contains(uzorak.text?.lowercased() ?? "") ){
               search54.isHidden = false
                resultCounter+=1

            }
            if(mjera6.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera6a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera3.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera3a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera4.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera4a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera5.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera5a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera9.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera9a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera8a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera8a.lowercased().contains(uzorak.text?.lowercased() ?? "") ){
               search55.isHidden = false
                resultCounter+=1

            }
            if(mjera6.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera6a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera3.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera3a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera4.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera4a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera5.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera5a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera9.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera9a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera8a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera8a.lowercased().contains(uzorak.text?.lowercased() ?? "") ){
               search56.isHidden = false
                resultCounter+=1

            }
            if(mjera6.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera6a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera3.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera3a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera4.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera4a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera5.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera5a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera9.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera9a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera8a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera8a.lowercased().contains(uzorak.text?.lowercased() ?? "") ){
               search57.isHidden = false
                resultCounter+=1

            }
            if(mjera6.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera6a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera3.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera3a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera4.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera4a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera5.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera5a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera9.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera9a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera8a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera8a.lowercased().contains(uzorak.text?.lowercased() ?? "") ){
               search58.isHidden = false
                resultCounter+=1

            }
            if(mjera6.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera6a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera3.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera3a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera4.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera4a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera5.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera5a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera9.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera9a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera8a.lowercased().contains(uzorak.text?.lowercased() ?? "") ||
               mjera8a.lowercased().contains(uzorak.text?.lowercased() ?? "") ){
               search59.isHidden = false
                resultCounter+=1
            }
            if (resultCounter == 0) {
                errorMessage1.text = "Nema rezultata, pokušajte ponovo sa drugim pojmom..."
            }
        } else {
            uzorak.placeholder = "Unesite željeni pojam..."
            uzorak.becomeFirstResponder()
        }
            

    }
    
    @IBAction func plus(_ sender: UIControl) {
    
        postText.font =  UIFont(name: postText.font.fontName, size: postText.font.pointSize-1)!
        customPostTxt.font =  UIFont(name: postText.font.fontName, size: postText.font.pointSize-1)!
        korak1text.font =  UIFont(name: postText.font.fontName, size: postText.font.pointSize-1)!
        korak2text.font =  UIFont(name: postText.font.fontName, size: postText.font.pointSize-1)!
        korak3text.font =  UIFont(name: postText.font.fontName, size: postText.font.pointSize-1)!
        korak4text.font =  UIFont(name: postText.font.fontName, size: postText.font.pointSize-1)!
        korak5text.font =  UIFont(name: postText.font.fontName, size: postText.font.pointSize-1)!
        korak6text.font =  UIFont(name: postText.font.fontName, size: postText.font.pointSize-1)!
        fontSize = Int(postText.font.pointSize)

        
    }
    
    @IBAction func minus(_ sender: UIControl) {
        postText.font =  UIFont(name: postText.font.fontName, size: postText.font.pointSize+1)!
        customPostTxt.font =  UIFont(name: postText.font.fontName, size: postText.font.pointSize+1)!
        korak1text.font =  UIFont(name: postText.font.fontName, size: postText.font.pointSize+1)!
        korak2text.font =  UIFont(name: postText.font.fontName, size: postText.font.pointSize+1)!
        korak3text.font =  UIFont(name: postText.font.fontName, size: postText.font.pointSize+1)!
        korak4text.font =  UIFont(name: postText.font.fontName, size: postText.font.pointSize+1)!
        korak5text.font =  UIFont(name: postText.font.fontName, size: postText.font.pointSize+1)!
        korak6text.font =  UIFont(name: postText.font.fontName, size: postText.font.pointSize+1)!
        fontSize = Int(postText.font.pointSize)

    }
    
    
    @IBAction func subBtn11(_ sender: UIControl) {
        closeAll()
        measuresListView.isHidden = false


    }
    
    @IBAction func subBtn12(_ sender: UIControl) {
        closeAll()
        measuresListView.isHidden = false


    }
    
    @IBAction func subBtn21(_ sender: UIControl) {
        closeAll()
        subHome.isHidden = false

    }
    
    @IBAction func subBtn22(_ sender: UIControl) {
        closeAll()
        subHome.isHidden = false
    }
    
    
    @IBAction func measuresBtn(_ sender: UIControl) {
        closeAll()
        measuresListView.isHidden = false

    }
    
    @IBAction func openG1(_ sender: UIControl) {
        closeAll()
        G1.isHidden = false
    }
    @IBAction func openG1b(_ sender: UIControl) {
        closeAll()
        G1.isHidden = false
    }
    
    @IBAction func openG2(_ sender: UIControl) {
        closeAll()
        G2.isHidden = false
    }
    
    @IBAction func openG3(_ sender: UIControl) {
        closeAll()
        G3.isHidden = false
    }
    
    @IBAction func openG4(_ sender: UIControl) {
        closeAll()
        G4.isHidden = false
    }
    
    @IBAction func openG5(_ sender: UIControl) {
        closeAll()
        G5.isHidden = false
    }
    
    
    @IBAction func openG6(_ sender: UIControl) {
        closeAll()
        G6.isHidden = false
    }
    
    @IBAction func openG7(_ sender: UIControl) {
        closeAll()
        measuresListView.isHidden = false
    }
    
    
    @IBAction func openG8(_ sender: UIControl) {
        closeAll()
        G8.isHidden = false
    }
    

    @IBAction func open11(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov1
        postImage.image = UIImage(named: "s1")
        postText.textColor = UIColor.white
        let attributedQuote = NSMutableAttributedString(string: text1)
        attributedQuote.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: CGFloat(fontSize)), range: NSRange(location: 426, length: 166))
        postText.attributedText = attributedQuote
    }
    
    @IBAction func open12(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov2
        postImage.image = UIImage(named: "s2")
        postText.textColor = UIColor.white
        let attributedQuote = NSMutableAttributedString(string: text2)
        attributedQuote.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: CGFloat(fontSize)), range: NSRange(location: 530, length: 202))
        postText.attributedText = attributedQuote
    }
    @IBAction func open13(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov3
        postImage.image = UIImage(named: "s3")
        postText.textColor = UIColor.white
        postText.text = text3
    }
    
    @IBAction func open14(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov4
        postText.textColor = UIColor.white
        postImage.image = UIImage(named: "s4")
        postText.text = text4
    }
    
    @IBAction func open15(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov5
        postText.textColor = UIColor.white
        postImage.image = UIImage(named: "s5")
        postText.text = text5
    }
    
    @IBAction func open16(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov6
        postText.textColor = UIColor.white
        postImage.image = UIImage(named: "s6")
        postText.text = text6
    }
    
    
    @IBAction func open21(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov7
        postText.textColor = UIColor.white
        postImage.image = UIImage(named: "s7")
        postText.text = text7
    }
    
    
    @IBAction func open22(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov8
        postImage.image = UIImage(named: "s8")
        postText.textColor = UIColor.orange
        postText.text = text8
    }
    @IBAction func open31(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov9
        postText.textColor = UIColor.white
        postImage.image = UIImage(named: "s9")
        postText.text = text9
    }

    @IBAction func open32(_ sender: UIControl) {
                closeAll()
                post.isHidden = false
                postTitle.text = naslov10
                postText.textColor = UIColor.white
                postImage.image = UIImage(named: "s10")
                postText.text = text10
    }
    @IBAction func open33(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov11
        postText.textColor = UIColor.white
        postImage.image = UIImage(named: "s11")
        postText.text = text11
    }
    @IBAction func open34(_ sender: UIControl) {
            closeAll()
            post.isHidden = false
            postTitle.text = naslov12
            postText.textColor = UIColor.white
            postImage.image = UIImage(named: "s12")
            postText.text = text12
    }
    @IBAction func open35(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov13
        postText.textColor = UIColor.white
        postImage.image = UIImage(named: "s13")
        postText.textColor = UIColor.orange
        postText.text = text13
    }
    
    @IBAction func open36(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov14
        postText.textColor = UIColor.white
        postImage.image = UIImage(named: "s14")
        postText.text = text14
    }
    @IBAction func open37(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov15
        postImage.image = UIImage(named: "s15")
        postText.textColor = UIColor.orange
        postText.text = text15
    }
    
    @IBAction func open38(_ sender: UIControl) {
                closeAll()
                post.isHidden = false
                postTitle.text = naslov16
                postText.textColor = UIColor.white
                postImage.image = UIImage(named: "s16")
                postText.text = text16
    }
    @IBAction func open39(_ sender: UIControl) {
        closeAll()
            post.isHidden = false
            postTitle.text = naslov17
        postText.textColor = UIColor.white
            postImage.image = UIImage(named: "s17")
        let attributedQuote = NSMutableAttributedString(string: text17)
        attributedQuote.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: CGFloat(fontSize)), range: NSRange(location: 675, length: 12))
        postText.attributedText = attributedQuote
    }
    @IBAction func open310(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov18
        postImage.image = UIImage(named: "s18")
        postText.textColor = UIColor.orange
        postText.text = text18
    }
    @IBAction func open41(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov19
        postText.textColor = UIColor.white
        postImage.image = UIImage(named: "s19")
        postText.text = text19
    }
    @IBAction func open51(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov20
        postText.textColor = UIColor.white
        postImage.image = UIImage(named: "s20")
        postText.text = text20
    }
    
    @IBAction func open52(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov21
        postImage.image = UIImage(named: "s21")
        postText.textColor = UIColor.orange
        postText.text = text21
    }
    
    
    @IBAction func open53(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov22
        postImage.image = UIImage(named: "s22")
        postText.textColor = UIColor.orange
        postText.text = text22
    }
    
    @IBAction func open54(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov23
        postImage.image = UIImage(named: "s23")
        postText.textColor = UIColor.orange
        postText.text = text23
    }
    
    @IBAction func open55(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov24
        postText.textColor = UIColor.white
        postImage.image = UIImage(named: "s24")
        postText.text = text24
    }
    @IBAction func open56(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov25
        postImage.image = UIImage(named: "s25")
        postText.textColor = UIColor.orange
        postText.text = text25
    }
    @IBAction func open57(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov26
        postText.textColor = UIColor.orange
        postImage.image = UIImage(named: "s26")
        postText.text = text26
    }
    
    
    @IBAction func open58(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov27
        postText.textColor = UIColor.white
        postImage.image = UIImage(named: "s27")
        postText.text = text27
    }
    
    @IBAction func open59(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov28
        postImage.image = UIImage(named: "s28")
        postText.textColor = UIColor.orange
        postText.text = text28
    }
    
    @IBAction func open61(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov29
        postText.textColor = UIColor.white
        postImage.image = UIImage(named: "s29")
        postText.text = text29
    }
    
    @IBAction func open62(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov30
        postImage.image = UIImage(named: "s30")
        postText.textColor = UIColor.orange
        postText.text = text30
    }
    
    @IBAction func open81(_ sender: UIControl) {
        closeAll()
        customPost.isHidden = false
        customPostTitle.text = naslov31
        customPostTxt.textColor = UIColor.white
        let attributedQuote = NSMutableAttributedString(string: text31)
        attributedQuote.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: CGFloat(fontSize)), range: NSRange(location: 0, length: 60))
        attributedQuote.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: CGFloat(fontSize)), range: NSRange(location: 277, length: 63))

        customPostTxt.attributedText = attributedQuote
    }
    @IBAction func open82(_ sender: UIControl) {
        closeAll()
        customPost.isHidden = false
        customPostTitle.text = naslov32
        customPostTxt.textColor = UIColor.white
        let attributedQuote = NSMutableAttributedString(string: text32)
        attributedQuote.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: CGFloat(fontSize)), range: NSRange(location: 0, length: 39))
        attributedQuote.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: CGFloat(fontSize)), range: NSRange(location: 904, length: 27))
        attributedQuote.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: CGFloat(fontSize)), range: NSRange(location: 1406, length: 33))
        attributedQuote.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: CGFloat(fontSize)), range: NSRange(location: 1858, length: 11))


        customPostTxt.attributedText = attributedQuote
    }
    @IBAction func open83(_ sender: UIControl) {
        closeAll()
        customPost.isHidden = false
        customPostTitle.text = naslov33
        customPostTxt.textColor = UIColor.white
        let attributedQuote = NSMutableAttributedString(string: text33)
        attributedQuote.addAttribute(.foregroundColor, value: UIColor.orange, range: NSRange(location: 0, length: 232))
        attributedQuote.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: 50))
        attributedQuote.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 233, length: 20))
        attributedQuote.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 751, length: 62))
        attributedQuote.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 1414, length: 47))



        customPostTxt.attributedText = attributedQuote
    }
    
    @IBAction func open84(_ sender: UIControl) {
        closeAll()
        customPost.isHidden = false
        customPostTitle.text = naslov34
        customPostTxt.textColor = UIColor.white
        let attributedQuote = NSMutableAttributedString(string: text34)
        attributedQuote.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: CGFloat(fontSize)), range: NSRange(location: 1472, length: 228))
        attributedQuote.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 76, length: 16))
        attributedQuote.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 113, length: 113))
        attributedQuote.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 712, length: 46))
        attributedQuote.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 1700, length: 28))
        attributedQuote.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 2166, length: 31))




       
        customPostTxt.attributedText = attributedQuote
    
    }
    @IBAction func open85(_ sender: UIControl) {
        closeAll()
        customPost.isHidden = false
        customPostTitle.text = naslov35
        customPostTxt.textColor = UIColor.white
        customPostTxt.text = text35
    }
    @IBAction func open86(_ sender: UIControl) {
        closeAll()
        customPost.isHidden = false
        customPostTitle.text = naslov36
        customPostTxt.textColor = UIColor.white
        customPostTxt.text = text36
    }
    @IBAction func open87(_ sender: UIControl) {
        closeAll()
        customPost.isHidden = false
        customPostTitle.text = naslov37
        customPostTxt.textColor = UIColor.white
        let attributedQuote = NSMutableAttributedString(string: text37)
        attributedQuote.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: CGFloat(fontSize)), range: NSRange(location: 1401, length: 185))
        attributedQuote.addAttribute(.foregroundColor, value: UIColor.orange, range: NSRange(location: 1586, length: 53))
        customPostTxt.attributedText = attributedQuote
    }
    
    @IBAction func openLink(_ sender: UIControl) {
        closeAll()
        customPost1.isHidden = false
    }
    @IBAction func openM1(_ sender: UIControl) {
       closeAll()
        measuresView.isHidden = false
        closeAllSteps()
        koraciNaslov.text = "FIZIČKO NASILJE NA BM/UGROŽENA SIGURNOST"
        korak1.isHidden = false
            korak1naslov.text = "Zaštitite se"
            korak1text.text = mjera1
        korak2.isHidden = false
            korak2naslov.text = "Prijavite nepravilnosti nadležnom koordinatoru"
            korak2text.text = mjera3
        korak3.isHidden = false
            korak3naslov.text = "Unesite primjedbu u zapisnik o radu BO"
            korak3text.text = mjera4
        korak4.isHidden = false
            korak4naslov.text = "Dokumentujte nepravilnosti/kršenje"
            korak4text.text = mjera5
    }
    
    @IBAction func openM2(_ sender: UIControl) {
        closeAll()
         measuresView.isHidden = false
         closeAllSteps()
         koraciNaslov.text = "ZABRANA POSMATRANJA ILI USKRAĆIVANJE PRAVA POSMATRAČA"
         korak1.isHidden = false
             korak1naslov.text = "Upozorite predsjednika BO"
             korak1text.text = mjera6
         korak2.isHidden = false
             korak2naslov.text = "Prijavite nepravilnosti nadležnom koordinatoru"
             korak2text.text = mjera3
    }
    @IBAction func openM3(_ sender: UIControl) {
        closeAll()
         measuresView.isHidden = false
         closeAllSteps()
         koraciNaslov.text = "BUGARSKI VOZ (KRUŽNO GLASANJE)"
         korak1.isHidden = false
             korak1naslov.text = "Upozorite predsjednika BO"
             korak1text.text = mjera6
         korak2.isHidden = false
            korak2naslov.text = "Prijavite nepravilnosti nadležnom koordinatoru"
            korak2text.text = mjera3
        korak3.isHidden = false
            korak3naslov.text = "Unesite primjedbu u zapisnik o radu BO"
            korak3text.text = mjera4
         korak4.isHidden = false
            korak4naslov.text = "Dokumentujte nepravilnosti/kršenje"
            korak4text.text = mjera5
    }
    
    @IBAction func openM4(_ sender: UIControl) {
        closeAll()
         measuresView.isHidden = false
         closeAllSteps()
         koraciNaslov.text = "KUPOVINA GLASOVA"
         korak1.isHidden = false
            korak1naslov.text = "Prijavite nepravilnosti nadležnom koordinatoru"
            korak1text.text = mjera3
         korak2.isHidden = false
            korak2naslov.text = "Dokumentujte nepravilnosti/kršenje"
            korak2text.text = mjera5
    }
    
    @IBAction func openM5(_ sender: UIControl) {
        closeAll()
         measuresView.isHidden = false
         closeAllSteps()
         koraciNaslov.text = "PRITISCI NA BIRAČE I ZASTRAŠIVANJE"
         korak1.isHidden = false
            korak1naslov.text = "Upozorite predsjednika BO"
            korak1text.text = mjera6
         korak2.isHidden = false
            korak2naslov.text = "Prijavite nepravilnosti nadležnom koordinatoru"
            korak2text.text = mjera3
        korak3.isHidden = false
            korak3naslov.text = "Dokumentujte nepravilnosti/kršenje"
            korak3text.text = mjera5

    }
    @IBAction func openM6(_ sender: UIControl) {
        closeAll()
         measuresView.isHidden = false
         closeAllSteps()
         koraciNaslov.text = "KRŠENJE IZBORNE ŠUTNJE"
         korak1.isHidden = false
            korak1naslov.text = "Upozorite predsjednika BO"
            korak1text.text = mjera6
         korak2.isHidden = false
            korak2naslov.text = "Prijavite nepravilnosti nadležnom koordinatoru"
            korak2text.text = mjera3
        korak3.isHidden = false
            korak3naslov.text = "Unesite primjedbu u zapisnik o radu BO"
            korak3text.text = mjera4
        korak4.isHidden = false
            korak4naslov.text = "Dokumentujte nepravilnosti/kršenje"
            korak4text.text = mjera5
    }
    
    @IBAction func openM7(_ sender: UIControl) {
        closeAll()
         measuresView.isHidden = false
         closeAllSteps()
         koraciNaslov.text = "PORODIČNO GLASANJE"
         korak1.isHidden = false
            korak1naslov.text = "Upozorite predsjednika BO"
            korak1text.text = mjera6
         korak2.isHidden = false
            korak2naslov.text = "Prijavite nepravilnosti nadležnom koordinatoru"
            korak2text.text = mjera3
        korak3.isHidden = false
            korak3naslov.text = "Unesite primjedbu u zapisnik o radu BO"
            korak3text.text = mjera4
        korak4.isHidden = false
            korak4naslov.text = "Dokumentujte nepravilnosti/kršenje"
            korak4text.text = mjera5
    }
    
    @IBAction func openM8(_ sender: UIControl) {
        closeAll()
         measuresView.isHidden = false
         closeAllSteps()
         koraciNaslov.text = "ZLOUPOTREBA POMOĆI PRI GLASANJU"
         korak1.isHidden = false
            korak1naslov.text = "Upozorite predsjednika BO"
            korak1text.text = mjera6
         korak2.isHidden = false
            korak2naslov.text = "Prijavite nepravilnosti nadležnom koordinatoru"
            korak2text.text = mjera3
        korak3.isHidden = false
            korak3naslov.text = "Unesite primjedbu u zapisnik o radu BO"
            korak3text.text = mjera4
        korak4.isHidden = false
            korak4naslov.text = "Dokumentujte nepravilnosti/kršenje"
            korak4text.text = mjera5
    }
    
    @IBAction func openM9(_ sender: UIControl) {
        closeAll()
         measuresView.isHidden = false
         closeAllSteps()
         koraciNaslov.text = "NISU ISTAKNUTI REZULTATI IZBORA (ŽUTE KOPIJE)"
         korak1.isHidden = false
            korak1naslov.text = "Upozorite predsjednika BO"
            korak1text.text = mjera6
         korak2.isHidden = false
            korak2naslov.text = "Tražite kopiju rezultata glasanja (žutu kopiju)"
            korak2text.text = mjera9
        korak3.isHidden = false
            korak3naslov.text = "Prijavite nepravilnosti nadležnom koordinatoru"
            korak3text.text = mjera3
        korak4.isHidden = false
            korak4naslov.text = "Unesite primjedbu u zapisnik o radu BO"
            korak4text.text = mjera4
        korak4.isHidden = false
            korak4naslov.text = "Dokumentujte nepravilnosti/kršenje"
            korak4text.text = mjera5
    }
    
    @IBAction func openM10(_ sender: UIControl) {
        closeAll()
         measuresView.isHidden = false
         closeAllSteps()
         koraciNaslov.text = "KAŠNJENJE U OTVARANJU BM PREKO 3 SATA"
         korak1.isHidden = false
            korak1naslov.text = "Upozorite predsjednika BO"
            korak1text.text = mjera6
         korak2.isHidden = false
            korak2naslov.text = "Prijavite nepravilnosti nadležnom koordinatoru"
            korak2text.text = mjera3
        korak3.isHidden = false
            korak3naslov.text = "Unesite primjedbu u zapisnik o radu BO"
            korak3text.text = mjera4
        korak4.isHidden = false
            korak4naslov.text = "Dokumentujte nepravilnosti/kršenje"
            korak4text.text = mjera5

    }
    @IBAction func openM11(_ sender: UIControl) {
        closeAll()
         measuresView.isHidden = false
         closeAllSteps()
         koraciNaslov.text = "ODSUSTVO ČLANOVA BO"
         korak1.isHidden = false
            korak1naslov.text = "Upozorite predsjednika BO"
            korak1text.text = mjera6
         korak2.isHidden = false
            korak2naslov.text = "Prijavite nepravilnosti nadležnom koordinatoru"
            korak2text.text = mjera3
        korak3.isHidden = false
            korak3naslov.text = "Unesite primjedbu u zapisnik o radu BO"
            korak3text.text = mjera4
        korak4.isHidden = false
            korak4naslov.text = "Dokumentujte nepravilnosti/kršenje"
            korak4text.text = mjera5
    }
    
    @IBAction func openM12(_ sender: UIControl) {
        closeAll()
         measuresView.isHidden = false
         closeAllSteps()
         koraciNaslov.text = "NEDOSTATAK ILI NESTANAK IZBORNOG MATERIJALA"
         korak1.isHidden = false
            korak1naslov.text = "Prijavite nepravilnosti nadležnom koordinatoru"
            korak1text.text = mjera3
         korak2.isHidden = false
            korak2naslov.text = "Unesite primjedbu u zapisnik o radu BO"
            korak2text.text = mjera4
        korak3.isHidden = false
        korak3.isHidden = false
            korak3naslov.text = "Dokumentujte nepravilnosti/kršenje"
            korak3text.text = mjera5
    }
    @IBAction func openM13(_ sender: UIControl) {
        closeAll()
         measuresView.isHidden = false
         closeAllSteps()
         koraciNaslov.text = "NARUŠENA TAJNOST GLASANJA"
         korak1.isHidden = false
            korak1naslov.text = "Upozorite predsjednika BO"
            korak1text.text = mjera6
         korak2.isHidden = false
            korak2naslov.text = "Prijavite nepravilnosti nadležnom koordinatoru"
            korak2text.text = mjera3
        korak3.isHidden = false
            korak3naslov.text = "Unesite primjedbu u zapisnik o radu BO"
            korak3text.text = mjera4
        korak4.isHidden = false
            korak4naslov.text = "Dokumentujte nepravilnosti/kršenje"
            korak4text.text = mjera5
    }
    
    @IBAction func openM14(_ sender: UIControl) {
        closeAll()
         measuresView.isHidden = false
         closeAllSteps()
         koraciNaslov.text = "MANIPULACIJE PRI IDENTIFIKACIJI BIRAČA"
         korak1.isHidden = false
            korak1naslov.text = "Upozorite predsjednika BO"
            korak1text.text = mjera6
         korak2.isHidden = false
            korak2naslov.text = "Prijavite nepravilnosti nadležnom koordinatoru"
            korak2text.text = mjera3
        korak3.isHidden = false
            korak3naslov.text = "Unesite primjedbu u zapisnik o radu BO"
            korak3text.text = mjera4
        korak4.isHidden = false
            korak4naslov.text = "Dokumentujte nepravilnosti/kršenje"
            korak4text.text = mjera5
    }
    
    @IBAction func openM15(_ sender: UIControl) {
        closeAll()
         measuresView.isHidden = false
         closeAllSteps()
         koraciNaslov.text = "MANIPULACIJE PRI IZDAVANJU GLASAČKIH LISTIĆA"
         korak1.isHidden = false
            korak1naslov.text = "Upozorite predsjednika BO"
            korak1text.text = mjera6
         korak2.isHidden = false
            korak2naslov.text = "Prijavite nepravilnosti nadležnom koordinatoru"
            korak2text.text = mjera3
        korak3.isHidden = false
            korak3naslov.text = "Unesite primjedbu u zapisnik o radu BO"
            korak3text.text = mjera4
        korak4.isHidden = false
            korak4naslov.text = "Dokumentujte nepravilnosti/kršenje"
            korak4text.text = mjera5
    }
    
    @IBAction func openM16(_ sender: UIControl) {
        closeAll()
         measuresView.isHidden = false
         closeAllSteps()
         koraciNaslov.text = "USKRAĆIVANJE PRAVA NA GLASANJU"
         korak1.isHidden = false
            korak1naslov.text = "Upozorite predsjednika BO"
            korak1text.text = mjera6
         korak2.isHidden = false
            korak2naslov.text = "Prijavite nepravilnosti nadležnom koordinatoru"
            korak2text.text = mjera3
        korak3.isHidden = false
            korak3naslov.text = "Unesite primjedbu u zapisnik o radu BO"
            korak3text.text = mjera4
        korak4.isHidden = false
            korak4naslov.text = "Dokumentujte nepravilnosti/kršenje"
            korak4text.text = mjera5
    }
    
    @IBAction func openM17(_ sender: UIControl) {
        closeAll()
         measuresView.isHidden = false
         closeAllSteps()
         koraciNaslov.text = "NESLAGANJA U TESTU TAČNOSTI"
         korak1.isHidden = false
            korak1naslov.text = "Upozorite predsjednika BO"
            korak1text.text = mjera6
         korak2.isHidden = false
            korak2naslov.text = "Prijavite nepravilnosti nadležnom koordinatoru"
            korak2text.text = mjera3
        korak3.isHidden = false
            korak3naslov.text = "Unesite primjedbu u zapisnik o radu BO"
            korak3text.text = mjera4
        korak4.isHidden = false
            korak4naslov.text = "Dokumentujte nepravilnosti/kršenje"
            korak4text.text = mjera5
        korak5.isHidden = false
            korak5naslov.text = "Tražite kopiju rezultata glasanja (žutu kopiju)"
            korak5text.text = mjera9
        korak6.isHidden = false
            korak6naslov.text = "Zatražite od CIK-a BiH ponovno brojanje glasova"
            korak6text.text = mjera8
       
    }
    @IBAction func openM18(_ sender: UIControl) {
        closeAll()
         measuresView.isHidden = false
         closeAllSteps()
         koraciNaslov.text = "ZLOUPOTREBE GLASAČKIH LISTIĆA PRI BROJANJU"
         korak1.isHidden = false
            korak1naslov.text = "Upozorite predsjednika BO"
            korak1text.text = mjera6
         korak2.isHidden = false
            korak2naslov.text = "Prijavite nepravilnosti nadležnom koordinatoru"
            korak2text.text = mjera3
        korak3.isHidden = false
            korak3naslov.text = "Unesite primjedbu u zapisnik o radu BO"
            korak3text.text = mjera4
        korak4.isHidden = false
            korak4naslov.text = "Dokumentujte nepravilnosti/kršenje"
            korak4text.text = mjera5
        korak5.isHidden = false
            korak5naslov.text = "Tražite kopiju rezultata glasanja (žutu kopiju)"
            korak5text.text = mjera9
        korak6.isHidden = false
            korak6naslov.text = "Zatražite od CIK-a BiH ponovno brojanje glasova"
            korak6text.text = mjera8
    }
    
    @IBAction func openM19(_ sender: UIControl) {
        closeAll()
         measuresView.isHidden = false
         closeAllSteps()
         koraciNaslov.text = "NAMJERNO PONIŠTAVANJE GLASOVA"
         korak1.isHidden = false
            korak1naslov.text = "Upozorite predsjednika BO"
            korak1text.text = mjera6
         korak2.isHidden = false
            korak2naslov.text = "Prijavite nepravilnosti nadležnom koordinatoru"
            korak2text.text = mjera3
        korak3.isHidden = false
            korak3naslov.text = "Unesite primjedbu u zapisnik o radu BO"
            korak3text.text = mjera4
        korak4.isHidden = false
            korak4naslov.text = "Dokumentujte nepravilnosti/kršenje"
            korak4text.text = mjera5
        korak5.isHidden = false
            korak5naslov.text = "Tražite kopiju rezultata glasanja (žutu kopiju)"
            korak5text.text = mjera9
        korak6.isHidden = false
            korak6naslov.text = "Zatražite od CIK-a BiH ponovno brojanje glasova"
            korak6text.text = mjera8
    }
    
    @IBAction func openM20(_ sender: UIControl) {
        closeAll()
         measuresView.isHidden = false
         closeAllSteps()
         koraciNaslov.text = "NEDOZVOLJENO DOPISIVANJE GLASOVA"
         korak1.isHidden = false
            korak1naslov.text = "Upozorite predsjednika BO"
            korak1text.text = mjera6
         korak2.isHidden = false
            korak2naslov.text = "Prijavite nepravilnosti nadležnom koordinatoru"
            korak2text.text = mjera3
        korak3.isHidden = false
            korak3naslov.text = "Unesite primjedbu u zapisnik o radu BO"
            korak3text.text = mjera4
        korak4.isHidden = false
            korak4naslov.text = "Dokumentujte nepravilnosti/kršenje"
            korak4text.text = mjera5
        korak5.isHidden = false
            korak5naslov.text = "Tražite kopiju rezultata glasanja (žutu kopiju)"
            korak5text.text = mjera9
        korak6.isHidden = false
            korak6naslov.text = "Zatražite od CIK-a BiH ponovno brojanje glasova"
            korak6text.text = mjera8
    }
    
    @IBAction func openM21(_ sender: UIControl) {
        closeAll()
         measuresView.isHidden = false
         closeAllSteps()
         koraciNaslov.text = "POGREŠNO EVIDENTIRANJE REZULTATA GLASANJU NA BM"
         korak1.isHidden = false
            korak1naslov.text = "Upozorite predsjednika BO"
            korak1text.text = mjera6
         korak2.isHidden = false
            korak2naslov.text = "Prijavite nepravilnosti nadležnom koordinatoru"
            korak2text.text = mjera3
        korak3.isHidden = false
            korak3naslov.text = "Unesite primjedbu u zapisnik o radu BO"
            korak3text.text = mjera4
        korak4.isHidden = false
            korak4naslov.text = "Dokumentujte nepravilnosti/kršenje"
            korak4text.text = mjera5
        korak5.isHidden = false
            korak5naslov.text = "Tražite kopiju rezultata glasanja (žutu kopiju)"
            korak5text.text = mjera9
        korak6.isHidden = false
            korak6naslov.text = "Zatražite od CIK-a BiH ponovno brojanje glasova"
            korak6text.text = mjera8
    }
    
    @IBAction func openM22(_ sender: UIControl) {
        closeAll()
         measuresView.isHidden = false
         closeAllSteps()
        koraciNaslov.text = "OTVARANJE VREĆA SA IZBORNIM MATERIJALOM TOKOM TRANSPORTA"
         korak1.isHidden = false
            korak1naslov.text = "Upozorite predsjednika BO"
            korak1text.text = mjera6
         korak2.isHidden = false
            korak2naslov.text = "Prijavite nepravilnosti nadležnom koordinatoru"
            korak2text.text = mjera3
        korak3.isHidden = false
            korak3naslov.text = "Unesite primjedbu u zapisnik o radu BO"
            korak3text.text = mjera4
        korak4.isHidden = false
            korak4naslov.text = "Dokumentujte nepravilnosti/kršenje"
            korak4text.text = mjera5
        korak5.isHidden = false
            korak5naslov.text = "Tražite kopiju rezultata glasanja (žutu kopiju)"
            korak5text.text = mjera9
        korak6.isHidden = false
            korak6naslov.text = "Zatražite od CIK-a BiH ponovno brojanje glasova"
            korak6text.text = mjera8
    }
    
    @IBAction func open1text(_ sender: UIControl) {
        if(!korak1text.isHidden) {
            korak1text.isHidden = true
            korak1img.image = UIImage(systemName: "chevron.down" )

        } else {
            closeAllLabels()
            korak1text.isHidden = false
            korak1img.image = UIImage(systemName: "chevron.up" )

        }
    }
    @IBAction func open2text(_ sender: UIControl) {
        if(!korak2text.isHidden) {
            korak2text.isHidden = true
            korak2img.image = UIImage(systemName: "chevron.down" )

        } else {
            closeAllLabels()
            korak2text.isHidden = false
            korak2img.image = UIImage(systemName: "chevron.up" )
        }
    }
    @IBAction func open3text(_ sender: UIControl) {
        if(!korak3text.isHidden) {
            korak3text.isHidden = true
            korak3img.image = UIImage(systemName: "chevron.down" )

        } else {
            closeAllLabels()
            korak3text.isHidden = false
            korak3img.image = UIImage(systemName: "chevron.up" )

        }
    }
    
    @IBAction func open4text(_ sender: UIControl) {
        if(!korak4text.isHidden) {
            korak4text.isHidden = true
            korak4img.image = UIImage(systemName: "chevron.down" )

        } else {
            closeAllLabels()
            korak4text.isHidden = false
            korak4img.image = UIImage(systemName: "chevron.up" )
        }
    }
    
    @IBAction func open5text(_ sender: UIControl) {
        if(!korak5text.isHidden) {
            korak5text.isHidden = true
            korak5img.image = UIImage(systemName: "chevron.down" )
        } else {
            closeAllLabels()
            korak5text.isHidden = false
            korak5img.image = UIImage(systemName: "chevron.up" )

        }
    }
    @IBAction func open6text(_ sender: UIControl) {
        if(!korak6text.isHidden) {
            korak6text.isHidden = true
            korak6img.image = UIImage(systemName: "chevron.down" )
        } else {
            closeAllLabels()
            korak6text.isHidden = false
            korak6img.image = UIImage(systemName: "chevron.up" )

        }
    }
    
    @IBAction func openS1(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov1
        postImage.image = UIImage(named: "s1")
        postText.textColor = UIColor.white
        let attributedQuote = NSMutableAttributedString(string: text1)
        attributedQuote.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: CGFloat(fontSize)), range: NSRange(location: 426, length: 166))
        postText.attributedText = attributedQuote
    }
    @IBAction func openS2(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov2
        postImage.image = UIImage(named: "s2")
        postText.textColor = UIColor.white
        let attributedQuote = NSMutableAttributedString(string: text2)
        attributedQuote.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: CGFloat(fontSize)), range: NSRange(location: 530, length: 202))
        postText.attributedText = attributedQuote
    }
    
    @IBAction func openS3(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov3
        postImage.image = UIImage(named: "s3")
        postText.textColor = UIColor.white
        postText.text = text3
    }
    
    @IBAction func openS4(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov4
        postText.textColor = UIColor.white
        postImage.image = UIImage(named: "s4")
        postText.text = text4
    }
    @IBAction func openS5(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov5
        postText.textColor = UIColor.white
        postImage.image = UIImage(named: "s5")
        postText.text = text5
    }
    
    @IBAction func openS6(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov6
        postText.textColor = UIColor.white
        postImage.image = UIImage(named: "s6")
        postText.text = text6
    }
    
    
    @IBAction func openS7(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov7
        postText.textColor = UIColor.white
        postImage.image = UIImage(named: "s7")
        postText.text = text7
    }
    
    @IBAction func openS8(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov8
        postImage.image = UIImage(named: "s8")
        postText.textColor = UIColor.orange
        postText.text = text8
    }
    
    @IBAction func openS9(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov9
        postText.textColor = UIColor.white
        postImage.image = UIImage(named: "s9")
        postText.text = text9
    }
    
    @IBAction func openS10(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov10
        postText.textColor = UIColor.white
        postImage.image = UIImage(named: "s10")
        postText.text = text10
    }
    
    
    @IBAction func openS11(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov11
        postText.textColor = UIColor.white
        postImage.image = UIImage(named: "s11")
        postText.text = text11
    }
    
    @IBAction func openS12(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov12
        postText.textColor = UIColor.white
        postImage.image = UIImage(named: "s12")
        postText.text = text12
    }
    
    @IBAction func openS13(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov13
        postText.textColor = UIColor.white
        postImage.image = UIImage(named: "s13")
        postText.textColor = UIColor.orange
        postText.text = text13
    }
    
    @IBAction func openS14(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov14
        postText.textColor = UIColor.white
        postImage.image = UIImage(named: "s14")
        postText.text = text14
    }
    @IBAction func openS15(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov15
        postImage.image = UIImage(named: "s15")
        postText.textColor = UIColor.orange
        postText.text = text15
    }
    
    
    @IBAction func openS16(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov16
        postText.textColor = UIColor.white
        postImage.image = UIImage(named: "s16")
        postText.text = text16
    }
    
    @IBAction func openS17(_ sender: UIControl) {
        closeAll()
            post.isHidden = false
            postTitle.text = naslov17
        postText.textColor = UIColor.white
            postImage.image = UIImage(named: "s17")
        let attributedQuote = NSMutableAttributedString(string: text17)
        attributedQuote.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: CGFloat(fontSize)), range: NSRange(location: 675, length: 12))
        postText.attributedText = attributedQuote
    }
    
    @IBAction func openS18(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov18
        postImage.image = UIImage(named: "s18")
        postText.textColor = UIColor.orange
        postText.text = text18
    }
    
    
    @IBAction func openS19(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov19
        postText.textColor = UIColor.white
        postImage.image = UIImage(named: "s19")
        postText.text = text19
    }
    
    @IBAction func openS20(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov20
        postText.textColor = UIColor.white
        postImage.image = UIImage(named: "s20")
        postText.text = text20
    }
    @IBAction func openS21(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov21
        postImage.image = UIImage(named: "s21")
        postText.textColor = UIColor.orange
        postText.text = text21
    }
    
    @IBAction func openS22(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov22
        postImage.image = UIImage(named: "s22")
        postText.textColor = UIColor.orange
        postText.text = text22
    }
    

    @IBAction func openS23(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov23
        postImage.image = UIImage(named: "s23")
        postText.textColor = UIColor.orange
        postText.text = text23
    }
    
    @IBAction func openS24(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov24
        postText.textColor = UIColor.white
        postImage.image = UIImage(named: "s24")
        postText.text = text24
    }
    
    
    @IBAction func openS25(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov25
        postImage.image = UIImage(named: "s25")
        postText.textColor = UIColor.orange
        postText.text = text25
    }
    
    @IBAction func openS26(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov26
        postText.textColor = UIColor.orange
        postImage.image = UIImage(named: "s26")
        postText.text = text26
    }
    
    @IBAction func openS27(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov27
        postText.textColor = UIColor.white
        postImage.image = UIImage(named: "s27")
        postText.text = text27
    }
    
    @IBAction func openS28(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov28
        postImage.image = UIImage(named: "s28")
        postText.textColor = UIColor.orange
        postText.text = text28
    }
    @IBAction func openS29(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov29
        postText.textColor = UIColor.white
        postImage.image = UIImage(named: "s29")
        postText.text = text29
    }
    @IBAction func openS30(_ sender: UIControl) {
        closeAll()
        post.isHidden = false
        postTitle.text = naslov30
        postImage.image = UIImage(named: "s30")
        postText.textColor = UIColor.orange
        postText.text = text30
    }
    @IBAction func openS31(_ sender: UIControl) {
        closeAll()
        customPost.isHidden = false
        customPostTitle.text = naslov31
        customPostTxt.textColor = UIColor.white
        let attributedQuote = NSMutableAttributedString(string: text31)
        attributedQuote.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: CGFloat(fontSize)), range: NSRange(location: 0, length: 60))
        attributedQuote.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: CGFloat(fontSize)), range: NSRange(location: 277, length: 63))

        customPostTxt.attributedText = attributedQuote
    }
    
    @IBAction func openS32(_ sender: UIControl) {
        closeAll()
        customPost.isHidden = false
        customPostTitle.text = naslov32
        customPostTxt.textColor = UIColor.white
        let attributedQuote = NSMutableAttributedString(string: text32)
        attributedQuote.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: CGFloat(fontSize)), range: NSRange(location: 0, length: 39))
        attributedQuote.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: CGFloat(fontSize)), range: NSRange(location: 904, length: 27))
        attributedQuote.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: CGFloat(fontSize)), range: NSRange(location: 1406, length: 33))
        attributedQuote.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: CGFloat(fontSize)), range: NSRange(location: 1858, length: 11))


        customPostTxt.attributedText = attributedQuote
    }
    
    @IBAction func openS33(_ sender: UIControl) {
        closeAll()
        customPost.isHidden = false
        customPostTitle.text = naslov33
        customPostTxt.textColor = UIColor.white
        let attributedQuote = NSMutableAttributedString(string: text33)
        attributedQuote.addAttribute(.foregroundColor, value: UIColor.orange, range: NSRange(location: 0, length: 232))
        attributedQuote.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: 50))
        attributedQuote.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 233, length: 20))
        attributedQuote.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 751, length: 62))
        attributedQuote.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 1414, length: 47))



        customPostTxt.attributedText = attributedQuote
    }
    
    @IBAction func openS34(_ sender: UIControl) {
        closeAll()
        customPost.isHidden = false
        customPostTitle.text = naslov34
        customPostTxt.textColor = UIColor.white
        let attributedQuote = NSMutableAttributedString(string: text34)
        attributedQuote.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: CGFloat(fontSize)), range: NSRange(location: 1472, length: 228))
        attributedQuote.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 76, length: 16))
        attributedQuote.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 113, length: 113))
        attributedQuote.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 712, length: 46))
        attributedQuote.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 1700, length: 28))
        attributedQuote.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 2166, length: 31))




       
        customPostTxt.attributedText = attributedQuote
    }
    @IBAction func openS35(_ sender: UIControl) {
        closeAll()
        customPost.isHidden = false
        customPostTitle.text = naslov35
        customPostTxt.textColor = UIColor.white
        customPostTxt.text = text35
    }
    
    @IBAction func openS36(_ sender: UIControl) {
        closeAll()
        customPost.isHidden = false
        customPostTitle.text = naslov36
        customPostTxt.textColor = UIColor.white
        customPostTxt.text = text36
    }
    @IBAction func openS37(_ sender: UIControl) {
        closeAll()
        customPost.isHidden = false
        customPostTitle.text = naslov37
        customPostTxt.textColor = UIColor.white
        let attributedQuote = NSMutableAttributedString(string: text37)
        attributedQuote.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: CGFloat(fontSize)), range: NSRange(location: 1401, length: 185))
        attributedQuote.addAttribute(.foregroundColor, value: UIColor.orange, range: NSRange(location: 1586, length: 53))
        customPostTxt.attributedText = attributedQuote
    }
    
    
    @IBAction func openS38(_ sender: UIControl) {
        closeAll()
         measuresView.isHidden = false
         closeAllSteps()
         koraciNaslov.text = "FIZIČKO NASILJE NA BM/UGROŽENA SIGURNOST"
         korak1.isHidden = false
             korak1naslov.text = "Zaštitite se"
             korak1text.text = mjera1
         korak2.isHidden = false
             korak2naslov.text = "Prijavite nepravilnosti nadležnom koordinatoru"
             korak2text.text = mjera3
         korak3.isHidden = false
             korak3naslov.text = "Unesite primjedbu u zapisnik o radu BO"
             korak3text.text = mjera4
         korak4.isHidden = false
             korak4naslov.text = "Dokumentujte nepravilnosti/kršenje"
             korak4text.text = mjera5
    }
    
    @IBAction func openS39(_ sender: UIControl) {
        closeAll()
         measuresView.isHidden = false
         closeAllSteps()
         koraciNaslov.text = "ZABRANA POSMATRANJA ILI USKRAĆIVANJE PRAVA POSMATRAČA"
         korak1.isHidden = false
             korak1naslov.text = "Upozorite predsjednika BO"
             korak1text.text = mjera6
         korak2.isHidden = false
             korak2naslov.text = "Prijavite nepravilnosti nadležnom koordinatoru"
             korak2text.text = mjera3
    }
    
    @IBAction func openS40(_ sender: UIControl) {
        closeAll()
         measuresView.isHidden = false
         closeAllSteps()
         koraciNaslov.text = "BUGARSKI VOZ (KRUŽNO GLASANJE)"
         korak1.isHidden = false
             korak1naslov.text = "Upozorite predsjednika BO"
             korak1text.text = mjera6
         korak2.isHidden = false
            korak2naslov.text = "Prijavite nepravilnosti nadležnom koordinatoru"
            korak2text.text = mjera3
        korak3.isHidden = false
            korak3naslov.text = "Unesite primjedbu u zapisnik o radu BO"
            korak3text.text = mjera4
         korak4.isHidden = false
            korak4naslov.text = "Dokumentujte nepravilnosti/kršenje"
            korak4text.text = mjera5
    }
    
    
    @IBAction func openS41(_ sender: UIControl) {
        closeAll()
         measuresView.isHidden = false
         closeAllSteps()
         koraciNaslov.text = "KUPOVINA GLASOVA"
         korak1.isHidden = false
            korak1naslov.text = "Prijavite nepravilnosti nadležnom koordinatoru"
            korak1text.text = mjera3
         korak2.isHidden = false
            korak2naslov.text = "Dokumentujte nepravilnosti/kršenje"
            korak2text.text = mjera5
    }
    
    @IBAction func openS42(_ sender: UIControl) {
        closeAll()
         measuresView.isHidden = false
         closeAllSteps()
         koraciNaslov.text = "PRITISCI NA BIRAČE I ZASTRAŠIVANJE"
         korak1.isHidden = false
            korak1naslov.text = "Upozorite predsjednika BO"
            korak1text.text = mjera6
         korak2.isHidden = false
            korak2naslov.text = "Prijavite nepravilnosti nadležnom koordinatoru"
            korak2text.text = mjera3
        korak3.isHidden = false
            korak3naslov.text = "Dokumentujte nepravilnosti/kršenje"
            korak3text.text = mjera5
    }
    
    
    @IBAction func openS43(_ sender: UIControl) {
        closeAll()
         measuresView.isHidden = false
         closeAllSteps()
         koraciNaslov.text = "KRŠENJE IZBORNE ŠUTNJE"
         korak1.isHidden = false
            korak1naslov.text = "Upozorite predsjednika BO"
            korak1text.text = mjera6
         korak2.isHidden = false
            korak2naslov.text = "Prijavite nepravilnosti nadležnom koordinatoru"
            korak2text.text = mjera3
        korak3.isHidden = false
            korak3naslov.text = "Unesite primjedbu u zapisnik o radu BO"
            korak3text.text = mjera4
        korak4.isHidden = false
            korak4naslov.text = "Dokumentujte nepravilnosti/kršenje"
            korak4text.text = mjera5
    }
    
    @IBAction func openS44(_ sender: UIControl) {
        closeAll()
         measuresView.isHidden = false
         closeAllSteps()
         koraciNaslov.text = "PORODIČNO GLASANJE"
         korak1.isHidden = false
            korak1naslov.text = "Upozorite predsjednika BO"
            korak1text.text = mjera6
         korak2.isHidden = false
            korak2naslov.text = "Prijavite nepravilnosti nadležnom koordinatoru"
            korak2text.text = mjera3
        korak3.isHidden = false
            korak3naslov.text = "Unesite primjedbu u zapisnik o radu BO"
            korak3text.text = mjera4
        korak4.isHidden = false
            korak4naslov.text = "Dokumentujte nepravilnosti/kršenje"
            korak4text.text = mjera5
    }
    
    @IBAction func openS45(_ sender: UIControl) {
        closeAll()
         measuresView.isHidden = false
         closeAllSteps()
         koraciNaslov.text = "ZLOUPOTREBA POMOĆI PRI GLASANJU"
         korak1.isHidden = false
            korak1naslov.text = "Upozorite predsjednika BO"
            korak1text.text = mjera6
         korak2.isHidden = false
            korak2naslov.text = "Prijavite nepravilnosti nadležnom koordinatoru"
            korak2text.text = mjera3
        korak3.isHidden = false
            korak3naslov.text = "Unesite primjedbu u zapisnik o radu BO"
            korak3text.text = mjera4
        korak4.isHidden = false
            korak4naslov.text = "Dokumentujte nepravilnosti/kršenje"
            korak4text.text = mjera5
    }
    
    @IBAction func openS46(_ sender: UIControl) {
        closeAll()
         measuresView.isHidden = false
         closeAllSteps()
         koraciNaslov.text = "NISU ISTAKNUTI REZULTATI IZBORA (ŽUTE KOPIJE)"
         korak1.isHidden = false
            korak1naslov.text = "Upozorite predsjednika BO"
            korak1text.text = mjera6
         korak2.isHidden = false
            korak2naslov.text = "Tražite kopiju rezultata glasanja (žutu kopiju)"
            korak2text.text = mjera9
        korak3.isHidden = false
            korak3naslov.text = "Prijavite nepravilnosti nadležnom koordinatoru"
            korak3text.text = mjera3
        korak4.isHidden = false
            korak4naslov.text = "Unesite primjedbu u zapisnik o radu BO"
            korak4text.text = mjera4
        korak4.isHidden = false
            korak4naslov.text = "Dokumentujte nepravilnosti/kršenje"
            korak4text.text = mjera5
    }
    
    
    @IBAction func openS47(_ sender: UIControl) {
        closeAll()
         measuresView.isHidden = false
         closeAllSteps()
         koraciNaslov.text = "KAŠNJENJE U OTVARANJU BM PREKO 3 SATA"
         korak1.isHidden = false
            korak1naslov.text = "Upozorite predsjednika BO"
            korak1text.text = mjera6
         korak2.isHidden = false
            korak2naslov.text = "Prijavite nepravilnosti nadležnom koordinatoru"
            korak2text.text = mjera3
        korak3.isHidden = false
            korak3naslov.text = "Unesite primjedbu u zapisnik o radu BO"
            korak3text.text = mjera4
        korak4.isHidden = false
            korak4naslov.text = "Dokumentujte nepravilnosti/kršenje"
            korak4text.text = mjera5
    }
    
    @IBAction func openS48(_ sender: UIControl) {
        closeAll()
         measuresView.isHidden = false
         closeAllSteps()
         koraciNaslov.text = "ODSUSTVO ČLANOVA BO"
         korak1.isHidden = false
            korak1naslov.text = "Upozorite predsjednika BO"
            korak1text.text = mjera6
         korak2.isHidden = false
            korak2naslov.text = "Prijavite nepravilnosti nadležnom koordinatoru"
            korak2text.text = mjera3
        korak3.isHidden = false
            korak3naslov.text = "Unesite primjedbu u zapisnik o radu BO"
            korak3text.text = mjera4
        korak4.isHidden = false
            korak4naslov.text = "Dokumentujte nepravilnosti/kršenje"
            korak4text.text = mjera5
    }
    
    @IBAction func openS49(_ sender: UIControl) {
        closeAll()
         measuresView.isHidden = false
         closeAllSteps()
         koraciNaslov.text = "NEDOSTATAK ILI NESTANAK IZBORNOG MATERIJALA"
         korak1.isHidden = false
            korak1naslov.text = "Prijavite nepravilnosti nadležnom koordinatoru"
            korak1text.text = mjera3
         korak2.isHidden = false
            korak2naslov.text = "Unesite primjedbu u zapisnik o radu BO"
            korak2text.text = mjera4
        korak3.isHidden = false
        korak3.isHidden = false
            korak3naslov.text = "Dokumentujte nepravilnosti/kršenje"
            korak3text.text = mjera5
    }
    
    @IBAction func openS50(_ sender: UIControl) {
        closeAll()
         measuresView.isHidden = false
         closeAllSteps()
         koraciNaslov.text = "NARUŠENA TAJNOST GLASANJA"
         korak1.isHidden = false
            korak1naslov.text = "Upozorite predsjednika BO"
            korak1text.text = mjera6
         korak2.isHidden = false
            korak2naslov.text = "Prijavite nepravilnosti nadležnom koordinatoru"
            korak2text.text = mjera3
        korak3.isHidden = false
            korak3naslov.text = "Unesite primjedbu u zapisnik o radu BO"
            korak3text.text = mjera4
        korak4.isHidden = false
            korak4naslov.text = "Dokumentujte nepravilnosti/kršenje"
            korak4text.text = mjera5
    }
    
    @IBAction func openS51(_ sender: UIControl) {
        closeAll()
         measuresView.isHidden = false
         closeAllSteps()
         koraciNaslov.text = "MANIPULACIJE PRI IDENTIFIKACIJI BIRAČA"
         korak1.isHidden = false
            korak1naslov.text = "Upozorite predsjednika BO"
            korak1text.text = mjera6
         korak2.isHidden = false
            korak2naslov.text = "Prijavite nepravilnosti nadležnom koordinatoru"
            korak2text.text = mjera3
        korak3.isHidden = false
            korak3naslov.text = "Unesite primjedbu u zapisnik o radu BO"
            korak3text.text = mjera4
        korak4.isHidden = false
            korak4naslov.text = "Dokumentujte nepravilnosti/kršenje"
            korak4text.text = mjera5
    }
    
    @IBAction func openS52(_ sender: UIControl) {
        closeAll()
         measuresView.isHidden = false
         closeAllSteps()
         koraciNaslov.text = "MANIPULACIJE PRI IZDAVANJU GLASAČKIH LISTIĆA"
         korak1.isHidden = false
            korak1naslov.text = "Upozorite predsjednika BO"
            korak1text.text = mjera6
         korak2.isHidden = false
            korak2naslov.text = "Prijavite nepravilnosti nadležnom koordinatoru"
            korak2text.text = mjera3
        korak3.isHidden = false
            korak3naslov.text = "Unesite primjedbu u zapisnik o radu BO"
            korak3text.text = mjera4
        korak4.isHidden = false
            korak4naslov.text = "Dokumentujte nepravilnosti/kršenje"
            korak4text.text = mjera5
    }
    
    @IBAction func openS53(_ sender: UIControl) {
        closeAll()
         measuresView.isHidden = false
         closeAllSteps()
         koraciNaslov.text = "USKRAĆIVANJE PRAVA NA GLASANJU"
         korak1.isHidden = false
            korak1naslov.text = "Upozorite predsjednika BO"
            korak1text.text = mjera6
         korak2.isHidden = false
            korak2naslov.text = "Prijavite nepravilnosti nadležnom koordinatoru"
            korak2text.text = mjera3
        korak3.isHidden = false
            korak3naslov.text = "Unesite primjedbu u zapisnik o radu BO"
            korak3text.text = mjera4
        korak4.isHidden = false
            korak4naslov.text = "Dokumentujte nepravilnosti/kršenje"
            korak4text.text = mjera5
    }

    @IBAction func openS54(_ sender: UIControl) {
        closeAll()
         measuresView.isHidden = false
         closeAllSteps()
         koraciNaslov.text = "NESLAGANJA U TESTU TAČNOSTI"
         korak1.isHidden = false
            korak1naslov.text = "Upozorite predsjednika BO"
            korak1text.text = mjera6
         korak2.isHidden = false
            korak2naslov.text = "Prijavite nepravilnosti nadležnom koordinatoru"
            korak2text.text = mjera3
        korak3.isHidden = false
            korak3naslov.text = "Unesite primjedbu u zapisnik o radu BO"
            korak3text.text = mjera4
        korak4.isHidden = false
            korak4naslov.text = "Dokumentujte nepravilnosti/kršenje"
            korak4text.text = mjera5
        korak5.isHidden = false
            korak5naslov.text = "Tražite kopiju rezultata glasanja (žutu kopiju)"
            korak5text.text = mjera9
        korak6.isHidden = false
            korak6naslov.text = "Zatražite od CIK-a BiH ponovno brojanje glasova"
            korak6text.text = mjera8
    }
    @IBAction func openS55(_ sender: UIControl) {
        closeAll()
         measuresView.isHidden = false
         closeAllSteps()
         koraciNaslov.text = "ZLOUPOTREBE GLASAČKIH LISTIĆA PRI BROJANJU"
         korak1.isHidden = false
            korak1naslov.text = "Upozorite predsjednika BO"
            korak1text.text = mjera6
         korak2.isHidden = false
            korak2naslov.text = "Prijavite nepravilnosti nadležnom koordinatoru"
            korak2text.text = mjera3
        korak3.isHidden = false
            korak3naslov.text = "Unesite primjedbu u zapisnik o radu BO"
            korak3text.text = mjera4
        korak4.isHidden = false
            korak4naslov.text = "Dokumentujte nepravilnosti/kršenje"
            korak4text.text = mjera5
        korak5.isHidden = false
            korak5naslov.text = "Tražite kopiju rezultata glasanja (žutu kopiju)"
            korak5text.text = mjera9
        korak6.isHidden = false
            korak6naslov.text = "Zatražite od CIK-a BiH ponovno brojanje glasova"
            korak6text.text = mjera8
    }
    
    @IBAction func openS56(_ sender: UIControl) {
        closeAll()
         measuresView.isHidden = false
         closeAllSteps()
         koraciNaslov.text = "NAMJERNO PONIŠTAVANJE GLASOVA"
         korak1.isHidden = false
            korak1naslov.text = "Upozorite predsjednika BO"
            korak1text.text = mjera6
         korak2.isHidden = false
            korak2naslov.text = "Prijavite nepravilnosti nadležnom koordinatoru"
            korak2text.text = mjera3
        korak3.isHidden = false
            korak3naslov.text = "Unesite primjedbu u zapisnik o radu BO"
            korak3text.text = mjera4
        korak4.isHidden = false
            korak4naslov.text = "Dokumentujte nepravilnosti/kršenje"
            korak4text.text = mjera5
        korak5.isHidden = false
            korak5naslov.text = "Tražite kopiju rezultata glasanja (žutu kopiju)"
            korak5text.text = mjera9
        korak6.isHidden = false
            korak6naslov.text = "Zatražite od CIK-a BiH ponovno brojanje glasova"
            korak6text.text = mjera8
    }
    
    @IBAction func openS57(_ sender: UIControl) {
        closeAll()
         measuresView.isHidden = false
         closeAllSteps()
         koraciNaslov.text = "NEDOZVOLJENO DOPISIVANJE GLASOVA"
         korak1.isHidden = false
            korak1naslov.text = "Upozorite predsjednika BO"
            korak1text.text = mjera6
         korak2.isHidden = false
            korak2naslov.text = "Prijavite nepravilnosti nadležnom koordinatoru"
            korak2text.text = mjera3
        korak3.isHidden = false
            korak3naslov.text = "Unesite primjedbu u zapisnik o radu BO"
            korak3text.text = mjera4
        korak4.isHidden = false
            korak4naslov.text = "Dokumentujte nepravilnosti/kršenje"
            korak4text.text = mjera5
        korak5.isHidden = false
            korak5naslov.text = "Tražite kopiju rezultata glasanja (žutu kopiju)"
            korak5text.text = mjera9
        korak6.isHidden = false
            korak6naslov.text = "Zatražite od CIK-a BiH ponovno brojanje glasova"
            korak6text.text = mjera8
    }
    @IBAction func openS58(_ sender: UIControl) {
        
            closeAll()
             measuresView.isHidden = false
             closeAllSteps()
             koraciNaslov.text = "POGREŠNO EVIDENTIRANJE REZULTATA GLASANJU NA BM"
             korak1.isHidden = false
                korak1naslov.text = "Upozorite predsjednika BO"
                korak1text.text = mjera6
             korak2.isHidden = false
                korak2naslov.text = "Prijavite nepravilnosti nadležnom koordinatoru"
                korak2text.text = mjera3
            korak3.isHidden = false
                korak3naslov.text = "Unesite primjedbu u zapisnik o radu BO"
                korak3text.text = mjera4
            korak4.isHidden = false
                korak4naslov.text = "Dokumentujte nepravilnosti/kršenje"
                korak4text.text = mjera5
            korak5.isHidden = false
                korak5naslov.text = "Tražite kopiju rezultata glasanja (žutu kopiju)"
                korak5text.text = mjera9
            korak6.isHidden = false
                korak6naslov.text = "Zatražite od CIK-a BiH ponovno brojanje glasova"
                korak6text.text = mjera8
    }
    
    @IBAction func openS59(_ sender: UIControl) {
        closeAll()
         measuresView.isHidden = false
         closeAllSteps()
        koraciNaslov.text = "OTVARANJE VREĆA SA IZBORNIM MATERIJALOM TOKOM TRANSPORTA"
         korak1.isHidden = false
            korak1naslov.text = "Upozorite predsjednika BO"
            korak1text.text = mjera6
         korak2.isHidden = false
            korak2naslov.text = "Prijavite nepravilnosti nadležnom koordinatoru"
            korak2text.text = mjera3
        korak3.isHidden = false
            korak3naslov.text = "Unesite primjedbu u zapisnik o radu BO"
            korak3text.text = mjera4
        korak4.isHidden = false
            korak4naslov.text = "Dokumentujte nepravilnosti/kršenje"
            korak4text.text = mjera5
        korak5.isHidden = false
            korak5naslov.text = "Tražite kopiju rezultata glasanja (žutu kopiju)"
            korak5text.text = mjera9
        korak6.isHidden = false
            korak6naslov.text = "Zatražite od CIK-a BiH ponovno brojanje glasova"
            korak6text.text = mjera8
    }
    
    @IBAction func link1(_ sender: UIControl) {
        guard let url = URL(string: "https://podlupom.org/") else { return }
        UIApplication.shared.open(url)
    }
    @IBAction func link2(_ sender: UIControl) {
        guard let url = URL(string: "https://izbori.ba/") else { return }
        UIApplication.shared.open(url)
    }
    

}





