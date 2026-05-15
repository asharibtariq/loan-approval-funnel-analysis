-- Overall approval rate
SELECT
    COUNT(*) AS total_applications,
    SUM(CASE WHEN loan_approved = 'Yes' THEN 1 ELSE 0 END) AS approved,
    SUM(CASE WHEN loan_approved = 'No' THEN 1 ELSE 0 END)  AS rejected,
    ROUND(100.0 * SUM(CASE WHEN loan_approved = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS approval_rate_pct
FROM loan_applications;

-- Approval rate by loan purpose
SELECT
    loan_purpose,
    COUNT(*) AS total,
    SUM(CASE WHEN loan_approved = 'Yes' THEN 1 ELSE 0 END) AS approved,
    ROUND(100.0 * SUM(CASE WHEN loan_approved = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS approval_rate_pct
FROM loan_applications
GROUP BY loan_purpose
ORDER BY approval_rate_pct DESC;

-- Approval rate by employment status
SELECT
    employment_status,
    COUNT(*) AS total,
    SUM(CASE WHEN loan_approved = 'Yes' THEN 1 ELSE 0 END) AS approved,
    ROUND(100.0 * SUM(CASE WHEN loan_approved = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS approval_rate_pct
FROM loan_applications
GROUP BY employment_status
ORDER BY approval_rate_pct DESC;

-- Approval rate by property area
SELECT
    property_area,
    COUNT(*) AS total,
    SUM(CASE WHEN loan_approved = 'Yes' THEN 1 ELSE 0 END) AS approved,
    ROUND(100.0 * SUM(CASE WHEN loan_approved = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS approval_rate_pct
FROM loan_applications
GROUP BY property_area
ORDER BY approval_rate_pct DESC;