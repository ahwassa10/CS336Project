INSERT INTO airport VALUES("EWR", "USA", "3 Brewster RD, Newark NJ, 07114", "Newark Airport");
INSERT INTO airport VALUES("JFK", "USA", "Queens, NY, 11430", "JFK Airport");
INSERT INTO airport VALUES("LAX", "USA", "1 World Way, Los Angeles, CA 90045", "Los Angeles International Airport");
INSERT INTO airport VALUES("SIN", "Singapore", "60 Airport Blvd, 819643", "Singapore Changi Airport");
INSERT INTO airport VALUES("HKG", "Hong Kong", "1 Sky Plaza Rd, Chek Lap Kok", "Hong Kong International Airport");
INSERT INTO airport VALUES("DEL", "India", "New Delhi, Delhi 110037", "Indira Gandhi International Airport");
INSERT INTO airport VALUES("MCO", "USA", "1 Jeff Fuqua Blvd, Orlando, FL 32827", "Orlando International Airport");

INSERT INTO airline VALUES("United");
INSERT INTO airline VALUES("Spirit");
INSERT INTO airline VALUES("Delta");
INSERT INTO airline VALUES("Jet Blue");
INSERT INTO airline VALUES("EthiopiaAL");
INSERT INTO airline VALUES("Frontier");
INSERT INTO airline VALUES("AlaskaAL");
INSERT INTO airline VALUES("SingaporAL");

INSERT INTO associated VALUES("United", "EWR");
INSERT INTO associated VALUES("Spirit", "EWR");
INSERT INTO associated VALUES("Delta", "EWR");
INSERT INTO associated VALUES("Jet Blue", "EWR");
INSERT INTO associated VALUES("Frontier", "EWR");
INSERT INTO associated VALUES("AlaskaAL", "EWR");

INSERT INTO associated VALUES("United", "MCO");
INSERT INTO associated VALUES("Spirit", "MCO");
INSERT INTO associated VALUES("Delta", "MCO");
INSERT INTO associated VALUES("Jet Blue", "MCO");
INSERT INTO associated VALUES("Frontier", "MCO");
INSERT INTO associated VALUES("AlaskaAL", "MCO");
INSERT INTO associated VALUES("SingaporAL", "MCO");

INSERT INTO associated VALUES("United", "SIN");
INSERT INTO associated VALUES("Spirit", "SIN");
INSERT INTO associated VALUES("Delta", "SIN");
INSERT INTO associated VALUES("Jet Blue", "SIN");
INSERT INTO associated VALUES("Frontier", "SIN");
INSERT INTO associated VALUES("AlaskaAL", "SIN");
INSERT INTO associated VALUES("SingaporAL", "SIN");

INSERT INTO associated VALUES("United", "HKG");
INSERT INTO associated VALUES("Spirit", "HKG");
INSERT INTO associated VALUES("Delta", "HKG");
INSERT INTO associated VALUES("Jet Blue", "HKG");
INSERT INTO associated VALUES("Frontier", "HKG");
INSERT INTO associated VALUES("AlaskaAL", "HKG");
INSERT INTO associated VALUES("SingaporAL", "HKG");

INSERT INTO associated VALUES("United", "JFK");
INSERT INTO associated VALUES("Spirit", "JFK");
INSERT INTO associated VALUES("Delta", "JFK");
INSERT INTO associated VALUES("Jet Blue", "JFK");
INSERT INTO associated VALUES("EthiopiaAL", "JFK");
INSERT INTO associated VALUES("Frontier", "JFK");
INSERT INTO associated VALUES("AlaskaAL", "JFK");
INSERT INTO associated VALUES("SingaporAL", "JFK");

INSERT INTO associated VALUES("United", "LAX");
INSERT INTO associated VALUES("Spirit", "LAX");
INSERT INTO associated VALUES("Jet Blue", "LAX");
INSERT INTO associated VALUES("Delta", "LAX");
INSERT INTO associated VALUES("EthiopiaAL", "LAX");
INSERT INTO associated VALUES("AlaskaAL", "LAX");
INSERT INTO associated VALUES("SingaporAL", "LAX");

INSERT INTO associated VALUES("Spirit", "DEL");
INSERT INTO associated VALUES("Jet Blue", "DEL");
INSERT INTO associated VALUES("Delta", "DEL");


INSERT INTO aircraftowned VALUES("United", "Aircraft01", "3");
INSERT INTO aircraftowned VALUES("United", "Aircraft02", "3");
INSERT INTO aircraftowned VALUES("United", "Aircraft03", "3");
INSERT INTO aircraftowned VALUES("Spirit", "Aircraft04", "3");
INSERT INTO aircraftowned VALUES("Spirit", "Aircraft05", "3");
INSERT INTO aircraftowned VALUES("Spirit", "Aircraft06", "3");
INSERT INTO aircraftowned VALUES("Delta", "Aircraft07", "3");
INSERT INTO aircraftowned VALUES("Delta", "Aircraft08", "2");
INSERT INTO aircraftowned VALUES("Jet Blue", "Aircraft09", "2");
INSERT INTO aircraftowned VALUES("Jet Blue", "Aircraft10", "3");
INSERT INTO aircraftowned VALUES("EthiopiaAL", "Aircraft11", "3");
INSERT INTO aircraftowned VALUES("Frontier", "Aircraft12", "3");
INSERT INTO aircraftowned VALUES("AlaskaAL", "Aircraft13", "3");
INSERT INTO aircraftowned VALUES("SingaporAL", "Aircraft14", "3");
INSERT INTO aircraftowned VALUES("SingaporAL", "Aircraft15", "3");
INSERT INTO aircraftowned VALUES("SingaporAL", "Aircraft16", "3");
INSERT INTO aircraftowned VALUES("SingaporAL", "Aircraft17", "3");
INSERT INTO aircraftowned VALUES("United", "Aircraft18", "3");
INSERT INTO aircraftowned VALUES("United", "Aircraft19", "3");
INSERT INTO aircraftowned VALUES("United", "Aircraft20", "3");

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

INSERT INTO flightOperated VALUES("United"
INSERT INTO flightOperated VALUES("United", "Aircraft01", "EWR", "LAX", "0001", "2021-12-03", "10:00", "2021-12-03", "16:00", "0", "1");
INSERT INTO flightOperated VALUES("United", "Aircraft02", "LAX", "JFK", "0002", "2021-12-04", "12:00", "2021-12-04", "18:00", "0", "2");
INSERT INTO flightOperated VALUES("Spirit", "Aircraft04", "EWR", "JFK", "0003", "2021-12-05", "14:00", "2021-12-05", "18:00", "0", "3");
INSERT INTO flightOperated VALUES("Spirit", "Aircraft06", "EWR", "MCO", "0004", "2021-12-06", "16:00", "2021-12-06", "19:00", "0", "1");
INSERT INTO flightOperated VALUES("Delta", "Aircraft08", "DEL", "HKG", "0005", "2021-12-20", "18:00", "2021-12-21", "1:00", "1", "2");
INSERT INTO flightOperated VALUES("Jet Blue", "Aircraft10", "MCO", "SIN", "0006", "2021-12-19", "16:00", "2021-12-20", "22:00", "1", "3");
INSERT INTO flightOperated VALUES("Frontier", "Aircraft12", "SIN", "HKG", "0007", "2021-12-18", "12:00", "2021-12-18", "16:00", "1", "1");
INSERT INTO flightOperated VALUES("SingaporAL", "Aircraft14", "HKG", "JFK", "0008", "2021-12-06", "18:00", "2021-12-07", "14:00", "1", "2");

-- ignore the below
-- FRONTIER DOES NOT GO TO LAX FROM JFK EWR SIN OR HKG
-- ETHIOPIA AL DOES NOT GO FROM JFK OR LAX TO EWR OR HKG OR SIN
-- SINGAPORAL DOES NOT GO FROM HKG SIN JFK OR LAX TO EWR
-- we have associated for: EWR, LAX, HKG, SIN, JFK

INSERT INTO operateson VALUES("United", "Aircraft02", "Monday");
INSERT INTO operateson VALUES("Spirit", "Aircraft04", "Tuesday");
INSERT INTO operateson VALUES("Spirit", "Aircraft06", "Wednesday");
INSERT INTO operateson VALUES("Delta", "Aircraft08", "Thursday");
INSERT INTO operateson VALUES("Jet Blue", "Aircraft10", "Friday");
INSERT INTO operateson VALUES("Frontier", "Aircraft12", "Saturday");
INSERT INTO operateson VALUES("SingaporAL", "Aircraft14", "Sunday");


INSERT INTO waitlist VALUES("United", "Aircraft01", "EWR", "LAX", "0001", "Customer1", "1");
INSERT INTO waitlist VALUES("United", "Aircraft01", "EWR", "LAX", "0001", "Customer2", "2");

INSERT INTO waitlist VALUES("Spirit", "Aircraft04", "EWR", "JFK", "0003", "Customer3", "1");

INSERT INTO waitlist VALUES("Jet Blue", "Aircraft10", "MCO", "SIN", "0006", "Customer1", "1");
INSERT INTO waitlist VALUES("Jet Blue", "Aircraft10", "MCO", "SIN", "0006", "Customer5", "2");
INSERT INTO waitlist VALUES("Jet Blue", "Aircraft10", "MCO", "SIN", "0006", "Customer6", "3");
INSERT INTO waitlist VALUES("Jet Blue", "Aircraft10", "MCO", "SIN", "0006", "Customer7", "4");

INSERT INTO waitlist VALUES("SingaporAL", "Aircraft14", "HKG", "JFK", "0008", "Customer4", "1");







