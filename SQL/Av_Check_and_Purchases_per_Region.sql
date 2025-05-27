
WITH user_monthly_counts AS (
  SELECT 
    customer_id,
    strftime(purchase_date, '%Y-%m') AS year_month,
    COUNT(*) AS monthly_purchase_count
  FROM regions_retention
  GROUP BY customer_id, year_month
),

user_aggregates AS (
  SELECT 
    customer_id,
    AVG(monthly_purchase_count) AS avg_purchases_per_month
  FROM user_monthly_counts
  GROUP BY customer_id
),

user_check AS (
  SELECT
    customer_id,
    AVG(CAST(REPLACE(REPLACE(purchase_amount, ',', ''), '$', '') AS DOUBLE)) AS average_check
  FROM regions_retention
  GROUP BY customer_id
),

user_region AS (
  SELECT customer_id, region
  FROM regions_retention
  GROUP BY customer_id, region
)

-- Агрегуємо на рівні регіону
SELECT 
  r.region AS Region,
  COUNT(DISTINCT r.customer_id) AS total_activated_users,
  AVG(c.average_check) AS average_chek,
  AVG(a.avg_purchases_per_month) AS avg_purchases_per_month
FROM user_region r
LEFT JOIN user_check c ON r.customer_id = c.customer_id
LEFT JOIN user_aggregates a ON r.customer_id = a.customer_id
GROUP BY 1
ORDER BY 4 DESC;
