# Pharmacy Database System  
**Production-Ready Relational Database Design using SQL Server**

This repository contains a **commercial-grade pharmacy database system** designed and implemented using **Microsoft SQL Server**.  
The project follows **industry best practices** in database design, data integrity, and maintainability, making it suitable for real-world applications as well as academic use.

---

## Project Overview

The Pharmacy Database System is designed to manage the core operational data of a pharmacy, including:

- Customers (Patients)
- Doctors
- Pharmacists
- Prescriptions
- Drugs and Suppliers
- Payments

The database schema is **normalized**, **scalable**, and **ready for integration** with backend systems such as web applications, REST APIs, or enterprise software.

---

## Key Design Principles

- **Identity-based primary keys** (no manual ID handling)
- **Strict foreign key constraints** for data integrity
- **Correct data types** (e.g., National Code stored as `CHAR(10)`, not numeric)
- **Modular SQL scripts** (tables, procedures, database setup)
- **Error-safe Stored Procedures** using `TRY