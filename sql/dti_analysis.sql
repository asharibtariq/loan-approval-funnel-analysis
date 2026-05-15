-- DTI distribution for approved vs rejected
SELECT
    loan_approved,
    ROUND(AVG(dti_ratio), 2)                                        AS avg_dti,
    PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY dti_ratio)         AS p25_dti,
    PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY dti_ratio)         AS median_dti,
    PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY dti_ratio)         AS p75_dti
FROM loan_applications
GROUP BY loan_approved;

-- Approval rate by DTI band
SELECT
    CASE
        WHEN dti_ratio < 0.20 THEN '1. Under 20%'
        WHEN dti_ratio < 0.35 THEN '2. 20-34%'
        WHEN dti_ratio < 0.50 THEN '3. 35-49%'
        ELSE                       '4. 50%+'
    END AS dti_band,
    COUNT(*) AS total,
    SUM(CASE WHEN loan_approved = 'Yes' THEN 1 ELSE 0 END) AS approved,
    ROUND(100.0 * SUM(CASE WHEN loan_approved = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS approval_rate_pct
FROM loan_applications
GROUP BY dti_band
ORDER BY dti_band;