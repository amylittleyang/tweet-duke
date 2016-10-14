# CS 316 Starter Project
Using Node.js, Express.js, AngularJS, Sequelize and Postgres   
## Run   
```
# Clone project   
git clone git@gitlab.oit.duke.edu:jy152/316-final-project.git  

# Install Dependencies   
cd 316-final-project   
npm install   

# Run   
npm run dev   

# App will be availabe at localhost:3000/   

# Create and load sample database   
psql cs316_project -af /src/sql/sampleDataSet.sql   

```
## SQL files   
All SQL files are located under src/sql. createdb.sql is the script used to define the tables and constraints. test-sample.sql is the test script.

## Roadmap   
1. SQL schema   
2. Create relations   
3. Front end routing    
4. Create test database   
