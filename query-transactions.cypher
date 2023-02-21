MATCH (c:CreditCard)-[:USED_BY]->(t:Transaction)
WHERE t.value > 100.0
WITH c, collect(t.date) as dates, count(*) as count
WHERE count(dates) = 1
RETURN c.number, c.name, dates[0], count;