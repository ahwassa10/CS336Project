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
				String input2="";
				if (reservationsBy.equals("flight_number")) {
					input2 = request.getParameter("input2");
					out.print(" airline_id "+input2);
				}
			%>
		</h1>
		<%
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();

            Statement stmt = con.createStatement();
			String str;

			PreparedStatement ps;
			if (reservationsBy.equals("flight_number")) {
				str = "SELECT * FROM ticket JOIN parts USING(ticket_id) WHERE flight_number=? AND airline_id=?";
				ps = con.prepareStatement(str);
				ps.setString(1,input);
				ps.setString(2,input2);
			}
			else if (reservationsBy.equals("name")) {
				str = "SELECT * FROM ticket JOIN purchased USING(ticket_id) WHERE username=?";
				ps = con.prepareStatement(str);
				ps.setString(1,input);
			}
			else {
				str = "SELECT * FROM ticket";
				out.println("Bad reservationsBy");				
				ps = con.prepareStatement(str);
				ps.setString(1,input);
			}


			ResultSet result = ps.executeQuery();
			
			out.print("<table>");
			//make a row
			out.print("<tr>");
			//print out column header
			out.print("<td>ticket_id</td>");
			out.print("<td>initial_departure_airport_id</td>");
			out.print("<td>final_arrival_airport_id</td>");
			out.print("<td>type_one_way_or_round_trip</td>");
			out.print("<td>type_domestic_or_international</td>");
			out.print("<td>number_of_stops</td>");
			out.print("<td>flight_duration</td>");
			out.print("<td>purchase_date</td>");
			out.print("<td>purchase_time</td>");
			out.print("<td>departure_date</td>");
			out.print("<td>departure_time</td>");
			out.print("<td>arrival_date</td>");
			out.print("<td>arrival_time</td>");
			out.print("<td>booking_fee</td>");
			out.print("<td>cancellation_fee</td>");
			out.print("</tr>");
			
			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>"+result.getString("ticket_id")+"</td>");
				out.print("<td>"+result.getString("initial_departure_airport_id")+"</td>");
				out.print("<td>"+result.getString("final_arrival_airport_id")+"</td>");
				out.print("<td>"+result.getString("type_one_way_or_round_trip")+"</td>");
				out.print("<td>"+result.getString("type_domestic_or_international")+"</td>");
				out.print("<td>"+result.getString("number_of_stops")+"</td>");
				out.print("<td>"+result.getString("flight_duration")+"</td>");
				out.print("<td>"+result.getString("purchase_date")+"</td>");
				out.print("<td>"+result.getString("purchase_time")+"</td>");
				out.print("<td>"+result.getString("departure_date")+"</td>");
				out.print("<td>"+result.getString("departure_time")+"</td>");
				out.print("<td>"+result.getString("arrival_date")+"</td>");
				out.print("<td>"+result.getString("arrival_time")+"</td>");
				out.print("<td>"+result.getString("booking_fee")+"</td>");
				out.print("<td>"+result.getString("cancellation_fee")+"</td>");
				out.print("</tr>");
			}
			out.print("</table>");
			con.close();
		%>
</body>
</html>
