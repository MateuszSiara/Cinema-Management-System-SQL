# Cinema-Management-System-SQL
A comprehensive relational database system for managing cinema operations (Movies, Screenings, Tickets). Designed with Oracle SQL.
# Cinema Management System (SQL Database) 🎬

![Oracle SQL](https://img.shields.io/badge/Oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-CC2927?style=for-the-badge&logo=oracle&logoColor=white)

A relational database project designed to simulate the backend operations of a multiplex cinema. The system manages movie inventory, actor casts, screening schedules, ticket sales, and financial reporting.

## 📌 Project Overview
This project demonstrates **fundamental engineering skills** in database design, normalization, and SQL programming. It was designed using **Oracle SQL Developer Data Modeler** and implemented in **Oracle Database 11g**.

### Key Features:
* **Relational Design:** Fully normalized database schema (3NF) ensuring data integrity.
* **Complex Relationships:** Implementation of **Many-to-Many** relationships between Movies and Actors (via `Obsada` junction table).
* **Constraints:** Usage of Primary Keys, Foreign Keys, and Not Null constraints to validate data.
* **Analytics:** SQL Views created for automatic financial reporting and repertoire generation.

## 📂 Repository Structure

| File | Description |
| :--- | :--- |
| `01_schema_ddl.sql` | The core DDL script. Creates tables (`Film`, `Seans`, `Bilet`, etc.) and defines relationships. |
| `02_insert_data.sql` | DML script that populates the database with sample data for testing purposes. |
| `03_views_reporting.sql` | Reporting module. Contains `CREATE VIEW` scripts for revenue analysis and scheduling. |
| `erd_diagram.png` | Visual representation of the Entity-Relationship Diagram. |

## 📊 Database Architecture

### Entity-Relationship Diagram (ERD)
The database models the flow: `Movie` <-> `Screening` -> `Ticket`. It also handles the `Movie` <-> `Actor` relationship.

*(Please ensure you uploaded erd_diagram.png to see the image below)*
![ERD Diagram](erd_diagram.png)

### Logical Model
![Logical Model](logic_diagram.png)

## 🚀 How to Run
1.  **Environment:** You need an Oracle Database instance (or any SQL-compatible environment like LiveSQL).
2.  **Execution Order:**
    1.  Run `01_schema_ddl.sql` to build the structure.
    2.  Run `02_insert_data.sql` to load data.
    3.  Run `03_views_reporting.sql` to enable reporting features.
3.  **Testing:**
    Run the following query to see the financial report:
    ```sql
    SELECT * FROM V_Przychody_Filmow;
    ```

## 👨‍💻 Author
**Mateusz Siara**
* Computer Science Student at Military University of Technology (WAT)
* [LinkedIn](https://www.linkedin.com/in/mateusz-siara/) (Optional: Add your link here if you have one)
