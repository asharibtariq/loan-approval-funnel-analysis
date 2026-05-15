\# Loan Approval Funnel Analysis



\## Overview

SQL-based analysis of 1 million loan applications to identify the key drivers 

of approval and rejection. Built to simulate the kind of product funnel and 

risk analysis done in fintech environments.



\## Tools

* PostgreSQL
* SQL



\## Dataset

1,000,000 loan applications with fields including credit score, DTI ratio, 

employment status, income, loan purpose, and property area.



\## Key Findings

* Overall approval rate is 30%
* Credit score is the strongest predictor, 4% approval below 500, 65% above 750
* DTI ratio is the second strongest, 53% approval under 20% DTI, 8% above 50%
* Employment status drives a 23-point gap between salaried and contract workers
* Loan purpose and property area have zero impact on approval decisions
* 59% of applicants fall into the high risk tier, approved at only 16%



\## Files

* /sql/data\_quality.sql
* /sql/funnel\_analysis.sql
* /sql/credit\_score\_analysis.sql
* /sql/dti\_analysis.sql
* /sql/rejection\_signals.sql
* /screenshorts/
* findings.md



\## Screenshots



