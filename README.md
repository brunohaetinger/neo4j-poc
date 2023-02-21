# Neo4j PoC

This PoC propose is to learn about Neo4j and how it works.
The scope idea is a Bank Fraud Analysis.

## File structure

### init-nodes

Create nodes for each relevant entity (`Transaction`, `CreditCard` and `CardHolder`)

### init-relations

Create relations between nodes, indicating what Transaction is related to a CreditCard and what CreditCard is related to what CardHolder

### query-transactions

Query for "suspecious transactions", in this example, searching all CreditCards that have been used for Transactions with amount over $100 in a same day

### relational.sql

Contains the same domain as `cypher` files, but for relational SQL databases.

## About Neo4j

### Advantages and Drawbacks vs Relational DBs

#### Advantages:

- Data Modeling: allow to model complex relationships between entities
- Query performance: it has been designed to manage graphs and it's optimized for queries with relationships
- Scaling: it scales horizontally, allowing to add more nodes on clusters to increase processing and storage

#### Drawbacks:

- Complexity: can be complex, especially for developers not familiarized with graphs.
- Hard to migrate
- Query limits:
  - Aggregation: it doesn't have native support aggregation queries as `GROUP BY` or `HAVING`
  - Subqueries: it doesn't support subqueries.
  - Indexes limits: there is a limited support to indexes, which can let some optimizations harder to do

### Instances options

- Local instalation
- Neo4j Aura
- Neo4j Desktop
- Neo4j Cloud
- Containers