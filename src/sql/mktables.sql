DROP TABLE IF EXISTS "user";
DROP TABLE IF EXISTS "thing";
DROP TABLE IF EXISTS "tags";
DROP TABLE IF EXISTS "ratings";
DROP TABLE IF EXISTS "subscribes";
DROP TABLE IF EXISTS "directory";


CREATE TABLE IF NOT EXISTS "user" (
  uid VARCHAR(20)  NOT NULL PRIMARY KEY,
  name VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS "thing" (
  tid VARCHAR(20) NOT NULL PRIMARY KEY,
  name VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS "tags" (
  tid VARCHAR(20) NOT NULL REFERENCES "thing",
  tag VARCHAR(15) NOT NULL,
  freq INT NOT NULL,
  PRIMARY KEY (tid,tag)
);

CREATE TABLE IF NOT EXISTS "ratings" (
  uid VARCHAR(20) NOT NULL REFERENCES "user",
  tid VARCHAR(20) NOT NULL REFERENCES "thing",
  rating INT NOT NULL CHECK (rating>=0 AND rating<=5),
  timestamp VARCHAR(30) NOT NULL,
  media TEXT
);
