--   sql_queries.sql
-- SQL queries used in the livestream e-commerce user churn analysis project
-- These queries were executed via SQLite in Google Colab using the %sql magic extension

--  Query 1: Churned vs. Active User Count
SELECT Churn, COUNT(*) AS user_count
FROM users
GROUP BY Churn;

--  Query 2: Average Tenure and App Usage by Churn Status
SELECT Churn,
       ROUND(AVG(Tenure), 2) AS avg_tenure,
       ROUND(AVG(HourSpendOnApp), 2) AS avg_app_hours
FROM users
GROUP BY Churn;

--  Query 3: Count of Users by City Tier and Churn Status
SELECT CityTier, Churn, COUNT(*) AS user_count
FROM users
GROUP BY CityTier, Churn
ORDER BY CityTier, Churn;

--  Query 4: Satisfaction Score Distribution for Churned Users
SELECT SatisfactionScore, COUNT(*) AS count
FROM users
WHERE Churn = 1
GROUP BY SatisfactionScore
ORDER BY SatisfactionScore;

--  Query 5: Identify Dormant but Loyal At-Risk Users
SELECT *
FROM users
WHERE Tenure > 6
  AND DaySinceLastOrder > 15
  AND (SatisfactionScore <= 3 OR Complain = 1);

--  Query 6: Identify Low-Conversion New Users
SELECT *
FROM users
WHERE Tenure <= 3
  AND DaySinceLastOrder > 10;

--  Query 7: Aggregate Cashback vs. Churn
SELECT Churn,
       ROUND(AVG(CashbackAmount), 2) AS avg_cashback
FROM users
GROUP BY Churn;

--  Query 8: Complaint Rate by Churn Status
SELECT Churn,
       ROUND(AVG(Complain), 2) AS complaint_rate
FROM users
GROUP BY Churn;
