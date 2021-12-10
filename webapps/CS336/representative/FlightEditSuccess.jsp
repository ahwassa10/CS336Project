<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Flight Edit Success</title>
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
	
	String OGTicket_ID = request.getParameter("id");
	String ticket_id = request.getParameter("ticket_id");
	String initial_departure_airport_id = request.getParameter("initial_departure_airport_id");
	String final_arrival_airport_id = request.getParameter("final_arrival_airport_id");
	String type_one_way_or_round_trip = request.getParameter("type_one_way_or_round_trip");
	String type_domestic_or_international = request.getParameter("type_domestic_or_international");
	String number_of_stops = request.getParameter("number_of_stops");
	String flight_duration = request.getParameter("flight_duration");
	String purchase_date = request.getParameter("purchase_date");
	String purchase_time = request.getParameter("purchase_time");
	String departure_date = request.getParameter("departure_date");
	String departure_time = request.getParameter("departure_time");
	String arrival_date = request.getParameter("arrival_date");
	String arrival_time = request.getParameter("arrival_time");
	String booking_fee = request.getParameter("booking_fee");
	String cancellation_fee = request.getParameter("cancellation_fee");
	

	
		//Here we deal with flights
	/*
	String q1 = "SELECT initial_departure_airport_od, final_arrival_airport_id FROM ticket WHERE ticket_id = ?";
	PreparedStatement ps1 = con.prepareStatement(q1);
	ps1.setString(1, OGTicket_ID);
	ResultSet r1 = ps1.executeQuery();
	while(r1.next()){
	*/
		
		//String test3 = r2.getString("airline_id");
		String query2 = "UPDATE ticket SET ticket_id = ?, initial_departure_airport_id = ?, final_arrival_airport_id = ?, type_one_way_or_round_trip = ?, type_domestic_or_international = ?, number_of_stops = ?, flight_duration = ?, purchase_date = ?, purchase_time = ?, departure_date = ?, departure_time = ?, arrival_date = ?, arrival_time = ?, booking_fee = ?, cancellation_fee = ? WHERE ticket_id = ?";
		PreparedStatement ps2 = con.prepareStatement(query2);
		ps2.setString(1, ticket_id);
		ps2.setString(2, initial_departure_airport_id);
		ps2.setString(3, final_arrival_airport_id);
		ps2.setString(4, type_one_way_or_round_trip);
		ps2.setString(5, type_domestic_or_international);
		ps2.setString(6, number_of_stops);
		ps2.setString(7, flight_duration);
		ps2.setString(8, purchase_date);
		ps2.setString(9, purchase_time);
		ps2.setString(10, departure_date);
		ps2.setString(11, departure_time);
		ps2.setString(12, arrival_date);
		ps2.setString(13, arrival_time);
		ps2.setString(14, booking_fee);
		ps2.setString(15, cancellation_fee);
		ps2.setString(16, OGTicket_ID);
		
		ps2.executeUpdate();
				
	
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