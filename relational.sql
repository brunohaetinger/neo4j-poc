-- Create Tables

CREATE TABLE Transaction (
  id INT PRIMARY KEY,
  value DECIMAL(10,2),
  date DATE,
  location VARCHAR(50)
);

CREATE TABLE CreditCard (
  number VARCHAR(16) PRIMARY KEY,
  name VARCHAR(50)
);

CREATE TABLE Cardholder (
  name VARCHAR(50) PRIMARY KEY
);


-- Inserts

INSERT INTO Transaction (id, value, date, location)
VALUES (1, 100.0, '2022-01-01', 'New York'),
       (2, 50.0, '2022-01-02', 'San Francisco'),
       (3, 75.0, '2022-01-03', 'Miami');

INSERT INTO CreditCard (number, name)
VALUES ('1111222233334444', 'John Doe'),
       ('2222333344445555', 'Jane Smith'),
       ('3333444455556666', 'Bob Johnson');

INSERT INTO Cardholder (name)
VALUES ('John Doe'),
       ('Jane Smith'),
       ('Bob Johnson');


-- Create Relationship Tables
CREATE TABLE Transaction_CreditCard (
  transaction_id INT,
  creditcard_number VARCHAR(16),
  FOREIGN KEY (transaction_id) REFERENCES Transaction(id),
  FOREIGN KEY (creditcard_number) REFERENCES CreditCard(number)
);

CREATE TABLE CreditCard_Cardholder (
  creditcard_number VARCHAR(16),
  cardholder_name VARCHAR(50),
  FOREIGN KEY (creditcard_number) REFERENCES CreditCard(number),
  FOREIGN KEY (cardholder_name) REFERENCES Cardholder(name)
);

-- Inserts into Relationship Tables

INSERT INTO Transaction_CreditCard (transaction_id, creditcard_number)
VALUES (1, '1111222233334444'),
       (2, '2222333344445555'),
       (3, '3333444455556666');

INSERT INTO CreditCard_Cardholder (creditcard_number, cardholder_name)
VALUES ('1111222233334444', 'John Doe'),
       ('2222333344445555', 'Jane Smith'),
       ('3333444455556666', 'Bob Johnson');

-- Queries

SELECT c.number, c.name, t.date, COUNT(*) AS count
FROM Transaction t
JOIN Transaction_CreditCard tc ON t.id = tc.transaction_id
JOIN CreditCard c ON tc.creditcard_number = c.number
WHERE t.value > 100.0
GROUP BY c.number, c.name, t.date
HAVING COUNT(DISTINCT t.date) = 1;

