# CS 316 Starter Project
Using Node.js, Express.js, AngularJS, Sequelize and PostgreSQL   

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

# Create db
psql CREATE DATABASE cs316_project

# Create and load sample database   
psql cs316_project -af src/sql/sampleDataSet.sql   

```
## SQL files   
All SQL files are located under src/sql.

We used a java program script to generate data for the production dataset. More specifically, we created randomly generated user IDs, names, "things" for each of our categories, and their related tags and comments. We then printed out SQL insert statements for each table by parsing through text files with the generated data, and using a random number generator for IDs and other integers such as ratings and timestamps. Since a thing id (or tid) can be associated with multiple tags, we used a hashmap structure to store data associated with things and their tags.

The key concept was to ensure data was randomized (for example, we used gaussian distribution to generate frequency of tags), and to ensure that all of our references in the schema were captured. We still have room for improvement in generating a more comprehensive set of possible tags/comments, and possibly introducing real data through surveys.

## Roadmap   
1. debug frontend   
2. add post endpoint   
3. more data   
