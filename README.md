# Olist SQL Analysis

## Overview

This project uses SQL to analyze the **Olist e-commerce dataset**, with a focus on customer spending behavior.

The current analysis identifies the **Top 10 customers by total amount spent**, using customer, order, and payment data.

The analysis combines the following tables:

* `customers` – customer information and identifiers
* `orders` – order-level information and customer relationships
* `order\\\_payments` – payment values associated with each order

The analysis is designed to support customer segmentation, revenue concentration analysis, and identification of high-value customers.

## Business Questions

The SQL analysis addresses the following business question:

> \\\*\\\*Who are the Top 10 customers by total amount spent?\\\*\\\*

This can help the business:

* Identify its highest-value customers.
* Understand revenue concentration among customers.
* Support VIP or loyalty-program strategies.
* Develop targeted retention and marketing campaigns.
* Identify customers who may contribute significantly to overall revenue.

## Key Findings

The SQL query calculates the total amount spent by each customer by:

1. Joining `customers` with `orders` using `customer\\\_id`.
2. Joining `orders` with `order\\\_payments` using `order\\\_id`.
3. Summing `payment\\\_value` for each customer.
4. Sorting customers from highest to lowest total spending.
5. Returning the Top 10 customers.

### Expected Output

The final result contains two columns:

|Column|Description|
|-|-|
|`customer\\\_id`|Unique identifier of the customer|
|`total\\\_spent`|Total payment value associated with the customer's orders|

> \\\*\\\*Note:\\\*\\\* The actual Top 10 customers and their spending amounts depend on the results returned when the SQL query is executed against the Olist database. The provided SQL file contains the query logic but does not include the query output.

## Recommendations

Based on this analysis, the business can consider the following actions:

### 1\. Develop a High-Value Customer Program

Create a VIP or loyalty program for customers with consistently high spending. Potential benefits could include exclusive promotions, early access to offers, or personalized customer service.

### 2\. Focus on Customer Retention

High-value customers can have a significant impact on revenue. Monitor their purchasing activity and develop targeted retention campaigns to encourage repeat purchases.

### 3\. Analyze Purchase Patterns

The Top 10 customer list should be combined with order frequency, product categories, average order value, and purchase recency to better understand what drives high customer value.

### 4\. Expand the Analysis Beyond the Top 10

Compare the Top 10 customers with the Top 100 customers and the broader customer base. This can reveal whether revenue is highly concentrated among a small group of customers.

### 5\. Build a Customer Value Dashboard

The results can be incorporated into a dashboard showing:

* Top customers by spending
* Total revenue by customer
* Average order value
* Number of orders per customer
* Customer purchase frequency
* Revenue contribution by customer segment

## Tools \& Skills

### Tools

* MySQL / SQL
* Olist E-commerce Dataset
* Git / GitHub
* Markdown

### SQL Skills Demonstrated

* `SELECT`
* `JOIN`
* `SUM()`
* `GROUP BY`
* `ORDER BY`
* `LIMIT`
* Table aliases
* Aggregation and customer-level analysis

## Files

|File|Description|
|-|-|
|`query1.sql`|SQL query used to identify the Top 10 customers by total amount spent|
|`README.md`|Project documentation, business question, analysis approach, findings, and recommendations|

## SQL Query

The core analysis uses the following SQL logic:

```sql
USE olist;

SELECT
    c.customer\\\_id,
    SUM(op.payment\\\_value) AS total\\\_spent
FROM customers AS c
JOIN orders AS o
    ON c.customer\\\_id = o.customer\\\_id
JOIN order\\\_payments AS op
    ON o.order\\\_id = op.order\\\_id
GROUP BY c.customer\\\_id
ORDER BY total\\\_spent DESC
LIMIT 10;
```

## Analysis Summary

This analysis demonstrates how SQL can transform transactional data into actionable customer insights. By identifying the customers with the highest total spending, the business can prioritize retention, personalization, and customer-value strategies.

**Next step:** Execute the query and add the actual Top 10 customer results to the `Key Findings` section for a complete analysis.



