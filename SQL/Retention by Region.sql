WITH first_activity_time AS (
  SELECT customer_id AS cust_id,
         MIN(purchase_date) AS first_purchase_time
  FROM regions_retention
  GROUP BY 1
),
retention_user_level AS(
SELECT 
  first_activity_time.cust_id,
  first_activity_time.first_purchase_time,
  MAX(
    CASE 
      WHEN purchase_date
           BETWEEN first_purchase_time 
           AND first_purchase_time + INTERVAL 30 DAY
      THEN 1 
      ELSE 0 
    END
  ) AS Month_0_returned,
  MAX(
    CASE 
      WHEN purchase_date
           BETWEEN first_purchase_time + INTERVAL 31 DAY
           AND first_purchase_time + INTERVAL 60 DAY
      THEN 1 
      ELSE 0 
    END
  ) AS Month_1_returned,
  MAX(
    CASE 
      WHEN purchase_date 
           BETWEEN first_purchase_time + INTERVAL 61 DAY
           AND first_purchase_time + INTERVAL 90 DAY
      THEN 1 
      ELSE 0 
    END
  ) AS Month_2_returned,
  
FROM first_activity_time
LEFT JOIN regions_retention
  ON first_activity_time.cust_id = regions_retention.customer_id
WHERE first_purchase_time IS NOT NULL
GROUP BY 1, 2
)
SELECT Region,

       count(distinct cust_id) as total_activated_users,
       count(distinct case when Month_0_returned = 1 then cust_id end) as Month_0_Returned_Total,
       count(distinct case when Month_1_returned = 1 then cust_id end) as Month_1_Returned_Total,
       count(distinct case when Month_2_returned = 1 then cust_id end) as Month_2_Returned_Total,
       Month_0_Returned_Total/Month_0_Returned_Total*100 as Month_0_Retention_Rate,
       Month_1_Returned_Total/Month_0_Returned_Total*100 as Month_1_Retention_Rate,
       Month_2_Returned_Total/Month_0_Returned_Total*100 as Month_2_Retention_Rate
      

FROM retention_user_level
LEFT JOIN regions_retention
  ON regions_retention.customer_id = retention_user_level.cust_id
GROUP By 1

ORDER BY 7 DESC;
