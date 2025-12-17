# Customer Retention & RFM Analysis

## 📌 Project Overview
This project analyzes customer purchasing behavior to understand retention patterns and customer value using SQL and Power BI.

The analysis focuses on:
- Identifying high-value customers using RFM segmentation
- Measuring how long customers take to return for a second purchase
- Translating insights into actionable business recommendations

---

## 🗂️ Dataset Description
The dataset represents an e-commerce business and includes:
- Customers
- Orders
- Order dates and amounts

Key fields:
- customer_id
- order_id
- order_date
- total_amount

---

## 🧠 Business Questions
1. Who are the most valuable customers?
2. How quickly do customers return after their first purchase?
3. What portion of customers are at risk of churn?
4. How can retention strategies be improved?

---

## 🛠️ Tools Used
- SQL (MySQL)
- Power BI
- GitHub

---

## 🔍 Analysis Approach

### 1. RFM Analysis
- Recency: Days since last purchase
- Frequency: Number of orders
- Monetary: Total spending
Customers were scored and segmented into groups such as Champions, Loyal, and At-Risk.

### 2. Retention Analysis
- Calculated days between first and second purchase
- Grouped customers into return-time buckets (0–30, 31–90, etc.)
- Computed average days to second purchase

---

## 📊 Dashboards

### RFM Segmentation
*(Screenshot)*

### Customer Retention
*(Screenshot)*

### Insights & Recommendations
*(Screenshot)*

---

## 💡 Key Insights
- Most customers return after more than 90 days, indicating a long repurchase cycle.
- Average time to second purchase is approximately 133 days.
- Early re-engagement between 30–90 days could improve repeat purchases.

---

## 📈 Recommendations
- Launch reminder or incentive campaigns around the 60–90 day window.
- Personalize offers for slow-returning customers.
- Monitor retention buckets over time to track improvement.


---

## 📈 Business Impact

This analysis helps the business understand customer behavior beyond total sales by identifying:

- High-value customers (Champions) who should be protected and rewarded.
- At-risk and hibernating customers who require re-engagement strategies.
- The typical time it takes customers to return for a second purchase, enabling better-timed marketing campaigns.

By acting on these insights, the business can:
- Improve retention through targeted incentives.
- Increase lifetime value by focusing on loyal segments.
- Reduce churn by intervening before customers disengage.


---

## 📁 Repository Structure

