-- Rejection rate by education level
SELECT
    education_level,
    COUNT(*) AS total,
    SUM(CASE WHEN loan_approved = 'No' THEN 1 ELSE 0 END) AS rejected,
    ROUND(100.0 * SUM(CASE WHEN loan_approved = 'No' THEN 1 ELSE 0 END) / COUNT(*), 2) AS rejection_rate_pct
FROM loan_applications
GROUP BY education_level
ORDER BY rejection_rate_pct DESC;

-- Combined risk tier: credit score + DTI
SELECT
    CASE
        WHEN credit_score >= 750 AND dti_ratio < 0.35 THEN '1. Low Risk'
        WHEN credit_score >= 650 AND dti_ratio < 0.50 THEN '2. Medium Risk'
        ELSE '3. High Risk'
    END AS risk_tier,
    COUNT(*) AS total,
    SUM(CASE WHEN loan_approved = 'Yes' THEN 1 ELSE 0 END) AS approved,
    ROUND(100.0 * SUM(CASE WHEN loan_approved = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS approval_rate_pct,
    ROUND(AVG(credit_score), 0) AS avg_credit_score,
    ROUND(AVG(dti_ratio), 2)    AS avg_dti
FROM loan_applications
GROUP BY risk_tier
ORDER BY risk_tier;