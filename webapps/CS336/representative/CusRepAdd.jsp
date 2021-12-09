<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Adding Page</title>
</head>
<body>

<%
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	String test1 = request.getParameter("editing");
	String test2 = request.getParameter("act");
%>

Welcome to the Addition Page. Please enter the credentials for the
<%
	out.print(test1);
%>
 you would like to add.
 
 <%
 	if(test1.equals("aircraft")){
 %>
	<br>
	You must use an already existing Airline.
	<br>
		<form method="post" action="addSuccess.jsp">
		<table>
		<tr>    
		<td>Airline ID</td><td><input type="text" name="airline_id"></td>
		</tr>
		<tr>
		<td>Aircraft ID</td><td><input type="text" name="aircraft_id"></td>
		</tr>
		<tr>
		<td>Total Seats</td><td><input type="text" name="total_seats"></td>
		</tr>
		</table>
		<input type = "hidden" name = "thing" value = "aircraft" >
		<input type="submit" value="Add Aircraft">
		</form>
	<br>
	
	
<% 
 	} else if(test1.equals("airport")){
%>	
 	<br>
		<form method="post" action="addSuccess.jsp">
		<table>
		<tr>    
		<td>Airport ID</td><td><input type="text" name="airport_id"></td>
		</tr>
		<tr>
		<td>Country</td><td><input type="text" name="country"></td>
		</tr>
		<tr>
		<td>Address</td><td><input type="text" name="address"></td>
		</tr>
		<tr>
		<td>Name</td><td><input type="text" name="name"></td>
		</tr>
		</table>
		<input type = "hidden" name = "thing" value = "airport" >
		<input type="submit" value="Add Airport">
		</form>
	<br>

<% 	
 	} else {
 		//dealing with flight
 %>
	<br>
	You must use already existing Airlines, Airports, and Aircrafts.
	<br>
		<form method="post" action="addSuccess.jsp">
		<table>
		<tr>    
		<td>Airline ID</td><td><input type="text" name="airline_id"></td>
		</tr>
		<tr>
		<td>Flight Number</td><td><input type="text" name="flight_number"></td>
		</tr>
		<tr>
		<td>Aircraft ID</td><td><input type="text" name="aircraft_id"></td>
		</tr>
		<tr>
		<td>Departing From Airport</td><td><input type="text" name="depart_from_airport_id"></td>
		</tr>
		<tr>
		<td>Arriving At Airport</td><td><input type="text" name="arrive_at_airport_id"></td>
		</tr>
		<tr>
		<td>Departure Date (YYYY-MM-DD)</td><td><input type="text" name="departure_date"></td>
		</tr>
		<tr>
		<td>Departure Time (HH:MM)</td><td><input type="text" name="departure_time"></td>
		</tr>
		<tr>
		<td>Arrival Date (YYYY-MM-DD)</td><td><input type="text" name="arrival_date"></td>
		</tr>
		<tr>
		<td>Arrival Time (HH:MM)</td><td><input type="text" name="arrival_time"></td>
		</tr>
		<tr>
		<td>Is International (Put 0 for No)</td><td><input type="text" name="is_international"></td>
		</tr>
		<tr>
		<td>Seats Available</td><td><input type="text" name="seats_available"></td>
		</tr>
		
		</table>
		<input type = "hidden" name = "thing" value = "flight" >
		<input type="submit" value="Add Flight">
		</form>
	<br>

<%
 	}
 %>
 
 
<form method="post" action="representativeConsole.jsp">
		<input type="submit" value="Press Here to Return to Customer Representative Console">
	</form>

</body>
</html>
