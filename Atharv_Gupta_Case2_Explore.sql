SELECT avg(AmountAtEntry-AmountAtExit+AmountSpentOnDrinks) AS avg_tot_spent
FROM my_casino.Customer;

SELECT CustomerID, FirstName, LastName,(AmountAtEntry-AmountAtExit+AmountSpentOnDrinks) AS tot_spent
FROM my_casino.Customer
ORDER BY tot_spent DESC
LIMIT 2;

SELECT CustomerID, FirstName, LastName,CardGames.name,(AmountAtEntry-AmountAtExit+AmountSpentOnDrinks)AS tot_spend
FROM my_casino.Customer
INNER JOIN my_casino.CardGames
GROUP BY CardGames.name
ORDER BY tot_spend DESC
LIMIT 2;


