<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Redirect Page</title>
</head>

<body>
<%
try{
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	String test1 = request.getParameter("thing");

 	if(test1.equals("aircraft")){
 		String airline_id = request.getParameter("airline_id");
 		String aircraft_id = request.getParameter("aircraft_id");
 		String total_seats = request.getParameter("total_seats");
 		
 		String query = "INSERT INTO aircraftOwned VALUES (?, ?, ?)";
 		PreparedStatement ps = con.prepareStatement(query);
 		ps.setString(1, airline_id);
 		ps.setString(2, aircraft_id);
 		ps.setString(3, total_seats);
 		
 		ps.executeUpdate();
 		
 		con.close();
 		out.print("Aircraft Added");
 		
 	} else if(test1.equals("airport")){
		String airport_id = request.getParameter("airport");
		String country = request.getParameter("country");
		String address = request.getParameter("address");
		String name = request.getParameter("name");
		
		String query = "INSERT INTO airport VALUES (?, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, airport_id);
		ps.setString(2, country);
		ps.setString(3, address);
		ps.setString(4, name);
		
		ps.executeUpdate();
		
		con.close();
		out.print("Airport Added");
 		
 	} else {
 		//dealing with flight
 		String airline_id = request.getParameter("airline_id");
		String flight_number = request.getParameter("flight_number");
		String aircraft_id = request.getParameter("aircraft_id");
		String depart_from_airport_id = request.getParameter("depart_from_airport_id");
		String arrive_at_airport_id = request.getParameter("arrive_at_airport_id");
		String departure_date = request.getParameter("departure_date");
		String departure_time = request.getParameter("departure_time");
		String arrival_date = request.getParameter("arrival_date");
		String arrival_time = request.getParameter("arrival_time");
		String is_international = request.getParameter("is_international");
		String seats_available = request.getParameter("seats_available");
		
		
		
		String query = "INSERT INTO flightOperated VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, airline_id);
		ps.setString(2, flight_number);
		ps.setString(3, aircraft_id);
		ps.setString(4, depart_from_airport_id);
		ps.setString(5, arrive_at_airport_id);
		ps.setString(6, departure_date);
		ps.setString(7, departure_time);
		ps.setString(8, arrival_date);
		ps.setString(9, arrival_time);
		ps.setString(10, is_international);
		ps.setString(11, seats_available);
		
		ps.executeUpdate();
		
		con.close();
		out.print("Flight Added");
 		
 	}
} catch (Exception ex){
	out.print(ex);
	out.print("Deletion failure. Please use existing values for airlines, airports, and aircrafts.");
}
 %>
 
 <form method="post" action="representativeConsole.jsp">
	<input type="submit" value="Click here to go back to Representative Console">
</form>

</body>
</html>