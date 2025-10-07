# 💾 Data Transformer — SQL Project

> 🧠 **Transforming raw data into meaningful insights** using SQL — all in one file!

---

## 🚀 Project Overview

This project demonstrates how to **clean**, **transform**, and **analyze** structured data using **SQL**.
All tasks are consolidated into one file:
📁 **`data_transformer.sql`**

It includes:

1. 🧩 **Dataset creation**
2. 🔄 **Data transformation**
3. 📊 **Insights and aggregation**

---

## 🗂️ Project Structure

| File Name                 | Description                                                                       |
| ------------------------- | --------------------------------------------------------------------------------- |
| 📘 `data_transformer.sql` | Contains all SQL scripts — table creation, transformations, and analysis queries. |
| 📄 `README.md`            | Project overview, instructions, and SQL concepts covered.                         |

---

## 🧩 Step-by-Step Tasks

### 🏗️ Task 1: Dataset Creation

- Create base tables (e.g., Employees, Departments, Sales, or other entities).
- Insert sample data for transformations.
- Ensure clean and normalized schema.

```sql
CREATE TABLE employees (
  emp_id INT PRIMARY KEY,
  emp_name VARCHAR(50),
  dept_id INT,
  salary DECIMAL(10,2)
);
```

---

### 🔄 Task 2: Data Transformation

Perform transformations such as:

- Filtering unnecessary records 🧹
- Calculating derived columns ➕
- Joining multiple tables 🔗
- Aggregating data (SUM, AVG, COUNT, etc.)

```sql
SELECT dept_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY dept_id;
```

---

### 📊 Task 3: Data Insights & Reporting

Generate actionable insights using:

- Ranking & sorting 📈
- Conditional logic (CASE WHEN) ⚙️
- Window functions for advanced analytics 🔍

```sql
SELECT emp_name,
       salary,
       RANK() OVER (ORDER BY salary DESC) AS rank_position
FROM employees;
```

---

## ⚙️ How to Run

1. 🧱 Open your SQL editor (MySQL Workbench / PostgreSQL / SQLite / etc.)
2. 📂 Load `data_transformer.sql`
3. ▶️ Run the queries sequentially
4. 🔍 View results and transformations in your SQL console

---

## 🧠 Learning Objectives

✅ Understand SQL data modeling and schema creation  
✅ Apply transformations and aggregations  
✅ Practice subqueries and window functions  
✅ Generate business insights from raw data

---

## 🌟 Key SQL Concepts Covered

| Concept                 | Example                          |
| ----------------------- | -------------------------------- |
| 🧱 **Table Creation**   | `CREATE TABLE`                   |
| 🔗 **Joins**            | `INNER JOIN`, `LEFT JOIN`        |
| 🧮 **Aggregations**     | `SUM()`, `AVG()`, `COUNT()`      |
| 🧩 **Subqueries**       | `SELECT ... FROM (SELECT ...)`   |
| 📈 **Window Functions** | `RANK() OVER ()`, `ROW_NUMBER()` |

---

## 🧰 Tools Used

- 🐬 MySQL / PostgreSQL / SQLite

---

## 👨‍💻 Author

### **Prath Digital**  
💡 _Data Science & AI/ML Professional_  
🌐 Passionate about data transformation, analytics, and automation.

---

## 📎 File Download

➡️ [Download `data_transformer.sql`](https://github.com/Prath-Digital/SQL_PR.-2-Data-Transformer/releases/download/SQL_PR_2_source_code_latest/data_transformer.sql)
