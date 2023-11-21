CREATE TABLE "vehicle" (
	"VIN"	TEXT NOT NULL,
	"Model_year"	INTEGER,
	"Model"	TEXT NOT NULL,
	"Make"	TEXT NOT NULL,
	PRIMARY KEY("VIN")
);
CREATE TABLE utility
(
Utility Id  INTEGER primary key ,
postal code Text primary key ,
state text primary key ,
county text primary key ,
city text references  location (city),
utility name  integer NOT NULL,
PRIMARY KEY (city)

);