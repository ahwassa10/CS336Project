<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Editing Page</title>
		<style>
			table, th, td {
			border: 1px solid black;
			}
		</style>
</head>
<body>

<% 
try{
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	String test1 = request.getParameter("thing");
	String test2 = request.getParameter("id");
	//String query = "DELETE FROM ? WHERE ? = ?";
	//PreparedStatement ps = con.prepareStatement(query);
	//id is the ID of the thing we're deleting
	//thing is what we're deleting specifically, so it will only be aircraft, airport, or flight
	
	if(test1.equals("aircraft")){
		String q1 = "SELECT airline_id FROM aircraftOwned WHERE aircraft_id = ?";
		PreparedStatement ps3 = con.prepareStatement(q1);
		ps3.setString(1, test2);
		ResultSet r1 = ps3.executeQuery();
		String airline_id = request.getParameter("airline_id");
		String aircraft_id = request.getParameter("aircraft_id");
		String total_seats = request.getParameter("total_seats");
		//out.print(total_seats);
		//String test3;
		while(r1.next()){
			String test3 = r1.getString("airline_id");
			//out.print(test3);
			String query2 = "UPDATE aircraftOwned SET airline_id = ?, aircraft_id = ?, total_seats = ? WHERE aircraft_id = ? and airline_id = ?";
			PreparedStatement ps2 = con.prepareStatement(query2);
			ps2.setString(1, airline_id);
			ps2.setString(2, aircraft_id);
			ps2.setString(3, total_seats);
			ps2.setString(4, test2);
			ps2.setString(5, test3);				
		
		//ps.setString(3, test2);
			ps2.executeUpdate();
			break;
		}
		
		
	} else if(test1.equals("airport")){
		String q2 = "UPDATE airport SET airport_id = ?, country = ?, address = ?, name = ? WHERE airport_id = ?";
		String airport_id = request.getParameter("airport_id");
		String country = request.getParameter("country");
		String address = request.getParameter("address");
		String name = request.getParameter("name");
		
		PreparedStatement ps2 = con.prepareStatement(q2);
		ps2.setString(1, airport_id);
		ps2.setString(2, country);
		ps2.setString(3, address);
		ps2.setString(4, name);
		ps2.setString(5, test2);
		
		//ps.setString(3, test2);
		ps2.executeUpdate();
	} else {
		//Here we deal with flights
		String q3 = "SELECT airline_id FROM flightOperated WHERE flight_number = ?";

		PreparedStatement ps3 = con.prepareStatement(q3);

		ps3.setString(1, test2);
		ResultSet r2 = ps3.executeQuery();
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
		
		while(r2.next()){
			String test3 = r2.getString("airline_id");
			String query2 = "UPDATE flightOperated SET airline_id = ?, flight_number = ?, aircraft_id = ?, depart_from_airport_id = ?, arrive_at_airport_id = ?, departure_date = ?, departure_time = ?, arrival_date = ?, arrival_time = ?, is_international = ?, seats_available = ? WHERE airline_id = ? and flight_number = ?";
			PreparedStatement ps2 = con.prepareStatement(query2);
			ps2.setString(1, airline_id);
			ps2.setString(2, flight_number);
			ps2.setString(3, aircraft_id);
			ps2.setString(4, depart_from_airport_id);
			ps2.setString(5, arrive_at_airport_id);
			ps2.setString(6, departure_date);
			ps2.setString(7, departure_time);
			ps2.setString(8, arrival_date);
			ps2.setString(9, arrival_time);
			ps2.setString(10, is_international);
			ps2.setString(11, seats_available);
			ps2.setString(12, test3);
			ps2.setString(13, test2);
			
			ps2.executeUpdate();
			
			break;
		}
			
		
	}
	out.print("Edit Succeeded");
	
} catch (Exception ex){
	out.print(ex);
	out.print("Edit Failed");
}
%>

<form method="post" action="representativeConsole.jsp">
	<input type="submit" value="Click here to go back to Representative Console">
</form>




</body>
</html>