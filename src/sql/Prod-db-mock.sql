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
  tid VARCHAR(20) NOT NULL REFERENCES "thing",
  category VARCHAR(20) NOT NULL
);

INSERT INTO "user" (uid,name) VALUES ('1','Luke Clarkson');
INSERT INTO "user" (uid,name) VALUES ('2','Nathan Gill');
INSERT INTO "user" (uid,name) VALUES ('3','Wendy Buckland');
INSERT INTO "user" (uid,name) VALUES ('4','Emma Kerr');
INSERT INTO "user" (uid,name) VALUES ('5','Diane Ogden');
INSERT INTO "user" (uid,name) VALUES ('6','Fiona Duncan');
INSERT INTO "user" (uid,name) VALUES ('7','Lucas Ellison');
INSERT INTO "user" (uid,name) VALUES ('8','Lucas Turner');
INSERT INTO "user" (uid,name) VALUES ('9','Nicola Forsyth');
INSERT INTO "user" (uid,name) VALUES ('10','Christopher McLean');
INSERT INTO "user" (uid,name) VALUES ('11','Angela Ince');
INSERT INTO "user" (uid,name) VALUES ('12','Victoria Howard');
INSERT INTO "user" (uid,name) VALUES ('13','Kevin Anderson');
INSERT INTO "user" (uid,name) VALUES ('14','Thomas McGrath');
INSERT INTO "user" (uid,name) VALUES ('15','Lauren Mills');
INSERT INTO "user" (uid,name) VALUES ('16','Stephanie Walsh');
INSERT INTO "user" (uid,name) VALUES ('17','Joseph Graham');
INSERT INTO "user" (uid,name) VALUES ('18','Grace Roberts');
INSERT INTO "user" (uid,name) VALUES ('19','Jason James');
INSERT INTO "user" (uid,name) VALUES ('20','Stephanie Ross');
INSERT INTO "user" (uid,name) VALUES ('21','Benjamin Brown');
INSERT INTO "user" (uid,name) VALUES ('22','Penelope McLean');
INSERT INTO "user" (uid,name) VALUES ('23','Ruth Metcalfe');
INSERT INTO "user" (uid,name) VALUES ('24','Keith Harris');
INSERT INTO "user" (uid,name) VALUES ('25','Owen Taylor');
INSERT INTO "user" (uid,name) VALUES ('26','Alexandra Burgess');
INSERT INTO "user" (uid,name) VALUES ('27','Rebecca Reid');
INSERT INTO "user" (uid,name) VALUES ('28','Dylan Russell');
INSERT INTO "user" (uid,name) VALUES ('29','Trevor Henderson');
INSERT INTO "user" (uid,name) VALUES ('30','Lisa Jones');
INSERT INTO "user" (uid,name) VALUES ('31','Matt Mitchell');
INSERT INTO "user" (uid,name) VALUES ('32','Sam Sutherland');
INSERT INTO "user" (uid,name) VALUES ('33','Ryan Piper');
INSERT INTO "user" (uid,name) VALUES ('34','Edward Peters');
INSERT INTO "user" (uid,name) VALUES ('35','Sam Alsop');
INSERT INTO "user" (uid,name) VALUES ('36','Keith Reid');
INSERT INTO "user" (uid,name) VALUES ('37','Phil Baker');
INSERT INTO "user" (uid,name) VALUES ('38','Jacob Abraham');
INSERT INTO "user" (uid,name) VALUES ('39','Eric Randall');
INSERT INTO "user" (uid,name) VALUES ('40','Michelle Hunter');
INSERT INTO "user" (uid,name) VALUES ('41','Julia Avery');
INSERT INTO "user" (uid,name) VALUES ('42','Diane Bailey');
INSERT INTO "user" (uid,name) VALUES ('43','Ava Cornish');
INSERT INTO "user" (uid,name) VALUES ('44','Rachel Springer');
INSERT INTO "user" (uid,name) VALUES ('45','Donna Sanderson');
INSERT INTO "user" (uid,name) VALUES ('46','Michelle Hardacre');
INSERT INTO "user" (uid,name) VALUES ('47','Grace Hart');
INSERT INTO "user" (uid,name) VALUES ('48','Kevin Edmunds');
INSERT INTO "user" (uid,name) VALUES ('49','Dominic Davidson');
INSERT INTO "user" (uid,name) VALUES ('50','Charles Mackenzie');
INSERT INTO "user" (uid,name) VALUES ('51','Diana Dyer');
INSERT INTO "user" (uid,name) VALUES ('52','Brian Lee');
INSERT INTO "user" (uid,name) VALUES ('53','Lauren Berry');
INSERT INTO "user" (uid,name) VALUES ('54','Thomas Arnold');
INSERT INTO "user" (uid,name) VALUES ('55','Frank Hill');
INSERT INTO "user" (uid,name) VALUES ('56','Yvonne Quinn');
INSERT INTO "user" (uid,name) VALUES ('57','Stephanie Bond');
INSERT INTO "user" (uid,name) VALUES ('58','Dan Tucker');
INSERT INTO "user" (uid,name) VALUES ('59','Isaac McLean');
INSERT INTO "user" (uid,name) VALUES ('60','Neil Russell');
INSERT INTO "user" (uid,name) VALUES ('61','Tracey Mills');
INSERT INTO "user" (uid,name) VALUES ('62','Edward Tucker');
INSERT INTO "user" (uid,name) VALUES ('63','Amy Anderson');
INSERT INTO "user" (uid,name) VALUES ('64','Phil Russell');
INSERT INTO "user" (uid,name) VALUES ('65','Ryan Pullman');
INSERT INTO "user" (uid,name) VALUES ('66','Virginia Sutherland');
INSERT INTO "user" (uid,name) VALUES ('67','Abigail McGrath');
INSERT INTO "user" (uid,name) VALUES ('68','Leonard Fisher');
INSERT INTO "user" (uid,name) VALUES ('69','Yvonne Wilkins');
INSERT INTO "user" (uid,name) VALUES ('70','Abigail Hudson');
INSERT INTO "user" (uid,name) VALUES ('71','Emma Fisher');
INSERT INTO "user" (uid,name) VALUES ('72','Piers Gill');
INSERT INTO "user" (uid,name) VALUES ('73','Stewart Payne');
INSERT INTO "user" (uid,name) VALUES ('74','Kevin Mackay');
INSERT INTO "user" (uid,name) VALUES ('75','Angela Blake');
INSERT INTO "user" (uid,name) VALUES ('76','Nicola Bell');
INSERT INTO "user" (uid,name) VALUES ('77','Joshua Carr');
INSERT INTO "user" (uid,name) VALUES ('78','Sam Anderson');
INSERT INTO "user" (uid,name) VALUES ('79','David Carr');
INSERT INTO "user" (uid,name) VALUES ('80','Emma Mills');
INSERT INTO "user" (uid,name) VALUES ('81','Molly Morrison');
INSERT INTO "user" (uid,name) VALUES ('82','Sally Pullman');
INSERT INTO "user" (uid,name) VALUES ('83','Rose Springer');
INSERT INTO "user" (uid,name) VALUES ('84','Ava Paterson');
INSERT INTO "user" (uid,name) VALUES ('85','Sally Slater');
INSERT INTO "user" (uid,name) VALUES ('86','Megan Baker');
INSERT INTO "user" (uid,name) VALUES ('87','Victoria Marshall');
INSERT INTO "user" (uid,name) VALUES ('88','Lisa Clark');
INSERT INTO "user" (uid,name) VALUES ('89','Victor Powell');
INSERT INTO "user" (uid,name) VALUES ('90','Andrea Turner');
INSERT INTO "user" (uid,name) VALUES ('91','Stewart Chapman');
INSERT INTO "user" (uid,name) VALUES ('92','Matt Howard');
INSERT INTO "user" (uid,name) VALUES ('93','Anthony Clarkson');
INSERT INTO "user" (uid,name) VALUES ('94','Vanessa Scott');
INSERT INTO "user" (uid,name) VALUES ('95','Rebecca Kelly');
INSERT INTO "user" (uid,name) VALUES ('96','Harry Turner');
INSERT INTO "user" (uid,name) VALUES ('97','Felicity Hart');
INSERT INTO "user" (uid,name) VALUES ('98','Christian Forsyth');
INSERT INTO "user" (uid,name) VALUES ('99','Jane Butler');
INSERT INTO "user" (uid,name) VALUES ('100','Diane Morrison');

INSERT INTO "subscribes" (uid, category) VALUES ('1','Animals');
INSERT INTO "subscribes" (uid, category) VALUES ('1','Food Places');
INSERT INTO "subscribes" (uid, category) VALUES ('1','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('2','Animals');
INSERT INTO "subscribes" (uid, category) VALUES ('2','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('4','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('5','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('6','Animals');
INSERT INTO "subscribes" (uid, category) VALUES ('6','Food Places');
INSERT INTO "subscribes" (uid, category) VALUES ('7','Food Places');
INSERT INTO "subscribes" (uid, category) VALUES ('7','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('8','Animals');
INSERT INTO "subscribes" (uid, category) VALUES ('8','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('9','Animals');
INSERT INTO "subscribes" (uid, category) VALUES ('9','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('10','Food Places');
INSERT INTO "subscribes" (uid, category) VALUES ('10','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('12','Animals');
INSERT INTO "subscribes" (uid, category) VALUES ('13','Food Places');
INSERT INTO "subscribes" (uid, category) VALUES ('14','Animals');
INSERT INTO "subscribes" (uid, category) VALUES ('14','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('15','Food Places');
INSERT INTO "subscribes" (uid, category) VALUES ('15','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('16','Animals');
INSERT INTO "subscribes" (uid, category) VALUES ('16','Food Places');
INSERT INTO "subscribes" (uid, category) VALUES ('16','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('17','Animals');
INSERT INTO "subscribes" (uid, category) VALUES ('17','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('18','Animals');
INSERT INTO "subscribes" (uid, category) VALUES ('19','Animals');
INSERT INTO "subscribes" (uid, category) VALUES ('20','Food Places');
INSERT INTO "subscribes" (uid, category) VALUES ('21','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('22','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('23','Animals');
INSERT INTO "subscribes" (uid, category) VALUES ('23','Food Places');
INSERT INTO "subscribes" (uid, category) VALUES ('24','Animals');
INSERT INTO "subscribes" (uid, category) VALUES ('24','Food Places');
INSERT INTO "subscribes" (uid, category) VALUES ('24','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('25','Animals');
INSERT INTO "subscribes" (uid, category) VALUES ('25','Food Places');
INSERT INTO "subscribes" (uid, category) VALUES ('25','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('26','Food Places');
INSERT INTO "subscribes" (uid, category) VALUES ('27','Animals');
INSERT INTO "subscribes" (uid, category) VALUES ('27','Food Places');
INSERT INTO "subscribes" (uid, category) VALUES ('27','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('28','Animals');
INSERT INTO "subscribes" (uid, category) VALUES ('30','Animals');
INSERT INTO "subscribes" (uid, category) VALUES ('30','Food Places');
INSERT INTO "subscribes" (uid, category) VALUES ('30','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('31','Animals');
INSERT INTO "subscribes" (uid, category) VALUES ('31','Food Places');
INSERT INTO "subscribes" (uid, category) VALUES ('31','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('33','Animals');
INSERT INTO "subscribes" (uid, category) VALUES ('33','Food Places');
INSERT INTO "subscribes" (uid, category) VALUES ('33','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('34','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('35','Animals');
INSERT INTO "subscribes" (uid, category) VALUES ('35','Food Places');
INSERT INTO "subscribes" (uid, category) VALUES ('35','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('36','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('37','Animals');
INSERT INTO "subscribes" (uid, category) VALUES ('37','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('38','Animals');
INSERT INTO "subscribes" (uid, category) VALUES ('38','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('39','Animals');
INSERT INTO "subscribes" (uid, category) VALUES ('39','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('40','Animals');
INSERT INTO "subscribes" (uid, category) VALUES ('40','Food Places');
INSERT INTO "subscribes" (uid, category) VALUES ('40','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('41','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('42','Animals');
INSERT INTO "subscribes" (uid, category) VALUES ('42','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('43','Animals');
INSERT INTO "subscribes" (uid, category) VALUES ('43','Food Places');
INSERT INTO "subscribes" (uid, category) VALUES ('44','Animals');
INSERT INTO "subscribes" (uid, category) VALUES ('44','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('46','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('47','Animals');
INSERT INTO "subscribes" (uid, category) VALUES ('47','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('48','Animals');
INSERT INTO "subscribes" (uid, category) VALUES ('48','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('49','Food Places');
INSERT INTO "subscribes" (uid, category) VALUES ('50','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('51','Food Places');
INSERT INTO "subscribes" (uid, category) VALUES ('52','Food Places');
INSERT INTO "subscribes" (uid, category) VALUES ('52','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('53','Food Places');
INSERT INTO "subscribes" (uid, category) VALUES ('53','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('54','Food Places');
INSERT INTO "subscribes" (uid, category) VALUES ('55','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('56','Animals');
INSERT INTO "subscribes" (uid, category) VALUES ('57','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('58','Food Places');
INSERT INTO "subscribes" (uid, category) VALUES ('59','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('60','Animals');
INSERT INTO "subscribes" (uid, category) VALUES ('60','Food Places');
INSERT INTO "subscribes" (uid, category) VALUES ('62','Animals');
INSERT INTO "subscribes" (uid, category) VALUES ('62','Food Places');
INSERT INTO "subscribes" (uid, category) VALUES ('63','Food Places');
INSERT INTO "subscribes" (uid, category) VALUES ('63','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('65','Animals');
INSERT INTO "subscribes" (uid, category) VALUES ('65','Food Places');
INSERT INTO "subscribes" (uid, category) VALUES ('66','Animals');
INSERT INTO "subscribes" (uid, category) VALUES ('66','Food Places');
INSERT INTO "subscribes" (uid, category) VALUES ('68','Animals');
INSERT INTO "subscribes" (uid, category) VALUES ('68','Food Places');
INSERT INTO "subscribes" (uid, category) VALUES ('68','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('70','Animals');
INSERT INTO "subscribes" (uid, category) VALUES ('71','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('73','Animals');
INSERT INTO "subscribes" (uid, category) VALUES ('73','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('75','Animals');
INSERT INTO "subscribes" (uid, category) VALUES ('75','Food Places');
INSERT INTO "subscribes" (uid, category) VALUES ('76','Food Places');
INSERT INTO "subscribes" (uid, category) VALUES ('77','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('78','Animals');
INSERT INTO "subscribes" (uid, category) VALUES ('78','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('79','Food Places');
INSERT INTO "subscribes" (uid, category) VALUES ('79','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('80','Food Places');
INSERT INTO "subscribes" (uid, category) VALUES ('80','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('81','Animals');
INSERT INTO "subscribes" (uid, category) VALUES ('81','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('82','Animals');
INSERT INTO "subscribes" (uid, category) VALUES ('82','Food Places');
INSERT INTO "subscribes" (uid, category) VALUES ('83','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('84','Animals');
INSERT INTO "subscribes" (uid, category) VALUES ('84','Food Places');
INSERT INTO "subscribes" (uid, category) VALUES ('87','Animals');
INSERT INTO "subscribes" (uid, category) VALUES ('88','Animals');
INSERT INTO "subscribes" (uid, category) VALUES ('88','Food Places');
INSERT INTO "subscribes" (uid, category) VALUES ('88','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('89','Animals');
INSERT INTO "subscribes" (uid, category) VALUES ('89','Food Places');
INSERT INTO "subscribes" (uid, category) VALUES ('90','Animals');
INSERT INTO "subscribes" (uid, category) VALUES ('90','Food Places');
INSERT INTO "subscribes" (uid, category) VALUES ('90','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('91','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('92','Food Places');
INSERT INTO "subscribes" (uid, category) VALUES ('93','Animals');
INSERT INTO "subscribes" (uid, category) VALUES ('93','Food Places');
INSERT INTO "subscribes" (uid, category) VALUES ('93','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('95','Animals');
INSERT INTO "subscribes" (uid, category) VALUES ('95','Food Places');
INSERT INTO "subscribes" (uid, category) VALUES ('95','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('96','Food Places');
INSERT INTO "subscribes" (uid, category) VALUES ('96','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('97','Food Places');
INSERT INTO "subscribes" (uid, category) VALUES ('98','Food Places');
INSERT INTO "subscribes" (uid, category) VALUES ('98','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('99','Food Places');
INSERT INTO "subscribes" (uid, category) VALUES ('99','Study Places');
INSERT INTO "subscribes" (uid, category) VALUES ('100','Study Places');

INSERT INTO "thing" (tid,name) VALUES ('1','Cat');
INSERT INTO "thing" (tid,name) VALUES ('2','Dog');
INSERT INTO "thing" (tid,name) VALUES ('3','Deer');
INSERT INTO "thing" (tid,name) VALUES ('4','Fish');
INSERT INTO "thing" (tid,name) VALUES ('5','Freshman');
INSERT INTO "thing" (tid,name) VALUES ('6','Frog');
INSERT INTO "thing" (tid,name) VALUES ('7','Pig');
INSERT INTO "thing" (tid,name) VALUES ('8','Turtle');
INSERT INTO "thing" (tid,name) VALUES ('9','Squirrel');
INSERT INTO "thing" (tid,name) VALUES ('10','Worm');
INSERT INTO "thing" (tid,name) VALUES ('11','Au Bon Pain');
INSERT INTO "thing" (tid,name) VALUES ('12','Bella Union');
INSERT INTO "thing" (tid,name) VALUES ('13','Blue Express');
INSERT INTO "thing" (tid,name) VALUES ('14','Cafe De Novo');
INSERT INTO "thing" (tid,name) VALUES ('15','Chick Fil A');
INSERT INTO "thing" (tid,name) VALUES ('16','Devils Krafthouse');
INSERT INTO "thing" (tid,name) VALUES ('17','Dames Express');
INSERT INTO "thing" (tid,name) VALUES ('18','Divinity Cafe');
INSERT INTO "thing" (tid,name) VALUES ('19','Dolce Vita');
INSERT INTO "thing" (tid,name) VALUES ('20','Farmstead');
INSERT INTO "thing" (tid,name) VALUES ('21','Ginger and Soy');
INSERT INTO "thing" (tid,name) VALUES ('22','Gyotaku');
INSERT INTO "thing" (tid,name) VALUES ('23','Il Forno');
INSERT INTO "thing" (tid,name) VALUES ('24','JBs Roast and Chops');
INSERT INTO "thing" (tid,name) VALUES ('25','Loop Grill');
INSERT INTO "thing" (tid,name) VALUES ('26','MarketPlace');
INSERT INTO "thing" (tid,name) VALUES ('27','McDonalds');
INSERT INTO "thing" (tid,name) VALUES ('28','Nasher Museum Cafe');
INSERT INTO "thing" (tid,name) VALUES ('29','Panda Express');
INSERT INTO "thing" (tid,name) VALUES ('30','Pitchforks');
INSERT INTO "thing" (tid,name) VALUES ('31','Quenchers');
INSERT INTO "thing" (tid,name) VALUES ('32','Red Mango');
INSERT INTO "thing" (tid,name) VALUES ('33','Skillet');
INSERT INTO "thing" (tid,name) VALUES ('34','Sprout');
INSERT INTO "thing" (tid,name) VALUES ('35','Subway');
INSERT INTO "thing" (tid,name) VALUES ('36','Tandoor');
INSERT INTO "thing" (tid,name) VALUES ('37','Twinnies');
INSERT INTO "thing" (tid,name) VALUES ('38','Washington Duke Inn');
INSERT INTO "thing" (tid,name) VALUES ('39','Atrium');
INSERT INTO "thing" (tid,name) VALUES ('40','Bolt');
INSERT INTO "thing" (tid,name) VALUES ('41','Bostock Library');
INSERT INTO "thing" (tid,name) VALUES ('42','Bryan Center');
INSERT INTO "thing" (tid,name) VALUES ('43','Duke Gardens');
INSERT INTO "thing" (tid,name) VALUES ('44','Edens');
INSERT INTO "thing" (tid,name) VALUES ('45','Edge');
INSERT INTO "thing" (tid,name) VALUES ('46','Few Tower');
INSERT INTO "thing" (tid,name) VALUES ('47','Link');
INSERT INTO "thing" (tid,name) VALUES ('48','Lilly Library');
INSERT INTO "thing" (tid,name) VALUES ('49','McClendon Tower');
INSERT INTO "thing" (tid,name) VALUES ('50','Perkins Library');
INSERT INTO "thing" (tid,name) VALUES ('51','Rubenstein Library');
INSERT INTO "thing" (tid,name) VALUES ('52','West Union');

INSERT INTO "directory" (tid,category) VALUES('1','Animals');
INSERT INTO "directory" (tid,category) VALUES('2','Animals');
INSERT INTO "directory" (tid,category) VALUES('3','Animals');
INSERT INTO "directory" (tid,category) VALUES('4','Animals');
INSERT INTO "directory" (tid,category) VALUES('5','Animals');
INSERT INTO "directory" (tid,category) VALUES('6','Animals');
INSERT INTO "directory" (tid,category) VALUES('7','Animals');
INSERT INTO "directory" (tid,category) VALUES('8','Animals');
INSERT INTO "directory" (tid,category) VALUES('9','Animals');
INSERT INTO "directory" (tid,category) VALUES('10','Animals');
INSERT INTO "directory" (tid,category) VALUES('11','Food Places');
INSERT INTO "directory" (tid,category) VALUES('12','Food Places');
INSERT INTO "directory" (tid,category) VALUES('13','Food Places');
INSERT INTO "directory" (tid,category) VALUES('14','Food Places');
INSERT INTO "directory" (tid,category) VALUES('15','Food Places');
INSERT INTO "directory" (tid,category) VALUES('16','Food Places');
INSERT INTO "directory" (tid,category) VALUES('17','Food Places');
INSERT INTO "directory" (tid,category) VALUES('18','Food Places');
INSERT INTO "directory" (tid,category) VALUES('19','Food Places');
INSERT INTO "directory" (tid,category) VALUES('20','Food Places');
INSERT INTO "directory" (tid,category) VALUES('21','Food Places');
INSERT INTO "directory" (tid,category) VALUES('22','Food Places');
INSERT INTO "directory" (tid,category) VALUES('23','Food Places');
INSERT INTO "directory" (tid,category) VALUES('24','Food Places');
INSERT INTO "directory" (tid,category) VALUES('25','Food Places');
INSERT INTO "directory" (tid,category) VALUES('26','Food Places');
INSERT INTO "directory" (tid,category) VALUES('27','Food Places');
INSERT INTO "directory" (tid,category) VALUES('28','Food Places');
INSERT INTO "directory" (tid,category) VALUES('29','Food Places');
INSERT INTO "directory" (tid,category) VALUES('30','Food Places');
INSERT INTO "directory" (tid,category) VALUES('31','Food Places');
INSERT INTO "directory" (tid,category) VALUES('32','Food Places');
INSERT INTO "directory" (tid,category) VALUES('33','Food Places');
INSERT INTO "directory" (tid,category) VALUES('34','Food Places');
INSERT INTO "directory" (tid,category) VALUES('35','Food Places');
INSERT INTO "directory" (tid,category) VALUES('36','Food Places');
INSERT INTO "directory" (tid,category) VALUES('37','Food Places');
INSERT INTO "directory" (tid,category) VALUES('38','Food Places');
INSERT INTO "directory" (tid,category) VALUES('39','Study Places');
INSERT INTO "directory" (tid,category) VALUES('40','Study Places');
INSERT INTO "directory" (tid,category) VALUES('41','Study Places');
INSERT INTO "directory" (tid,category) VALUES('42','Study Places');
INSERT INTO "directory" (tid,category) VALUES('43','Study Places');
INSERT INTO "directory" (tid,category) VALUES('44','Study Places');
INSERT INTO "directory" (tid,category) VALUES('45','Study Places');
INSERT INTO "directory" (tid,category) VALUES('46','Study Places');
INSERT INTO "directory" (tid,category) VALUES('47','Study Places');
INSERT INTO "directory" (tid,category) VALUES('48','Study Places');
INSERT INTO "directory" (tid,category) VALUES('49','Study Places');
INSERT INTO "directory" (tid,category) VALUES('50','Study Places');
INSERT INTO "directory" (tid,category) VALUES('51','Study Places');
INSERT INTO "directory" (tid,category) VALUES('52','Study Places');

INSERT INTO "tags" (tid,tag,freq) VALUES ('1','Meow',3);
INSERT INTO "tags" (tid,tag,freq) VALUES ('1','Kitty',12);
INSERT INTO "tags" (tid,tag,freq) VALUES ('1','Striped',3);
INSERT INTO "tags" (tid,tag,freq) VALUES ('1','Keohane',2);
INSERT INTO "tags" (tid,tag,freq) VALUES ('2','Small',1);
INSERT INTO "tags" (tid,tag,freq) VALUES ('2','Cute',5);
INSERT INTO "tags" (tid,tag,freq) VALUES ('2','Stress Reliever',4);
INSERT INTO "tags" (tid,tag,freq) VALUES ('3','Nighttime',2);
INSERT INTO "tags" (tid,tag,freq) VALUES ('3','Headlights',3);
INSERT INTO "tags" (tid,tag,freq) VALUES ('3','Doe',8);
INSERT INTO "tags" (tid,tag,freq) VALUES ('4','Best pet',2);
INSERT INTO "tags" (tid,tag,freq) VALUES ('4','Goldfish',6);
INSERT INTO "tags" (tid,tag,freq) VALUES ('4','Bowl',2);
INSERT INTO "tags" (tid,tag,freq) VALUES ('4','Tank',8);
INSERT INTO "tags" (tid,tag,freq) VALUES ('4','Water',8);
INSERT INTO "tags" (tid,tag,freq) VALUES ('5','Lmao',1);
INSERT INTO "tags" (tid,tag,freq) VALUES ('5','But actually',1);
INSERT INTO "tags" (tid,tag,freq) VALUES ('5','Lol',6);
INSERT INTO "tags" (tid,tag,freq) VALUES ('5','Rofl',1);
INSERT INTO "tags" (tid,tag,freq) VALUES ('6','Toad',5);
INSERT INTO "tags" (tid,tag,freq) VALUES ('6','Water',6);
INSERT INTO "tags" (tid,tag,freq) VALUES ('6','Pond',2);
INSERT INTO "tags" (tid,tag,freq) VALUES ('7','Bacon',5);
INSERT INTO "tags" (tid,tag,freq) VALUES ('7','Piglet',3);
INSERT INTO "tags" (tid,tag,freq) VALUES ('8','Water',9);
INSERT INTO "tags" (tid,tag,freq) VALUES ('8','Slow',1);
INSERT INTO "tags" (tid,tag,freq) VALUES ('8','Cool',2);
INSERT INTO "tags" (tid,tag,freq) VALUES ('9','Baller',6);
INSERT INTO "tags" (tid,tag,freq) VALUES ('9','Aggressive',8);
INSERT INTO "tags" (tid,tag,freq) VALUES ('9','Alpha',1);
INSERT INTO "tags" (tid,tag,freq) VALUES ('9','Acorn',1);
INSERT INTO "tags" (tid,tag,freq) VALUES ('9','Chasing my food',2);
INSERT INTO "tags" (tid,tag,freq) VALUES ('10','Dirt',3);
INSERT INTO "tags" (tid,tag,freq) VALUES ('10','Dope',14);
INSERT INTO "tags" (tid,tag,freq) VALUES ('11','Fast',8);
INSERT INTO "tags" (tid,tag,freq) VALUES ('11','On the go',5);
INSERT INTO "tags" (tid,tag,freq) VALUES ('11','Not cheap',6);
INSERT INTO "tags" (tid,tag,freq) VALUES ('12','Convenient',13);
INSERT INTO "tags" (tid,tag,freq) VALUES ('12','Snacks',9);
INSERT INTO "tags" (tid,tag,freq) VALUES ('13','Unknown',2);
INSERT INTO "tags" (tid,tag,freq) VALUES ('13','LSRC',3);
INSERT INTO "tags" (tid,tag,freq) VALUES ('14','Very good',5);
INSERT INTO "tags" (tid,tag,freq) VALUES ('14','Food',13);
INSERT INTO "tags" (tid,tag,freq) VALUES ('15','Hospital',7);
INSERT INTO "tags" (tid,tag,freq) VALUES ('15','Better than McD',3);
INSERT INTO "tags" (tid,tag,freq) VALUES ('16','Beers',2);
INSERT INTO "tags" (tid,tag,freq) VALUES ('16','TV',9);
INSERT INTO "tags" (tid,tag,freq) VALUES ('16','Drinks',3);
INSERT INTO "tags" (tid,tag,freq) VALUES ('17','Expensive',3);
INSERT INTO "tags" (tid,tag,freq) VALUES ('17','Central',6);
INSERT INTO "tags" (tid,tag,freq) VALUES ('18','Grilled Cheese',4);
INSERT INTO "tags" (tid,tag,freq) VALUES ('19','French Science',2);
INSERT INTO "tags" (tid,tag,freq) VALUES ('19','Snacks',3);
INSERT INTO "tags" (tid,tag,freq) VALUES ('20','Not cheap',11);
INSERT INTO "tags" (tid,tag,freq) VALUES ('21','Panda Equivalent',5);
INSERT INTO "tags" (tid,tag,freq) VALUES ('21','Ramen',4);
INSERT INTO "tags" (tid,tag,freq) VALUES ('21','Asian',3);
INSERT INTO "tags" (tid,tag,freq) VALUES ('22','Sushi',1);
INSERT INTO "tags" (tid,tag,freq) VALUES ('22','Rolls',1);
INSERT INTO "tags" (tid,tag,freq) VALUES ('22','Mm',5);
INSERT INTO "tags" (tid,tag,freq) VALUES ('23','Pizza',1);
INSERT INTO "tags" (tid,tag,freq) VALUES ('23','Wings',2);
INSERT INTO "tags" (tid,tag,freq) VALUES ('23','Grill',6);
INSERT INTO "tags" (tid,tag,freq) VALUES ('24','Steak',2);
INSERT INTO "tags" (tid,tag,freq) VALUES ('25','Empty',5);
INSERT INTO "tags" (tid,tag,freq) VALUES ('26','Freshman 15',7);
INSERT INTO "tags" (tid,tag,freq) VALUES ('26','All you can eat',4);
INSERT INTO "tags" (tid,tag,freq) VALUES ('27','Cheap',5);
INSERT INTO "tags" (tid,tag,freq) VALUES ('27','Im Lovin It',2);
INSERT INTO "tags" (tid,tag,freq) VALUES ('28','Fancy Living',1);
INSERT INTO "tags" (tid,tag,freq) VALUES ('29','Go to',5);
INSERT INTO "tags" (tid,tag,freq) VALUES ('29','Asian American',5);
INSERT INTO "tags" (tid,tag,freq) VALUES ('30','Cafe Edens',6);
INSERT INTO "tags" (tid,tag,freq) VALUES ('30','Late night',2);
INSERT INTO "tags" (tid,tag,freq) VALUES ('31','Post workout',3);
INSERT INTO "tags" (tid,tag,freq) VALUES ('31','Pre workout',9);
INSERT INTO "tags" (tid,tag,freq) VALUES ('31','Gains',5);
INSERT INTO "tags" (tid,tag,freq) VALUES ('32','Froyo',11);
INSERT INTO "tags" (tid,tag,freq) VALUES ('32','Shakes',7);
INSERT INTO "tags" (tid,tag,freq) VALUES ('33','Chicken',1);
INSERT INTO "tags" (tid,tag,freq) VALUES ('34','Healthy',2);
INSERT INTO "tags" (tid,tag,freq) VALUES ('35','Hospital',3);
INSERT INTO "tags" (tid,tag,freq) VALUES ('35','5 dollar footlong',2);
INSERT INTO "tags" (tid,tag,freq) VALUES ('36','Indian',3);
INSERT INTO "tags" (tid,tag,freq) VALUES ('36','Cuisine',7);
INSERT INTO "tags" (tid,tag,freq) VALUES ('36','Curry',8);
INSERT INTO "tags" (tid,tag,freq) VALUES ('37','Engineers',2);
INSERT INTO "tags" (tid,tag,freq) VALUES ('38','Fancy Living',6);
INSERT INTO "tags" (tid,tag,freq) VALUES ('38','Rolling in the money',1);
INSERT INTO "tags" (tid,tag,freq) VALUES ('38','Extra Food Points',6);
INSERT INTO "tags" (tid,tag,freq) VALUES ('39','Quiet',1);
INSERT INTO "tags" (tid,tag,freq) VALUES ('39','Glass box',2);
INSERT INTO "tags" (tid,tag,freq) VALUES ('40','Video Games',4);
INSERT INTO "tags" (tid,tag,freq) VALUES ('40','Gamers',9);
INSERT INTO "tags" (tid,tag,freq) VALUES ('41','Super quiet',3);
INSERT INTO "tags" (tid,tag,freq) VALUES ('41','shhhh',10);
INSERT INTO "tags" (tid,tag,freq) VALUES ('42','Empty at night',7);
INSERT INTO "tags" (tid,tag,freq) VALUES ('42','Late night McD',8);
INSERT INTO "tags" (tid,tag,freq) VALUES ('43','Beautiful',4);
INSERT INTO "tags" (tid,tag,freq) VALUES ('43','Views',2);
INSERT INTO "tags" (tid,tag,freq) VALUES ('43','Garden',1);
INSERT INTO "tags" (tid,tag,freq) VALUES ('43','Best study spot',12);
INSERT INTO "tags" (tid,tag,freq) VALUES ('44','Dorm',3);
INSERT INTO "tags" (tid,tag,freq) VALUES ('44','Common Room',8);
INSERT INTO "tags" (tid,tag,freq) VALUES ('45','Engineer Home',1);
INSERT INTO "tags" (tid,tag,freq) VALUES ('45','Always full',8);
INSERT INTO "tags" (tid,tag,freq) VALUES ('46','Views',1);
INSERT INTO "tags" (tid,tag,freq) VALUES ('46','Sunset',2);
INSERT INTO "tags" (tid,tag,freq) VALUES ('46','Common Room',7);
INSERT INTO "tags" (tid,tag,freq) VALUES ('47','CS Major Home',1);
INSERT INTO "tags" (tid,tag,freq) VALUES ('47','Sauna',4);
INSERT INTO "tags" (tid,tag,freq) VALUES ('47','Vending Machines',7);
INSERT INTO "tags" (tid,tag,freq) VALUES ('48','Freshman',9);
INSERT INTO "tags" (tid,tag,freq) VALUES ('48','Closes at 4??',3);
INSERT INTO "tags" (tid,tag,freq) VALUES ('48','Kinda small',2);
INSERT INTO "tags" (tid,tag,freq) VALUES ('49','Lowkey',3);
INSERT INTO "tags" (tid,tag,freq) VALUES ('49','3rd floor',3);
INSERT INTO "tags" (tid,tag,freq) VALUES ('50','Always full',8);
INSERT INTO "tags" (tid,tag,freq) VALUES ('50','Quiet?',1);
INSERT INTO "tags" (tid,tag,freq) VALUES ('50','Depressing',1);
INSERT INTO "tags" (tid,tag,freq) VALUES ('51','Gothic reading room',6);
INSERT INTO "tags" (tid,tag,freq) VALUES ('51','Undiscovered',1);
INSERT INTO "tags" (tid,tag,freq) VALUES ('52','Food',8);
INSERT INTO "tags" (tid,tag,freq) VALUES ('52','Snacks',6);
INSERT INTO "tags" (tid,tag,freq) VALUES ('52','RIP Food points',4);

INSERT INTO "ratings" (uid,tid,rating,timestamp,media) VALUES('48','32',5,'2015-11-02 17:40:18','Very good');
INSERT INTO "ratings" (uid,tid,rating,timestamp,media) VALUES('51','33',2,'2015-10-24 04:25:42','5/7');
INSERT INTO "ratings" (uid,tid,rating,timestamp,media) VALUES('63','10',1,'2015-06-07 08:10:47','Good');
INSERT INTO "ratings" (uid,tid,rating,timestamp,media) VALUES('96','3',4,'2015-02-24 00:19:01','Ehh');
INSERT INTO "ratings" (uid,tid,rating,timestamp,media) VALUES('50','21',2,'2015-10-16 16:03:24','Horrible');
INSERT INTO "ratings" (uid,tid,rating,timestamp,media) VALUES('95','33',4,'2015-08-01 07:00:12','Yes');
INSERT INTO "ratings" (uid,tid,rating,timestamp,media) VALUES('91','5',5,'2016-06-19 03:08:54','Lit');
INSERT INTO "ratings" (uid,tid,rating,timestamp,media) VALUES('52','29',2,'2015-01-16 21:16:10','No');
INSERT INTO "ratings" (uid,tid,rating,timestamp,media) VALUES('24','22',2,'2015-02-16 05:09:58','Horrible');
INSERT INTO "ratings" (uid,tid,rating,timestamp,media) VALUES('65','37',2,'2015-04-18 18:53:04','Ehh');
INSERT INTO "ratings" (uid,tid,rating,timestamp,media) VALUES('59','49',4,'2016-03-24 00:16:50','Good');
INSERT INTO "ratings" (uid,tid,rating,timestamp,media) VALUES('81','5',2,'2015-03-13 20:29:04','Lit');
INSERT INTO "ratings" (uid,tid,rating,timestamp,media) VALUES('51','23',4,'2015-12-03 11:53:41','Never again');
INSERT INTO "ratings" (uid,tid,rating,timestamp,media) VALUES('72','49',3,'2015-04-28 15:06:51','No');
INSERT INTO "ratings" (uid,tid,rating,timestamp,media) VALUES('63','36',4,'2015-02-18 09:15:48','Horrible');
INSERT INTO "ratings" (uid,tid,rating,timestamp,media) VALUES('4','5',3,'2015-01-17 05:13:48','5/7');
INSERT INTO "ratings" (uid,tid,rating,timestamp,media) VALUES('45','38',1,'2015-10-06 14:55:19','No');
INSERT INTO "ratings" (uid,tid,rating,timestamp,media) VALUES('58','35',3,'2016-05-02 00:32:25','Never again');
INSERT INTO "ratings" (uid,tid,rating,timestamp,media) VALUES('20','20',3,'2016-10-26 13:19:37','Never again');
INSERT INTO "ratings" (uid,tid,rating,timestamp,media) VALUES('23','4',5,'2015-07-27 22:20:48','Ehh');
