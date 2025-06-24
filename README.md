# COVID-19 Vaccination Data Analysis with SQL
This project demonstrates how to build a relational database from a real-world dataset and use SQL queries to extract meaningful insights from it. The goal is to reinforce data modeling, normalization, database implementation, and querying skills using a publicly available dataset.

# Project Objectives
- Understand and explore a real-world dataset
- Design an Entity-Relationship (ER) diagram
- Normalize and create the database from scratch
- Import data into the relational database
- Develop SQL queries to answer analytical questions
- Visualize query results using Python

# Dataset Description
The original dataset is published by **Our World in Data** as part of a comprehensive global COVID-19 vaccination database.  

[GitHub Repository](https://github.com/owid/covid-19-data/tree/master/public/data/vaccinations)  

[Related Article (Nature)](https://www.nature.com/articles/s41562-021-01122-8)

Dataset documentation: https://github.com/owid/covid-19-data/blob/master/public/data/vaccinations/README.md

**Note**:  
This project does **not** use the full OWID dataset. Instead, we extracted and used a selected subset of data relevant to our analytical goals, including:

- Vaccine administration by country and date  
- Vaccine brands used by each country  
- Age group-level vaccination data (for specific queries only)  
- A few selected countries for comparative analysis

All data transformations and selections were made to simplify the schema design and focus the SQL-based analytical tasks.

# Project Structure
```
project/
│
├── data/                        # Raw source files (.xlsx) from OWID vaccination data
├── database/                    # SQL schema + SQLite database
│   ├── Database.sql
│   └── Vaccinations.db
├── docs/                        # Documentation and ER diagram
│   ├── er_diagram.png
│   └── schema_design.pdf
├── queries/                     # SQL queries
│   └── Queries.sql
├── visualization/               #  Notebooks and Result plots from SQL analysis
│   ├── queries.ipynb
│   ├── task1_top10_difference.png
│   ├── task2_cumulative_doses.png
│   ├── task3_vaccine_type_heatmap.png
│   ├── task4_top10_total_administered.png
│   └── task5_fully_vaccinated_trend.png
└── README.md                   # Project overview
```

# Quering Task
| Task | Description                                                        |
| ---- | ------------------------------------------------------------------ |
| D.1  | Compare vaccine totals between April and May 2022                  |
| D.2  | Identify countries exceeding their average monthly vaccination     |
| D.3  | Show vaccine types adopted by countries                            |
| D.4  | Show total administered vaccines per country                       |
| D.5  | Trend of fully vaccinated people in selected countries (2022–2023) |

# Technologies Used
- Lucidchart
- SQLite
- SQL
- Python (pandas, seaborn, matplotlib)
- Jupyter Notebook

# How to Use
1. Explore the database schema in docs/schema_design.pdf
2. View and run SQL queries in queries/Queries.sql or queries.ipynb
3. Open visualization/queries_and_visualization.ipynb to see query results and plots

## Database Access

The SQLite database file (`Vaccinations.db`) is not included in this repository due to size limits.

You can download it here: [Download Vaccinations.db from OneDrive](https://1drv.ms/u/c/debe48202d2b83cd/ESGERi_W3ftPod79kz8_F6kB9e1uJWulIigOwBBgtCxcPA?e=gwcC8N)

After downloading, place the file in the `database/` folder to run all SQL queries and notebooks.

# Credits
- This project uses data published by **Our World in Data**, available publicly at [https://ourworldindata.org](https://ourworldindata.org).

- The dataset is maintained under the **Creative Commons Attribution 4.0 International License (CC BY 4.0)**, which allows reuse and modification with proper attribution.
