CREATE DATABASE IF NOT EXISTS `Travel`;
USE `Travel`;

CREATE TABLE airport (airport_id varchar(10) NOT NULL,
                      country    varchar(50) NOT NULL,
                      address    varchar(50) NOT NULL,
                      name       varchar(50) NOT NULL,
                      PRIMARY KEY(airport_id));


CREATE TABLE airline (airline_id    varchar(10) NOT NULL,
                      airline_name  varchar(50),
                      PRIMARY KEY(airline_id));


CREATE TABLE associated(airline_id varchar(10) NOT NULL,
                        airport_id varchar(10) NOT NULL,
                        PRIMARY KEY (airline_id,
                                     airport_id),
                        FOREIGN KEY (airline_id) REFERENCES airline(airline_id),
                        FOREIGN KEY (airport_id) REFERENCES airport(airport_id)
                        ON DELETE CASCADE);


CREATE TABLE aircraftOwned(airline_id       varchar(10) NOT NULL,
                           aircraft_id      varchar(10) NOT NULL,
                           total_seats      int,
                           PRIMARY KEY (airline_id,
                                        aircraft_id),
                           FOREIGN KEY (airline_id) REFERENCES airline(airline_id));

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
                             flight_number          varchar(10) NOT NULL,
                             aircraft_id            varchar(10) NOT NULL,
                             depart_from_airport_id varchar(10) NOT NULL,
                             arrive_at_airport_id   varchar(10) NOT NULL,
                             ticket_class           ENUM('first', 'economy', 'business'),
                             flight_fare            int,
                             departure_date         DATE,
                             departure_time         TIME,
                             arrival_date           DATE,
                             arrival_time           TIME,
                             is_international       BOOL,
                             seats_available        int,
                             PRIMARY KEY(airline_id,
                                         flight_number),
                             FOREIGN KEY (airline_id,
                                          aircraft_id) REFERENCES aircraftOwned(airline_id,
                                                                                aircraft_id)
                             ON DELETE CASCADE,
                             FOREIGN KEY (depart_from_airport_id) REFERENCES airport(airport_id)
                             ON DELETE CASCADE,
                             FOREIGN KEY (arrive_at_airport_id) REFERENCES airport(airport_id)
                              ON DELETE CASCADE);

CREATE TABLE operatesOn(airline_id      varchar(10) NOT NULL,
                        flight_number   varchar(10) NOT NULL,
                        operateDay      varchar(10) NOT NULL,
                        PRIMARY KEY (airline_id,
                                     flight_number,
                                     operateDay),
                        FOREIGN KEY (airline_id,
                                     flight_number) REFERENCES flightOperated(airline_id,
                                                                              flight_number));

CREATE TABLE waitlist (airline_id             varchar(10) NOT NULL,
                       flight_number          varchar(10) NOT NULL,
                       username               varchar(50) NOT NULL,
                       waitlist_number        int,
                       PRIMARY KEY (airline_id,
                                    flight_number,
                                    username),
                       FOREIGN KEY (airline_id,
                                    flight_number) REFERENCES flightOperated(airline_id,
                                                                             flight_number),
                       FOREIGN KEY (username) REFERENCES user(username));
                       

CREATE TABLE ticket (ticket_id                      varchar(10) NOT NULL,
                     initial_departure_airport_id   varchar(10) NOT NULL,
                     final_arrival_airport_id       varchar(10) NOT NULL,
                     type_one_way_or_round_trip     BOOL,
                     type_domestic_or_international BOOL,
                     number_of_stops                int,
                     flight_duration                TIME,
                     purchase_date                  DATE,
                     purchase_time                  TIME,
                     departure_date                 DATE,
                     departure_time                 TIME,
                     arrival_date                   DATE,
                     arrival_time                   TIME,
                     booking_fee                    int,
                     cancellation_fee               int,
                     PRIMARY KEY (ticket_id),
                     FOREIGN KEY (initial_departure_airport_id) REFERENCES airport(airport_id),
                     FOREIGN KEY (final_arrival_airport_id) REFERENCES airport(airport_id));
                     

CREATE TABLE purchased (ticket_id                      varchar(10) NOT NULL,
                        username                       varchar(50) NOT NULL,
                        was_cancelled                  BOOL,
                        PRIMARY KEY (ticket_id,
                                     username),
                        FOREIGN KEY (ticket_id) REFERENCES ticket(ticket_id),
                        FOREIGN KEY (username) REFERENCES user(username));

CREATE TABLE parts (ticket_id                      varchar(10) NOT NULL,
                    airline_id                     varchar(10) NOT NULL,
                    flight_number                  varchar(10) NOT NULL,
                    seat_number                    int,
                    PRIMARY KEY(ticket_id,
                                airline_id,
                                flight_number),
                    FOREIGN KEY(ticket_id) REFERENCES ticket(ticket_id)
                    ON DELETE CASCADE,
                    FOREIGN KEY(airline_id,
                                flight_number) REFERENCES flightOperated(airline_id,
                                                                         flight_number)
                   ON DELETE CASCADE);                                                                                                                                      
                                                                       
CREATE TABLE question(question        varchar(255) NOT NULL,
                      answer          varchar(255) NOT NULL,
                      username        varchar(50)  NOT NULL, 
                      PRIMARY KEY(username, question),
                      FOREIGN KEY(username) references user(username));
