# SQL--Analyzing-Motorcycle-Part-Sales
Analyzing motorcycle part sales to find out how much Wholesale net revenue each product line generated per month per warehouse.

## Project Overview
This project aims to analyze the wholesale sales data for a motorcycle parts company, focusing on net revenue trends by product line, month, and warehouse location. By leveraging SQL queries on the company's sales database, we provide meaningful insights into how sales vary over time and across different locations.

---

## Dataset Description
The analysis is based on the `sales` table, which contains detailed information about orders made between June and August 2021. Below is a summary of the key columns used in this project:

| Column         | Data Type | Description                                               |
|----------------|-----------|-----------------------------------------------------------|
| `order_number` | VARCHAR   | Unique identifier for each order                          |
| `date`         | DATE      | Date of the order                                         |
| `warehouse`    | VARCHAR   | Warehouse (`North`, `Central`, `West`) where order occurred |
| `client_type`  | VARCHAR   | Indicates if the client was `Retail` or `Wholesale`       |
| `product_line` | VARCHAR   | Category of the product sold                              |
| `quantity`     | INT       | Number of products ordered                                |
| `unit_price`   | FLOAT     | Price per product                                         |
| `total`        | FLOAT     | Total price of the order                                  |
| `payment`      | VARCHAR   | Payment method (`Credit card`, `Transfer`, `Cash`)       |
| `payment_fee`  | FLOAT     | Percentage of `total` charged as payment method fee      |

---

## Objective
The goal of this analysis is to compute the net revenue for wholesale orders by product line, month, and warehouse. The net revenue is defined as:

\[ \text{Net Revenue} = \sum(\text{total} - \text{payment\_fee}) \]

The results are grouped by product line, month, and warehouse, and sorted by product line, month, and descending net revenue.

---

## SQL Query
Below is the SQL query used to generate the required results:

```sql
SELECT product_line,
       TO_CHAR(date, 'Month') AS month,
       warehouse,
       SUM(total - payment_fee) AS net_revenue
FROM sales
WHERE client_type = 'Wholesale'
GROUP BY product_line, month, warehouse
ORDER BY product_line, month, net_revenue DESC;
```

### Query Breakdown
- **`TO_CHAR(date, 'Month')`**: Extracts the month as a human-readable string.
- **`SUM(total - payment_fee)`**: Calculates the net revenue by subtracting payment fees from the total.
- **`WHERE client_type = 'Wholesale'`**: Filters results to include only wholesale orders.
- **Grouping and Sorting**: The query groups results by product line, month, and warehouse, then sorts by product line and net revenue in descending order.

---

## Results
The query produced a table with the following columns:
- **Product Line**: The category of products sold.
- **Month**: Month of the sale (`June`, `July`, `August`).
- **Warehouse**: Location where the order occurred (`North`, `Central`, `West`).
- **Net Revenue**: Sum of revenue minus payment fees.

### Sample Output
| `product_line`            | `month` | `warehouse` | `net_revenue` |
|----------------------------|---------|-------------|---------------|
| Braking system             | August  | Central     | 3039.41       |
| Electrical system          | July    | Central     | 5577.62       |
| Frame & body               | August  | Central     | 8657.99       |
| Suspension & traction      | June    | North       | 8065.74       |

---

## Results interpretation
The results are presented in graphics below: 

**Net Revenue versus Month by Product Line**
![image](https://github.com/user-attachments/assets/1930b2c2-f129-462e-a73a-c521f36a3bb5)

**Net Revenue versus Month by Warehouse**
![image](https://github.com/user-attachments/assets/9f2dc114-785c-4c85-8d66-29b11c184e15)

- **Monthly Trends**: Revenue tended to peak in July and August for most product categories, with the highest revenue in August, as shown below:
![download (1)](https://github.com/user-attachments/assets/cfc11e1f-b92d-43f4-97ce-f901b1e1c776)

- **Frame and Body** were the parts that generated the overall highest net income, as shown in the table below:
![download](https://github.com/user-attachments/assets/e19ec98c-1727-4aa1-ad3c-3c12dbe926c1)

- **Top Warehouses**: The Central warehouse consistently generated the highest net revenue across multiple product lines, as shown in the table below:
![image](https://github.com/user-attachments/assets/e001374c-d65e-47b0-8e8f-ccdca8981464)

---

## Conclusion
This analysis provides valuable insights into sales performance by product line, month, and warehouse. The results can help the company optimize its sales strategies, improve warehouse efficiency, and refine payment processing methods to maximize revenue.

## How to Run
1. Connect to the company's sales database.
2. Run the provided SQL query.
3. Analyze the output as shown in the sample results above.

---

