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
			
			<%
				while(resultPast.next()) {
					out.print("<tr>");
					
					out.print("<td>");
					out.print(resultPast.getString("ticked_id"));
					out.print("</td");
					
					out.print("<td>");
					out.print(resultPast.getString("initial_departure_airport_id"));
					out.print("</td");
					
					out.print("<td>");
					out.print(resultPast.getString("final_arrival_airport_id"));
					out.print("</td");
					
					out.print("<td>");
					out.print(resultPast.getString("airline_id"));
					out.print("</td");
					
					out.print("<td>");
					out.print(resultPast.getString("type_one_way_or_round_trip"));
					out.print("</td");
					
					out.print("<td>");
					out.print(resultPast.getString("type_domestic_or_international"));
					out.print("</td");
					
					out.print("<td>");
					out.print(resultPast.getString("ticket_class"));
					out.print("</td");
					
					out.print("<td>");
					out.print(resultPast.getString("number_of_stops"));
					out.print("</td");
					
					out.print("<td>");
					out.print(resultPast.getString("flight_duration"));
					out.print("</td");
					
					out.print("<td>");
					out.print(resultPast.getString("purchase_date"));
					out.print("</td");
					
					out.print("<td>");
					out.print(resultPast.getString("purchase_time"));
					out.print("</td");
					
					out.print("<td>");
					out.print(resultPast.getString("departure_date"));
					out.print("</td");
					
					out.print("<td>");
					out.print(resultPast.getString("departure_time"));
					out.print("</td");
					
					out.print("<td>");
					out.print(resultPast.getString("arrival_date"));
					out.print("</td");
					
					out.print("<td>");
					out.print(resultPast.getString("arrival_time"));
					out.print("</td");
					
					out.print("<td>");
					out.print(resultPast.getString("total_fare"));
					out.print("</td");
					
					out.print("<td>");
					out.print(resultPast.getString("booking_fee"));
					out.print("</td");
					
					out.print("<td>");
					out.print(resultPast.getString("cancellation_fee"));
					out.print("</td");
					
					out.print("<td>");
					out.print(resultPast.getString("was_cancelled"));
					out.print("</td");
					
					out.print("</tr>");
				}
			%>
			
		
		</table>

		<h1>Table of Upcoming Reservations</h1>
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
			
			<%
				while(resultPast.next()) {
					out.print("<tr>");
					
					out.print("<td>");
					out.print(resultPast.getString("ticked_id"));
					out.print("</td");
					
					out.print("<td>");
					out.print(resultPast.getString("initial_departure_airport_id"));
					out.print("</td");
					
					out.print("<td>");
					out.print(resultPast.getString("final_arrival_airport_id"));
					out.print("</td");
					
					out.print("<td>");
					out.print(resultPast.getString("airline_id"));
					out.print("</td");
					
					out.print("<td>");
					out.print(resultPast.getString("type_one_way_or_round_trip"));
					out.print("</td");
					
					out.print("<td>");
					out.print(resultPast.getString("type_domestic_or_international"));
					out.print("</td");
					
					out.print("<td>");
					out.print(resultPast.getString("ticket_class"));
					out.print("</td");
					
					out.print("<td>");
					out.print(resultPast.getString("number_of_stops"));
					out.print("</td");
					
					out.print("<td>");
					out.print(resultPast.getString("flight_duration"));
					out.print("</td");
					
					out.print("<td>");
					out.print(resultPast.getString("purchase_date"));
					out.print("</td");
					
					out.print("<td>");
					out.print(resultPast.getString("purchase_time"));
					out.print("</td");
					
					out.print("<td>");
					out.print(resultPast.getString("departure_date"));
					out.print("</td");
					
					out.print("<td>");
					out.print(resultPast.getString("departure_time"));
					out.print("</td");
					
					out.print("<td>");
					out.print(resultPast.getString("arrival_date"));
					out.print("</td");
					
					out.print("<td>");
					out.print(resultPast.getString("arrival_time"));
					out.print("</td");
					
					out.print("<td>");
					out.print(resultPast.getString("total_fare"));
					out.print("</td");
					
					out.print("<td>");
					out.print(resultPast.getString("booking_fee"));
					out.print("</td");
					
					out.print("<td>");
					out.print(resultPast.getString("cancellation_fee"));
					out.print("</td");
					
					out.print("<td>");
					out.print(resultPast.getString("was_cancelled"));
					out.print("</td");
					
					out.print("</tr>");
				}
			%>
			
			
		
		</table>		
	
	
	<body>

	</body>
</html>