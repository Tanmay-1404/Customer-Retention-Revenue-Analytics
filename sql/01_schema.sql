CREATE DATABASE IF NOT EXISTS customer_retention;
USE customer_retention;

DROP TABLE IF EXISTS telco_raw;
CREATE TABLE telco_raw (
	customerID VARCHAR(20),
    gender VARCHAR(10),
    SeniorCitizen VARCHAR(5),
    Partner VARCHAR(5),
    Dependents VARCHAR(5),
    tenure VARCHAR(10),
    PhoneService VARCHAR(5),
    MultipleLines VARCHAR(30),
    InternetService VARCHAR(30),
    OnlineSecurity VARCHAR(30),
    OnlineBackup VARCHAR(30),
    DeviceProtection VARCHAR(30),
    TechSupport VARCHAR(30),
    StreamingTV VARCHAR(30),
    StreamingMovies VARCHAR(30),
    Contract VARCHAR(30),
    PaperlessBilling VARCHAR(5),
    PaymentMethod VARCHAR(60),
    MonthlyCharges VARCHAR(30),
    TotalCharges VARCHAR(30),
    Churn VARCHAR(5)
);