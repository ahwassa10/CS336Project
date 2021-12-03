CREATE DATABASE IF NOT EXISTS `Travel`;
USE `Travel`;

CREATE TABLE airport (airport_id varchar(10) NOT NULL,
                      country    varchar(50) NOT NULL,
                      address    varchar(50) NOT NULL,
                      name       varchar(50) NOT NULL,
                      PRIMARY KEY(airport_id));


CREATE TABLE airline (airline_id varchar(10) NOT NULL,
                      PRIMARY KEY(airline_id));


CREATE TABLE associated(airline_id varchar(10) NOT NULL,
                        airport_id varchar(10) NOT NULL,
                        PRIMARY KEY (airline_id,
                                     airport_id),
                        FOREIGN KEY (airline_id) REFERENCES airline(airline_id),
                        FOREIGN KEY (airport_id) REFERENCES airport(airport_id));


CREATE TABLE aircraftOwned(airline_id       varchar(10) NOT NULL,
                           aircraft_id      varchar(10) NOT NULL,
                           total_seats      int,
                           seats_available  int,
                           PRIMARY KEY (airline_id,
                                        aircraft_id),
                           FOREIGN KEY (airline_id) REFERENCES airline(airline_id));

CREATE TABLE operatesOn(airline_id      varchar(10) NOT NULL,
                        aircraft_id     varchar(10) NOT NULL,
                        operateDay      varchar(10) NOT NULL,
                        PRIMARY KEY (airline_id,
                                     aircraft_id,
                                     operateDay),
                        FOREIGN KEY (airline_id,
                                     aircraft_id) REFERENCES aircraftOwned(airline_id,
                                                                           aircraft_id));

CREATE TABLE user (username   varchar(50) NOT NULL,
                   password   varchar(50) NOT NULL,
                   first_name varchar(50),
                   last_name  varchar(50),
                   type       ENUM('representative', 'admin', 'customer')DEFAULT'customer',
                   PRIMARY KEY (username));
INSERT INTO user
VALUES("administrator", "1234", "name", "last name", "admin");

INSERT INTO user
VALUES ("rep", "1234", "mrcustomer", "rep", "representative");


CREATE TABLE flightOperated (airline_id             varchar(10) NOT NULL,
                             aircraft_id            varchar(10) NOT NULL,
                             depart_from_airport_id varchar(10) NOT NULL,
                             arrive_at_airport_id   varchar(10) NOT NULL,
                             flight_number          varchar(10) NOT NULL,
                             departure_date         DATE,
                             departure_time         TIME,
                             arrival_date           DATE,
                             arrival_time           TIME,
                             type_domestic_or_international BOOL,
                             ticket_class           varchar(10),
                             number_of_seats        int,
                             seats_booked           int,
                             number_of_stops        int,
                             alert                  BOOL,
                             PRIMARY KEY(airline_id,
                                         aircraft_id,
                                         depart_from_airport_id, 
                                         arrive_at_airport_id,
                                         flight_number),
                             FOREIGN KEY (airline_id,
                                          aircraft_id) REFERENCES aircraftOwned(airline_id,
                                                                                aircraft_id),
                             FOREIGN KEY (depart_from_airport_id) REFERENCES airport(airport_id),
                             FOREIGN KEY (arrive_at_airport_id) REFERENCES airport(airport_id));


CREATE TABLE waitlist (airline_id             varchar(10) NOT NULL,
                       aircraft_id            varchar(10) NOT NULL,
                       depart_from_airport_id varchar(10) NOT NULL,
                       arrive_at_airport_id   varchar(10) NOT NULL,
                       flight_number          varchar(10) NOT NULL,
                       username               varchar(50) NOT NULL,
                       waitlist_number        int,
                       PRIMARY KEY (airline_id,
                                    aircraft_id,
                                    depart_from_airport_id,
                                    arrive_at_airport_id,
                                    flight_number,
                                    username),
                       FOREIGN KEY (airline_id,
                                    aircraft_id,
                                    depart_from_airport_id,
                                    arrive_at_airport_id,
                                    flight_number) REFERENCES flightOperated(airline_id,
                                                                             aircraft_id,
                                                                             depart_from_airport_id,
                                                                             arrive_at_airport_id,
                                                                             flight_number),
                       FOREIGN KEY (username) REFERENCES user(username));
                       

CREATE TABLE ticket (ticket_id                      varchar(10) NOT NULL,
                     airline_id                     varchar(10) NOT NULL,
                     aircraft_id                    varchar(10) NOT NULL,
                     depart_from_airport_id         varchar(10) NOT NULL,
                     arrive_at_airport_id           varchar(10) NOT NULL,
                     flight_number                  varchar(10) NOT NULL,
                     type_one_way_or_round_trip     BOOL,
                     type_domestic_or_international BOOL,
                     departure_date                 DATE,
                     departure_time                 TIME,
                     purchase_date                  DATE,
                     purchase_time                  TIME,
                     total_fare                     int,
                     cancellation_fee               int,
                     was_cancelled                  BOOL,
                     flight_duration                time,
                     arrival_time                   time,
                     arrival_date                   date,
                     seat_number                    int,
                     PRIMARY KEY (ticket_id,
                                  airline_id,
                                  aircraft_id,
                                  depart_from_airport_id,
                                  arrive_at_airport_id,
                                  flight_number),
                     FOREIGN KEY (airline_id,
                                  aircraft_id,
                                  depart_from_airport_id,
                                  arrive_at_airport_id,
                                  flight_number) REFERENCES flightOperated(airline_id,
                                                                           aircraft_id,
                                                                           depart_from_airport_id,
                                                                           arrive_at_airport_id,
                                                                           flight_number));
                     

CREATE TABLE purchased (ticket_id                      varchar(10) NOT NULL,
                        airline_id                     varchar(10) NOT NULL,
                        aircraft_id                    varchar(10) NOT NULL,
                        depart_from_airport_id         varchar(10) NOT NULL,
                        arrive_at_airport_id           varchar(10) NOT NULL,
                        flight_number                  varchar(10) NOT NULL,
                        username                       varchar(50) NOT NULL,
                        PRIMARY KEY (ticket_id,
                                     airline_id,
                                     aircraft_id,
                                     depart_from_airport_id,
                                     arrive_at_airport_id,
                                     flight_number,
                                     username),
                        FOREIGN KEY (ticket_id,
                                     airline_id,
                                     aircraft_id,
                                     depart_from_airport_id,
                                     arrive_at_airport_id,
                                     flight_number) REFERENCES ticket(ticket_id,
                                                                      airline_id,
                                                                      aircraft_id,
                                                                      depart_from_airport_id,
                                                                      arrive_at_airport_id,
                                                                      flight_number),
                        FOREIGN KEY (username) REFERENCES user(username));

CREATE TABLE question(question        varchar(255) NOT NULL,
                      answer          varchar(255) NOT NULL,
                      username        varchar(50)  NOT NULL, 
                      PRIMARY KEY(username, question),
                      FOREIGN KEY(username) REFERENCES user(username));
