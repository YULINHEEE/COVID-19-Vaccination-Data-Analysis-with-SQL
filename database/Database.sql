DROP TABLE source_url;
DROP TABLE source_name;
DROP TABLE country_info;
DROP TABLE country_source;
DROP TABLE vaccine_brand;
DROP TABLE manufacturer_location;
DROP TABLE date;
DROP TABLE us_states_info;
DROP TABLE age_group;
DROP TABLE country_vaccines_brand;
DROP TABLE country_vaccinated_record;
DROP TABLE vaccinations_by_manufacturer;
DROP TABLE age_vaccinated_record;
DROP TABLE us_vaccinated_record;

--(1) source_url
CREATE TABLE source_url (
   source_url VARCHAR(50) NOT NULL PRIMARY KEY
);

--(2)source_name
CREATE TABLE source_name (
   source_url VARCHAR(50) NOT NULL PRIMARY KEY,
   source_name VARCHAR(30) NOT NULL,
   FOREIGN KEY (source_url) REFERENCES source_url (source_url)
);

--(3) country_info

CREATE TABLE country_info  (
    iso_code VARCHAR(30) NOT NULL PRIMARY KEY,
    country_name VARCHAR(30) NOT NULL
);

-- (4) country_source
CREATE TABLE country_source  (
    iso_code VARCHAR(30) NOT NULL PRIMARY KEY,
    source_url VARCHAR(50) NOT NULL,
    FOREIGN KEY (source_url) REFERENCES source_url (source_url)
);
  
--(5) vaccine_brand
CREATE TABLE vaccine_brand  (
    vaccine_brand VARCHAR(30) NOT NULL PRIMARY KEY
);

--(6) manufacturer_location
CREATE TABLE manufacturer_location  (
    location VARCHAR(30) NOT NULL PRIMARY KEY
);

--(7)date
CREATE TABLE date (
   year INTEGER NOT NULL,
   month INTEGER NOT NULL,
   day INTEGER NOT NULL,
   PRIMARY KEY (year, month, day)
);

--(8) us_states_info
CREATE TABLE us_states_info  (
    states_name VARCHAR(30) NOT NULL PRIMARY KEY
);


--(9) age_group
CREATE TABLE age_group  (
    age_range VARCHAR(30) NOT NULL PRIMARY KEY
);


--(10) country_vaccines_brand
DROP TABLE country_vaccines_brand;
CREATE TABLE country_vaccines_brand (
    iso_code VARCHAR(30) NOT NULL,
    year INTEGER NOT NULL,
    month INTEGER NOT NULL,
    day INTEGER NOT NULL,
    vaccine_brand VARCHAR(30) NOT NULL,
    FOREIGN KEY (iso_code) REFERENCES country_info (iso_code),
    FOREIGN KEY (year, month, day) REFERENCES date (year, month, day),
    FOREIGN KEY (vaccine_brand) REFERENCES vaccine_brand (vaccine_brand),
    PRIMARY KEY (iso_code, year, month, day)
);

--(11) country_vaccinated_record
CREATE TABLE country_vaccinated_record (
    iso_code VARCHAR(30) NOT NULL,
    year INTEGER NOT NULL,
    month INTEGER NOT NULL,
    day INTEGER NOT NULL,
    people_vaccinated INTEGER NOT NULL,
    people_fully_vaccinated INTEGER NOT NULL,
    total_booster INTEGER NOT NULL,
    FOREIGN KEY (iso_code) REFERENCES country_info (iso_code),
    FOREIGN KEY (year, month, day) REFERENCES date (year, month, day),
    PRIMARY KEY (iso_code, year, month, day)
);

SELECT * FROM country_vaccinated_record;

--(12) vaccinations_by_manufacturer
CREATE TABLE vaccinations_by_manufacturer (
    location VARCHAR(30) NOT NULL,
    vaccine_brand VARCHAR(30) NOT NULL,
    year INTEGER NOT NULL,
    month INTEGER NOT NULL,
    day INTEGER NOT NULL,
    total_vaccination_number INTEGER NOT NULL, 
   FOREIGN KEY (location) REFERENCES manufacturer_location (location),
   FOREIGN KEY (vaccine_brand) REFERENCES vaccine_brand (vaccine_brand),
   FOREIGN KEY (year, month, day) REFERENCES date (year, month, day),
   PRIMARY KEY (location, vaccine_brand, year, month, day)
);

SELECT * FROM vaccinations_by_manufacturer;

--(13) age_vaccinated_record
CREATE TABLE age_vaccinated_record (
    iso_code VARCHAR(30) NOT NULL,
    age_range VARCHAR(30) NOT NULL,
    year INTEGER NOT NULL,
    month INTEGER NOT NULL,
    day INTEGER NOT NULL,
    people_vaccinated_per_hundred INTEGER NOT NULL,
    people_fully_vaccinated_per_hundred INTEGER NOT NULL,
    people_with_booster_per_hundred INTEGER NOT NULL,
    FOREIGN KEY (iso_code) REFERENCES country_info (iso_code),
    FOREIGN KEY (age_range) REFERENCES age_group(age_range),
    FOREIGN KEY (year, month, day) REFERENCES date (year, month, day),
    PRIMARY KEY (iso_code, age_range, year, month, day)
);

SELECT * FROM age_vaccinated_record;

--(14)us_vaccinated_record
CREATE TABLE us_vaccinated_record (
    states_name VARCHAR(30) NOT NULL,
    year INTEGER NOT NULL,
    month INTEGER NOT NULL,
    day INTEGER NOT NULL,
    people_vaccinated INTEGER NOT NULL,
    people_fully_vaccinated INTEGER NOT NULL,
    total_booster INTEGER NOT NULL,
    total_distribute INTEGER NOT NULL,
    FOREIGN KEY (states_name) REFERENCES us_states_info (states_name),
    FOREIGN KEY (year, month, day) REFERENCES date (year, month, day),
    PRIMARY KEY (states_name, year, month, day)
);

