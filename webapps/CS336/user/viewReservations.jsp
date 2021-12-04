<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>

<html>
	<head>
		<title>View Reservations</title>
		<style>
		table, th, td {
			border: 1px solid black;
		}
		</style>
	</head>
	
		<h1>Reservations for <%=session.getAttribute("username")%> </h1>
		
		<%
		//Get all the tickets that a user purchased
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();

		String str = "SELECT t.ticket_id, t.initial_departure_airport_id, t.final_arrival_airport_id, t.airline_id, " +
		             	"t.type_one_way_or_round_trip, t.type_domestic_or_international, t.ticket_class, " +
						"t.number_of_stops, t.flight_duration, " +
					 	"t.purchase_date, t.purchase_time, t.departure_date, t.departure_time, t.arrival_date, " +
		             	"t.arrival_time, t.total_fare, t.booking_fee, t.cancellation_fee, " +
					 	"t.was_cancelled " +
				     "FROM purchased p, ticket t " +
					 "WHERE username like \"" + session.getAttribute("username") + "\" " +
				     	"and p.ticket_id = t.ticket_id " +
					    "and p.initial_departure_airport_id = t.initial_departure_airport_id " +
				     	"and p.final_arrival_airport_id = t.final_arrival_airport_id ";
		
		Statement pastReservations     = con.createStatement();
		Statement upcomingReservations = con.createStatement();
		
		String queryPastReservations     = str + "and t.departure_date < CURDATE()";
		String queryUpcomingReservations = str + "and t.departure_date >= CURDATE()";
		
		ResultSet resultPast     = pastReservations.executeQuery(queryPastReservations);
		ResultSet resultUpcoming = upcomingReservations.executeQuery(queryUpcomingReservations);
		%>
		
		<h1>Table of Past Reservations</h1>
		<table>
			<tr>
				<th>Ticket ID</th>
				<th>Initial Departure Airport</th>
				<th>Final Arrival Airport</th>
				<th>One Way / Round Trip </th>
				<th>Domestic / International </th>
				<th>Class</th>
				<th>Number of Stops</th>
				<th>Flight Duration</th>
				<th>Purchase Date</th>
				<th>Purchase Time</th>
				<th>Departure Date</th>
				<th>Departure Time</th>
				<th>Arrival Date</th>
				<th>Arrival Time</th>
				<th>Total Fare</th>
				<th>Booking Fee</th>
				<th>Cancellation Fee</th>
				<th>Cancelled</th>
			</tr>
			
			
			
		
		</table>
		
		<!--
		out.println("Printing ticket_id, initial_departure_airport_id, final_arrival_airport_id");
		
		while (result.next()) {
			out.println(result.getString("ticket_id") + " " +
					    result.getString("initial_departure_airport_id") + " " +
					    result.getString("final_arrival_airport_id"));
			out.println();
		} -->
	
	
	<body>

	</body>
</html>