<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Reservations</title>
	</head>
	
	<body>
		<h1>
			Reservations for 
			<% 
				String reservationsBy = request.getParameter("reservationsBy");
				out.print(reservationsBy+" ");
				String input = request.getParameter("input");
				out.print(input);
			%>
		</h1>
		<%
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();

            Statement stmt = con.createStatement();
			String str;

			if (reservationsBy.equals("flight_number")) {
				str = "SELECT * FROM ticket WHERE flight_number=?";
			}
			else if (reservationsBy.equals("name")) {
				str = "SELECT t.* FROM ticket t JOIN purchased p ON t.ticket_id=p.ticket_id AND t.aircraft_id=p.aircraft_id AND t.flight_number=p.flight_number WHERE p.username=?";
			}
			else {
				str = "SELECT * FROM ticket";
				out.println("Bad reservationsBy");				
			}

			PreparedStatement ps = con.prepareStatement(str);
			ps.setString(1,input);

			ResultSet result = ps.executeQuery();
			
			out.print("<table>");
			//make a row
			out.print("<tr>");
			//print out column header
			out.print("<td>ticket_id</td>");
			out.print("<td>airline_id</td>");
			out.print("<td>aircraft_id</td>");
			out.print("<td>depart_from_airport_id</td>");
			out.print("<td>arrive_at_airport_id</td>");
			out.print("<td>flight_number</td>");
			out.print("<td>type_one_way_or_round_trip</td>");
			out.print("<td>type_domestic_or_international</td>");
			out.print("<td>departure_date</td>");
			out.print("<td>departure_time</td>");
			out.print("<td>purchase_date</td>");
			out.print("<td>purchase_time</td>");
			out.print("<td>total_fare</td>");
			out.print("<td>booking_fee</td>");
			out.print("<td>cancellation_fee</td>");
			out.print("<td>was_cancelled</td>");
			out.print("<td>flight_duration</td>");
			out.print("<td>arrival_time</td>");
			out.print("<td>arrival_date</td>");
			out.print("<td>seat_number</td>");
			out.print("</tr>");
			
			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>"+result.getString("ticket_id")+"</td>");
				out.print("<td>"+result.getString("airline_id")+"</td>");
				out.print("<td>"+result.getString("aircraft_id")+"</td>");
				out.print("<td>"+result.getString("depart_from_airport_id")+"</td>");
				out.print("<td>"+result.getString("arrive_at_airport_id")+"</td>");
				out.print("<td>"+result.getString("flight_number")+"</td>");
				out.print("<td>"+result.getString("type_one_way_or_round_trip")+"</td>");
				out.print("<td>"+result.getString("type_domestic_or_international")+"</td>");
				out.print("<td>"+result.getString("departure_date")+"</td>");
				out.print("<td>"+result.getString("departure_time")+"</td>");
				out.print("<td>"+result.getString("purchase_date")+"</td>");
				out.print("<td>"+result.getString("purchase_time")+"</td>");
				out.print("<td>"+result.getString("total_fare")+"</td>");
				out.print("<td>"+result.getString("booking_fee")+"</td>");
				out.print("<td>"+result.getString("cancellation_fee")+"</td>");
				out.print("<td>"+result.getString("was_cancelled")+"</td>");
				out.print("<td>"+result.getString("flight_duration")+"</td>");
				out.print("<td>"+result.getString("arrival_time")+"</td>");
				out.print("<td>"+result.getString("arrival_date")+"</td>");
				out.print("<td>"+result.getString("seat_number")+"</td>");
				out.print("</tr>");
			}
			out.print("</table>");
		%>
</body>
</html>
