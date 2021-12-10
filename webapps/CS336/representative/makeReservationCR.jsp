<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Make Reservation Page</title>
		<style>
		table, th, td {
			border: 1px solid black;
			border-collapse: collapse;
		}
		</style>
	</head>
<body>

<%
ApplicationDB db = new ApplicationDB();
Connection con = db.getConnection();
		String username = request.getParameter("username");
		
%>
Please select the ticket you would like to purchase for 
<%
out.print(username + ".");
		
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

	<h1>Table of Tickets that can be Purchased</h1>
	<table>
		<tr>
			<th>Ticket ID</th>
			<th>Purchase</th>
			<!--  <th>Show All Ticket Information</th> -->
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
			
			out.print("<td>" + resultTickets.getString("t.ticket_id") + "</td>");
			out.print("<td><form method = post action= reservationSuccess.jsp>" +
					  "<input type = \"hidden\" name = \"username\" value = " + username + ">" +
					  "<input type = \"hidden\" name = \"ticket_id\" value = \"" + resultTickets.getString("t.ticket_id") + "\">" +
					  "<input type = \"submit\" value= \"Buy Ticket\"></form></td>");
			          
			/*
			out.print("<td><form method=\"get\" action=\"getMoreInfo.jsp\">" +
			          "<button type=\"submit\" name=\"ticket_id\" value=\"" + resultTickets.getString("t.ticket_id") + "\">" +
			          "Show All Info</button></form></td>");
			*/
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




	<form method="post" action="representativeConsole.jsp">
		<input type="submit" value="Back To Representative Console">
	</form>


</body>
</html>