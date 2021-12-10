<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE HTML>
<html>
<head>
	<title>View Waitlists</title>
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

String username = session.getAttribute("username").toString();

String query = "SELECT * FROM waitlist w, ticket t, flightOperated fo, airline ar, airport a, airport aa " +
               "WHERE w.ticket_id = t.ticket_id and w.flight_number = fo.flight_number and w.airline_id = fo.airline_id and " +
			   "t.initial_departure_airport_id = a.airport_id and t.final_arrival_airport_id = aa.airport_id and " +
               "fo.airline_id = ar.airline_id and w.username = \"" + username + "\"";

Statement queryWaitlists = con.createStatement();
ResultSet resultWaitlists = queryWaitlists.executeQuery(query);
%>

<body>
	<h1>Showing Waitlists for <%=username%></h1>
	
	<table>
		<tr>
			<th>Ticket ID</th>
			<th>Airline</th>
			<th>Flight Number</th>
			<th>Part of Ticket From</th>
			<th>Part of Ticket To</th>
			<th>Seats Available</th>
			<th>Cancel Waitlist</th>
			<th>Purchase Ticket</th>
		</tr>
		
		<%
		while(resultWaitlists.next()) {
			out.print("<tr>");
			
			out.print("<td>" + resultWaitlists.getString("w.ticket_id") + "</td>");
			out.print("<td>" + resultWaitlists.getString("ar.airline_name") + "</td>");
			out.print("<td>" + resultWaitlists.getString("w.flight_number") + "</td>");
			out.print("<td>(" + resultWaitlists.getString("a.airport_id") + ") " + resultWaitlists.getString("a.name") +"</td>");
			out.print("<td>(" + resultWaitlists.getString("aa.airport_id") + ") " + resultWaitlists.getString("aa.name") +"</td>");
			out.print("<td>" + resultWaitlists.getString("fo.seats_available") + "</td>");
			
			out.print("<td><form method=\"get\" action=\"cancelWaitlist.jsp\">" +
			          "<button name=\"airline_id\" value =\"" + resultWaitlists.getString("w.airline_id") + "\" " +
			                  "name=\"airline_id\" value =\"" + resultWaitlists.getString("w.flight_number") + "\"> " +
			          "Cancel Waitlist</button></form></td>");
			
			out.print("</tr>");	
		}
		%>
		
		
	</table>

</body>


<%con.close();%>
</html>