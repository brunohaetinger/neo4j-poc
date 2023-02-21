CREATE (:Transaction {id: 1, value: 100.0, date: '2022-01-01', location: 'New York'}),
       (:Transaction {id: 2, value: 50.0, date: '2022-01-02', location: 'San Francisco'}),
       (:Transaction {id: 3, value: 75.0, date: '2022-01-03', location: 'Miami'}),
       (:CreditCard {number: '1111222233334444', name: 'John Doe'}),
       (:CreditCard {number: '2222333344445555', name: 'Jane Smith'}),
       (:CreditCard {number: '3333444455556666', name: 'Bob Johnson'}),
       (:Cardholder {name: 'John Doe'}),
       (:Cardholder {name: 'Jane Smith'}),
       (:Cardholder {name: 'Bob Johnson'});