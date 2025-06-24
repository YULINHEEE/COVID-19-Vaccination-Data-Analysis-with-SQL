# Data Description

The vaccination dataset includes the following metrics by country and date:

- `people_vaccinated`: Number of individuals who received at least one dose
- `people_fully_vaccinated`: Number of individuals who completed all doses
- `total_booster`: Number of booster doses administered
- `vaccine_brand`: Vaccine types used (e.g. Pfizer, Moderna, Sinopharm, etc.)
- `location`: Country or region name
- `date`: Standardized format (YYYY-MM-DD)
- `age_group`: Age segmentation (for age-based analysis)

The data is provided in various XLSX files and was imported into a relational schema with multiple foreign key relationships.