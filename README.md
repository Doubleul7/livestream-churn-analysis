# Livestream E-commerce User Churn and Behavior Data Analysis

This project performs a comprehensive churn and behavioral analysis using user data from a livestream e-commerce platform. The dataset includes user demographics, engagement metrics, satisfaction scores, and churn indicators designed to inform retention strategies and actionable insights.


## Business Background & Problem Statement

(1) Business Context

The livestream e-commerce operations team recently observed an increase in user churn. As illustrated by internal metrics, this month alone recorded 948 churned users, resulting in a churn rate of 16.84%.

(2) Problem Statement

While operations can observe the rising churn, the root causes remain unclear. Facing a large volume of raw user data, the operations team sought help from the data analytics department to investigate churn drivers and provide actionable insights.

## Data

* Data source: [E-commerce User Dataset](https://tianchi.aliyun.com/dataset/124814)
* Format: Excel (.xlsx)
### Field Descriptions

| Field Name           | Description                                                    |
| -------------------- | -------------------------------------------------------------- |
| CustomerID           | Unique identifier for each user                                |
| Churn                | Whether the user churned: 1 = churned, 0 = active              |
| Tenure               | Duration of user activity on the platform (in months)          |
| PreferredLoginDevice | Device used by the user to log into the platform               |
| CityTier             | Classification of the user's city (e.g., Tier 1, Tier 2)       |
| DeliveryDistance     | Distance between warehouse and user's delivery location        |
| AgeGroup             | User's age group (e.g., 2 = 20–29 years)                       |
| MaritalStatus        | User's marital status                                          |
| Gender               | Gender of the user                                             |
| HourSpendOnApp       | Average time user spends per session (in hours)                |
| PreferredOrderType   | User's most frequently selected order type in the past month   |
| SatisfactionScore    | User's satisfaction score (1 to 5 scale)                       |
| FollowedLives        | Number of livestream accounts followed by the user             |
| Complain             | Whether the user submitted negative feedback (0 = No, 1 = Yes) |
| OrderGrowthPercent   | Year-over-year growth in the user's order volume (%)           |
| CouponUsed           | Number of coupons used by the user in the past month           |
| OrderCount           | Total number of orders placed by the user last month           |
| DaySinceLastOrder    | Days since the user's last order                               |

## Analytical Approach

To address the issue of increasing user churn, all users are first divided into two categories: **churned users** and **retained (active) users**. The analysis then proceeds in three key directions:

### 1. Churned User Profiling

Analyze the characteristics of churned users to identify common attributes and behavioral patterns. The goal is to uncover actionable insights that can inform improvements to product features, user experience, or customer engagement strategies.

### 2. Comparative Analysis: Churned vs. Retained Users

Perform multi-dimensional comparisons between churned and retained users across various metrics (e.g., tenure, satisfaction score, usage frequency, recency). This helps to:

* Quantify behavioral differences
* Identify early signs of potential churn in currently retained users
* Support the development of predictive churn models

### 3. Order Growth Strategy

From a business growth perspective, this part explores strategies to increase order volume by:

* Re-engaging loyal but dormant users (retention-side growth)
* Boosting conversions among new users who have not yet placed an order (acquisition-side growth)

### Analytical Framework: RFA Model

To structure the behavioral analysis, a custom-built **RFA model** is developed, inspired by the classic RFM (Recency, Frequency, Monetary) model. It includes:

| Component     | Definition                            | Interpretation                           |
| ------------- | ------------------------------------- | ---------------------------------------- |
| R (Recency)   | Days since the user's last purchase   | Indicates recent activity or inactivity  |
| F (Frequency) | Tenure (months on platform)           | Proxy for user lifecycle and familiarity |
| A (Activity)  | HourSpendOnApp (average session time) | Reflects platform engagement intensity   |

The RFA model enables multi-dimensional segmentation and behavioral comparison, supporting both retention and conversion strategies.

## Objectives

* Segment users into churned and active groups based on purchasing behavior.
* Profile churned users to identify key characteristics driving churn.
* Quantify differences between churned and active users using an RFA (Recency, Frequency, Activity) model.
* Identify at-risk user segments to guide targeted retention strategies.
* Formulate actionable recommendations for increasing retention and conversion.

## Stack

- **Python 3.9**
  - `pandas 2.0`: data wrangling, filtering, aggregation
  - `seaborn 0.12`, `matplotlib 3.7`: data visualization and distribution analysis
- **SQL (SQLite)**: segmentation queries, cohort filtering, logic replication in SQL format
- **Jupyter Notebook / Google Colab**: exploratory environment, interactive visualization
- **Excel (.xlsx)**: original dataset format (Alibaba Tianchi export)

## Results & Visualizations

### 1. Churned vs. Active Distribution

```python
print("Churned Users:", len(df_churned))
print("Active Users:", len(df_active))
```

**Insight:**

* A total of **948 users** have churned out of 5630 users.
* **Churn rate: 16.84%**

---

### 2. Preferred Login Device among Churned Users

<img width="550" height="436" alt="1" src="https://github.com/user-attachments/assets/781de928-dcdd-418b-9777-c4534385ba2d" />

**Insight:**

* Most churned users log in via **Mobile Phone**, followed by Pad and Phone.
* Device type may reflect user journey experience and UI optimization gaps.

---

### 3. City Tier Distribution

<img width="550" height="404" alt="2" src="https://github.com/user-attachments/assets/f5d16a78-e765-440a-ba30-9cee23f4f039" />

**Insight:**

* **Tier 1 cities** dominate churn volume, indicating higher churn risk in large urban markets.

---

### 4. Gender Distribution

<img width="550" height="420" alt="3" src="https://github.com/user-attachments/assets/bbe73a25-6828-49bf-be4a-a5ab8c27dbcf" />

**Insight:**

* **Male users** churn significantly more than female users (approx. 600 vs. 350).

---

### 5. Complaint Distribution

<img width="550" height="404" alt="4" src="https://github.com/user-attachments/assets/9ed8fd5f-fae7-476e-b459-fc45c8076579" />

**Insight:**

* Over **50% of churned users** had filed complaints, suggesting service dissatisfaction is a key churn trigger.

---

### 6. Satisfaction Score Distribution

<img width="550" height="404" alt="5" src="https://github.com/user-attachments/assets/1e3223d7-44b7-4466-9f5b-8bb912a5774d" />

**Insight:**

* While score **3 is the most common**, many churned users had scores of **1–2**, confirming low satisfaction correlates with churn.

---

### 7. Recency: Days Since Last Order

<img width="541" height="402" alt="6" src="https://github.com/user-attachments/assets/4a43a30f-8aa8-4876-88d5-c29c6b845ffd" />

**Insight:**

* Median recency is similar for churned and active users, suggesting **recency alone is not predictive** of churn.

---

### 8. Frequency: Tenure (Months)

<img width="541" height="402" alt="7" src="https://github.com/user-attachments/assets/a232cff4-5a32-4148-a017-0b1a500129da" />

**Insight:**

* Churned users have extremely short tenure: **most within 1–3 months**.
* Tenure is the **most differentiating factor** between groups.

---

## Key Findings

* **948 users** churned out of 5630 → **churn rate = 16.84%**.
* **Mobile Phone** is the most common login device among churned users.
* **Tier 1 cities** dominate churned population → localized strategy needed.
* **Male users** account for \~63% of churned users.
* Over **50% of churned users** have filed complaints → service dissatisfaction.
* Satisfaction scores **≤3** dominate, with score **3 most common**.
* **Recency** (days since last order) is not strongly different between groups.
* **Frequency** (tenure): churned users tend to churn within **first 3 months**.
* **Activity** (app usage time) patterns overlap but are more concentrated in churned users.

## Recommendations

### 1. Target Early-Stage Users (Low Tenure)

* **Issue:** Most churned users leave within 1–3 months.
* **Strategy:**

  * Trigger onboarding incentives (e.g. coupons, free trials) within first 7 days.
  * Monitor activity drop within the first month and apply retention nudges.
  * Implement a milestone-based rewards program for reaching month 2 or 3.

### 2. Resolve Complaint-Driven Churn

* **Issue:** Over 50% of churned users submitted complaints.
* **Strategy:**

  * Route complaints from high-tenure or paying users to senior support agents.
  * Launch a feedback loop: auto-follow-up on low satisfaction or complaint logs.
  * Reward users who submit feedback constructively (e.g. coupons for survey completion).

### 3. Address Dissatisfaction Signals

* **Issue:** Most churners scored satisfaction ≤3.
* **Strategy:**

  * Launch in-app micro-surveys to detect dissatisfaction in real-time.
  * Segment low-score users and deliver satisfaction-improvement drip campaigns.
  * Bundle personalized help center articles or FAQs post-purchase.

### 4. Focus on Tier 1 City Users

* **Issue:** Tier 1 cities have the highest churn count.
* **Strategy:**

  * Run region-specific campaigns highlighting local service improvements.
  * Partner with influencers or livestreamers popular in Tier 1 locations.
  * A/B test pricing transparency or delivery timelines in major metros.

### 5. De-Prioritize Recency as Sole Predictor

* **Insight:** No strong difference in recency distribution between churned and active.
* **Action:**

  * Do not rely on recency alone for churn prediction.
  * Use it in conjunction with tenure, activity, and satisfaction score in predictive modeling.


## SQL Queries

All SQL queries for detailed user segmentation and analysis are stored in the repository file `sql_queries.sql`. Example queries include:

### Dormant Loyal Users Query

Identify users with long tenure who have recently become inactive:

```sql
SELECT *
FROM users
WHERE Tenure > 6
  AND DaySinceLastOrder > 15
  AND (SatisfactionScore <= 3 OR Complain = 1);
```

Purpose: Highlights users at high risk of churn, ideal for targeted re-engagement campaigns.

### New Users Low Engagement Query

Identify recently registered users who haven't made purchases:

```sql
SELECT *
FROM users
WHERE Tenure <= 3
  AND DaySinceLastOrder > 10;
```

Purpose: Pinpoints new users needing onboarding assistance or promotional offers.

## Reproducibility

Follow these steps to reproduce the analysis locally:

### Step 1: Clone Repository and Setup Environment

```bash
git clone https://github.com/your-username/livestream-churn-analysis.git
cd livestream-churn-analysis

# Using conda (recommended)
conda create -n churn-env python=3.9 pandas=2.0 seaborn=0.12 matplotlib=3.7 notebook
conda activate churn-env

# Alternatively, using pip
pip install pandas==2.0 seaborn==0.12 matplotlib==3.7 notebook

# Launch Jupyter Notebook
jupyter notebook
```

### Step 2: Data Preparation and Segmentation

```python
# Check churn distribution
df["Churn"].value_counts()

# Segment users based on churn status
df_churned = df[df["Churn"] == 1]
df_active = df[df["Churn"] == 0]
```

### Step 3: User Profiling Analysis

```python
import matplotlib.pyplot as plt
import seaborn as sns

# Example: Preferred Login Device
plt.figure(figsize=(6,4))
sns.countplot(data=df_churned, x="PreferredLoginDevice")
plt.title("Preferred Login Device among Churned Users")
plt.xlabel("Preferred Login Device")
plt.ylabel("Count")
plt.xticks(rotation=20)
plt.show()
```

Repeat similar visualization code snippets for `CityTier`, `Gender`, `SatisfactionScore` to profile churned users.

### Step 4: RFA (Recency, Frequency, Activity) Analysis

```python
rfa_fields = ["DaySinceLastOrder", "Tenure", "HourSpendOnApp"]

for field in rfa_fields:
    plt.figure(figsize=(6,4))
    sns.boxplot(x="Churn", y=field, data=df)
    plt.title(f"{field} Distribution by Churn")
    plt.xlabel("Churn")
    plt.ylabel(field)
    plt.show()
```

### Step 5: Identifying At-risk User Segments

```python
# Filter at-risk users
at_risk_users = df[
    (df["Tenure"] > 6) &
    (df["DaySinceLastOrder"] > 15) &
    ((df["SatisfactionScore"] <= 3) | (df["Complain"] == 1))
]

# Preview at-risk users
at_risk_users.head()

# Identify new users with low first-order conversion
new_users_low_conversion = df[
    (df["Tenure"] <= 3) &
    (df["DaySinceLastOrder"] > 10)
]

# Preview low-conversion new users
new_users_low_conversion.head()
```
### Step 6: Public Colab Notebook

Access and run the notebook online via [Google Colab]([your_colab_link_here](https://colab.research.google.com/drive/13POkTRazYhdS-U8PVJ31LNDrFkGZ5cMN?usp=sharing)).
