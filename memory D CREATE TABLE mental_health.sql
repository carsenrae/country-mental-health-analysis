memory D CREATE TABLE mental_health_raw AS
         SELECT *
         FROM read_csv_auto("C:\Users\Carsen Rae Helms\OneDrive\Desktop from Surface Pro\duckdb\mental_health.csv");
memory D SELECT *
         FROM mental_health_raw
         LIMIT 10;
memory D DESCRIBE mental_health_raw;
memory D SELECT Entity, Year, "Depression (%)"
         FROM mental_health_raw
         LIMIT 10;
memory D SELECT DISTINCT Entity
         FROM mental_health_raw
         ORDER BY Entity;
memory D SELECT Entity, Year, "Depression (%)"
         FROM mental_health_raw
         ORDER BY "Depression (%)" DESC
         LIMIT 10;
memory D SELECT Year
         FROM mental_health_raw
         LIMIT 20;
memory D CREATE TABLE mental_health_clean AS
         SELECT *
         FROM mental_health_raw
         WHERE TRY_CAST(Year AS INTEGER) IS NOT NULL;
memory D SELECT Year
         FROM mental_health_clean
         LIMIT 20;
memory D SELECT *
         FROM mental_health_raw
         WHERE TRY_CAST(Year AS INTEGER) IS NULL
         LIMIT 20;
memory D SELECT DISTINCT Year
         FROM mental_health_raw
         ORDER BY Year;
memory D SELECT DISTINCT Year
         FROM mental_health_clean
         ORDER BY Year;
memory D SELECT
             Entity,
             AVG("Depression (%)") AS avg_depression
         FROM mental_health_clean
         GROUP BY Entity
         ORDER BY avg_depression DESC
         LIMIT 10;
memory D SELECT
             Entity,
             MIN("Depression (%)") AS min_dep,
             MAX("Depression (%)") AS max_dep,
             AVG("Depression (%)") AS avg_dep
         FROM mental_health_clean
         WHERE Entity IN ('Greenland', 'Morocco', 'Lesotho')
         GROUP BY Entity;
memory D SELECT
             Entity,
             AVG("Depression (%)") AS avg_dep,
             STDDEV("Depression (%)") AS variability
         FROM mental_health_clean
         WHERE Entity IN ('Greenland', 'Morocco', 'Lesotho')
         GROUP BY Entity;
memory D COPY (
             SELECT
                  CAST(Year AS INTEGER) AS year,
                  Entity,
                  "Depression (%)" AS depression_pct
             FROM mental_health_clean
             WHERE Entity IN ('Greenland', 'Morocco', 'Lesotho')
             ORDER BY Entity, year
         ) TO 'C:\Users\Carsen Rae Helms\OneDrive\Desktop from Surface Pro\Career\top3_depression_trend.csv' WITH (HEADER, DELIMITER ',');
memory D COPY (
             SELECT
                 CAST(Year AS INTEGER) AS year,
                 Entity,
                 AVG("Depression (%)") AS depression_pct
             FROM mental_health_clean
             WHERE Entity IN ('Greenland', 'Morocco', 'Lesotho')
               AND "Depression (%)" IS NOT NULL
             GROUP BY Entity, CAST(Year AS INTEGER)
             ORDER BY Entity, year
         ) TO 'C:\Users\Carsen Rae Helms\OneDrive\Desktop from Surface Pro\Portfolio\Global MH Disorder Trends\top3_depression_trend_b.csv' WITH (HEADER, DELIMITER ',');