
USE customer_retention;

SELECT
    COUNT(*) AS total_customers,

    SUM(churn = 'No') AS current_customers,

    SUM(churn = 'Yes') AS churned_customers,

    ROUND(
        100.0 * SUM(churn = 'Yes') / COUNT(*),
        2
    ) AS churn_rate_pct,

    ROUND(
        SUM(CASE
            WHEN churn = 'No'
            THEN monthly_charges
            ELSE 0
        END),
        2
    ) AS active_monthly_revenue,

    ROUND(AVG(monthly_charges), 2)
        AS avg_monthly_charge,

    ROUND(AVG(tenure_months), 2)
        AS avg_tenure_months

FROM telco_clean;



SELECT
    contract,

    COUNT(*) AS total_customers,

    SUM(churn = 'Yes') AS churned_customers,

    ROUND(
        100.0 * SUM(churn = 'Yes') / COUNT(*),
        2
    ) AS churn_rate_pct,

    ROUND(
        SUM(CASE
            WHEN churn = 'Yes'
            THEN monthly_charges
            ELSE 0
        END),
        2
    ) AS churned_monthly_revenue

FROM telco_clean
GROUP BY contract
ORDER BY churn_rate_pct DESC;



SELECT
    CASE
        WHEN tenure_months <= 12
            THEN '0-12 months'
        WHEN tenure_months <= 24
            THEN '13-24 months'
        WHEN tenure_months <= 48
            THEN '25-48 months'
        ELSE '49+ months'
    END AS tenure_group,

    COUNT(*) AS total_customers,

    SUM(churn = 'Yes') AS churned_customers,

    ROUND(
        100.0 * SUM(churn = 'Yes') / COUNT(*),
        2
    ) AS churn_rate_pct,

    ROUND(AVG(monthly_charges), 2)
        AS avg_monthly_charge

FROM telco_clean
GROUP BY tenure_group
ORDER BY MIN(tenure_months);



SELECT
    payment_method,

    COUNT(*) AS total_customers,

    SUM(churn = 'Yes') AS churned_customers,

    ROUND(
        100.0 * SUM(churn = 'Yes') / COUNT(*),
        2
    ) AS churn_rate_pct,

    ROUND(
        AVG(monthly_charges),
        2
    ) AS avg_monthly_charge

FROM telco_clean
GROUP BY payment_method
ORDER BY churn_rate_pct DESC;



SELECT
    contract,
    internet_service,

    COUNT(*) AS total_customers,

    SUM(churn = 'Yes') AS churned_customers,

    ROUND(
        100.0 * SUM(churn = 'Yes') / COUNT(*),
        2
    ) AS churn_rate_pct,

    ROUND(
        SUM(CASE
            WHEN churn = 'Yes'
            THEN monthly_charges
            ELSE 0
        END),
        2
    ) AS churned_monthly_revenue,

    ROUND(
        SUM(CASE
            WHEN churn = 'No'
            THEN monthly_charges
            ELSE 0
        END),
        2
    ) AS active_monthly_revenue

FROM telco_clean
GROUP BY contract, internet_service
HAVING COUNT(*) >= 30
ORDER BY churned_monthly_revenue DESC;



WITH segment_metrics AS (
    SELECT
        contract,

        COUNT(*) AS total_customers,

        ROUND(
            100.0 * SUM(churn = 'Yes') / COUNT(*),
            2
        ) AS churn_rate_pct,

        ROUND(
            SUM(CASE
                WHEN churn = 'Yes'
                THEN monthly_charges
                ELSE 0
            END),
            2
        ) AS churned_monthly_revenue

    FROM telco_clean
    GROUP BY contract
)

SELECT
    contract,
    total_customers,
    churn_rate_pct,
    churned_monthly_revenue,

    DENSE_RANK() OVER (
        ORDER BY churn_rate_pct DESC
    ) AS churn_rate_rank

FROM segment_metrics;