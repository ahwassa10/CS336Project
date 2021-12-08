<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>

<%
// Initialize the Database Connection
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	
	String queryAllFlights = "select al.airline_name, fo.flight_number, fo.aircraft_id, ap.name depart_from , app.name arrive_at, " +
	                         	"fo.departure_date, fo.departure_time, fo.arrival_date, " +
	                         	"fo.arrival_time, fo.is_international, fo.seats_available " +
							 "from flightOperated fo, airline al, airport ap, airport app " +
							 "where fo.airline_id = al.airline_id and fo.depart_from_airport_id like ap.airport_id " +
							 "and fo.arrive_at_airport_id like app.airport_id";
	
	Statement browseFlights = con.createStatement();
	ResultSet resultBrowseFlights = browseFlights.executeQuery(queryAllFlights);
	
%>

<html>
<head>
	<meta charset="UTF-8">
	<title>Search Flights</title>
	<style>
		table, th, td {
			border: 1px solid black;
			border-collapse: collapse;
		}
	</style>
</head>
<body>

	<h1>Search for a Specific Flight</h1>
	
 	<form method="get" action="SearchResults.jsp">
 		<label>Trip Type:</label>
		<input type="radio" name="button1" value="one_way" >  One Way
		<input type="radio" name="button1" value="round_trip" >  Round Trip	 
		<br>

		<label>Sort By:</label>
		<input type="radio" name="button2" value="total_fare" >  Price
   		<input type="radio" name="button2" value="departure_time" > Departure Time
   		<input type="radio" name="button2" value="arrival_time"> Arrival Time
  		<input type="radio" name="button2" value="flight_duration"> Flight Duration
		<br>
	
		<label>Filter By:</label>
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
		<input type="date" name="arrival_date" placeholder="Arrival Date"> 
		<br>
		
		<input type="checkbox" name="button3" id = "flexible" value="flexible"> Flexible Dates
		<br>
			
		<button type="submit">Perform Search</button>
	</form>
	
	<hr>
	<h1>Browse All Upcoming Flights</h1>
	
	<table>
		<tr>
			<th>Airline Name</th>
			<th>Flight Number</th>
			<th>Aircraft ID</th>
			<th>Departing Airport</th>
			<th>Arriving Airport</th>
			<th>Departure Date</th>
			<th>Departure Time</th>
			<th>Arrival Date</th>
			<th>Arrival Time</th>
			<th>International?</th>
			<th>Seats Available</th>
		</tr>
	<%
		while(resultBrowseFlights.next()) {
			out.print("<tr>");
			
			out.print("<td>" + resultBrowseFlights.getString("airline_name") + "</td>");
			out.print("<td>" + resultBrowseFlights.getString("flight_number") + "</td>");
			out.print("<td>" + resultBrowseFlights.getString("aircraft_id") + "</td>");
			out.print("<td>" + resultBrowseFlights.getString("depart_from") + "</td>");
			out.print("<td>" + resultBrowseFlights.getString("arrive_at") + "</td>");
			out.print("<td>" + resultBrowseFlights.getString("departure_date") + "</td>");
			out.print("<td>" + resultBrowseFlights.getString("departure_time") + "</td>");
			out.print("<td>" + resultBrowseFlights.getString("arrival_date") + "</td>");
			out.print("<td>" + resultBrowseFlights.getString("arrival_time") + "</td>");
			
			String international = resultBrowseFlights.getString("is_international");
			if (international.equals("1")) {
				out.print("<td>yes</td>");
			} else {
				out.print("<td>no</td>");
			}
			
			out.print("<td>" + resultBrowseFlights.getString("seats_available") + "</td>");
			
			out.print("</tr>");
			
		}
	
	%>
	</table>
	
	
	
</body>
</html>
