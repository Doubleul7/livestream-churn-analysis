# Livestream E-commerce User Churn Analysis using Simulated Data ([Dataset Link](#))

## Objectives

* Segment users into churned and active groups based on purchasing behavior.
* Profile churned users to identify key characteristics driving churn.
* Quantify differences between churned and active users using an RFA (Recency, Frequency, Activity) model.
* Identify at-risk user segments to guide targeted retention strategies.
* Formulate actionable recommendations for increasing retention and conversion.

## Data

* Simulated e-commerce user behavior dataset in Excel (.xlsx), containing user demographics, engagement metrics, satisfaction scores, complaint history, and churn labels.

## Stack

* Python 3.9

  * pandas 2.0
  * seaborn 0.12
  * matplotlib 3.7
* SQL (SQLite)
* Jupyter Notebook / Google Colab

## Folder Structure

```
livestream-churn-analysis/
├── README.md                   # Project overview and instructions
├── churn_analysis.ipynb        # Main analysis notebook
├── sql_queries.sql             # SQL queries for data segmentation
├── final_report.pdf            # Summary of key findings (optional)
├── visuals/                    # Output plots from analysis
└── data/                       # Original Excel dataset
```

## Key Findings

* **65%** of churned users had tenure less than **3 months**, highlighting early-stage churn risk.
* **Tier 1 cities** accounted for **40%** of churned users, higher than expected.
* Approximately **35%** of churned users submitted complaints, indicating service-related issues.
* Users with tenure greater than **6 months** demonstrated significantly lower churn rates (<10%).

## Recommendations

* Target users with tenure > 6 months and inactivity > 15 days through personalized retention campaigns.
* Provide onboarding discounts for new users (tenure ≤ 3 months) to increase first-order conversions.
* Prioritize customer support outreach to users with complaint history or satisfaction scores ≤ 3.

## Representative SQL Query

```sql
-- Identify dormant, at-risk users for targeted retention
SELECT * FROM users
WHERE Tenure > 6
  AND DaySinceLastOrder > 15
  AND (SatisfactionScore <= 3 OR Complain = 1);
```

## Reproducibility

### Setup

Clone this repository and set up the environment:

```bash
git clone https://github.com/your-username/livestream-churn-analysis.git
cd livestream-churn-analysis

# With conda
conda create -n churn-env python=3.9 pandas seaborn matplotlib jupyter notebook
conda activate churn-env

# With pip
pip install pandas==2.0 seaborn==0.12 matplotlib==3.7 notebook

# Run notebook
jupyter notebook
```

### Public Colab Notebook

[View and run online via Google Colab](your_colab_link_here)
