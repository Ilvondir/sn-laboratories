// 2
MATCH (m:Movie)
RETURN m
LIMIT 10;

// 3
MATCH (p:Person)-[:ACTED_IN]->(:Movie)
RETURN p
SKIP 19;

// 4
MATCH (p:Person)-[:DIRECTED]->(:Movie)
WITH DISTINCT p
RETURN p
SKIP 9
LIMIT 10;

// 5
MATCH (p:Person)
WHERE p.born=1931 OR p.born=1944 OR p.born=1956 OR p.born=1954 OR p.born=1967
RETURN p;

UNWIND [1931, 1944, 1954, 1956, 1967] AS years
MATCH (p:Person { born:years })
RETURN p;

// 6
UNWIND ["Ala", "Ola"] AS Imie
UNWIND [[1945, 1946, 2020], [1923, 1945, 2025]] AS Lata
RETURN Imie, Lata;

UNWIND ["Ala", "Ola"] AS Imie
UNWIND [[1945, 1946, 2020], [1923, 1945, 2025]] AS Lata
UNWIND Lata AS Rok
RETURN Imie, Rok;

// 7
UNWIND [1975, 1990, 1995, 2003] AS years
MATCH (m:Movie { released:years })
MERGE (p:Person { name:"Jan" })
MERGE (p)-[:LIKES]->(m)
RETURN *;

UNWIND [1999, 2004, 2006] AS years
MATCH (m:Movie { released:years })
MERGE (p:Person { name:"Aleksander" })
MERGE (p)-[:LIKES]->(m)
RETURN *;

UNWIND [2003, 2006] AS years
MATCH (m:Movie { released:years })
MERGE (p:Person { name:"Maciej" })
MERGE (p)-[:LIKES]->(m)
RETURN *;

UNWIND [1992, 1996, 2003] AS years
MATCH (m:Movie { released:years })
MERGE (p:Person { name:"Ewa" })
MERGE (p)-[:LIKES]->(m)
RETURN *;

UNWIND [2000, 2012] AS years
MATCH (m:Movie { released:years })
MERGE (p:Person { name:"Filip" })
MERGE (p)-[:LIKES]->(m)
RETURN *;

UNWIND [1975, 2003, 2004] AS years
MATCH (m:Movie { released:years })
MERGE (p:Person { name:"Agata" })
MERGE (p)-[:LIKES]->(m)
RETURN *;

UNWIND [2004, 2006, 2008, 2019] AS years
MATCH (m:Movie { released:years })
MERGE (p:Person { name:"Wojciech" })
MERGE (p)-[:LIKES]->(m)
RETURN *;

UNWIND [2000] AS years
MATCH (m:Movie { released:years })
MERGE (p:Person { name:"Aneta" })
MERGE (p)-[:LIKES]->(m)
RETURN *;

UNWIND [2012, 2019] AS years
MATCH (m:Movie { released:years })
MERGE (p:Person { name:"Anna" })
MERGE (p)-[:LIKES]->(m)
RETURN *;

UNWIND [2004] AS years
MATCH (m:Movie { released:years })
MERGE (p:Person { name:"Ula" })
MERGE (p)-[:LIKES]->(m)
RETURN *;

// 8
MERGE (jan:Pisarz)
RETURN jan, LABELS(jan);

MERGE (osoba { imie:"Ola", wiek:10 })
RETURN osoba;

MERGE (osoba:Osoba { imie:"Ania", wzrost:25 })
RETURN osoba;

MATCH (o { imie:"Kazimierz" })
RETURN o;

MERGE (o { imie:"Kazimierz" })
RETURN o;

UNWIND ["Krosno", "Rzeszów", "Warszawa"] AS n
MERGE (m:Miasto { nazwa:n })
RETURN m;

MERGE (o { imie:"Kazimierz" })
 SET o.urodzony="Krosno"
RETURN o;

MATCH (o:Osoba { urodzony:o.urodzony })
MERGE (m:Miasto { nazwa: o.urodzony })
RETURN o, m;

MERGE (p:Pracownik { imie:"Dariusz", urodzony:"Warszawa" })
RETURN p;

MATCH (o:Osoba { urodzony:o.urodzony })
MERGE (m:Miasto { nazwa: o.urodzony })
RETURN o, m;

MATCH (o { urodzony:o.urodzony })
MERGE (m:Miasto { nazwa: o.urodzony })
MERGE (o)-[r:`urodzony w`]->(m)
RETURN o, m, r;
