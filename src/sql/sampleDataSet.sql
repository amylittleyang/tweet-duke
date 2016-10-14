CREATE TABLE IF NOT EXISTS "user" (
  uid VARCHAR(20)  NOT NULL PRIMARY KEY,
  name VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS "thing" (
  tid VARCHAR(20) NOT NULL PRIMARY KEY,
  name VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS "subscribes" (
  uid VARCHAR(20) NOT NULL REFERENCES "user",
  category VARCHAR(20) NOT NULL,
  PRIMARY KEY(uid,category)
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

CREATE TABLE IF NOT EXISTS "directory" (
  tid INT NOT NULL REFERENCES "thing",
  category VARCHAR(20) NOT NULL
);	


INSERT INTO "user" (uid,name) VALUES ('1673060250799','Britanni');
INSERT INTO "user" (uid,name) VALUES ('1682040740399','Bert');
INSERT INTO "user" (uid,name) VALUES ('1675032949399','Ori');
INSERT INTO "user" (uid,name) VALUES ('1682021109899','Hop');
INSERT INTO "user" (uid,name) VALUES ('1644082877099','Dakota');
INSERT INTO "user" (uid,name) VALUES ('1620020537699','Amethyst');
INSERT INTO "user" (uid,name) VALUES ('1603112032399','Galena');
INSERT INTO "user" (uid,name) VALUES ('1685041900299','Devin');
INSERT INTO "user" (uid,name) VALUES ('1612051679099','Chloe');
INSERT INTO "user" (uid,name) VALUES ('1678101038299','Stacy');
INSERT INTO "user" (uid,name) VALUES ('1611102836299','Jerry');
INSERT INTO "user" (uid,name) VALUES ('1619062501599','Ali');
INSERT INTO "user" (uid,name) VALUES ('1613080940099','Isaiah');
INSERT INTO "user" (uid,name) VALUES ('1647102308099','Odysseus');
INSERT INTO "user" (uid,name) VALUES ('1626062446499','Darrel');
INSERT INTO "user" (uid,name) VALUES ('1687051052699','Nicole');
INSERT INTO "user" (uid,name) VALUES ('1624100694199','Jessica');
INSERT INTO "user" (uid,name) VALUES ('1664021673099','Zena');
INSERT INTO "user" (uid,name) VALUES ('1696032429799','Ciaran');
INSERT INTO "user" (uid,name) VALUES ('1618061610799','Kay');
INSERT INTO "user" (uid,name) VALUES ('1644030741399','Shelby');
INSERT INTO "user" (uid,name) VALUES ('1673060250799','Britanni');

INSERT INTO "subscribes" (uid,category) VALUES ('1673060250799','Food');
INSERT INTO "subscribes" (uid,category) VALUES ('1682040740399','Weekend');
INSERT INTO "subscribes" (uid,category) VALUES ('1675032949399','Weekend');
INSERT INTO "subscribes" (uid,category) VALUES ('1682021109899','Study');
INSERT INTO "subscribes" (uid,category) VALUES ('1644082877099','Food');
INSERT INTO "subscribes" (uid,category) VALUES ('1620020537699','Food');
INSERT INTO "subscribes" (uid,category) VALUES ('1603112032399','Movies');
INSERT INTO "subscribes" (uid,category) VALUES ('1685041900299','Free Shows');
INSERT INTO "subscribes" (uid,category) VALUES ('1612051679099','Entertainment');
INSERT INTO "subscribes" (uid,category) VALUES ('1678101038299','Food');
INSERT INTO "subscribes" (uid,category) VALUES ('1611102836299','Entertainment');

INSERT INTO "ratings" (uid,tid,rating,timestamp,media) VALUES ('1673060250799','Perkins',5,'2016-10-11 09:12:34','Cool');
INSERT INTO "ratings" (uid,tid,rating,timestamp,media) VALUES ('1682040740399','Perkins',3,'2016-10-03 10:53:22','Meh');
INSERT INTO "ratings" (uid,tid,rating,timestamp,media) VALUES ('1675032949399','West Union',5,'2016-09-30 15:32:54','Nice');
INSERT INTO "ratings" (uid,tid,rating,timestamp,media) VALUES ('1682021109899','Rubenstein',4,'2016-09-25 12:12:12','Ehh');
INSERT INTO "ratings" (uid,tid,rating,timestamp,media) VALUES ('1644082877099','Bryan Center',3,'2016-09-30 11:11:11','Bleh');
INSERT INTO "ratings" (uid,tid,rating,timestamp,media) VALUES ('1620020537699','Pitchforks',2,'2016-09-22 23:15:31','Umm');
INSERT INTO "ratings" (uid,tid,rating,timestamp,media) VALUES ('1603112032399','ABP',2,'2016-09-02 07:34:33'),'Okay';
INSERT INTO "ratings" (uid,tid,rating,timestamp,media) VALUES ('1685041900299','Bolt',3,'2016-09-16 22:12:74'),'PCool';
INSERT INTO "ratings" (uid,tid,rating,timestamp,media) VALUES ('1612051679099','Bolt',4,'2016-10-01 03:00:00')'VCool';
INSERT INTO "ratings" (uid,tid,rating,timestamp,media) VALUES ('1678101038299','Cameron Indoor Stadium',5,'2015-04-19 06:30:00','Littt');
INSERT INTO "ratings" (uid,tid,rating,timestamp,media) VALUES ('1611102836299','Link',3,'2016-10-12 11:59:30','No');

INSERT INTO "directory" (tid,category) VALUES('Perkins','Study');
INSERT INTO "directory" (tid,category) VALUES('West Union','Study');
INSERT INTO "directory" (tid,category) VALUES('Rubenstein','Study');
INSERT INTO "directory" (tid,category) VALUES('Bryan Center','Food');
INSERT INTO "directory" (tid,category) VALUES('Pitchforks','Food');
INSERT INTO "directory" (tid,category) VALUES('ABP','Food');
INSERT INTO "directory" (tid,category) VALUES('Bolt','Entertainment');
INSERT INTO "directory" (tid,category) VALUES('Cameron Indoor Stadium','Entertainment');
INSERT INTO "directory" (tid,category) VALUES('Link','Study');

INSERT INTO "tags" (tid,tag,freq) VALUES('Perkins','Quiet',3);
INSERT INTO "tags" (tid,tag,freq) VALUES('Perkins','WeGonLearn',10);
INSERT INTO "tags" (tid,tag,freq) VALUES('Perkins','ColdAF',8);
INSERT INTO "tags" (tid,tag,freq) VALUES('Bolt','ItsLit',4);
INSERT INTO "tags" (tid,tag,freq) VALUES('Pitchforks','RIP',7);
INSERT INTO "tags" (tid,tag,freq) VALUES('Bryan Center','RIP',4);
INSERT INTO "tags" (tid,tag,freq) VALUES('West Union','EatingRoutine',9);
INSERT INTO "tags" (tid,tag,freq) VALUES('Cameron Indoor Stadium','GHTC',24);
INSERT INTO "tags" (tid,tag,freq) VALUES('Link','MidtermSeason',12);
