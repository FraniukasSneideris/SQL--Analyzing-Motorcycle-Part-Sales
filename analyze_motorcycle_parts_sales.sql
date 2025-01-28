SELECT product_line,
       TO_CHAR(date, 'Month') AS month,
       warehouse,
       SUM(total - payment_fee) AS net_revenue
FROM sales
WHERE client_type = 'Wholesale'
GROUP BY product_line, month, warehouse
ORDER BY product_line, month, net_revenue DESC;
