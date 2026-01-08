# Customer Retention & RFM Analysis

## Project Overview
This project analyzes customer purchasing behavior to understand retention patterns and customer value using SQL and Power BI.

The analysis focuses on:
- Identifying high-value customers using RFM segmentation
- Measuring how long customers take to return for a second purchase
- Translating insights into actionable business recommendations

---

## Dataset Description
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

##  Business Questions
1. Who are the most valuable customers?
2. How quickly do customers return after their first purchase?
3. What portion of customers are at risk of churn?
4. How can retention strategies be improved?

---

## Tools Used
- SQL (MySQL)
- Power BI
- GitHub

---

##  Analysis Approach

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

##  Dashboards

### RFM Segmentation
<img width="1225" height="666" alt="Screenshot 2026-01-07 194013" src="https://github.com/user-attachments/assets/9254e321-3f04-4818-98ac-5e9b981da218" />


### Customer Retention
<img width="1201" height="655" alt="Screenshot 2026-01-07 194200" src="https://github.com/user-attachments/assets/379e78d2-9778-4114-a544-8caae82c4c49" />


### Insights & Recommendations

<img width="1210" height="664" alt="Screenshot 2026-01-07 194330" src="https://github.com/user-attachments/assets/b052a66f-5979-45ac-be42-c6274bb5fc63" />

---

##  Key Insights
- Most customers return after more than 90 days, indicating a long repurchase cycle.
- Average time to second purchase is approximately 133 days.
- Early re-engagement between 30–90 days could improve repeat purchases.

---

##  Recommendations
- Launch reminder or incentive campaigns around the 60–90 day window.
- Personalize offers for slow-returning customers.
- Monitor retention buckets over time to track improvement.


---

##  Business Impact

This analysis helps the business understand customer behavior beyond total sales by identifying:

- High-value customers (Champions) who should be protected and rewarded.
- At-risk and hibernating customers who require re-engagement strategies.
- The typical time it takes customers to return for a second purchase, enabling better-timed marketing campaigns.

By acting on these insights, the business can:
- Improve retention through targeted incentives.
- Increase lifetime value by focusing on loyal segments.
- Reduce churn by intervening before customers disengage.


---


## Business Problem
The business experienced declining customer activity over time.
While new customers were acquired, retention weakened significantly, leading to unstable long-term growth.

The objective of this analysis was to understand customer behavior, 
identify retention patterns, and determine whether the business problem 
was driven by acquisition, retention, or both.


## Dataset Overview
The analysis uses transactional e-commerce data including orders, customers, and purchase history.
Key fields include order date, customer ID, order value, and product details.

## Analysis Approach

SQL used to compute:
  * RFM scores
  * Repeat customers
  * Time to second purchase
  * Monthly revenue, order, and customer trends
    
 Power BI used for:
  * Customer segmentation dashboards
  * Cohort retention matrix
  * KPI tracking

    ## Key Insights
    * Customer retention declines sharply after early cohort months.
    * Revenue can grow temporarily even while customer counts decline.
    * Later cohorts show significantly weaker long-term engagement.
    * Retention issues pose a larger long-term risk than acquisition volume.
   

    ## Recommendations

- Introduce early post-purchase engagement strategies within the first 30–90 days 
  (e.g., onboarding emails, reminders, incentives) to reduce early customer churn.

- Prioritize retention efforts toward high-value customer segments identified through RFM analysis, 
  using loyalty programs or personalized offers to increase repeat purchases.

- Improve customer retention metrics before scaling acquisition spend, 
  ensuring new customers are retained long enough to generate sustainable lifetime value.



  ## Tools Used

- SQL (MySQL) for data extraction, aggregation, and metric calculation
- Power BI for data visualization and dashboard creation
- GitHub for version control and project documentation









