<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
<head>
	<title>View Tickets</title>
	<style>
	table, th, td {
		border: 1px solid black;
		border-collapse: collapse;
	}
	</style>
</head>

<%
ApplicationDB db = new ApplicationDB();
Connection con = db.getConnection();

String query = "SELECT t.ticket_id, a.airport_id, a.name, aa.airport_id, aa.name, t.type_one_way_or_round_trip, " +
               "t.type_domestic_or_international, t.number_of_stops, t.flight_duration, t.departure_date, t.departure_time, " +
			   "t.arrival_date, t.arrival_time, t.booking_fee, t.cancellation_fee, sum(pt.flight_fare) total_fare " +
               "FROM ticket t, airport a, airport aa, parts pt " +
               "WHERE t.initial_departure_airport_id = a.airport_id and t.final_arrival_airport_id = aa.airport_id " +
               "and t.ticket_id = pt.ticket_id " +
               "and t.ticket_id NOT IN (SELECT p.ticket_id FROM purchased p WHERE p.was_cancelled = false) " +
               "GROUP BY t.ticket_id";

Statement tickets = con.createStatement();
ResultSet resultTickets = tickets.executeQuery(query);
%>

<body>
	<h1>Table of Tickets that can be Purchased</h1>
	<table>
		<tr>
			<th>Purchase</th>
			<th>Ticket ID</th>
			<th>Departure Airport</th>
			<th>Arrival Airport</th>
			<th>Total Fare</th>
			<th>Type</th>
			<th>Number of Stops</th>
			<th>Flight Duration</th>
			<th>Departure Date/Time</th>
			<th>Arrival Date/Time</th>
			<th>Booking Fee</th>
			<th>Cancellation Fee</th>
		</tr>
		
		<%
		while(resultTickets.next()) {
			out.print("<tr>");
			
			out.print("<td><form method=\"get\" action=\"makeReservation.jsp\">" +
			          "<button type=\"submit\" name=\"ticket_id\" value=\"" + resultTickets.getString("t.ticket_id") + "\">" +
			          "Buy Ticket</button></form></td>");
			
			out.print("<td>" + resultTickets.getString("t.ticket_id") + "</td>");
			out.print("<td>(" + resultTickets.getString("a.airport_id") + ") " + resultTickets.getString("a.name") + "</td>");
			out.print("<td>(" + resultTickets.getString("aa.airport_id") + ") " + resultTickets.getString("aa.name") + "</td>");
			out.print("<td>" + resultTickets.getString("total_fare") + "</td>");
			
				String flightType = "";
				if (resultTickets.getString("t.type_one_way_or_round_trip").equals("0")) {
					flightType += "One Way ";
				} else {
					flightType += "Round Trip ";
				}
				
				if (resultTickets.getString("t.type_domestic_or_international").equals("0")) {
					flightType += "Domestic ";
				} else {
					flightType += "International ";
				}
			
			out.print("<td>" + flightType + "</td>");
			out.print("<td>" + resultTickets.getString("t.number_of_stops") + "</td>");
			out.print("<td>" + resultTickets.getString("t.flight_duration") + "</td>");
			out.print("<td>" + resultTickets.getString("t.departure_date") + " " + resultTickets.getString("t.departure_time") + "</td>");
			out.print("<td>" + resultTickets.getString("t.arrival_date") + " " + resultTickets.getString("t.arrival_time") + "</td>");
			out.print("<td>" + resultTickets.getString("t.booking_fee") + "</td>");
			out.print("<td>" + resultTickets.getString("t.cancellation_fee") + "</td>");
			
			out.print("</tr>");
		}
		
		%>
	
	</table>
	
	<hr>
	<form method="get" action="userConsole.jsp">
		<button type="submit">Go Back to the User Console</button>
	</form>

</body>
<%con.close();%>
</html>