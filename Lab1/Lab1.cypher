// A B
CREATE (w:Student {name:"Michał", surname:"Komsa", index:123633, degree:"IT"}),
       (w1:Student {name:"Adrian", surname:"Myszak", index:122957, degree:"IT"}),
       (w2:Student {name:"Kamil", surname:"Matusz", index:122954, degree:"IT"}),
       (w3:Student {name:"Filip", surname:"Łępa", degree:"IT"}),
       (w4:Student {name:"Michał", surname:"Cybulski", degree:"IT"}),
       (w5:Student {name:"Łukasz", surname:"Jasiński", degree:"IT"}),
       (w6:Student {name:"Konrad", surname:"Baran", degree:"IT"}),
       (w7:Student {name:"Łukasz", surname:"Domin", degree:"IT"}),
       (w8:Student {name:"Bartłomiej", surname:"Babicz", degree:"IT"}),
       (w9:Student {name:"Kacper", surname:"Mroczek", degree:"IT"}),
       (w10:Student {name:"Artur", surname:"Pas", degree:"IT"}),
       (w11:Student {name:"Krystian", surname:"Dziura", degree:"IT"}),
       (w12:Student {name:"Sebastian", surname:"Kolański", degree:"IT"}),
       (w13:Student {name:"Szymon", surname:"Całka", degree:"IT"})
RETURN w, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13;

// C
MATCH (n)
WHERE n.index = 123633
MATCH (m)
WHERE m.name <> "Michał" OR m.surname <> "Komsa"
CREATE (n)-[:ZNA]->(m)
RETURN n, m;

// D
CREATE (o1:Person {name:"Adam", surname:"Cywka", age:21}),
       (o2:Person {name:"Agata", surname:"Biedroń", age:21}),
       (o1)-[:LUBI]->(o2),
       (o2)-[:LUBI]->(o1),
       (o3:Person {name:"Donald", surname:"Knur", age:31}),
       (o4:Person {name:"Zofia", surname:"Biedronka", age:24}),
       (o3)-[:LUBI]->(o4),
       (o4)-[:LUBI]->(o3),
       (o5:Person {name:"Olga", surname:"Wellman", age:18}),
       (o6:Person {name:"Tomasz", surname:"Świnia", age:15}),
       (o5)-[:LUBI]->(o6),
       (o6)-[:LUBI]->(o5),
       (o7:Person {name:"Anna", surname:"Justyna", age:21}),
       (o8:Person {name:"Dominika", surname:"Świerzb", age:22}),
       (o7)-[:LUBI]->(o8),
       (o8)-[:LUBI]->(o7),
       (o9:Person {name:"Agata", surname:"Trak", age:56}),
       (o10:Person {name:"Gerwazy", surname:"Rębajło", age:65}),
       (o9)-[:LUBI]->(o10),
       (o10)-[:LUBI]->(o9)
RETURN o1, o2, o3, o4, o5, o6, o7, o8, o9, o10;

// E
MATCH (N:Student {name:"Michał", surname:"Komsa"})
MATCH (M:Person {name:"Agata", surname:"Trak"})
CREATE (N)-[:ZNA]->(M),
       (M)-[:ZNA]->(N),
       (N)-[:LUBI]->(M)
RETURN N, M;

MATCH (N:Student {name:"Kamil", surname:"Matusz"})
MATCH (M:Person {name:"Agata", surname:"Trak"})
CREATE (N)-[:ZNA]->(M)
RETURN N, M;

MATCH (N:Student {name:"Krystian", surname:"Dziura"})
MATCH (M:Person {name:"Zofia", surname:"Biedronka"})
CREATE (N)-[:ZNA]->(M),
       (N)-[:LUBI]->(M)
RETURN N, M;

MATCH (N:Student {name:"Łukasz", surname:"Jasiński"})
MATCH (N1:Student {name:"Sebastian", surname:"Kolański"})
MATCH (M:Person {name:"Adam", surname:"Cywka"})
CREATE (N)-[:ZNA]->(M),
       (N1)-[:ZNA]->(M)
RETURN N, M, N1;

MATCH (N:Student {name:"Artur", surname:"Pas"})
MATCH (M:Person {name:"Anna", surname:"Justyna"})
CREATE (N)-[:ZNA]->(M),
       (M)-[:ZNA]->(N)
RETURN N, M;

// F
MATCH (N1:Person {name: "Zofia", surname:"Biedronka"})
MATCH (N2:Person {name: "Gerwazy", surname:"Rębajło"})
MATCH (N3:Person {name: "Olga", surname:"Wellman"})
MATCH (N4:Person {name: "Dominika", surname:"Świerzb"})
MATCH (N5:Person {name: "Agata", surname:"Trak"})
SET N1.job="Baker", N1.salary=4500,
    N2.job="Plumber", N2.salary=3900,
    N3.job="Unemployment", N3.salary=0,
    N4.job="Teacher", N4.salary=5100,
    N5.job="Programmer", N5.salary=6000
RETURN N1, N2, N3, N4, N5;

// G
CREATE (N1:Teacher {name:"Zbigniew", surname:"Suraj"}),
       (N2:Teacher {name:"Zbigniew", surname:"Bazan"}),
       (N3:Teacher {name:"Marcin", surname:"Ochab"}),
       (N4:Teacher {name:"Szymon", surname:"Szczur"}),
       (N5:Teacher {name:"Tomasz", surname:"Mysz"}),
       (N6:Teacher {name:"Wojciech", surname:"Kozioł"}),
       (N7:Teacher {name:"Agata", surname:"Kosior"}),
       (N8:Teacher {name:"Ewa", surname:"Bentkowska"}),
       (N9:Teacher {name:"Robert", surname:"Knap"}),
       (N10:Teacher {name:"Wiktoria", surname:"Rząsa"}),
       (S1:School {name:"Uniwersytet Rzeszowski", address:"Rzeszów"}),
       (S2:School {name:"Uniwersytet Jagieloński", address:"Kraków"}),
       (S3:School {name:"Katolicki Uniwersytet Lubelski", address:"Lublin"}),
       (N1)-[:PRACUJE {year:2000}]->(S1),
       (N2)-[:PRACUJE {year:2010}]->(S1),
       (N3)-[:PRACUJE {year:2001}]->(S1),
       (N4)-[:PRACUJE {year:2002}]->(S1),
       (N5)-[:PRACUJE {year:2023}]->(S1),
       (N6)-[:PRACUJE {year:2021}]->(S2),
       (N7)-[:PRACUJE {year:2022}]->(S2),
       (N8)-[:PRACUJE {year:2019}]->(S2),
       (N9)-[:PRACUJE {year:2014}]->(S3),
       (N10)-[:PRACUJE {year:2011}]->(S3)
RETURN N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, S1, S2, S3;

// H
MATCH (w:Student {name:"Michał", surname:"Komsa", index:123633, degree:"IT"})
MATCH (w1:Student {name:"Adrian", surname:"Myszak", index:122957, degree:"IT"})
MATCH (w2:Student {name:"Kamil", surname:"Matusz", index:122954, degree:"IT"})
MATCH (w3:Student {name:"Filip", surname:"Łępa", degree:"IT"})
MATCH (w4:Student {name:"Michał", surname:"Cybulski", degree:"IT"})
MATCH (w5:Student {name:"Łukasz", surname:"Jasiński", degree:"IT"})
MATCH (w6:Student {name:"Konrad", surname:"Baran", degree:"IT"})
MATCH (w7:Student {name:"Łukasz", surname:"Domin", degree:"IT"})
MATCH (w8:Student {name:"Bartłomiej", surname:"Babicz", degree:"IT"})
MATCH (w9:Student {name:"Kacper", surname:"Mroczek", degree:"IT"})
MATCH (w10:Student {name:"Artur", surname:"Pas", degree:"IT"})
MATCH (w11:Student {name:"Krystian", surname:"Dziura", degree:"IT"})
MATCH (w12:Student {name:"Sebastian", surname:"Kolański", degree:"IT"})
MATCH (w13:Student {name:"Szymon", surname:"Całka", degree:"IT"})
MATCH (N1:Teacher {name:"Zbigniew", surname:"Suraj"})
MATCH (N2:Teacher {name:"Zbigniew", surname:"Bazan"})
MATCH (N3:Teacher {name:"Marcin", surname:"Ochab"})
MATCH (N4:Teacher {name:"Szymon", surname:"Szczur"})
MATCH (N5:Teacher {name:"Tomasz", surname:"Mysz"})
MATCH (N6:Teacher {name:"Wojciech", surname:"Kozioł"})
MATCH (N7:Teacher {name:"Agata", surname:"Kosior"})
MATCH (N8:Teacher {name:"Ewa", surname:"Bentkowska"})
MATCH (N9:Teacher {name:"Robert", surname:"Knap"})
MATCH (N10:Teacher {name:"Wiktoria", surname:"Rząsa"})
CREATE (N1)-[:UCZY {subject:"IT"}]->(w1),
       (N1)-[:UCZY {subject:"IT"}]->(w2),
       (N1)-[:UCZY {subject:"IT"}]->(w5),
       (N2)-[:UCZY {subject:"Math"}]->(w6),
       (N2)-[:UCZY {subject:"Math"}]->(w7),
       (N2)-[:UCZY {subject:"Math"}]->(w),
       (N3)-[:UCZY {subject:"Math"}]->(w1),
       (N3)-[:UCZY {subject:"Math"}]->(w4),
       (N3)-[:UCZY {subject:"Math"}]->(w3),
       (N4)-[:UCZY {subject:"Physic"}]->(w),
       (N5)-[:UCZY {subject:"Biology"}]->(w9),
       (N5)-[:UCZY {subject:"Biology"}]->(w8),
       (N6)-[:UCZY {subject:"English"}]->(w12),
       (N6)-[:UCZY {subject:"English"}]->(w11),
       (N6)-[:UCZY {subject:"English"}]->(w),
       (N7)-[:UCZY {subject:"Deutsch"}]->(w8),
       (N8)-[:UCZY {subject:"Sport"}]->(w10),
       (N8)-[:UCZY {subject:"Sport"}]->(w6),
       (N9)-[:UCZY {subject:"Art"}]->(w),
       (N9)-[:UCZY {subject:"Art"}]->(w7),
       (N9)-[:UCZY {subject:"Art"}]->(w8),
       (N10)-[:UCZY {subject:"Polish"}]->(w),
       (N10)-[:UCZY {subject:"Polish"}]->(w9),
       (N10)-[:UCZY {subject:"Polish"}]->(w4)
RETURN w, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10;

// I J
CREATE (p1:City {name:"Rzeszów"}),
       (p2:City {name:"Lublin"}),
       (p3:City {name:"Kraków"}),
       (p4:City {name:"Warszawa"}),
       (p5:City {name:"Gdańsk"}),
       (p6:City {name:"Gniezno"}),
       (p7:City {name:"Szczecin"}),
       (p8:City {name:"Kielce"}),
       (p9:City {name:"Łódź"}),
       (p10:City {name:"Sandomierz"})
RETURN p1, p2, p3, p4, p5, p6, p7, p8, p9, p10;

MATCH (w:Student {name:"Michał", surname:"Komsa", index:123633, degree:"IT"})
MATCH (w1:Student {name:"Adrian", surname:"Myszak", index:122957, degree:"IT"})
MATCH (w2:Student {name:"Kamil", surname:"Matusz", index:122954, degree:"IT"})
MATCH (w3:Student {name:"Filip", surname:"Łępa", degree:"IT"})
MATCH (w4:Student {name:"Michał", surname:"Cybulski", degree:"IT"})
MATCH (w5:Student {name:"Łukasz", surname:"Jasiński", degree:"IT"})
MATCH (w6:Student {name:"Konrad", surname:"Baran", degree:"IT"})
MATCH (w7:Student {name:"Łukasz", surname:"Domin", degree:"IT"})
MATCH (w8:Student {name:"Bartłomiej", surname:"Babicz", degree:"IT"})
MATCH (w9:Student {name:"Kacper", surname:"Mroczek", degree:"IT"})
MATCH (w10:Student {name:"Artur", surname:"Pas", degree:"IT"})
MATCH (w11:Student {name:"Krystian", surname:"Dziura", degree:"IT"})
MATCH (w12:Student {name:"Sebastian", surname:"Kolański", degree:"IT"})
MATCH (w13:Student {name:"Szymon", surname:"Całka", degree:"IT"})
MATCH (N1:Teacher {name:"Zbigniew", surname:"Suraj"})
MATCH (N2:Teacher {name:"Zbigniew", surname:"Bazan"})
MATCH (N3:Teacher {name:"Marcin", surname:"Ochab"})
MATCH (N4:Teacher {name:"Szymon", surname:"Szczur"})
MATCH (N5:Teacher {name:"Tomasz", surname:"Mysz"})
MATCH (N6:Teacher {name:"Wojciech", surname:"Kozioł"})
MATCH (N7:Teacher {name:"Agata", surname:"Kosior"})
MATCH (N8:Teacher {name:"Ewa", surname:"Bentkowska"})
MATCH (N9:Teacher {name:"Robert", surname:"Knap"})
MATCH (N10:Teacher {name:"Wiktoria", surname:"Rząsa"})
MATCH (p1:City {name:"Rzeszów"})
MATCH (p2:City {name:"Lublin"})
MATCH (p3:City {name:"Kraków"})
MATCH (p4:City {name:"Warszawa"})
MATCH (p5:City {name:"Gdańsk"})
MATCH (p6:City {name:"Gniezno"})
MATCH (p7:City {name:"Szczecin"})
MATCH (p8:City {name:"Kielce"})
MATCH (p9:City {name:"Łódź"})
MATCH (p10:City {name:"Sandomierz"})
MATCH (o1:Person {name:"Adam", surname:"Cywka", age:21})
MATCH (o2:Person {name:"Agata", surname:"Biedroń", age:21})
MATCH (o3:Person {name:"Donald", surname:"Knur", age:31})
MATCH (o4:Person {name:"Zofia", surname:"Biedronka", age:24})
MATCH (o5:Person {name:"Olga", surname:"Wellman", age:18})
MATCH (o6:Person {name:"Tomasz", surname:"Świnia", age:15})
MATCH (o7:Person {name:"Anna", surname:"Justyna", age:21})
MATCH (o8:Person {name:"Dominika", surname:"Świerzb", age:22})
MATCH (o9:Person {name:"Agata", surname:"Trak", age:56})
MATCH (o10:Person {name:"Gerwazy", surname:"Rębajło", age:65})
MATCH (S1:School {name:"Uniwersytet Rzeszowski", address:"Rzeszów"})
MATCH (S2:School {name:"Uniwersytet Jagieloński", address:"Kraków"})
MATCH (S3:School {name:"Katolicki Uniwersytet Lubelski", address:"Lublin"})
CREATE (S1)-[:ZNAJDUJE]->(p1),
       (S2)-[:ZNAJDUJE]->(p3),
       (S3)-[:ZNAJDUJE]->(p2),
       (w)-[:MIESZKA]->(p2),
       (w1)-[:MIESZKA]->(p3),
       (w2)-[:MIESZKA]->(p4),
       (w3)-[:MIESZKA]->(p5),
       (w4)-[:MIESZKA]->(p7),
       (w5)-[:MIESZKA]->(p8),
       (w6)-[:MIESZKA]->(p9),
       (w7)-[:MIESZKA]->(p10),
       (w8)-[:MIESZKA]->(p1),
       (w9)-[:MIESZKA]->(p2),
       (w10)-[:MIESZKA]->(p3),
       (w11)-[:MIESZKA]->(p4),
       (w12)-[:MIESZKA]->(p6),
       (w13)-[:MIESZKA]->(p7),
       (N1)-[:MIESZKA]->(p8),
       (N2)-[:MIESZKA]->(p9),
       (N3)-[:MIESZKA]->(p10),
       (N4)-[:MIESZKA]->(p2),
       (N5)-[:MIESZKA]->(p2),
       (N6)-[:MIESZKA]->(p3),
       (N7)-[:MIESZKA]->(p4),
       (N8)-[:MIESZKA]->(p5),
       (N9)-[:MIESZKA]->(p6),
       (N10)-[:MIESZKA]->(p7),
       (o1)-[:MIESZKA]->(p1),
       (o2)-[:MIESZKA]->(p2),
       (o3)-[:MIESZKA]->(p3),
       (o4)-[:MIESZKA]->(p4),
       (o5)-[:MIESZKA]->(p5),
       (o6)-[:MIESZKA]->(p6),
       (o7)-[:MIESZKA]->(p7),
       (o8)-[:MIESZKA]->(p8),
       (o9)-[:MIESZKA]->(p9),
       (o10)-[:MIESZKA]->(p10);

MATCH (N)
RETURN N;