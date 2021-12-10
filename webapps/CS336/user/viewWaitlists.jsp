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

String cleanWaitlist = "SELECT * FROM waitlist w, purchased p WHERE w.ticket_id = p.ticket_id and w.username = p.username and " +
                       "p.username=\"" + username + "\" and p.was_cancelled=false";

boolean queryFailed = false;
	
try {
	Statement queryClean = con.createStatement();
	ResultSet resultClean = queryClean.executeQuery(cleanWaitlist);
	while(resultClean.next()) {
		String airline_id = resultClean.getString("w.airline_id");
		String flight_number = resultClean.getString("w.flight_number");
		
		String delete = "DELETE FROM waitlist WHERE airline_id=\"" + airline_id + "\" and flight_number=\"" + flight_number +
	                     "\" and username=\"" + username + "\"";
		
		Statement deleteWaitlists = con.createStatement();
		int ret = deleteWaitlists.executeUpdate(delete);
		if (ret != 1) {
			queryFailed = true;
		}
		
	}
	
} catch (Exception e){
	queryFailed = true;	
}


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
			
			int seats_available=Integer.parseInt(resultWaitlists.getString("fo.seats_available"));
			out.print("<td>" + seats_available + "</td>");
			
			
			out.print("<td><form method=\"get\" action=\"cancelWaitlist.jsp\">" +
			          "<input type=\"hidden\" name=\"airline_id\" value =\"" + resultWaitlists.getString("w.airline_id") + "\">" +
			          "<input type=\"hidden\" name=\"flight_number\" value =\"" + resultWaitlists.getString("w.flight_number") + "\">" +
			          "<button type=\"submit\">Cancel Waitlist</button></form></td>");
			
			if (seats_available >= 1) {
				out.print("<td>");
				out.print("<form method = \"get\" action=\"makeReservation.jsp\">");
				out.print("<button type=\"submit\" name=\"ticket_id\" value=\"" + resultWaitlists.getString("w.ticket_id") + "\">");
				out.print("Purchase Ticket</button>");
				out.print("</form>");
				out.print("</td>");
			} else {
				out.print("<td>No Seats Available</td>");
			}
			
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