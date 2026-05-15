-- Approval rate by credit score band
SELECT
    CASE
        WHEN credit_score < 500 THEN '1. Below 500'
        WHEN credit_score < 650 THEN '2. 500-649'
        WHEN credit_score < 750 THEN '3. 650-749'
        ELSE                         '4. 750+'
    END AS credit_band,
    COUNT(*) AS total,
    SUM(CASE WHEN loan_approved = 'Yes' THEN 1 ELSE 0 END) AS approved,
    ROUND(100.0 * SUM(CASE WHEN loan_approved = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS approval_rate_pct,
    ROUND(AVG(dti_ratio), 2) AS avg_dti
FROM loan_applications
GROUP BY credit_band
ORDER BY credit_band;