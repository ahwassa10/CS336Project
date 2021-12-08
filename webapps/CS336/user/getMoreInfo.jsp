<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE HTML>
<html>
<head>
	<title>Get More Info</title>
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

String generalInfo = "SELECT * FROM ticket t, airport a, airport aa " +
					 "WHERE t.initial_departure_airport_id = a.airport_id and t.final_arrival_airport_id = aa.airport_id and " + 
                     "t.ticket_id = " + request.getParameter("ticket_id");

Statement queryGeneralInfo = con.createStatement();
ResultSet resultGeneralInfo = queryGeneralInfo.executeQuery(generalInfo);

int stops = 0;

%>
		
<body>
	<h1>Showing All Information for Ticket ID: <%=request.getParameter("ticket_id") %></h1>
	
	<h2>General Information:</h2>
		<table>
			<tr>
				<th>Ticket ID</th>
				<th>Departure Airport</th>
				<th>Arrival Airport</th>
				<th>Type</th>
				<th>Number of Stops</th>
				<th>Flight Duration</th>
				<th>Purchase Date/Time</th>
				<th>Departure Date/Time</th>
				<th>Arrival Date/Time</th>
				<th>Booking Fee</th>
				<th>Cancellation Fee</th>
			</tr>
			<tr>
				<%resultGeneralInfo.next(); %>
				<td><%=resultGeneralInfo.getString("ticket_id") %></td>
				
				<td><%="(" + resultGeneralInfo.getString("a.airport_id") + ") " + resultGeneralInfo.getString("a.name") %></td>
				
				<td><%="(" + resultGeneralInfo.getString("aa.airport_id") + ") " + resultGeneralInfo.getString("aa.name") %></td>
				
				<%
					// Build a string to describe the flight
					String flightType = "";
					if (resultGeneralInfo.getString("t.type_one_way_or_round_trip").equals("0")) {
						flightType += "One Way ";
					} else {
						flightType += "Round Trip ";
					}
					
					if (resultGeneralInfo.getString("t.type_domestic_or_international").equals("0")) {
						flightType += "Domestic ";
					} else {
						flightType += "International ";
					}
				%>
				
				<td><%=flightType %></td>
				
				<% stops = resultGeneralInfo.getInt("t.number_of_stops"); %>
				<td><%=stops %></td>
				
				<td><%=resultGeneralInfo.getString("t.flight_duration") %></td>
				
				<td><%=resultGeneralInfo.getString("t.purchase_date") + " " + resultGeneralInfo.getString("t.purchase_time") %></td>
				
				<td><%=resultGeneralInfo.getString("t.departure_date") + " " + resultGeneralInfo.getString("t.departure_time") %></td>
				
				<td><%=resultGeneralInfo.getString("t.arrival_date") + " " + resultGeneralInfo.getString("t.arrival_time") %></td>
				
				<td><%=resultGeneralInfo.getString("t.booking_fee") %></td>
				
				<td><%=resultGeneralInfo.getString("t.cancellation_fee") %></td>
			</tr>
		</table>
		
		<%
		
		String firstStop = "Select * FROM ticket t, parts p, flightOperated fo, airport a, airport aa, airline ar " +
						   "WHERE p.ticket_id = " + request.getParameter("ticket_id") +
						   " and t.ticket_id = p.ticket_id and p.airline_id = fo.airline_id and p.flight_number = fo.flight_number" +
						   " and t.initial_departure_airport_id = fo.depart_from_airport_id" +
						   " and fo.depart_from_airport_id = a.airport_id and fo.arrive_at_airport_id = aa.airport_id" +
						   " and fo.airline_id = ar.airline_id";
		
		Statement queryFirstStop = con.createStatement();
		ResultSet resultFirstStop = queryFirstStop.executeQuery(firstStop);
		
		%>
		
		<h3>Information on the First Leg</h3>
		<table>
			<tr>
				<th>Airline Info</th>
				<th>Flight Number</th>
				<th>Aircraft ID</th>
				<th>Departure Airport</th>
				<th>Arrival Airport</th>
				<th>Departure Data/Time</th>
				<th>Arrival Date/Time</th>
				<th>Type</th>
				<th>Seat Number</th>
				<th>Flight Fare</th>
				<th>Ticket Class</th>
			</tr>
		
		</table>
		
	
	
	
		
	<h2></h2>
	
</body>

</html>