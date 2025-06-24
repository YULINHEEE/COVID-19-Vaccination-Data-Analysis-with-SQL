--Task D.1 Assume we want to know the total number of vaccines administered in each of all countries, and the difference between the administered vaccines for April 2022 and May 2022.

SELECT t1.month AS "Observation Months1(OM1)",
       t1.country_name AS "Country Name(CN)",
       t1.total_vaccinated AS "Administered Vaccine on OM1(VOM1)",
       t2.month AS "Observation Months2(OM2)",
       t2.total_vaccinated AS "Administered Vaccine on OM2(VOM2)",
       t1.total_vaccinated-t2.total_vaccinated AS "Difference of totals(VOM1-VOM2）"
       FROM 
           (SELECT c2.country_name, month, 
           SUM(people_vaccinated + people_fully_vaccinated 
           + total_booster) AS total_vaccinated 
            FROM country_vaccinated_record AS "c1"
            JOIN country_info AS "c2"
            ON c1.iso_code = c2.iso_code
            WHERE year = '2022' AND month IN ('4','5')
            GROUP BY c1.iso_code, month) t1       
        JOIN
            (SELECT c2.country_name, month, 
            SUM(people_vaccinated + people_fully_vaccinated 
            + total_booster) AS total_vaccinated 
                    FROM country_vaccinated_record AS "c1"
                    JOIN country_info AS "c2"
                    ON c1.iso_code = c2.iso_code
                    WHERE year = '2022' AND month IN ('4','5')
                    GROUP BY c1.iso_code, month) t2
    ON t1.country_name = t2.country_name
    AND t1.month = '4'
    AND t2.month = '5';
    

--Task D.2 Find the countries with more than the average cumulative numbers of COVID-19 
-- doses administered by each country in each month. Produces a result set containing 
-- the name of each country and the cumulative number of doses administered in that country.
        
SELECT  c3.country_name AS "Country Name", 
        c1.month ||'/'|| c1.year AS "Month", mon_vac AS "Cumulative Doses"
    FROM 
    (
    SELECT iso_code, year, month,
            SUM(people_fully_vaccinated+people_vaccinated+total_booster) AS mon_vac      
                FROM country_vaccinated_record 
                GROUP BY iso_code, year, month    
) c1 -- sum of each month and each country
    LEFT OUTER JOIN
    (
    SELECT iso_code, COUNT(month), 
        SUM(mon_vac) AS total_vac, 
        SUM(mon_vac)/COUNT(month) AS avg_vac     
            FROM (SELECT iso_code, year, month,
            SUM(people_fully_vaccinated+people_vaccinated+total_booster) AS mon_vac      
                FROM country_vaccinated_record 
                GROUP BY iso_code, year, month) t1
                GROUP BY iso_code    
) c2 -- avg of each country during the whole months
    ON c1.iso_code = c2.iso_code
    JOIN country_info c3
    ON c1.iso_code = c3.iso_code AND c2.iso_code = c3.iso_code
WHERE mon_vac > avg_vac;

-- Task D.3 Produce a list of vaccine types with the countries taking each vaccine type.
-- for vaccinations by manufacturer
SELECT vaccine_brand AS "Vaccine Type",
        location AS "Country"
        FROM vaccinations_by_manufacturer
        GROUP BY location, vaccine_brand
        ORDER BY vaccine_brand;
        
-- Task D.4 Produce a report showing the total number of vaccines administered in each country according to each data source.
SELECT c1.country_name AS [Country Name],
       c2.source_url AS [Source Name (URL)],
       "Total Administered Vaccines"
  FROM country_info c1
       JOIN
       country_source c2 ON c1.iso_code = c2.iso_code
       JOIN
       (
           SELECT iso_code,
                  SUM(people_fully_vaccinated + people_vaccinated + total_booster) AS [Total Administered Vaccines]
             FROM country_vaccinated_record
            GROUP BY iso_code
       )
       c3 ON c1.iso_code = c3.iso_code
 ORDER BY "Total Administered Vaccines";
 
-- Task D.5 lists all the observation months in 2022 and 2023, and then for each months, list the total number of people fully vaccinated

SELECT 
    month ||'/'|| year AS "Date Range (Months)",
    MAX(CASE WHEN country_name = 'United States' THEN num ELSE NULL END) AS "United States",
    MAX(CASE WHEN country_name = 'Wales' THEN num ELSE NULL END) AS "Wales",
    MAX(CASE WHEN country_name = 'Canada' THEN num ELSE NULL END) AS "Canada",
    MAX(CASE WHEN country_name = 'Denmark' THEN num ELSE NULL END) AS "Denmark"
FROM 
    (
    SELECT c2.country_name, year, month, SUM(people_fully_vaccinated) AS "num"
    FROM country_vaccinated_record c1
    JOIN country_info c2
    ON c1.iso_code = c2.iso_code
    WHERE year IN ('2022', '2023')
    AND c1.iso_code IN ('CAN','USA', 'OWID_WLS','DNK')
    GROUP BY c1.iso_code, year, month    
) t
GROUP BY 
    year, month;

    
            