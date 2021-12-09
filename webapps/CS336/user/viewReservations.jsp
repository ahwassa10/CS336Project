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
			border-collapse: collapse;
		}
		
		td#st1 {
			background-color:green;
			color:white
		}
		
		td#st2 {
			background-color:red;
			color:white
		}
		</style>
	</head>
	
	<body>
		<h1>Reservations for <%=session.getAttribute("username")%> </h1>
		
		<%
		//Get all the tickets that a user purchased
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		
		String queryt = "SELECT t.ticket_id, a.name, aa.name, t.number_of_stops, t.flight_duration, " +
							"t.purchase_date, t.purchase_time, t.departure_date, t.departure_time, " +
							"t.arrival_date, t.arrival_time, p.was_cancelled, t.cancellation_fee " +
						 "FROM ticket t, purchased p, airport a, airport aa " +
				         "WHERE t.ticket_id = p.ticket_id and p.username like \"" + session.getAttribute("username") + "\" " +
						 "and t.initial_departure_airport_id = a.airport_id and t.final_arrival_airport_id = aa.airport_id ";
		
		Statement pastReservations     = con.createStatement();
		Statement upcomingReservations = con.createStatement();
		
		String queryPastReservations     = queryt + "and t.departure_date < CURDATE()";
		String queryUpcomingReservations = queryt + "and t.departure_date >= CURDATE()";
		
		ResultSet resultPast     = pastReservations.executeQuery(queryPastReservations);
		ResultSet resultUpcoming = upcomingReservations.executeQuery(queryUpcomingReservations);
		%>
		
		<h1>Table of Past Reservations</h1>
		<table>
			<tr>
				<th>Ticket ID</th>
				<th>Show All Ticket Information</th>
				<th>Initial Departure Airport</th>
				<th>Final Arrival Airport</th>
				<th>Number of Stops</th>
				<th>Flight Duration</th>
				<th>Purchase Date/Time</th>
				<th>Departure Date/Time</th>
				<th>Arrival Date/Time</th>
				<th>Was Cancelled</th>
				<th>Cancellation Fee</th>
			</tr>
			
			<%
				while(resultPast.next()) {
					out.print("<tr>");
					
					out.print("<td>" + resultPast.getString("ticket_id") + "</td>");
					
					out.print("<td><form method=\"get\" action=\"getMoreInfo.jsp\">" +
							  "<button type=\"submit\" name=\"ticket_id\" value=\"" + resultPast.getString("ticket_id") +
							  "\">Show All Info</button>" +
					          "</form></td>");
					
					out.print("<td>" + resultPast.getString("a.name") + "</td>");
					out.print("<td>" + resultPast.getString("aa.name") + "</td>");
					out.print("<td>" + resultPast.getString("t.number_of_stops") + "</td>");
					out.print("<td>" + resultPast.getString("t.flight_duration") + "</td>");
					out.print("<td>" + resultPast.getString("t.purchase_date") + " " +
									   resultPast.getString("t.purchase_time") + "</td>");
					out.print("<td>" + resultPast.getString("t.departure_date") + " " +
									   resultPast.getString("t.departure_time") + "</td>");
					out.print("<td>" + resultPast.getString("t.arrival_date") + " " +
									   resultPast.getString("t.arrival_time") + "</td>");
					
					String cancelled = resultPast.getString("p.was_cancelled");
					if (cancelled.equals("1")) {
						out.print("<td>Yes</td>");	
					} else {
						out.print("<td id=\"st1\">No</td>");
					}
					
					out.print("<td>" + resultPast.getString("t.cancellation_fee") + "</td>");
					
					out.print("</tr>");
				}
			%>
		</table>
		
		<h1>Table of Upcoming Reservations</h1>
		<table>
			<tr>
				<th>Ticket ID</th>
				<th>Show All Ticket Information</th>
				<th>Initial Departure Airport</th>
				<th>Final Arrival Airport</th>
				<th>Number of Stops</th>
				<th>Flight Duration</th>
				<th>Purchase Date/Time</th>
				<th>Departure Date/Time</th>
				<th>Arrival Date/Time</th>
				<th>Was Cancelled</th>
				<th>Cancellation Fee</th>
			</tr>
			
			<%
				while(resultUpcoming.next()) {
					out.print("<tr>");
					
					out.print("<td>" + resultUpcoming.getString("ticket_id") + "</td>");
					
					out.print("<td><form method=\"get\" action=\"getMoreInfo.jsp\">" +
							  "<button type=\"submit\" name=\"ticket_id\" value=\"" + resultUpcoming.getString("ticket_id") +
							  "\">Show All Info</button>" +
					          "</form></td>");
					
					out.print("<td>" + resultUpcoming.getString("a.name") + "</td>");
					out.print("<td>" + resultUpcoming.getString("aa.name") + "</td>");
					out.print("<td>" + resultUpcoming.getString("t.number_of_stops") + "</td>");
					out.print("<td>" + resultUpcoming.getString("t.flight_duration") + "</td>");
					out.print("<td>" + resultUpcoming.getString("t.purchase_date") + " " +
					                   resultUpcoming.getString("t.purchase_time") + "</td>");
					out.print("<td>" + resultUpcoming.getString("t.departure_date") + " " +
					                   resultUpcoming.getString("t.departure_time") + "</td>");
					out.print("<td>" + resultUpcoming.getString("t.arrival_date") + " " +
					                   resultUpcoming.getString("t.arrival_time") + "</td>");
					
					String cancelled = resultUpcoming.getString("p.was_cancelled");
					if (cancelled.equals("1")) {
						out.print("<td>Yes</td>");	
					} else {
						out.print("<td id=\"st1\">No</td>");
					}
					
					out.print("<td>" + resultUpcoming.getString("t.cancellation_fee") + "</td>");
					
					out.print("</tr>");
				}
			%>
		</table>		
	
		<hr>
		<form method="get" action="userConsole.jsp">
			<button type="submit">Go Back to the User Console</button>
		</form>
		
	</body>
<% con.close(); %>
</html>