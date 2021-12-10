<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE HTML>
<html>
<head>
	<title>Canceling a Reservation</title>
</head>

<%
String username = session.getAttribute("username").toString();
String ticket_id = request.getParameter("ticket_id");

ApplicationDB db = new ApplicationDB();
Connection con = db.getConnection();

String parts = "SELECT * FROM purchased p, parts ps, ticket t, flightOperated fo " +
               "WHERE p.ticket_id=\""+ ticket_id +"\" and p.username=\"" + username + "\"" +
               " and p.ticket_id = t.ticket_id and t.ticket_id = ps.ticket_id " +
               " and ps.airline_id = fo.airline_id and ps.flight_number = fo.flight_number";

Statement queryParts = con.createStatement();
ResultSet resultParts = queryParts.executeQuery(parts);

// Increment the seats available in each flight
while (resultParts.next()) {
	String airlineID    = resultParts.getString("fo.airline_id");
	String flightNumber = resultParts.getString("fo.flight_number");
	int seatsAvail      = Integer.parseInt(resultParts.getString("fo.seats_available"));
	
	String updateQuery = "UPDATE flightOperated " +
	                     "SET seats_available=" + (seatsAvail + 1) + " " +
	                     "WHERE airline_id=\"" + airlineID + "\" AND flight_number=\"" + flightNumber + "\""; 
	
	Statement updateFlights = con.createStatement();
	int ret = updateFlights.executeUpdate(updateQuery);
}

String deletePurchase = "UPDATE purchased " +
                        "SET was_cancelled=true " + 
                        "WHERE ticket_id=\"" + ticket_id + "\" and username=\"" + username + "\"";

Statement deleteTicket = con.createStatement();
deleteTicket.executeUpdate(deletePurchase);

String updateTicket = "UPDATE ticket " +
                      "SET purchase_date=NULL, purchase_time=NULL " +
                      "WHERE ticket_id=\"" + ticket_id + "\"";

Statement setTimeDate = con.createStatement();
setTimeDate.executeUpdate(updateTicket);

%>

<body>
	<h1>Canceling a Reservation</h1>

	<p>Username: <%=username%></p>
	<p>Ticket ID: <%=ticket_id%></p>
	<h1>You Successfully Cancelled Ticket <%=ticket_id%></h1>
	
	<hr>
	<form method="get" action="viewReservations.jsp">
		<button type="submit">Go Back to View Reservations</button>
	</form>
	
</body>
<%con.close(); %>
</html>