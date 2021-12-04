<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>List Of Flights</title>
		<style>
		table, th, td {
			border: 1px solid black;
		}
		</style>
	</head>
<body>
Below is a list of departing and arriving flights for <%String AirportID = request.getParameter("AirportID");
														out.println(AirportID + " airport.");
														%>
<h2>
Departing Flights
</h2>
<%
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	
	//AirportID has the ID requested.
	
	String select1 = "SELECT * FROM flightoperated f WHERE f.depart_from_airport_id = ?";
	
	PreparedStatement ps = con.prepareStatement(select1);
	ps.setString(1, AirportID);
	ResultSet result1 = ps.executeQuery();
	
	/*
	while(result1.next()){
		out.println(result1.getString("aircraft_id"));
	}
	*/
	
%>
	
<% 
	if(!result1.isBeforeFirst()){
		out.print("There are no departing flights from " + AirportID + " airport");
	} else {

		out.print("<table>");
		
		//this creates a row
		out.print("<tr>");
		
		//This makes the columns
		out.print("<th>");
		out.print("Airline ID");
		out.print("</th>");
		
		out.print("<th>");
		out.print("Aircraft ID");
		out.print("</th>");
		
		out.print("<th>");
		out.print("Departing From");
		out.print("</th>");
		
		out.print("<th>");
		out.print("Arriving In");
		out.print("</th>");
		
		out.print("<th>");
		out.print("Flight Number");
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
		
		out.print("</tr>");
		
		while(result1.next()){
			//this creates a row
			out.print("<tr>");
			//This makes the columns
			out.print("<td>");
			out.print(result1.getString("airline_ID"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result1.getString("aircraft_ID"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result1.getString("depart_from_airport_id"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result1.getString("arrive_at_airport_id"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result1.getString("flight_number"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result1.getString("departure_data"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result1.getString("departure_time"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result1.getString("arrival_data"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result1.getString("arrival_time"));
			out.print("</td>");
			
			out.print("</tr>");
		}
		out.print("</table>");
		
	}
	
	

%>



<h2>
Arriving Flights
</h2>

<%
	String select2 = "SELECT * FROM flightoperated f WHERE f.arrive_at_airport_id = ?";

	PreparedStatement ps2 = con.prepareStatement(select2);
	ps2.setString(1, AirportID);
	ResultSet result2 = ps2.executeQuery();

	if(!result2.isBeforeFirst()){
		out.print("There are no flights arriving at " + AirportID + " airport");
	} else {

		out.print("<table>");
	
		//this creates a row
		out.print("<tr>");
	
		//This makes the columns
		out.print("<th>");
		out.print("Airline ID");
		out.print("</th>");
		
		out.print("<th>");
		out.print("Aircraft ID");
		out.print("</th>");
	
		out.print("<th>");
		out.print("Departing From");
		out.print("</th>");
	
		out.print("<th>");
		out.print("Arriving In");
		out.print("</th>");
	
		out.print("<th>");
		out.print("Flight Number");
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
	
		out.print("</tr>");
	
		while(result2.next()){
			//this creates a row
			out.print("<tr>");
			//This makes the columns
			out.print("<td>");
			out.print(result2.getString("airline_ID"));
			out.print("</td>");
		
			out.print("<td>");
			out.print(result2.getString("aircraft_ID"));
			out.print("</td>");
		
			out.print("<td>");
			out.print(result2.getString("depart_from_airport_id"));
			out.print("</td>");
		
			out.print("<td>");
			out.print(result2.getString("arrive_at_airport_id"));
			out.print("</td>");
		
			out.print("<td>");
			out.print(result2.getString("flight_number"));
			out.print("</td>");
		
			out.print("<td>");
			out.print(result2.getString("departure_data"));
			out.print("</td>");
		
			out.print("<td>");
			out.print(result2.getString("departure_time"));
			out.print("</td>");
		
			out.print("<td>");
			out.print(result2.getString("arrival_data"));
			out.print("</td>");
		
			out.print("<td>");
			out.print(result2.getString("arrival_time"));
			out.print("</td>");
		
			out.print("</tr>");
		}
		out.print("</table>");
	
	}

%>

</body>
</html>