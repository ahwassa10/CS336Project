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
int totalCost = 0;
int bookingFee = 0;

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
				
				<td><%=resultGeneralInfo.getString("t.departure_date") + " " + resultGeneralInfo.getString("t.departure_time") %></td>
				
				<td><%=resultGeneralInfo.getString("t.arrival_date") + " " + resultGeneralInfo.getString("t.arrival_time") %></td>
				
				<td><%=resultGeneralInfo.getString("t.booking_fee") %></td>
				
				<td><%=resultGeneralInfo.getString("t.cancellation_fee") %></td>
				
				<%bookingFee += Integer.parseInt(resultGeneralInfo.getString("t.booking_fee")); %>
			</tr>
		</table>
		
	<h3>Information on the First Leg</h3>
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
		<table>
			<tr>
				<th>Airline Info</th>
				<th>Flight Number</th>
				<th>Aircraft ID</th>
				<th>Seats Available</th>
				<th>Departure Airport</th>
				<th>Arrival Airport</th>
				<th>Departure Data/Time</th>
				<th>Arrival Date/Time</th>
				<th>Type</th>
				<th>Seat Number</th>
				<th>Flight Fare</th>
				<th>Ticket Class</th>
			</tr>
			<tr>
				<%resultFirstStop.next(); %>
				<td>(<%=resultFirstStop.getString("ar.airline_id")%>) <%=resultFirstStop.getString("ar.airline_name")%></td>
				
				<td><%=resultFirstStop.getString("fo.flight_number") %></td>
				
				<td><%=resultFirstStop.getString("fo.aircraft_id") %></td>
				
				<td><%=resultFirstStop.getString("fo.seats_available")%></td>
				
				<td>(<%=resultFirstStop.getString("a.airport_id")%>) <%=resultFirstStop.getString("a.name") %></td>
				
				<td>(<%=resultFirstStop.getString("aa.airport_id")%>) <%=resultFirstStop.getString("aa.name") %></td>
				
				<td><%=resultFirstStop.getString("fo.departure_date")%> <%=resultFirstStop.getString("fo.departure_time") %></td>
				
				<td><%=resultFirstStop.getString("fo.arrival_date")%> <%=resultFirstStop.getString("fo.arrival_time") %></td>
				
				<td><%=resultFirstStop.getString("fo.is_international").equals("0") ? "Domestic" : "International"%></td>
				
				<td><%=resultFirstStop.getString("p.seat_number") %></td>
				
				<td><%=resultFirstStop.getString("p.flight_fare") %></td>
				
				<td><%=resultFirstStop.getString("p.ticket_class") %></td>
				
				<%totalCost += Integer.parseInt(resultFirstStop.getString("p.flight_fare")); %>
			</tr>
		</table>
		
		<!-- Middle Leg -->
		<%
		String SecondStop = "Select * FROM ticket t, parts p, flightOperated fo, airport a, airport aa, airline ar " +
				   "WHERE p.ticket_id = " + request.getParameter("ticket_id") +
				   " and t.ticket_id = p.ticket_id and p.airline_id = fo.airline_id and p.flight_number = fo.flight_number" +
				   " and t.initial_departure_airport_id <> fo.depart_from_airport_id" +
				   " and t.final_arrival_airport_id <> fo.arrive_at_airport_id" +
				   " and fo.depart_from_airport_id = a.airport_id and fo.arrive_at_airport_id = aa.airport_id" +
				   " and fo.airline_id = ar.airline_id";

		Statement querySecondStop = con.createStatement();
		ResultSet resultSecondStop = querySecondStop.executeQuery(SecondStop);
		
		while (resultSecondStop.next()) {
			out.print("<h3>Information on the Second Leg</h3>");
			out.print("<table>");
			out.print("<tr>");
			out.print("<th>Airline Info</th>");
			out.print("<th>Flight Number</th>");
			out.print("<th>Aircraft ID</th>");
			out.print("<th>Seats Available</th>");
			out.print("<th>Departure Airport</th>");
			out.print("<th>Arrival Airport</th>");
			out.print("<th>Departure Data/Time</th>");
			out.print("<th>Arrival Date/Time</th>");
			out.print("<th>Type</th>");
			out.print("<th>Seat Number</th>");
			out.print("<th>Flight Fare</th>");
			out.print("<th>Ticket Class</th>");
			out.print("</tr>");
			
			out.print("<tr>");
			out.print("<td>(" + resultSecondStop.getString("ar.airline_id") + ") " + resultSecondStop.getString("ar.airline_name") + "</td>");
			out.print("<td>" + resultSecondStop.getString("fo.flight_number") + "</td>");
			out.print("<td>" + resultSecondStop.getString("fo.aircraft_id") + "</td>");
			out.print("<td>" + resultSecondStop.getString("fo.seats_available") + "</td>");
			out.print("<td>(" + resultSecondStop.getString("a.airport_id") + ") " + resultSecondStop.getString("a.name") + "</td>");
			out.print("<td>(" + resultSecondStop.getString("aa.airport_id") + ") " + resultSecondStop.getString("aa.name") + "</td>");
			out.print("<td>" + resultSecondStop.getString("fo.departure_date") + " " + resultSecondStop.getString("fo.departure_time") + "</td>");
			out.print("<td>" + resultSecondStop.getString("fo.arrival_date") + " " + resultSecondStop.getString("fo.arrival_time") + "</td>");
			out.print("<td>" + (resultSecondStop.getString("fo.is_international").equals("0") ? "Domestic" : "International") + "</td>");
			out.print("<td>" + resultSecondStop.getString("seat_number") + "</td>");
			out.print("<td>" + resultSecondStop.getString("flight_fare") + "</td>");
			out.print("<td>" + resultSecondStop.getString("ticket_class") + "</td");
			
			out.print("</tr>");
			out.print("</table>");
			totalCost += Integer.parseInt(resultSecondStop.getString("p.flight_fare"));
			
		}
		%>
		
		<!-- Final Leg -->
		<%
		String thirdStop = "Select * FROM ticket t, parts p, flightOperated fo, airport a, airport aa, airline ar " +
				   "WHERE p.ticket_id = " + request.getParameter("ticket_id") +
				   " and t.ticket_id = p.ticket_id and p.airline_id = fo.airline_id and p.flight_number = fo.flight_number" +
				   " and t.initial_departure_airport_id <> fo.depart_from_airport_id" +
				   " and t.final_arrival_airport_id = fo.arrive_at_airport_id" +
				   " and fo.depart_from_airport_id = a.airport_id and fo.arrive_at_airport_id = aa.airport_id" +
				   " and fo.airline_id = ar.airline_id";

		Statement queryThirdStop = con.createStatement();
		ResultSet resultThirdStop = queryThirdStop.executeQuery(thirdStop);
		
		while (resultThirdStop.next()) {
			out.print("<h3>Information on the Final Leg</h3>");
			out.print("<table>");
			out.print("<tr>");
			out.print("<th>Airline Info</th>");
			out.print("<th>Flight Number</th>");
			out.print("<th>Aircraft ID</th>");
			out.print("<td>Seats Available</th>");
			out.print("<th>Departure Airport</th>");
			out.print("<th>Arrival Airport</th>");
			out.print("<th>Departure Data/Time</th>");
			out.print("<th>Arrival Date/Time</th>");
			out.print("<th>Type</th>");
			out.print("<th>Seat Number</th>");
			out.print("<th>Flight Fare</th>");
			out.print("<th>Ticket Class</th>");
			out.print("</tr>");
			
			out.print("<tr>");
			out.print("<td>(" + resultThirdStop.getString("ar.airline_id") + ") " + resultThirdStop.getString("ar.airline_name") + "</td>");
			out.print("<td>" + resultThirdStop.getString("fo.flight_number") + "</td>");
			out.print("<td>" + resultThirdStop.getString("fo.aircraft_id") + "</td>");
			out.print("<td>" + resultThirdStop.getString("fo.seats_available") + "</td>");
			out.print("<td>(" + resultThirdStop.getString("a.airport_id") + ") " + resultThirdStop.getString("a.name") + "</td>");
			out.print("<td>(" + resultThirdStop.getString("aa.airport_id") + ") " + resultThirdStop.getString("aa.name") + "</td>");
			out.print("<td>" + resultThirdStop.getString("fo.departure_date") + " " + resultThirdStop.getString("fo.departure_time") + "</td>");
			out.print("<td>" + resultThirdStop.getString("fo.arrival_date") + " " + resultThirdStop.getString("fo.arrival_time") + "</td>");
			out.print("<td>" + (resultThirdStop.getString("fo.is_international").equals("0") ? "Domestic" : "International") + "</td>");
			out.print("<td>" + resultThirdStop.getString("seat_number") + "</td>");
			out.print("<td>" + resultThirdStop.getString("flight_fare") + "</td>");
			out.print("<td>" + resultThirdStop.getString("ticket_class") + "</td");
			
			out.print("</tr>");
			out.print("</table>");
			totalCost += Integer.parseInt(resultThirdStop.getString("p.flight_fare"));
			
		}
		%>
	
	<h1>Total Cost of Flight: <%=totalCost%></h1>
	<h1>Booking Fee: <%=bookingFee %></h1>
	
</body>
<% con.close(); %>
</html>