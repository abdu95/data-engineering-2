-- delete the schema if exists
DROP SCHEMA IF EXISTS db_X_L_A;

-- Create the schema named 'db_X_L_A;'
CREATE SCHEMA db_X_L_A;

-- Use this schema
USE db_X_L_A;

SHOW VARIABLES LIKE "local_infile";
SET GLOBAL local_infile = ON;


SET FOREIGN_KEY_CHECKS = 0;
-- drop table if exists
DROP TABLE IF EXISTS country_medals;

-- creating athletes_medals table  
CREATE TABLE country_medals (
    ID INT NOT NULL,
	city VARCHAR(60) NOT NULL,
    event_year INT NOT NULL,
    sport VARCHAR(60) NOT NULL,
    discipline VARCHAR(100) NOT NULL,
    event_name VARCHAR(200) NOT NULL,
    athlete VARCHAR(200) NOT NULL,
    gender VARCHAR(100) NOT NULL,
    country_code VARCHAR(10) NOT NULL,
    country VARCHAR(100) NOT NULL,
    event_gender VARCHAR(20) NOT NULL,
    medal VARCHAR(20) NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (country) REFERENCES country_gdppc_population(country_name),
    FOREIGN KEY (country) REFERENCES eu_country_gov_exp_sports(country_name));


-- loading CSV file into country_medals table

LOAD DATA LOCAL INFILE '/Users/xinqi/Desktop/DE2/DE2 Group Project/Data_Sets_Completed/Olympic_medals_1992-2008.csv' 
INTO TABLE country_medals 
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES 
(ID, city, event_year, sport, discipline, event_name, athlete, gender, country_code, country, event_gender, medal);

select count(medal), country from country_medals where event_year = 2008 group by country order by count(medal) desc;



DROP TABLE IF EXISTS country_gdppc_population;

-- creating country_gdppc_population table  
CREATE TABLE country_gdppc_population (
	country_code VARCHAR(60) NOT NULL,
    country_name VARCHAR(100) NOT NULL,
    gdppc DOUBLE NOT NULL,
    population INT NOT NULL,
    PRIMARY KEY (country_name)
);

LOAD DATA LOCAL INFILE '/Users/xinqi/Desktop/DE2/DE2 Group Project/Country_list_gdppc_population.csv' 
INTO TABLE country_gdppc_population
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES 
(country_code, country_name, gdppc, population);


DROP TABLE IF EXISTS eu_country_gov_exp_sports;

-- creating eu_country_gov_exp_sports table  
CREATE TABLE eu_country_gov_exp_sports (
	sports_exp DOUBLE NOT NULL,
    country_name VARCHAR(100) NOT NULL,
    PRIMARY KEY(country_name)
);

LOAD DATA LOCAL INFILE '/Users/xinqi/Desktop/DE2/DE2 Group Project/European_country_gov_exp_sports.csv' 
INTO TABLE eu_country_gov_exp_sports
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES 
(sports_exp, country_name);

SET FOREIGN_KEY_CHECKS = 1;
