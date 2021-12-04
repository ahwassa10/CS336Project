<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>

<html>
	<head>
		<title>View Reservations</title>
	</head>
	
		<h1>Reservations for <%=session.getAttribute("username")%> </h1>
		
		<%
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();

		String str = "SELECT ticket_id, initial_departure_airport_id, final_arrival_airport_id " +
				     "FROM purchased WHERE username like " +
				     "\"" + session.getAttribute("username") + "\"";
		
		Statement stmt = con.createStatement();
		ResultSet result = stmt.executeQuery(str);
		%>
		
		<table>
			<tr>
				<th>Ticket ID</th>
				<th>Initial Departure Airport</th>
				<th>Final Arrival Airport</th>
				<th>One Way / Round Trip </th>
				<th>Domestic / International </th>
				<th>Class</th>
				<th>Purchase Date</th>
				<th>Purchase Time</th>
				<th>Departure Date</th>
				<th>Departure Time</th>
				<th>Arrival Date</th>
				<th>Arrival Time</th>
				<th>Number of Stops</th>
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