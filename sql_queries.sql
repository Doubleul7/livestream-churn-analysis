-- sql_queries.sql
-- SQL segmentation logic based on churn analysis project

-- 1. Churn Distribution Summary
SELECT Churn, COUNT(*) AS UserCount
FROM users
GROUP BY Churn;

-- 2. Churned Users by City Tier
SELECT CityTier, COUNT(*) AS ChurnedCount
FROM users
WHERE Churn = 1
GROUP BY CityTier
ORDER BY ChurnedCount DESC;

-- 3. Churned Users by Gender
SELECT Gender, COUNT(*) AS ChurnedCount
FROM users
WHERE Churn = 1
GROUP BY Gender;

-- 4. Churned Users by Complaint Status
SELECT Complain, COUNT(*) AS ChurnedCount
FROM users
WHERE Churn = 1
GROUP BY Complain;

-- 5. Churned Users by Satisfaction Score
SELECT SatisfactionScore, COUNT(*) AS ChurnedCount
FROM users
WHERE Churn = 1
GROUP BY SatisfactionScore
ORDER BY SatisfactionScore;

-- 6. RFA Distribution Summary
SELECT Churn,
       AVG(DaySinceLastOrder) AS AvgRecency,
       AVG(Tenure) AS AvgFrequency,
       AVG(HourSpendOnApp) AS AvgActivity
FROM users
GROUP BY Churn;

-- 7. Dormant Loyal Users (High Tenure + Inactive + Complaint or Low Satisfaction)
SELECT *
FROM users
WHERE Tenure > 6
  AND DaySinceLastOrder > 15
  AND (SatisfactionScore <= 3 OR Complain = 1);

-- 8. New Users with Low Conversion
SELECT *
FROM users
WHERE Tenure <= 3
  AND DaySinceLastOrder > 10;

-- 9. High Churn in Tier 1 Cities (Flag for further A/B testing)
SELECT *
FROM users
WHERE CityTier = 1
  AND Churn = 1;

-- 10. Gender-Based Churn Behavior
SELECT Gender, COUNT(*) AS TotalUsers,
       SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS ChurnedUsers,
       ROUND(1.0 * SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS ChurnRate
FROM users
GROUP BY Gender;
