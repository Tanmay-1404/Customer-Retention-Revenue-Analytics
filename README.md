# Customer Retention & Revenue Analytics Dashboard

An end-to-end data analytics project analyzing customer churn, retention patterns, customer segments, and monthly revenue exposure using MySQL and Power BI.

## Project Overview

This project analyzes the IBM Telco Customer Churn dataset containing 7,043 customer records.

The project follows a two-stage analytics workflow:

1. MySQL for data cleaning, validation, and business analysis
2. Power BI for interactive visualization, DAX measures, and dashboarding

## Tech Stack

- MySQL
- Power BI
- DAX
- CSV
- SQL

## Dataset

The project uses the IBM Telco Customer Churn dataset.

The dataset contains customer-level information including:

- Customer demographics
- Tenure
- Contract type
- Internet service
- Payment method
- Monthly charges
- Total charges
- Churn status

## Data Preparation

The raw dataset was imported into MySQL and stored in a raw table.

Data cleaning included:

- Removing unnecessary whitespace
- Converting numeric fields to appropriate data types
- Handling blank TotalCharges values
- Validating customer IDs
- Checking for duplicate records
- Validating numeric ranges

A cleaned `telco_clean` table was created for analysis.

## SQL Analysis

Business analysis was performed using SQL to investigate:

- Overall customer and churn KPIs
- Churn rate by contract type
- Churn rate by customer tenure
- Churn rate by payment method
- Contract and internet-service segments
- Ranking customer segments by churn rate

SQL concepts used include:

- GROUP BY
- HAVING
- CASE statements
- Conditional aggregation
- CTEs
- Window functions
- DENSE_RANK
- Aggregate functions
- Indexes

## Power BI Dashboard

The cleaned dataset was exported to CSV and loaded into Power BI independently of the MySQL connection.

The dashboard includes:

- Total Customers
- Churn Rate
- Active Monthly Revenue
- Churned Monthly Revenue
- Churn Rate by Contract Type
- Churn Rate by Customer Tenure
- Customer Distribution by Tenure
- Customer Segment and Revenue Exposure analysis
- Interactive slicers for Contract, Internet Service, and Payment Method

## DAX

Key DAX measures include:

- Total Customers
- Active Customers
- Churned Customers
- Churn Rate
- Active Monthly Revenue
- Churned Monthly Revenue
- Average Monthly Charge
- Average Tenure
- Churned Revenue Share

## Key Business Questions

The dashboard is designed to answer questions such as:

- Which contract types have the highest churn?
- Which customer tenure groups are most associated with churn?
- Which payment methods are associated with higher churn?
- Which customer segments have the greatest monthly charge exposure?
- How does customer distribution vary across tenure groups?

## Important Data Limitation

The dataset is a customer-level snapshot rather than a time-series transaction dataset.

Therefore, monthly charges are treated as a current billing/revenue proxy, and the project uses the term "Churned Monthly Revenue" rather than claiming actual historical revenue lost.

The analysis identifies associations in the data and does not establish causal relationships.
