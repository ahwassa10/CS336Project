<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Edit a Flight</title>
		<style>
			table, th, td {
			border: 1px solid black;
			}
		</style>
	</head>
<body>

<%

	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	String test1 = request.getParameter("username");
%>	
Welcome to the Edit Flight Reservations page. Below is a list of
<%
out.print(test1 + "'s flight reservations.");
%>
Please note that ALL the boxes must be filled. If you do not wish to change an attribute, please enter its current value.

<form method="post" action="representativeConsole.jsp">
	<input type="submit" value="Click here to go back to Representative Console">
</form>

<form method="post" action = "FlightEditSuccess.jsp">
			<table>
				<tr>
					<td> Enter ticket ID of the reservation you'd like to edit:</td> <td> <input type = "text" name = "id"></td>
				</tr>
				<tr>
					<td> Enter new Ticket ID:</td> <td> <input type = "text" name = "ticket_id"></td>
				</tr>
				<tr>
					<td> Enter new Initial Departure Airport ID:</td> <td> <input type = "text" name = "initial_departure_airport_id"></td>
				</tr>
				<tr>
					<td> Enter new Final Arrival Airport ID:</td> <td> <input type = "text" name = "final_arrival_airport_id"></td>
				</tr>
				<tr>
					<td> Enter whether One way or Round Trip(Type 0 for One Way, Type 1 for Round Trip):</td> <td> <input type = "text" name = "type_one_way_or_round_trip"></td>
				</tr>
				<tr>
					<td> Enter whether domestic or international(Type 0 for Domestic, type 1 for International):</td> <td> <input type = "text" name = "type_domestic_or_international"></td>
				</tr>
				<tr>
					<td> Enter new number of stops:</td> <td> <input type = "text" name = "number_of_stops"></td>
				</tr>
				<tr>
					<td> Enter new Flight Duration (HH:MM):</td> <td> <input type = "text" name = "flight_duration"></td>
				</tr>
				<tr>
					<td> Enter new Purchase Date (YYYY-MM-DD):</td> <td> <input type = "text" name = "purchase_date"></td>
				</tr>
				<tr>
					<td> Enter new Purchase Time (HH:MM):</td> <td> <input type = "text" name = "purchase_time"></td>
				</tr>
				<tr>
					<td> Enter new Departure Date (YYYY-MM-DD):</td> <td> <input type = "text" name = "departure_date"></td>
				</tr>
				<tr>
					<td> Enter new Departure Time (HH:MM):</td> <td> <input type = "text" name = "departure_time"></td>
				</tr>
				<tr>
					<td> Enter new Arrival Date (YYYY-MM-DD):</td> <td> <input type = "text" name = "arrival_date"></td>
				</tr>
				<tr>
					<td> Enter new Arrival Time(HH:MM):</td> <td> <input type = "text" name = "arrival_time"></td>
				</tr>
				<tr>
					<td> Enter new Booking Fee:</td> <td> <input type = "text" name = "booking_fee"></td>
				</tr>
				<tr>
					<td> Enter new Cancellation Fee:</td> <td> <input type = "text" name = "cancellation_fee"></td>
				</tr>
				
			</table>
			<input type="submit" value="Continue">
		</form>
<%
	String query = "SELECT t.ticket_id FROM ticket t, user u, purchased p WHERE t.ticket_id = p.ticket_id and u.username = p.username and u.username = ?";
	PreparedStatement ps1 = con.prepareStatement(query);
	ps1.setString(1, test1);
	ResultSet r1 = ps1.executeQuery();
			
		out.print("<table>");
		
		out.print("<tr>");
		
		out.print("<th>");
		out.print("Ticket ID");
		out.print("</th>");
		
		out.print("<th>");
		out.print("Initial Departure Airport ID");
		out.print("</th>");
		
		out.print("<th>");
		out.print("Final Arrival Airport ID");
		out.print("</th>");
		
		out.print("<th>");
		out.print("One Way or Round Trip");
		out.print("</th>");
		
		out.print("<th>");
		out.print("Domestic or International");
		out.print("</th>");
		
		out.print("<th>");
		out.print("Number of Stops");
		out.print("</th>");
		
		out.print("<th>");
		out.print("Flight Duration");
		out.print("</th>");
		
		out.print("<th>");
		out.print("Purchase Date");
		out.print("</th>");
		
		out.print("<th>");
		out.print("Purchase Time");
		out.print("</th>");
		
		out.print("<th>");
		out.print("Departure Date");
		out.print("</th>");
		
		out.print("<th>");
		out.print("Departure Time");
		out.print("</th>");
		
		out.print("<th>");
		out.print("Arrival Date");
		out.print("</th>");
		
		out.print("<th>");
		out.print("Arrival Time");
		out.print("</th>");
		
		out.print("<th>");
		out.print("Booking Fee");
		out.print("</th>");
		
		out.print("<th>");
		out.print("Cancellation Fee");
		out.print("</th>");
		
		
		out.print("</tr>");
		
		while(r1.next()){
			
			String query2 ="SELECT * FROM ticket WHERE ticket_id = ?";
			PreparedStatement ps2 = con.prepareStatement(query2);
			ps2.setString(1, r1.getString("ticket_id"));
			ResultSet r2 = ps2.executeQuery();
			
			while(r2.next()){
			out.print("<tr>");
			
			out.print("<td>");
			out.print(r2.getString("ticket_id"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(r2.getString("initial_departure_airport_id"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(r2.getString("final_arrival_airport_id"));
			out.print("</td>");
			
			out.print("<td>");
			String x = r2.getString("type_one_way_or_round_trip");
			if(x.equals("0")){
				out.print("One Way");
			} else {
				out.print("Round Trip");
			}
			out.print("</td>");
			
			out.print("<td>");
			String test = r2.getString("type_domestic_or_international");
			if(test.equals("0")){
				out.print("Domestic");
			} else{
				out.print("International");
			}
			out.print("</td>");
			
			out.print("<td>");
			out.print(r2.getString("number_of_stops"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(r2.getString("flight_duration"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(r2.getString("purchase_date"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(r2.getString("purchase_time"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(r2.getString("departure_date"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(r2.getString("departure_time"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(r2.getString("arrival_date"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(r2.getString("arrival_time"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(r2.getString("booking_fee"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(r2.getString("cancellation_fee"));
			out.print("</td>");
			
			out.print("</tr>");
			}
		
			
		}
		out.print("</table>");
	
	
	
	
	
%>












</body>
</html>