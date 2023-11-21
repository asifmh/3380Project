CREATE TABLE "vehicle" (
	"VIN"	TEXT NOT NULL,
	"Model_year"	INTEGER,
	"Model"	TEXT ,
	"Make"	TEXT ,
	PRIMARY KEY("VIN")
);

CREATE TABLE "vehicleDetail" (
	"VIN"	TEXT,
	"Model"	TEXT,
	"Model_year"	INTEGER,
	"Make"	TEXT,
	"electRange"	INTEGER,
	"base_msrp"	INTEGER,
	FOREIGN KEY("Model") REFERENCES "vehicle"("Model"),
	FOREIGN KEY("Model_year") REFERENCES "vehicle"("Model_year"),
	FOREIGN KEY("Make") REFERENCES "vehicle"("Make"),
	FOREIGN KEY("VIN") REFERENCES "vehicle"("VIN")
);

CREATE TABLE "altFuel" (
	"Model"	TEXT,
	"Model_year"	INTEGER,
	"Make"	TEXT,
	"CAFV"	TEXT,
	FOREIGN KEY("Make") REFERENCES "vehicle"("Make"),
	FOREIGN KEY("Model") REFERENCES "vehicle"("Model"),
	PRIMARY KEY("Model","Model_year","Make"),
	FOREIGN KEY("Model_year") REFERENCES "vehicle"("Model_year")
);

CREATE TABLE "location"(
    "DOL_ID"	INTEGER NOT NULL UNIQUE,
   	PRIMARY KEY("DOL_ID"),
   	"longitude" DECIMAL(10, 6),
   	"latitude" DECIMAL(10, 6),
   	"State" TEXT,
   	"County" TEXT,
   	"City" TEXT,
   	"Postal_code" INTEGER
);

CREATE TABLE "District"(

    "DOL_ID" INTEGER,
    "longitude"  DECIMAL(10, 6),
    "latitude" DECIMAL(10, 6),
    FOREIGN KEY("DOL_ID") REFERENCES "location"("DOL_ID"),
    FOREIGN KEY("longitude") REFERENCES "location"("longitude"),
    FOREIGN KEY("latitude") REFERENCES "location"("latitude"),
    "Ld" INTEGER,
    PRIMARY KEY(DOL_ID, longitude, latitude)
    );
CREATE TABLE EVData
(
    	"VIN"	TEXT,
	"Model"	TEXT,
	"DOL_ID"	INTEGER,
	"longitude" DECIMAL(10, 6),
   	"latitude" DECIMAL(10, 6),
	"census"  TEXT ,
	FOREIGN KEY("VIN") REFERENCES "vehicle"("VIN")
	FOREIGN KEY("DOL_ID") REFERENCES "District"("DOL_ID"),
	FOREIGN KEY("longitude") REFERENCES "location"("longitude"),
	FOREIGN KEY("latitude") REFERENCES "location"("latitude"),
	PRIMARY KEY(VIN , DOL_ID , longitude , latitude ,  census)
);


