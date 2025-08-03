# livestream-churn-analysis
A data-driven user churn and retention analysis project for livestream e-commerce platforms

# 🛍️ Livestream E-commerce User Churn & Behavior Analysis

This project simulates a real-world churn and behavioral analysis for a livestream e-commerce platform. It is designed as a portfolio case to demonstrate my ability in data analysis, SQL querying, user segmentation, and business insight generation — tailored for roles like **Strategy Intern at TikTok E-commerce**.

---

## 🔍 Project Objectives

* Segment users into **churned** and **active** based on behavior
* Analyze the **behavioral traits** of churned users
* Compare groups using a custom **RFA model** (Recency, Frequency, Activity)
* Identify **at-risk segments** & propose **order volume growth strategies**
* Showcase **SQL querying capabilities** alongside Python-based data analysis

---

## 🧰 Tools & Stack

* **Python**: `pandas`, `seaborn`, `matplotlib`
* **SQL**: via `sqlite3` and `%sql` magic in Google Colab
* \*\*Google Colab / Jupyter Notebook\`
* **Excel**: input dataset in `.xlsx` format

---

## 📁 Project Structure

```
livestream-churn-analysis/
├── 📘 README.md                 <- You are here
├── 📓 churn_analysis.ipynb      <- Main analysis notebook (Colab)
├── 📄 final_report.pdf          <- Optional summary report for download
├── 🧮 sql_queries.sql           <- All SQL queries used
├── 📊 visuals/                  <- Saved analysis charts (e.g., churn_by_gender.png)
└── 📂 data/                     <- Original Excel file or link
```

---

## 📊 Key Findings

### ✅ Churned User Profile

* Most churned users are **new users** with less than 3 months tenure
* Churned users tend to be concentrated in **Tier 1 cities**, contrary to expectations
* A significant share of churned users **filed complaints** or gave **low satisfaction scores**

### 📐 RFA Behavior Model Insights

* **F (Tenure)** is the **most predictive** variable: long-term users are far less likely to churn
* **R (Recency)** and **A (App Usage Hours)** showed no strong correlation with churn
* Churn prediction should prioritize tenure-based segmentation and user lifecycle monitoring

### 🧠 Strategic Recommendations

#### 🔁 Retention Strategy: Dormant Loyal Users

* Target users with `Tenure > 6` and `DaySinceLastOrder > 15`
* Offer **personalized cashback incentives** or **reactivation coupons**
* Prioritize those with low satisfaction or complaint history

#### 🎯 Conversion Strategy: New Users at Risk

* Identify new users (`Tenure <= 3`) who haven’t placed orders
* Trigger **first-order discount pushes** or **onboarding tutorials**
* Track early drop-off in funnel via `DaySinceLastOrder`

---

## 🧮 SQL Highlights

We used SQLite within Colab to simulate platform-level behavioral queries:

```sql
-- Dormant loyal users with low satisfaction
SELECT * FROM users
WHERE Tenure > 6
  AND DaySinceLastOrder > 15
  AND (SatisfactionScore <= 3 OR Complain = 1);

-- New users with no follow-up engagement
SELECT * FROM users
WHERE Tenure <= 3
  AND DaySinceLastOrder > 10;
```

These queries enabled segmentation for targeted CRM strategies, mirroring the kind of insight TikTok Strategy teams might surface in internal dashboards.

---

## 📎 Portfolio Integration

* 🔗 [Colab Notebook (view)](your_colab_link_here)
* 📄 Optional: final\_report.pdf or Notion embed
* 🧠 Designed for showcasing Python + SQL + business insight thinking

---

## 💬 About This Project

This project was independently initiated and executed to simulate the work style of a Strategy Analyst at TikTok E-commerce. It reflects proficiency in exploratory analysis, SQL-based data slicing, and e-commerce behavior interpretation.

The entire pipeline was constructed from raw Excel input to segmented strategy recommendations, demonstrating both analytical and product-oriented thinking.
