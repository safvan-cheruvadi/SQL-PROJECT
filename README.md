# 🏥 Healthcare & Insurance SQL Analytics Project

A structured SQL project focused on real-world healthcare and insurance data analysis using stored procedures, conditional logic, window functions, and patient segmentation techniques.

---

## 📌 Project Overview

This project simulates a data analyst role where business teams — including insurance companies, healthcare departments, and product teams — request specific reports and insights from a relational database. Each problem statement is solved using optimized SQL queries and stored procedures.

---

## 🗂️ Problem Statements

### 1. Insurance Claim Rate Classifier
A stored procedure that accepts a `disease_id` and returns whether that disease is **"claimed higher than average"** or **"claimed lower than average"** by comparing its claim count against the overall average across all diseases.

- Concepts used: Stored Procedure, AVG(), IF-ELSE logic

---

### 2. Gender-wise Treatment Report
A stored procedure that takes a `disease_id` and returns:
- `disease_name`
- `number_of_male_treated`
- `number_of_female_treated`
- `more_treated_gender` — either `'male'`, `'female'`, or `'same'`

- Concepts used: Stored Procedure, COUNT with GROUP BY, CASE statement

---

### 3. Top 3 Most & Least Claimed Insurance Plans
A query that identifies the **top 3 most claimed** and **top 3 least claimed** insurance plans, returning the plan name, insurance company name, and a label indicating whether it is most or least claimed.

- Concepts used: Window Functions (RANK/DENSE_RANK), UNION, Joins

---

### 4. Patient Demographic Segmentation by Disease
A report that identifies which patient category is most affected by each disease. Patients are segmented into 8 categories based on date of birth and gender:

| Category | DOB Range | Gender |
|---|---|---|
| YoungMale / YoungFemale | On or after Jan 1, 2005 | M / F |
| AdultMale / AdultFemale | Jan 1, 1985 – Dec 31, 2004 | M / F |
| MidAgeMale / MidAgeFemale | Jan 1, 1970 – Dec 31, 1984 | M / F |
| ElderMale / ElderFemale | Before Jan 1, 1970 | M / F |

- Concepts used: CASE statements, DATE comparisons, GROUP BY, aggregations

---

### 5. Medicine Pricing Report
A report listing only **"pricey"** (max price > 1000) and **"affordable"** (max price < 5) medicines, showing:
- `companyName`, `productName`, `description`, `maxPrice`, `price_category`

Results sorted in **descending order of maxPrice**.

- Concepts used: CASE statement, WHERE with OR, ORDER BY

---

## 🛠️ Tech Stack

- **Database:** MySQL / SQL Server
- **Concepts:** Stored Procedures, IF-ELSE, CASE, Window Functions, Joins, Aggregations, Date Functions, Patient Segmentation

---

## 📁 Project Structure

```
├── schema/
│   └── qustions.docx       # Table definitions
├── solutions/
│   ├── qustion 1_claim_classifie.sql
│   ├── qustion 2_gender_report.sql
│   ├── qustion 3_top_insurance_plans.sql
│   ├── qustion 4_patient_segmentation.sql
│   └── qustion 5_medicine_pricing.sql
└── README.md
```

---

## 🚀 How to Run

1. Clone the repository
   ```bash
   git clone https://github.com/safvan-cheruvadi/SQL-PROJECT.git
   ```
2. Import the database schema from `schema/qustions.docx`
3. Run individual solution files from the `solutions/` folder in your SQL client (MySQL Workbench / SSMS / DBeaver)

---

## 🎯 Key Learnings

- Writing reusable stored procedures with dynamic input handling
- Applying IF-ELSE and CASE logic for conditional reporting
- Using window functions for ranking and top-N analysis
- Segmenting data based on age groups and demographic attributes
- Building business-ready reports from raw relational data

---

## 👤 Author

**SAFVAN**  
[LinkedIn](https://linkedin.com/in/your-profile) • [GitHub](https://github.com/your-username)
