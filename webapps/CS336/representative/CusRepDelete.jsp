<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Deleting Page</title>
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
	String test1 = request.getParameter("editing");
	String test2 = request.getParameter("act");
%>

Welcome to the deletion page. Below is a list of all 
<%out.print(test1 + "s"); 

	if(test1.equals("aircraft")){
		String str1 = "SELECT * from aircraftowned ORDER BY aircraft_id ASC";
		PreparedStatement ps1 = con.prepareStatement(str1);
		ResultSet result1 = ps1.executeQuery();
		if(!result1.isBeforeFirst()){
			out.print("There are no aircrafts to delete");
		} else {
%>
		<form method="post" action = "deleteSuccess.jsp">
			<table>
				<tr>
					<td> Enter aircraft ID of the aircraft you'd like to delete:</td> <td> <input type = "text" name = "id"></td>
				</tr>
			</table>
			<input type = "hidden" name = "thing" value = "aircraft" >
			<input type="submit" value="Continue">
		</form>

			
<%
			out.print("<table>");
			
			out.print("<tr>");
			
			out.print("<th>");
			out.print("Airline ID");
			out.print("</th>");
			
			out.print("<th>");
			out.print("Aircraft ID");
			out.print("</th>");
			
			out.print("<th>");
			out.print("Total Seats");
			out.print("</th>");
			
			out.print("</tr>");
			
			while(result1.next()){
				out.print("<tr>");
				out.print("<td>");
				out.print(result1.getString("airline_id"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result1.getString("aircraft_id"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result1.getString("total_seats"));
				out.print("</td>");
				
				out.print("</tr>");
			}
			
			out.print("</table>");
		}
%>		
	
<% 	
	} else if(test1.equals("airport")){
		String str1 = "SELECT * from airport";
		PreparedStatement ps1 = con.prepareStatement(str1);
		ResultSet result1 = ps1.executeQuery();
		if(!result1.isBeforeFirst()){
			out.print("There are no airports to delete");
		} else {
%>
		<form method="post" action = "deleteSuccess.jsp">
			<table>
				<tr>
					<td> Enter airport ID of the airport you'd like to delete:</td> <td> <input type = "text" name = "id"></td>
				</tr>
			</table>
			<input type = "hidden" name = "thing" value = "airport" >			
			<input type="submit" value="Continue">
		</form>

			
<%
			out.print("<table>");
			
			out.print("<tr>");
			
			out.print("<th>");
			out.print("Airport ID");
			out.print("</th>");
			
			out.print("<th>");
			out.print("Country");
			out.print("</th>");
			
			out.print("<th>");
			out.print("Address");
			out.print("</th>");
			
			out.print("<th>");
			out.print("Name");
			out.print("</th>");
			
			out.print("</tr>");
			
			while(result1.next()){
				out.print("<tr>");
				out.print("<td>");
				out.print(result1.getString("airport_id"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result1.getString("country"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result1.getString("address"));
				out.print("</td>");
				
				out.print("<th>");
				out.print(result1.getString("name"));
				out.print("</th>");
				
				out.print("</tr>");
			}
			
			out.print("</table>");
		}
%>
	
<%
	} else {
		//Here we'd be dealing with flights
		String str1 = "SELECT * from flightOperated ORDER BY flight_number ASC";
		PreparedStatement ps1 = con.prepareStatement(str1);
		ResultSet result1 = ps1.executeQuery();
		if(!result1.isBeforeFirst()){
			out.print("There are no flights to delete");
		} else {
%>
		<form method="post" action = "deleteSuccess.jsp">
			<table>
				<tr>
					<td> Enter flight ID of the flight you'd like to delete:</td> <td> <input type = "text" name = "id"></td>
				</tr>
			</table>
			<input type = "hidden" name = "thing" value = "flight" >
			<input type="submit" value="Continue">
		</form>

			
<%
			out.print("<table>");
			
			out.print("<tr>");
			
			out.print("<th>");
			out.print("Airline ID");
			out.print("</th>");
			
			out.print("<th>");
			out.print("Flight Number");
			out.print("</th>");
			
			out.print("<th>");
			out.print("Aircraft ID");
			out.print("</th>");
			
			out.print("<th>");
			out.print("Departing From");
			out.print("</th>");
			
			out.print("<th>");
			out.print("Arriving At");
			out.print("</th>");
			
			/*
			out.print("<th>");
			out.print("Ticket Class");
			out.print("</th>");
			
			
			out.print("<th>");
			out.print("Flight Fare");
			out.print("</th>");
			*/
			
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
			out.print("Is International");
			out.print("</th>");
			
			out.print("<th>");
			out.print("Seats Available");
			out.print("</th>");
			
			out.print("</tr>");
			
			while(result1.next()){
				out.print("<tr>");
				
				out.print("<td>");
				out.print(result1.getString("airline_id"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result1.getString("flight_number"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result1.getString("aircraft_id"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result1.getString("depart_from_airport_id"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result1.getString("arrive_at_airport_id"));
				out.print("</td>");
				
				/*
				out.print("<td>");
				out.print(result1.getString("ticket_class"));
				out.print("</td>");
				
				
				out.print("<td>");
				out.print(result1.getString("flight_fare"));
				out.print("</td>");
				*/
				
				out.print("<td>");
				out.print(result1.getString("departure_date"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result1.getString("departure_time"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result1.getString("arrival_date"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result1.getString("arrival_time"));
				out.print("</td>");
				
				
				out.print("<td>");
				if(result1.getString("is_international").equals("0")){
					out.print("No");
				} else {
					out.print("Yes");
				}
				out.print("</td>");
				
				out.print("<td>");
				out.print(result1.getString("seats_available"));
				out.print("</td>");
				
				out.print("</tr>");
			}
			
			out.print("</table>");
		}
%>
	
<%
	}
%>
	
<form method="post" action="representativeConsole.jsp">
		<input type="submit" value="Press Here to Return to Customer Representative Console">
	</form>

</body>
</html>