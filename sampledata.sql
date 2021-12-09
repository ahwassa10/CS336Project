INSERT INTO airport VALUES("EWR", "USA", "3 Brewster RD, Newark NJ, 07114", "Newark Airport");
INSERT INTO airport VALUES("JFK", "USA", "Queens, NY, 11430", "JFK Airport");
INSERT INTO airport VALUES("LAX", "USA", "1 World Way, Los Angeles, CA 90045", "Los Angeles International Airport");
INSERT INTO airport VALUES("SIN", "Singapore", "60 Airport Blvd, 819643", "Singapore Changi Airport");
INSERT INTO airport VALUES("HKG", "Hong Kong", "1 Sky Plaza Rd, Chek Lap Kok", "Hong Kong International Airport");
INSERT INTO airport VALUES("DEL", "India", "New Delhi, Delhi 110037", "Indira Gandhi International Airport");
INSERT INTO airport VALUES("MCO", "USA", "1 Jeff Fuqua Blvd, Orlando, FL 32827", "Orlando International Airport");

INSERT INTO airline VALUES("UA", "United Airlines");
INSERT INTO airline VALUES("AA", "American Airlines");
INSERT INTO airline VALUES("NK", "Spirit Airlines");
INSERT INTO airline VALUES("DL", "Delta Airlines");
INSERT INTO airline VALUES("B6", "JetBlue Airways");
INSERT INTO airline VALUES("ET", "Ethiopian Airlines");
INSERT INTO airline VALUES("F9", "Frontier Airlines");
INSERT INTO airline VALUES("AS", "Alaska Airlines");
INSERT INTO airline VALUES("SQ", "Singapore Airlines");

INSERT INTO associated VALUES("UA", "EWR");
INSERT INTO associated VALUES("NK", "EWR");
INSERT INTO associated VALUES("DL", "EWR");
INSERT INTO associated VALUES("B6", "EWR");
INSERT INTO associated VALUES("F9", "EWR");
INSERT INTO associated VALUES("AS", "EWR");

INSERT INTO associated VALUES("UA", "MCO");
INSERT INTO associated VALUES("NK", "MCO");
INSERT INTO associated VALUES("DL", "MCO");
INSERT INTO associated VALUES("B6", "MCO");
INSERT INTO associated VALUES("F9", "MCO");
INSERT INTO associated VALUES("AS", "MCO");
INSERT INTO associated VALUES("SQ", "MCO");

INSERT INTO associated VALUES("UA", "SIN");
INSERT INTO associated VALUES("NK", "SIN");
INSERT INTO associated VALUES("DL", "SIN");
INSERT INTO associated VALUES("B6", "SIN");
INSERT INTO associated VALUES("F9", "SIN");
INSERT INTO associated VALUES("AS", "SIN");
INSERT INTO associated VALUES("SQ", "SIN");

INSERT INTO associated VALUES("UA", "HKG");
INSERT INTO associated VALUES("NK", "HKG");
INSERT INTO associated VALUES("DL", "HKG");
INSERT INTO associated VALUES("B6", "HKG");
INSERT INTO associated VALUES("F9", "HKG");
INSERT INTO associated VALUES("AS", "HKG");
INSERT INTO associated VALUES("SQ", "HKG");

INSERT INTO associated VALUES("UA", "JFK");
INSERT INTO associated VALUES("NK", "JFK");
INSERT INTO associated VALUES("DL", "JFK");
INSERT INTO associated VALUES("B6", "JFK");
INSERT INTO associated VALUES("ET", "JFK");
INSERT INTO associated VALUES("F9", "JFK");
INSERT INTO associated VALUES("AS", "JFK");
INSERT INTO associated VALUES("SQ", "JFK");

INSERT INTO associated VALUES("UA", "LAX");
INSERT INTO associated VALUES("NK", "LAX");
INSERT INTO associated VALUES("B6", "LAX");
INSERT INTO associated VALUES("DL", "LAX");
INSERT INTO associated VALUES("ET", "LAX");
INSERT INTO associated VALUES("AS", "LAX");
INSERT INTO associated VALUES("SQ", "LAX");

INSERT INTO associated VALUES("NK", "DEL");
INSERT INTO associated VALUES("B6", "DEL");
INSERT INTO associated VALUES("DL", "DEL");


INSERT INTO aircraftOwned VALUES("UA", "Aircraft01", "3");
INSERT INTO aircraftOwned VALUES("UA", "Aircraft02", "3");
INSERT INTO aircraftOwned VALUES("UA", "Aircraft03", "3");
INSERT INTO aircraftOwned VALUES("NK", "Aircraft04", "3");
INSERT INTO aircraftOwned VALUES("NK", "Aircraft05", "3");
INSERT INTO aircraftOwned VALUES("NK", "Aircraft06", "3");
INSERT INTO aircraftOwned VALUES("DL", "Aircraft07", "3");
INSERT INTO aircraftOwned VALUES("DL", "Aircraft08", "2");
INSERT INTO aircraftOwned VALUES("B6", "Aircraft09", "2");
INSERT INTO aircraftOwned VALUES("B6", "Aircraft10", "3");
INSERT INTO aircraftOwned VALUES("ET", "Aircraft11", "3");
INSERT INTO aircraftOwned VALUES("F9", "Aircraft12", "3");
INSERT INTO aircraftOwned VALUES("AS", "Aircraft13", "3");
INSERT INTO aircraftOwned VALUES("SQ", "Aircraft14", "3");
INSERT INTO aircraftOwned VALUES("SQ", "Aircraft15", "3");
INSERT INTO aircraftOwned VALUES("SQ", "Aircraft16", "3");
INSERT INTO aircraftOwned VALUES("SQ", "Aircraft17", "3");
INSERT INTO aircraftOwned VALUES("UA", "Aircraft18", "3");
INSERT INTO aircraftOwned VALUES("UA", "Aircraft19", "3");
INSERT INTO aircraftOwned VALUES("UA", "Aircraft20", "3");

INSERT INTO user VALUES("Customer1", "10", "Bob", "Smith", "customer");
INSERT INTO user VALUES("Customer2", "20", "Bruce", "Doe", "customer");
INSERT INTO user VALUES("Customer3", "30", "Anthony", "Smith", "customer");
INSERT INTO user VALUES("Customer4", "40", "Paul", "Demarest", "customer");
INSERT INTO user VALUES("Customer5", "50", "Aromal", "Gomez", "customer");
INSERT INTO user VALUES("Customer6", "60", "Nikola", "Gonzalez", "customer");
INSERT INTO user VALUES("Customer7", "70", "Abby", "Bettancourt", "customer");
INSERT INTO user VALUES("Customer8", "80", "Justin", "Mannebach", "customer");
-- INSERT INTO user VALUES("administrator", "1234", "name", "last name", "admin");
INSERT INTO user VALUES("admin2", "2468", "Ad", "Min", "admin");
-- INSERT INTO user VALUES("rep", "1234", "mrcustomer", "rep", "representative");
INSERT INTO user VALUES("rep2", "2468", "represent", "ative", "representative");

-- I commented out the administrator and rep because we already make them in the main Schema. 
-- They're only here for easy reference.

INSERT INTO flightOperated VALUES("UA", "0001", "Aircraft01", "EWR", "LAX", "2021-12-03", "10:00", "2021-12-03", "16:00", 0, 3);
INSERT INTO flightOperated VALUES("UA", "0002", "Aircraft02", "LAX", "JFK", "2021-12-04", "12:00", "2021-12-04", "18:00", 0, 3);
INSERT INTO flightOperated VALUES("NK", "0003", "Aircraft04", "EWR", "JFK", "2021-12-05", "14:00", "2021-12-05", "18:00", 0, 3);
INSERT INTO flightOperated VALUES("NK", "0004", "Aircraft06", "EWR", "MCO", "2021-12-06", "16:00", "2021-12-06", "19:00", 0, 3);
INSERT INTO flightOperated VALUES("DL", "0005", "Aircraft08", "DEL", "HKG", "2021-12-20", "18:00", "2021-12-21", "1:00", 1, 2);
INSERT INTO flightOperated VALUES("B6", "0006", "Aircraft10", "MCO", "SIN", "2021-12-19", "16:00", "2021-12-19", "22:00", 1, 3);
INSERT INTO flightOperated VALUES("F9", "0007", "Aircraft12", "SIN", "HKG", "2021-12-20", "12:00", "2021-12-20", "16:00", 1, 3);
INSERT INTO flightOperated VALUES("SQ", "0008", "Aircraft14", "HKG", "JFK", "2021-12-20", "18:00", "2021-12-21", "14:00", 1, 3);

-- ignore the below
-- FRONTIER DOES NOT GO TO LAX FROM JFK EWR SIN OR HKG
-- ETHIOPIA AL DOES NOT GO FROM JFK OR LAX TO EWR OR HKG OR SIN
-- SQ DOES NOT GO FROM HKG SIN JFK OR LAX TO EWR
-- we have associated for: EWR, LAX, HKG, SIN, JFK

INSERT INTO operatesOn VALUES("UA", "0001", "Monday");
INSERT INTO operatesOn VALUES("NK", "0003", "Sunday");
INSERT INTO operatesOn VALUES("NK", "0004", "Monday");
INSERT INTO operatesOn VALUES("DL", "0005", "Monday");
INSERT INTO operatesOn VALUES("B6", "0006", "Sunday");
INSERT INTO operatesOn VALUES("F9", "0007", "Saturday");
INSERT INTO operatesOn VALUES("SQ", "0008", "Monday");

INSERT INTO ticket VALUES("001", "EWR", "LAX", "0", "0", "0", "6:00", "2021-12-01", "09:24", "2021-12-03", "10:00", "2021-12-03", "16:00", "15", "50");
INSERT INTO parts VALUES("001", "UA", "0001", 1, 1000, "first");

INSERT INTO ticket VALUES("002", "EWR", "LAX", "0", "0", "0", "6:00", NULL, NULL, "2021-12-03", "10:00", "2021-12-03", "16:00", "15", "50");
INSERT INTO parts VALUES("002", "UA", "0001", 2, 800, "business");

INSERT INTO ticket VALUES("003", "EWR", "LAX", "0", "0", "0", "6:00", NULL, NULL, "2021-12-03", "10:00", "2021-12-03", "16:00", "15", "50");
INSERT INTO parts VALUES("003", "UA", "0001", 3, 700, "economy");

INSERT INTO ticket VALUES("004", "MCO", "HKG", "0", "1", "1", "24:00", "2021-12-01", "09:25", "2021-12-19", "16:00", "2021-12-20", "16:00", "50", "100");
INSERT INTO parts values("004", "B6", "0006", 1, 1200, "first");
INSERT INTO parts values("004", "F9", "0007", 1, 800, "first");

INSERT INTO ticket VALUES("005", "MCO", "HKG", "0", "1", "1", "24:00", "2021-12-01", "09:27", "2021-12-19", "16:00", "2021-12-20", "16:00", "50", "100");
INSERT INTO parts values("005", "B6", "0006", 2, 700, "economy");
INSERT INTO parts values("005", "F9", "0007", 2, 500, "economy");

INSERT INTO ticket VALUES("006", "MCO", "JFK", "0", "1", "2", "46:00", "2021-12-01", "09:30", "2021-12-19", "16:00", "2021-12-21", "14:00", "45", "80");
INSERT INTO parts values("006", "B6", "0006", 1, 700, "economy");
INSERT INTO parts values("006", "F9", "0007", 1, 500, "economy");
INSERT INTO parts values("006", "SQ", "0008", 1, 800, "economy");

INSERT INTO ticket VALUES("007", "MCO", "JFK", "0", "1", "2", "46:00", NULL, NULL, "2021-12-19", "16:00", "2021-12-21", "14:00", "45", "80");
INSERT INTO parts values("007", "B6", "0006", 2, 700, "business");
INSERT INTO parts values("007", "F9", "0007", 2, 500, "business");
INSERT INTO parts values("007", "SQ", "0008", 2, 800, "business");

INSERT INTO ticket VALUES("008", "MCO", "JFK", "0", "1", "2", "46:00", NULL, NULL, "2021-12-19", "16:00", "2021-12-21", "14:00", "45", "80");
INSERT INTO parts values("008", "B6", "0006", 1, 700, "business");
INSERT INTO parts values("008", "F9", "0007", 1, 500, "business");
INSERT INTO parts values("008", "SQ", "0008", 1, 800, "business");

INSERT INTO purchased VALUES("001", "Customer4", "0");
INSERT INTO purchased VALUES("004", "Customer4", "0");
INSERT INTO purchased VALUES("005", "Customer4", "0");
INSERT INTO purchased VALUES("006", "Customer4", "0");



INSERT INTO question VALUES("What day is flight 0008?", "2021-12-06", "Customer1");
INSERT INTO question VALUES("What time is flight 0001?", "10:00", "Customer2");
INSERT INTO question VALUES("Where does flight 0002 land?", "JFK Airport", "Customer3");
INSERT INTO question VALUES("What is EWR's address?", "", "Customer4");
INSERT INTO question VALUES("Where does flight 0006 land?", "", "Customer5");






