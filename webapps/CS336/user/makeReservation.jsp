<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE HTML>
<html>
<head>
	<title>Making a Reservation</title>
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

<%
ApplicationDB db = new ApplicationDB();
Connection con = db.getConnection();

String query = "SELECT * FROM ticket t, parts p, flightOperated fo " +
               "WHERE t.ticket_id = p.ticket_id AND p.airline_id = fo.airline_id AND p.flight_number = fo.flight_number " +
			   "AND t.ticket_id = \"" + request.getParameter("ticket_id") + "\"";

Statement getFlights = con.createStatement();
ResultSet resultGetFlights = getFlights.executeQuery(query);

boolean canPurchase = true;
ArrayList<String> airlineIDs = new ArrayList<String>();
ArrayList<String> flightNumbers = new ArrayList<String>();
ArrayList<Integer> seatsAvailable = new ArrayList<Integer>();
%>

<body>
	<h1>Making a Reservation</h1>
	
	<p>Username: <%=session.getAttribute("username") %></p>
	<p>Ticket ID: <%=request.getParameter("ticket_id") %></p>
	
	<table>
		<tr>
			<th>Airline ID</th>
			<th>Flight Number</th>
			<th>Departing Airport</th>
			<th>Arrival Airport</th>
			<th>Flight Available</th>
		</tr>
		<%
			while(resultGetFlights.next()) {
				out.print("<tr>");
				
				out.print("<td>" + resultGetFlights.getString("airline_id") + "</td>");
				airlineIDs.add(resultGetFlights.getString("airline_id"));
				
				out.print("<td>" + resultGetFlights.getString("flight_number") + "</td>");
				flightNumbers.add(resultGetFlights.getString("flight_number"));
				
				out.print("<td>" + resultGetFlights.getString("depart_from_airport_id") + "</td>");
				out.print("<td>" + resultGetFlights.getString("arrive_at_airport_id") + "</td>");
				
				int seats = Integer.parseInt(resultGetFlights.getString("seats_available"));
				seatsAvailable.add(seats);
				
				if (seats == 0) {
					canPurchase = false;
					out.print("<td id=\"st2\">No</td>");
				} else {
					out.print("<td id=\"st1\">Yes</td>");
				}
				
				out.print("</tr>");
			}
		%>
	</table>
	
	<%
	if (canPurchase == false) {
		out.print("<h1>Sorry, one or more flights are full. Please join the respective waitinglists</h1>");
	} else {
		for(int i = 0; i < airlineIDs.size(); i++) {
			String airlineID = airlineIDs.get(i);
			String flightNumber = flightNumbers.get(i);
			int seatsAvail = seatsAvailable.get(i);
			
			String updateQuery = "UPDATE flightOperated " +
			                     "SET seats_available=" + (seatsAvail - 1) + " " +
			                     "WHERE airline_id=\"" + airlineID + "\" AND flight_number=\"" + flightNumber + "\""; 
			
			Statement updateFlights = con.createStatement();
			int ret = updateFlights.executeUpdate(updateQuery);
		}
		
		String purchase = "INSERT INTO purchased " +
						  "VALUES(\""+ request.getParameter("ticket_id") + "\", \"" + session.getAttribute("username") +
				          "\", false)";
		
		Statement purchaseTicket = con.createStatement();
		purchaseTicket.executeUpdate(purchase);
		
		String updateTicket = "UPDATE ticket " +
		                      "SET purchase_date=CURDATE(), purchase_time=CURTIME() " +
		                      "WHERE ticket_id=\"" + request.getParameter("ticket_id") + "\"";
		
		Statement setTimeDate = con.createStatement();
		setTimeDate.executeUpdate(updateTicket);
		
	}
	
	%>
	
	
</body>
</html>