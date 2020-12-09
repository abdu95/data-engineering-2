# 2008 Summer Olympics: A Use Case Study on Data Product

## Table of Content

* Term project report PDF
* Power point presentation - material for a few minutes presentation
* Knime workflow file
* Source files, which contains 
* SQL Script about loading data

## Reproducibility
Here are the steps to reproduce the full workflow

### Step 1: DB schema and tables

In MySQL workbench, execute queries from `Load_Data_IN_SQL.sql` file. It does the following:
- creates `db_X_L_A` DB schema 
- creates `country_medals`, `country_gdppc_population`, and `eu_country_gov_exp_sports` tables
- loads data to these tables from corresponding CSV files

### Step 2: KNIME Workflow

Import KNIME Workflow from `de2_project_KNIME_Workflow.zip` file. 

### Step 3: Connect to DB

To connect to the database, write username and password for DB server in **MySQL Connector node**. One more Sidenote that should be considered is given at the end of this file.

### Step 4: R Source

Then execute **R Source (Table)** node. After that, all nodes can be executed by clicking **Execute all executable nodes**

### Step 5: File Reader
 
Before executing **File Reader** node, configure it by showing the folder where `gov_10a_exp_1_Data.csv` file is located. Otherwise, it may show *Error: Input file does not exist*

Then, click **Execute all executable nodes**

### Step 6: CSV Writer

To fix 2 nodes with the name **CSV Writer**, show output folder. Otherwise, it may show *Error: directory of output file does not exist*.



### Sidenote
In MySQL Connector node, the following error may occur if user's OS is Windows and has different timezone.

Execute failed: The server time zone value 'Öåíòðàëüíàÿ Åâðîïà (çèìà)' is unrecognized or represents more than one time zone. You must configure either the server or JDBC driver (via the serverTimezone configuration property) to use a more specifc time zone value if you want to utilize time zone support

In that case, the following should be done:
- go to **JDBC parameters** tab of MySQL Connector node
- add new parameter. 

| Name           | Value |
|----------------|-------|
| serverTimezone | UTC   |
