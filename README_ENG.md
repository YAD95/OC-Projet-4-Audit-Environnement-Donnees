🇬🇧 English | readme en français 👉 [🇫🇷 Français](README_FR.md)
# 🏪 SuperSmartMarket – Data Environment Audit

Project completed as part of the **Data Engineer – OpenClassrooms** training program.

This project consists of auditing a decision-support data environment (OLAP) in order to identify inconsistencies in business indicators, especially **revenue**, and then propose recommendations to improve data quality and reliability.

---

## ---Project Objectives---

The objectives of this project are:

- understand a company's data architecture
- analyze data quality and consistency
- identify the causes of inconsistencies in business indicators
- rebuild a local database prototype (POC)
- validate data using SQL queries
- analyze logs to understand data modifications
- propose recommendations to improve the system

---

## ---Business Context---

The company **SuperSmartMarket** uses a decision-support architecture based on:

- a relational database
- a data warehouse (**OLAP**)
- a visualization tool (**Power BI**)

The data is used to analyze business performance and personalize the customer experience.

However, inconsistencies were observed in **revenue**, which changes for the same date.

---

## ---Data Architecture---

Data flow:

Sources systems → ETL → OLAP Warehouse → Power BI

The audit helped understand:

- the data structure
- the data ingestion flows
- the transformation points
- the risks related to data quality

---

## ---Project Steps---

### 1. Database analysis

- study of the OLAP flat file
- creation of a **data dictionary**
- design of a **relational schema**
- understanding of dimensions and fact tables

---

### 2. Creation of a prototype (POC)

- setup of a local database (**SQLite**)
- table creation
- CSV data import
- data consistency verification

---

### 3. SQL analysis

Queries performed:

- total revenue
- top 10 customers
- revenue by employee

👉 Validated result:
**€284,243.88 for August 14**

---

### 4. Log analysis

- integration of logs into the database
- analysis of actions (INSERT, UPDATE, DELETE)
- understanding of data modifications

👉 Key result:

- some sales were **inserted one day late**
- this delay explains the variation in revenue

---

### 5. Problem identification

The main issue identified is:

❌ **Data integration delay**

- sales from 08/14 were inserted on 08/15
- incomplete revenue during the first calculation
- delayed update of indicators

👉 Identified gap:
**€9,057.29**

---

## ---Audit Results---

### Findings

- revenue inconsistency
- instability of indicators over time
- lack of synchronization in data flows

### Impacts

- loss of reliability in analyses
- risk of poor decision-making
- loss of trust in the data

---

## ---Recommendations---

Several solutions were proposed:

### 1. Price historization

- store prices with a validity period
- guarantee indicator stability over time

### 2. Store the price in the sales table

- add a `unit_price` column
- calculate revenue based on the price at the time of sale

### 3. Log improvement

- better traceability of changes
- add old and new values

### 4. Data quality controls

- constraints on data
- alerts in case of anomalies

👉 These recommendations aim to improve **data reliability** and **analysis quality**

---

## ---Technologies Used---

- **SQL**
- **SQLite**
- **Relational modeling**
- **OLAP**
- **Log analysis**
- **Data Quality**
- **Power BI**

---

## ---Project Deliverables---

### 📊 Presentation

- PowerPoint presentation including:
  - data architecture
  - relational schema
  - SQL results
  - problem analysis
  - recommendations

👉 File: `presentation_powerpoint.pdf`

---

### 📄 Audit Report

- structured document including:
  - findings
  - cause analysis
  - risk assessment
  - recommendations
  - action plan

👉 File: `rapport_audit.pdf`  (audit_report in french)

---

## ---Skills Developed---

This project applies:

- data systems auditing
- data quality analysis
- database modeling
- SQL querying
- log analysis
- understanding OLAP architectures
- data recommendation formulation

---

## ---Conclusion---

This project highlights the importance of **data quality** in decision-support systems.

The analysis identified a critical **integration delay** issue, directly impacting business indicators.

The proposed solutions make it possible to:

- stabilize data
- improve analysis reliability
- strengthen data governance

---

## ---Author---

**YAD95**  
OpenClassrooms Project – Data Engineer
