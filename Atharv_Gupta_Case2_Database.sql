CREATE SCHEMA my_casino;
CREATE TABLE my_casino.GeneralManager 
( EmployeeID INT PRIMARY KEY,
FirstName VARCHAR(45) NOT NULL,
LastName VARCHAR (45) NOT NULL, 
Salary INT

);
CREATE TABLE my_casino.Bartenders
( EmployeeID INT PRIMARY KEY,
FirstName VARCHAR(45) NOT NULL,
LastName VARCHAR (45) NOT NULL, 
Salary INT, 
TipsEarned INT,
HoursWorked INT, 
DrinksPerHour INT,
GeneralManager_EmployeeID INT, 
FOREIGN KEY (GeneralManager_EmployeeID) REFERENCES my_casino.GeneralManager (EmployeeID) ON DELETE CASCADE
);
CREATE TABLE my_casino.CardDealers
( EmployeeID INT PRIMARY KEY,
FirstName VARCHAR(45) NOT NULL,
LastName VARCHAR (45) NOT NULL, 
Salary INT,
TipsEarned INT,
HoursWorked INT,
GeneralManager_EmployeeID INT, 
FOREIGN KEY (GeneralManager_EmployeeID) REFERENCES my_casino.GeneralManager (EmployeeID) ON DELETE CASCADE
);

CREATE TABLE my_casino.Beverage
(DrinkNo INT PRIMARY KEY,
Name VARCHAR(45) NOT NULL,
ABV INT, 
Bartenders_EmployeeID INT,
Customer_CustomerID INT,
FOREIGN KEY (Bartenders_EmployeeID) REFERENCES my_casino.Bartenders (EmployeeID) ON DELETE CASCADE,
FOREIGN KEY (Customer_CustomerID) REFERENCES my_casino.Customer (CustomerID) ON DELETE CASCADE
);

CREATE TABLE my_casino.DealerGames
(DealerGameID INT PRIMARY KEY,
CardDealers_EmployeeID INT,
CardDealers_GeneralManager_EmployeeID INT,
FOREIGN KEY (CardDealers_EmployeeID) REFERENCES my_casino.CardDealers (EmployeeID) ON DELETE CASCADE,
FOREIGN KEY (CardDealers_GeneralManager_EmployeeID) REFERENCES my_casino.GeneralManager (EmployeeID) ON
DELETE CASCADE
);

CREATE TABLE my_casino.CardGames
(GameNo INT PRIMARY KEY,
Name VARCHAR(45) NOT NULL,
DealerRequired BOOLEAN NOT NULL,
TimePerRound INT NOT NULL,
DealerGames_DealerGameID INT,
DealerGames_CardDealers_EmployeeID INT,
DealerGames_CardDealers_GeneralManager_EmployeeID INT,
customer_customerID INT,
FOREIGN KEY (DealerGames_DealerGameID) REFERENCES my_casino.DealerGames (DealerGameID) ON DELETE CASCADE,
FOREIGN KEY (DealerGames_CardDealers_EmployeeID) REFERENCES my_casino.CardDealers (EmployeeID) ON
DELETE CASCADE,
FOREIGN KEY (DealerGames_CardDealers_GeneralManager_EmployeeID) REFERENCES my_casino.GeneralManager (EmployeeID) ON DELETE CASCADE, 
FOREIGN KEY (customer_customerID) REFERENCES my_casino.customer (customerID) ON DELETE CASCADE
);

CREATE TABLE my_casino.Customer
(CustomerID INT PRIMARY KEY,
FirstName VARCHAR(45) NOT NULL,
LastName VARCHAR (45) NOT NULL, 
Age INT NOT NULL,
AmountAtEntry INT NOT NULL,
AmountAtExit INT NOT NULL,
AmountSpentOnDrinks INT NOT NULL,
GeneralManager_EmployeeID INT,
FOREIGN KEY (GeneralManager_EmployeeID) REFERENCES my_casino.GeneralManager (EmployeeID) ON DELETE CASCADE
);

INSERT INTO my_casino.GeneralManager (EmployeeID, FirstName, LastName, Salary) VALUES
(1, 'Atharv', 'Gupta', 70000),
(2, 'Eshaan', 'Sharma', 80000),
(3, 'Vithal', 'Goel', 75000),
(4, 'Vihaan', 'Martin', 72000),
(5, 'Michael', 'Jordan', 68000),
(6, 'Joe', 'Wright', 71000),
(7, 'Jennifer', 'Lopez', 76000),
(8, 'Ant', 'Hill', 74000),
(9, 'Jack', 'Adams', 78000),
(10, 'Joey', 'White', 77000);

INSERT INTO my_casino.Bartenders (EmployeeID, FirstName, LastName, Salary, TipsEarned, HoursWorked, DrinksPerHour, GeneralManager_EmployeeID) VALUES
(11, 'Kevin', 'Black', 40000, 12000, 35, 50, 1),
(12, 'Laura', 'Vergara', 42000, 15000, 40, 55, 2),
(13, 'Megan', 'Fox', 39000, 11000, 38, 45, 3),
(14, 'Ned', 'Ghaswalla', 41000, 13000, 32, 48, 4),
(15, 'Olivia', 'Rodrigo', 43000, 14000, 45, 60, 5),
(16, 'Patrick', 'Harris', 44000, 12500, 41, 53, 6),
(17, 'Quincy', 'Adams', 45000, 11800, 36, 47, 7),
(18, 'Rachel', 'Victor', 42000, 13500, 34, 49, 8),
(19, 'Steve', 'Smith', 40000, 12800, 39, 52, 9),
(20, 'Tina', 'Thaoar', 43000, 12200, 37, 46, 10);

INSERT INTO my_casino.CardDealers (EmployeeID, FirstName, LastName, Salary, TipsEarned, HoursWorked, GeneralManager_EmployeeID) VALUES
(21, 'Uma', 'Jain', 50000, 20000, 40, 1),
(22, 'Emma', 'Stone', 52000, 19000, 42, 2),
(23, 'Victor', 'Wemby', 51000, 18000, 38, 3),
(24, 'Xavi', 'Iniesta', 53000, 21000, 44, 4),
(25, 'Alaistar', 'Cooke', 54000, 17500, 39, 5),
(26, 'Zack', 'Norris', 50000, 18500, 41, 6),
(27, 'Alan', 'Shearer', 55000, 19500, 43, 7),
(28, 'Reid', 'Bailey', 52000, 19000, 40, 8),
(29, 'Carlos', 'Alcaraz', 53000, 20500, 45, 9),
(30, 'Diana', 'Morris', 54000, 17500, 37, 10);

INSERT INTO my_casino.Customer (CustomerID, FirstName, LastName, Age, AmountAtEntry, AmountAtExit, AmountSpentOnDrinks, GeneralManager_EmployeeID) VALUES
(101, 'Liam', 'Hernandez', 32, 1000, 800, 200, 1),
(102, 'Emma', 'Mazi', 28, 1500, 1200, 300, 2),
(103, 'Noah', 'Schneider', 41, 2000, 1700, 300, 3),
(104, 'Olivia', 'Martinez', 23, 1200, 900, 300, 4),
(105, 'Ava', 'Rodriguez', 47, 1300, 1000, 300, 5),
(106, 'William', 'Garcia', 52, 1800, 1500, 300, 6),
(107, 'Sophia', 'Lint', 24, 1400, 1100, 300, 7),
(108, 'James', 'Wick', 38, 1600, 1200, 400, 8),
(109, 'Isabella', 'Lopez', 31, 1900, 1600, 300, 9),
(110, 'Sanaa', 'Chandra', 20, 1700, 2600, 400, 1);

INSERT INTO my_casino.Beverage (DrinkNo, Name, ABV, Bartenders_EmployeeID, Customer_CustomerID) VALUES
(1001, 'Virgin Mojito', 0, 11, 101),
(1002, 'Old Fashioned', 12, 12, 102),
(1003, 'Corona', 5, 13, 103),
(1004, 'Cosmopolitan', 14, 14, 104),
(1005, 'LIIT', 13, 15, 105),
(1006, 'Negroni', 18, 16, 106),
(1007, 'Whiskey Sour', 11, 17, 107),
(1008, ' Dry Martini', 16, 18, 108),
(1009, 'Bloody Mary', 10, 19, 109),
(1010, 'G and T', 12, 20, 110);

INSERT INTO my_casino.DealerGames (DealerGameID, CardDealers_EmployeeID, CardDealers_GeneralManager_EmployeeID) VALUES
(201, 21, 1),
(202, 22, 2),
(203, 23, 3),
(204, 24, 4),
(205, 25, 5),
(206, 26, 6),
(207, 27, 7),
(208, 28, 8),
(209, 29, 9),
(210, 30, 10);

INSERT INTO my_casino.CardGames (GameNo, Name, DealerRequired, TimePerRound, DealerGames_DealerGameID, DealerGames_CardDealers_EmployeeID, DealerGames_CardDealers_GeneralManager_EmployeeID, customer_customerID) VALUES
(301, 'Blackjack', TRUE, 5, 201, 21, 1, 101),
(302, 'Poker', TRUE, 8, 202, 22, 2, 102),
(303, 'Baccarat', TRUE, 6, 203, 23, 3, 103),
(304, 'Slot Machine', FALSE, 4, 204, 24, 4, 104),
(305, 'Roulette', TRUE, 7, 205, 25, 5, 105),
(306, 'Omaha Poker', TRUE, 10, 206, 26, 6, 106),
(307, 'Teen Patti', TRUE, 8, 207, 27, 7, 107),
(308, 'Caribbean Stud Poker', TRUE, 9, 208, 28, 8, 108),
(309, 'Three Card Poker', TRUE, 5, 209, 29, 9, 109),
(310, 'Let It Ride', TRUE, 6, 210, 30, 10, 110);




















