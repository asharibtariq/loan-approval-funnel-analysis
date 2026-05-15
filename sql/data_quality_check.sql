-- Total row count
SELECT COUNT(*) FROM loan_applications;

-- Null checks across every column
SELECT
    COUNT(*) - COUNT(applicant_income)   AS missing_income,
    COUNT(*) - COUNT(credit_score)       AS missing_credit_score,
    COUNT(*) - COUNT(dti_ratio)          AS missing_dti,
    COUNT(*) - COUNT(loan_approved)      AS missing_outcome,
    COUNT(*) - COUNT(employment_status)  AS missing_employment
FROM loan_applications;

-- Check loan_approved values
SELECT loan_approved, COUNT(*) 
FROM loan_applications 
GROUP BY loan_approved;

-- Outlier check
SELECT 
    MIN(applicant_income),
    MAX(applicant_income),
    ROUND(AVG(applicant_income), 2) AS avg_income,
    MIN(dti_ratio),
    MAX(dti_ratio),
    ROUND(AVG(dti_ratio), 2)        AS avg_dti,
    MIN(credit_score),
    MAX(credit_score),
    ROUND(AVG(credit_score), 2)     AS avg_credit_score
FROM loan_applications;