\# Loan Approval Funnel Analysis - Key Findings



Dataset: 1,000,000 loan applications

Tool: PostgreSQL

Goal: Identify what drives loan approval and rejection





\## Overall Approval Rate



* &#x20;Only 300,000 of 1,000,000 applicants were approved - a 30% approval rate
* &#x20;7 in 10 applicants are rejected, making rejection the default outcome
* &#x20;Understanding what separates approved from rejected applicants is the core question





\## Finding 1: Loan Purpose and Property Area Have No Impact



* Approval rate is exactly 30% across all 5 loan purposes (Car, Personal, Home, Education, Business)
* Approval rate is exactly 30% across all 3 property areas (Rural, Semiurban, Urban)
* Decisions are driven entirely by applicant financials, not loan type or location





\## Finding 2: Employment Status Is a Strong Signal



| Employment Status | Approval Rate |

|-------------------|---------------|

| Salaried          | 43.30%        |

| Self-employed     | 23.76%        |

| Contract          | 20.46%        |

| Unemployed        | 0.71%         |



* Salaried applicants are approved at twice the rate of contract workers
* Unemployed applicants are nearly always rejected (0.71%)
* Stable, predictable income is a core requirement for approval



\---



\## Finding 3: Credit Score Is the Single Strongest Predictor



| Credit Band | Approval Rate |

|-------------|---------------|

| Below 500   | 4.25%         |

| 500-649     | 17.51%        |

| 650-749     | 38.91%        |

| 750+        | 65.39%        |



* Applicants above 750 are approved at 15x the rate of those below 500
* The 650 mark is the clear approval threshold in this dataset
* Average DTI also drops as credit score rises - stronger applicants carry less debt







\## Finding 4: DTI Ratio Is the Second Strongest Predictor



| DTI Band  | Approval Rate |

|-----------|---------------|

| Under 20% | 53.21%        |

| 20-34%    | 34.66%        |

| 35-49%    | 20.59%        |

| 50%+      | 7.96%         |



* Applicants with DTI under 20% are approved at 53% — majority get through
* Above 50% DTI, approval drops to 8% — nearly as bad as a sub-500 credit score
* Keeping total debt below a third of income is critical for approval





\## Finding 5: Combined Risk Tier Is the Most Actionable Insight



| Risk Tier   | Total Applicant | Approval Rate | Avg Credit Score | Avg DTI |

|-------------|-----------------|---------------|------------------|---------|

| Low Risk    | 63,924          | 78.12%        | 789              | 0.21    |

| Medium Risk | 345,292         | 44.53%        | 701              | 0.29    |

| High Risk   | 590,784         | 16.30%        | 596              | 0.39    |



* 59% of all applicants are high risk - approved at only 16%
* Low risk applicants (credit score 750+ and DTI under 35%) are approved at 78%
* Credit score and DTI together are far more predictive than either metric alone







\## Recommendations



1\. Flag applicants with credit score below 650 and DTI above 50% early in the funnel 

&#x20;  they have less than 5% chance of approval

2\. Salaried applicants with credit score above 750 and DTI under 20% are the strongest 

&#x20;  segment 78%+ approval rate

3\. Employment status should be weighted heavily in any risk model 

&#x20;  the gap between salaried and contract workers is 23 percentage points

