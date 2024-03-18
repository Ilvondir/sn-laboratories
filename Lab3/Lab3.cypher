// 1.1
MATCH (N)
RETURN N;

// 1.2
MATCH (m:Movie)
RETURN m;

// 1.3
MATCH (m:Movie)
RETURN m;

// 1.4
MATCH (p:Person)
RETURN p;

// 1.5
MATCH (p:Person)-[:ACTED_IN]->()
RETURN p;

// 1.6
// a)
MATCH (p:Person)-[:ACTED_IN]->()
RETURN DISTINCT p.name;

// b)
MATCH (p:Person)-[:DIRECTED]->()
RETURN DISTINCT p.name;

// c)
MATCH (p:Person)-[:PRODUCED]->()
RETURN DISTINCT p.name;

// 1.7
MATCH (p:Movie { title: "As Good as It Gets" })
RETURN p.tagline;

// 1.8
MATCH (p:Person)-[:DIRECTED]->()
RETURN p;

// 1.9
MATCH (p:Person)-[:PRODUCED]->()
RETURN p;

// 1.10
MATCH p=(:Person { name:"Cameron Crowe" })-[:PRODUCED]->(:Movie)
RETURN p;

// 1.11
MATCH (p:Person { name:"Robin Williams" })-[:ACTED_IN]->(m:Movie)
RETURN *;

// 1.12
MATCH (p:Person { name:"Bill Pullman" })
RETURN p.born;

// 1.13
MATCH (:Movie { title:"Top Gun" })<-[:DIRECTED]-(p:Person)
RETURN p.born;

// 1.14
MATCH (m:Movie { title:"Sleepless in Seattle" })
RETURN m.released;

// 1.15
MATCH (m:Movie { released:1998 })
RETURN m;

// 1.16
MATCH (p:Person)-[:DIRECTED]->(m:Movie { released:1998 })
RETURN p.name;

// 1.17
MATCH (p:Person)-[:DIRECTED]->(m:Movie { title:"When Harry Met Sally" })
RETURN p.name;

// 1.18
MATCH (p:Person)-[:PRODUCED]->(m:Movie { title:"When Harry Met Sally" })
RETURN p.name;

// 1.19
MATCH (p:Person)-[:WROTE]->(m:Movie { title:"When Harry Met Sally" })
RETURN p.name;

// 1.20
MATCH (p:Person { name:"Andy Wachowski" })-[:PRODUCED]->(m:Movie)
RETURN *;

// 1.21
MATCH (p:Person { name:"Lana Wachowski" })-[:DIRECTED]->(m:Movie)
RETURN *;

// 1.22
MATCH (p:Person { name:"Lana Wachowski" })-[:WROTE]->(m:Movie)
RETURN *;
