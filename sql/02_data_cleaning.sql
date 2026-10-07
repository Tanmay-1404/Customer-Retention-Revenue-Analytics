USE customer_retention;

DROP TABLE IF EXISTS telco_clean;

CREATE TABLE telco_clean AS
SELECT
    TRIM(customerID) AS customer_id,

    TRIM(gender) AS gender,

    CAST(TRIM(SeniorCitizen) AS UNSIGNED)
        AS senior_citizen,

    TRIM(Partner) AS partner,
    TRIM(Dependents) AS dependents,

    CAST(TRIM(tenure) AS UNSIGNED)
        AS tenure_months,

    TRIM(PhoneService) AS phone_service,
    TRIM(MultipleLines) AS multiple_lines,
    TRIM(InternetService) AS internet_service,
    TRIM(OnlineSecurity) AS online_security,
    TRIM(OnlineBackup) AS online_backup,
    TRIM(DeviceProtection) AS device_protection,
    TRIM(TechSupport) AS tech_support,
    TRIM(StreamingTV) AS streaming_tv,
    TRIM(StreamingMovies) AS streaming_movies,

    TRIM(Contract) AS contract,
    TRIM(PaperlessBilling) AS paperless_billing,
    TRIM(PaymentMethod) AS payment_method,

    CAST(TRIM(MonthlyCharges) AS DECIMAL(10,2))
        AS monthly_charges,
    CASE
        WHEN TotalCharges IS NULL
          OR TRIM(TotalCharges) = ''
        THEN 0.00
        ELSE CAST(TRIM(TotalCharges) AS DECIMAL(12,2))
    END AS total_charges,

    TRIM(Churn) AS churn

FROM telco_raw
WHERE customerID IS NOT NULL
  AND TRIM(customerID) <> '';
  
  
  
ALTER TABLE telco_clean
    ADD PRIMARY KEY (customer_id);

CREATE INDEX idx_churn
    ON telco_clean(churn);

CREATE INDEX idx_contract
    ON telco_clean(contract);

CREATE INDEX idx_tenure
    ON telco_clean(tenure_months);

CREATE INDEX idx_internet_service
    ON telco_clean(internet_service);
    


-- Confirm row count
SELECT COUNT(*) AS clean_rows
FROM telco_clean;

-- Check NULL values in important numeric fields
SELECT
    SUM(tenure_months IS NULL) AS null_tenure,
    SUM(monthly_charges IS NULL) AS null_monthly_charges,
    SUM(total_charges IS NULL) AS null_total_charges
FROM telco_clean;

-- Check invalid numeric values
SELECT *
FROM telco_clean
WHERE tenure_months < 0
   OR monthly_charges < 0
   OR total_charges < 0;

-- Check unique customers
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM telco_clean;