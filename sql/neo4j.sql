
match (s1:State ) where s1.StateName="StartStateNameHere"
match (s2:State ) where s2.StateName="EndStateNameHere"
with shortestPath((s1)-[:BORDERS*]-(s2)) as  x
return *;

match p = ALL SHORTEST (s1:State)-[:BORDERS*]-(s2:State)
where s1.StateName="StartStateNameHere" and s2.StateName="EndStateNameHere"
return distinct [n in nodes(p) | n.StateName] as stops;
