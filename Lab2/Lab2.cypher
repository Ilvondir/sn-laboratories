// Ex 1
CREATE (mk:Person {name:"Michał"}),
       (kk:Person {name:"Kamil"}),
       (dk:Person {name:"Damian"}),
       (mk)-[:BRAT]->(kk),
       (mk)-[:BRAT]->(dk),
       (kk)-[:BRAT]->(mk),
       (dk)-[:BRAT]->(kk),
       (kk)-[:BRAT]->(dk),
       (dk)-[:BRAT]->(mk),
       (ek:Person {name:"Ewa"}),
       (zk:Person {name:"Zbigniew"}),
       (mk)-[:SYN]->(ek),
       (kk)-[:SYN]->(ek),
       (dk)-[:SYN]->(ek),
       (mk)-[:SYN]->(zk),
       (kk)-[:SYN]->(zk),
       (dk)-[:SYN]->(zk),
       (ek)-[:MAMA]->(mk),
       (ek)-[:MAMA]->(dk),
       (ek)-[:MAMA]->(kk),
       (zk)-[:TATA]->(mk),
       (zk)-[:TATA]->(dk),
       (zk)-[:TATA]->(kk),
       (zk)-[:MĄŻ]->(ek),
       (ek)-[:ŻONA]->(zk)
RETURN mk, zk, ek, dk, kk;

CREATE (wk:Person {name:"Wiesław"}),
       (ak:Person {name:"Agnieszka"}),
       (wk)-[:MĄŻ]->(ak),
       (ak)-[:ŻONA]->(wk),
       (pk:Person {name:"Patrycja"}),
       (kk:Person {name:"Kacper"}),
       (mk:Person {name:"Marzena"}),
       (wk)-[:TATA]->(pk),
       (wk)-[:TATA]->(kk),
       (wk)-[:TATA]->(mk),
       (ak)-[:MAMA]->(pk),
       (ak)-[:MAMA]->(kk),
       (ak)-[:MAMA]->(mk),
       (mk)-[:SIOSTRA]->(kk),
       (mk)-[:SIOSTRA]->(pk),
       (pk)-[:SIOSTRA]->(mk),
       (pk)-[:SIOSTRA]->(kk),
       (kk)-[:BRAT]->(mk),
       (kk)-[:BRAT]->(pk),
       (mk)-[:CÓRKA]->(ak),
       (mk)-[:CÓRKA]->(wk),
       (pk)-[:CÓRKA]->(ak),
       (pk)-[:CÓRKA]->(wk),
       (kk)-[:SYN]->(ak),
       (kk)-[:SYN]->(wk)
RETURN wk, ak, pk, kk, mk;

CREATE (zl:Person {name:"Zofia"}),
       (cl:Person {name:"Czesław"}),
       (ml:Person {name:"Marta"}),
       (gl:Person {name:"Grzegorz"}),
       (dl:Person {name:"Dariusz"}),
       (gl)-[:BRAT]->(ml),
       (gl)-[:BRAT]->(dl),
       (dl)-[:BRAT]->(gl),
       (dl)-[:BRAT]->(ml),
       (ml)-[:SIOSTRA]->(dl),
       (ml)-[:SIOSTRA]->(gl),
       (zl)-[:MĄŻ]->(cl),
       (cl)-[:ŻONA]->(zl),
       (zl)-[:MAMA]->(ml),
       (zl)-[:MAMA]->(gl),
       (zl)-[:MAMA]->(dl),
       (cl)-[:TATA]->(ml),
       (cl)-[:TATA]->(gl),
       (cl)-[:TATA]->(dl),
       (ml)-[:CÓRKA]->(zl),
       (dl)-[:SYN]->(zl),
       (gl)-[:SYN]->(zl),
       (ml)-[:CÓRKA]->(cl),
       (dl)-[:SYN]->(cl),
       (gl)-[:SYN]->(cl)
RETURN zl, gl, dl, ml, cl;

MATCH (zk)
WHERE zk.name = "Zbigniew"
MATCH (wk)
WHERE wk.name = "Wiesław"
MATCH (zl)
WHERE zl.name = "Zofia"
CREATE (zk)-[:BRAT]->(zl),
       (zk)-[:BRAT]->(wk),
       (wk)-[:BRAT]->(zk),
       (wk)-[:BRAT]->(zl),
       (zl)-[:SIOSTRA]->(zk),
       (zl)-[:SIOSTRA]->(wk)
RETURN zk, zl, wk;

MATCH (ml:Person {name:"Marta"})
CREATE (ec:Person {name: "Emilian"}),
       (ml)-[:ŻONA]->(ec),
       (ec)-[:MĄŻ]->(ml),
       (lc:Person {name: "Lidia"}),
       (hc:Person {name: "Hanna"}),
       (lc)-[:SIOSTA]->(hc),
       (hc)-[:SIOSTA]->(lc),
       (ml)-[:MAMA]->(lc),
       (ml)-[:MAMA]->(hc),
       (ec)-[:TATA]->(lc),
       (ec)-[:TATA]->(hc),
       (lc)-[:CÓRKA]->(ec),
       (hc)-[:CÓRKA]->(ec),
       (lc)-[:CÓRKA]->(ml),
       (hc)-[:CÓRKA]->(ml)
RETURN ec, hc, lc, ml;

MATCH (zl:Person {name:"Zofia"})
MATCH (cl:Person {name:"Czesław"})
MATCH (lc:Person {name:"Lidia"})
MATCH (hc:Person {name:"Hanna"})
CREATE (zl)-[:BABCIA]->(lc),
       (zl)-[:BABCIA]->(hc),
       (cl)-[:DZIADEK]->(lc),
       (cl)-[:DZIADEK]->(hc),
       (lc)-[:WNUCZKA]->(cl),
       (lc)-[:WNUCZKA]->(zl),
       (hc)-[:WNUCZKA]->(zl),
       (hc)-[:WNUCZKA]->(cl)
RETURN cl, lc, hc, zl;

MATCH (N)
RETURN N

// Ex 2
CREATE (p1:Person {name:"Adam", surname:"Nowak", salary:11200}),
       (p2:Person {name:"Agata"}),
       (p3:Person {name:"Adrian", salary:7900}),
       (p4:Person {name:"Zenon"}),
       (p5:Person {name:"Julia", surname:"Zbęk"}),
       (p6:Person {name:"Damian"}),
       (p7:Person {name:"Kamil"}),
       (p8:Person {name:"Wiesław"}),
       (p9:Person {name:"Wojciech"}),
       (p10:Person {name:"Krzysztof", RODO:false}),
       (p11:Person {name:"Andrzej"}),
       (p12:Person {name:"Grzegorz"}),
       (p13:Person {name:"Justyna", RODO:false}),
       (p14:Person {name:"Aleksandra", surname:"Bąk"}),
       (p15:Person {name:"Hubert"}),
       (p16:Person {name:"Karol", surname:"Wojnar"}),
       (p17:Person {name:"Arkadiusz"}),
       (p18:Person {name:"Wacław"}),
       (p19:Person {name:"Gerard"}),
       (p20:Person {name:"Jerzy", surname:"Jeż"}),
       (p21:Person {name:"Tobiasz"}),
       (p22:Person {name:"Janina"}),
       (p23:Person {name:"Lidia"}),
       (pr1:Profession {title:"Srum master"}),
       (pr2:Profession {title:"Java Programmer"}),
       (pr3:Profession {title:"C++ Programmer"}),
       (pr4:Profession {title:"JavaScript Programmer"}),
       (pr5:Profession {title:"Mathematician"}),
       (po1:Position {title:"President"}),
       (po2:Position {title:"Backend Developer"}),
       (po3:Position {title:"Frontend Developer"}),
       (po4:Position {title:"Analytic"}),
       (p1)-[:NA_STANOWISKU]->(po1),
       (p2)-[:NA_STANOWISKU]->(po2),
       (p3)-[:NA_STANOWISKU]->(po2),
       (p4)-[:NA_STANOWISKU]->(po2),
       (p5)-[:NA_STANOWISKU]->(po2),
       (p6)-[:NA_STANOWISKU]->(po2),
       (p7)-[:NA_STANOWISKU]->(po3),
       (p8)-[:NA_STANOWISKU]->(po3),
       (p9)-[:NA_STANOWISKU]->(po3),
       (p10)-[:NA_STANOWISKU]->(po3),
       (p11)-[:NA_STANOWISKU]->(po3),
       (p12)-[:NA_STANOWISKU]->(po4),
       (p13)-[:NA_STANOWISKU]->(po4),
       (p14)-[:NA_STANOWISKU]->(po4),
       (p15)-[:NA_STANOWISKU]->(po3),
       (p16)-[:NA_STANOWISKU]->(po4),
       (p17)-[:NA_STANOWISKU]->(po3),
       (p18)-[:NA_STANOWISKU]->(po2),
       (p19)-[:NA_STANOWISKU]->(po3),
       (p20)-[:NA_STANOWISKU]->(po4),
       (p21)-[:NA_STANOWISKU]->(po3),
       (p22)-[:NA_STANOWISKU]->(po2),
       (p23)-[:NA_STANOWISKU]->(po4),
       (p1)-[:Z_ZAWODU]->(pr1),
       (p2)-[:Z_ZAWODU]->(pr2),
       (p3)-[:Z_ZAWODU]->(pr2),
       (p4)-[:Z_ZAWODU]->(pr3),
       (p5)-[:Z_ZAWODU]->(pr2),
       (p6)-[:Z_ZAWODU]->(pr3),
       (p7)-[:Z_ZAWODU]->(pr3),
       (p8)-[:Z_ZAWODU]->(pr4),
       (p9)-[:Z_ZAWODU]->(pr4),
       (p10)-[:Z_ZAWODU]->(pr4),
       (p11)-[:Z_ZAWODU]->(pr4),
       (p12)-[:Z_ZAWODU]->(pr5),
       (p13)-[:Z_ZAWODU]->(pr5),
       (p14)-[:Z_ZAWODU]->(pr5),
       (p15)-[:Z_ZAWODU]->(pr5),
       (p16)-[:Z_ZAWODU]->(pr5),
       (p17)-[:Z_ZAWODU]->(pr3),
       (p18)-[:Z_ZAWODU]->(pr1),
       (p19)-[:Z_ZAWODU]->(pr2),
       (p20)-[:Z_ZAWODU]->(pr5),
       (p21)-[:Z_ZAWODU]->(pr3),
       (p22)-[:Z_ZAWODU]->(pr4),
       (p23)-[:Z_ZAWODU]->(pr5),
       (p2)-[:PODWŁADNY]->(p1),
       (p3)-[:PODWŁADNY]->(p1),
       (p4)-[:PODWŁADNY]->(p1),
       (p5)-[:PODWŁADNY]->(p1),
       (p6)-[:PODWŁADNY]->(p1),
       (p7)-[:PODWŁADNY]->(p1),
       (p8)-[:PODWŁADNY]->(p1),
       (p9)-[:PODWŁADNY]->(p1),
       (p10)-[:PODWŁADNY]->(p1),
       (p11)-[:PODWŁADNY]->(p1),
       (p12)-[:PODWŁADNY]->(p1),
       (p13)-[:PODWŁADNY]->(p1),
       (p14)-[:PODWŁADNY]->(p1),
       (p15)-[:PODWŁADNY]->(p1),
       (p16)-[:PODWŁADNY]->(p1),
       (p17)-[:PODWŁADNY]->(p1),
       (p18)-[:PODWŁADNY]->(p1),
       (p19)-[:PODWŁADNY]->(p1),
       (p20)-[:PODWŁADNY]->(p1),
       (p21)-[:PODWŁADNY]->(p1),
       (p22)-[:PODWŁADNY]->(p1),
       (p23)-[:PODWŁADNY]->(p1)
RETURN *;

// Ex 3
CREATE (p1:Person {name:"Michał", surname:"Komsa", age:23, work:"Student"}),
       (p2:Person {name:"Kamil", surname:"Komsa", age:19, work:"Uczeń"}),
       (p3:Person {name:"Agata", surname:"Duda", age:55, work:"Pierwsza dama"}),
       (p4:Person {name:"Karol", surname:"Hunia", age:24, work:"Student"}),
       (p1)-[:ZNA]->(p4)-[:ZNA]->(p1),
       (p1)-[:ZNA]->(p2)-[:ZNA]->(p1),
       (p2)-[:ZNA]->(p3)-[:ZNA]->(p2),
       (p4)-[:ZNA]->(p3)-[:ZNA]->(p4),
       (p5:Person {name:"Adrian", surname:"Żygała", age:20}),
       (p2)-[:ZNA]->(p5)-[:ZNA]->(p2),
       (p6:Person {name:"Ewa", surname:"Komsa", age:49, work:"Pielęgniarka"}),
       (p1)-[:ZNA]->(p6)-[:ZNA]->(p1),
       (p2)-[:ZNA]->(p6)-[:ZNA]->(p2),
       (p3)-[:ZNA]->(p6)-[:ZNA]->(p3),
       (p7:Person {name:"Agata", surname:"Jamroży", age:33, work:"Asystent"}),
       (p8:Person {name:"Wacław", surname:"Dereń", age:71, work:"Emeryt"}),
       (p9:Person {name:"Jadwiga", surname:"Czarna", work:"Emeryt"}),
       (p8)-[:ZNA]->(p9)-[:ZNA]->(p8),
       (p4)-[:ZNA]->(p7)-[:ZNA]->(p4),
       (p7)-[:ZNA]->(p6)-[:ZNA]->(p7),
       (p10:Person {name:"Jolanta", surname:"Gzik"}),
       (p6)-[:ZNA]->(p10)-[:ZNA]->(p6),
       (p11:Person {name:"Grzegorz", surname:"Halny", wiek:20}),
       (p5)-[:ZNA]->(p11)-[:ZNA]->(p5),
       (p1)-[:ZNA]->(p11)-[:ZNA]->(p1),
       (p2)-[:ZNA]->(p11)-[:ZNA]->(p2),
       (p4)-[:ZNA]->(p11)-[:ZNA]->(p4),
       (p12:Person {name:"Agata", surname:"Jamroży", age:80}),
       (p13:Person {name:"Wacław", surname:"Dereń"}),
       (p14:Person {name:"Jadwiga", surname:"Czarna"}),
       (p8)-[:ZNA]->(p12)-[:ZNA]->(p8),
       (p8)-[:ZNA]->(p13)-[:ZNA]->(p8),
       (p8)-[:ZNA]->(p14)-[:ZNA]->(p8),
       (p9)-[:ZNA]->(p13)-[:ZNA]->(p9),
       (p14)-[:ZNA]->(p6)-[:ZNA]->(p14),
       (p15:Person {name:"Hubert", surname:"Pleśniak", age:25, work:"Doktorant"}),
       (p16:Person {name:"Julia", surname:"Stasiowska", age:22, work:"Student"}),
       (p16)-[:ZNA]->(p1)-[:ZNA]->(p16),
       (p16)-[:ZNA]->(p15)-[:ZNA]->(p16),
       (p15)-[:ZNA]->(p7)-[:ZNA]->(p15),
       (p17:Person {name:"Sebastian", surname:"Sumara", age:21}),
       (p16)-[:ZNA]->(p17)-[:ZNA]->(p16),
       (p15)-[:ZNA]->(p17)-[:ZNA]->(p15),
       (p18:Person {name:"Jadwiga", surname:"Stacher", work:"Emeryt"}),
       (p8)-[:ZNA]->(p18)-[:ZNA]->(p8),
       (p12)-[:ZNA]->(p18)-[:ZNA]->(p12),
       (p19:Person {name:"Adrian", surname:"Myszak", age:21}),
       (p1)-[:ZNA]->(p19)-[:ZNA]->(p1),
       (p20:Person {name:"Szymon", hidden:true}),
       (p21:Person {name:"Damian", hidden:true}),
       (p22:Person {name:"Czesław", surname:"Grodziński", age:55}),
       (p22)-[:ZNA]->(p3)-[:ZNA]->(p22),
       (p23:Person {name:"Elżbieta", surname:"Dzwon", age:33, work:"Nauczyciel"}),
       (p15)-[:ZNA]->(p23)-[:ZNA]->(p15),
       (p2)-[:ZNA]->(p23)-[:ZNA]->(p2),
       (p24:Person {name:"Zofia", hidden:true}),
       (p25:Person {name:"Karolina", hidden:true})
RETURN *;