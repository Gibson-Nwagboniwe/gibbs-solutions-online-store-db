# GIBBS SOLUTIONS: Cloud Retail Database Project

A fictional cloud-based PostgreSQL database for **GIBBS SOLUTIONS**, an online retail company specializing in computers and gadgets. This project simulates a real-world sales and inventory system built for data analysis and reporting.

---

## 🛠️ Tech Stack

- PostgreSQL
- SQL (DDL & DML)
- Linux (VMware)
- Git & GitHub
- Entity Relationship Diagrams (ERD)

---

## 🗂️ Project Structure


gibbs-solutions-online-store-db/ ├── schema/ │ ├── create_tables.sql # SQL to create all tables │ ├── insert_sample_data.sql # Inserts ~150 rows of sample data │ └── sample_queries.sql # Business intelligence SQL queries ├── ERD.png # Entity Relationship Diagram └── README.md # Project documentation.


---

## 💼 What This Database Can Do

- Record and manage sales transactions
- Track product inventory and supplier info
- Analyze top-selling products and low-stock items
- Report on employee sales performance
- Identify high-value customers and trends

---

## ⚙️ How to Set Up the Database

### 1. Clone the Repository
```bash
git clone https://github.com/Gibson-Nwagboniwe/gibbs-solutions-online-store-db.git
cd gibbs-solutions-online-store-db


2. Create the Database

CREATE DATABASE gibbs_store;


3. Run the Schema & Sample Data

psql -U postgres -d gibbs_store -f schema/create_tables.sql
psql -U postgres -d gibbs_store -f schema/insert_sample_data.sql



4. Run the Sample Reports

psql -U postgres -d gibbs_store -f schema/sample_queries.sql



📊 Sample Business Queries
Here are some SQL queries included in this project:

Top 5 Best-Selling Products

Monthly Sales Summary

Top 5 Customers by Spending

Low Stock Product Alerts

Sales by Employee

These queries showcase real-world database reporting and can be customized for various insights.

🌟 Features
✅ Well-structured ERD
✅ Normalized relational schema
✅ Realistic business simulation
✅ 150+ rows of sample data
✅ Insightful SQL queries for analytics

🤝 Author
Gibson Nwagboniwe – Entry-Level Database Administrator
🔗 GitHub

📌 Note
This project is purely educational and intended to demonstrate SQL and data modeling skills in a real-world retail scenario.





---

## ✅ Next Steps
1. Copy the above into your `README.md` file (you can use `nano README.md` or any code editor).
2. Commit and push it to GitHub:
```bash
git add README.md
git commit -m "Add project README"
git push origin main

