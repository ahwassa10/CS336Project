<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Flights</title>
</head>
<body>

 		<form method="get" action="SearchResults.jsp">
 		
Trip Type:
<input type="radio" name="button1" value="one_way" >  One Way
<input type="radio" name="button1" value="round_trip" >  Round Trip	 
	<br>

Sort By:
	<input type="radio" name="button2" value="total_fare" >  Price
    <input type="radio" name="button2" value="departure_time" > Departure Time
    <input type="radio" name="button2" value="arrival_time"> Arrival Time
    <input type="radio" name="button2" value="flight_duration"> Flight Duration
	<br>
	
	Filter By:
	<input type="text" name="total_fare" placeholder="Price"> 
	<input type="text" name="number_of_stops" placeholder="Number of Stops"> 
	<input type="text" name="airline_id" placeholder="Airline"> 
	<input type="time" name="departure_time" placeholder="Take-off Time">
	<input type="time" name="arrival_time" placeholder="Landing Time">

	<br>
	
	<input type="text" name="initial_departure_airport_id" placeholder="Departure Airport"> 
	<input type="date" name="departure_date" placeholder="Departing Date"> 
	

	<br>
 	<input type="text" name="final_arrival_airport_id" placeholder="Arrival Airport" > 
	<input type="date" name="arrival_date" placeholder="Returning Date"> 
	<br>
	
	<form action="SearchResults.jsp">
		<input type="submit" value="Search">
</body>
</html>