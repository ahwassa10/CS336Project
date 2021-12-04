<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Most Active Flights</title>
	</head>
	
	<body>
		<h1>
			List of Flights by Tickets Sold
		</h1>
		<%
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();

            Statement stmt = con.createStatement();
			String str = "SELECT flight_number,airline_id,aircraft_id,COUNT(*) tickets_sold FROM ticket GROUP BY airline_id,aircraft_id,flight_number ORDER BY tickets_sold DESC";

			ResultSet result = stmt.executeQuery(str);
			
			out.print("<table>");
			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header
			out.print("flight_number");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("airline_id");
			out.print("</td>");
			out.print("<td>");
			out.print("aircraft_id");
			out.print("</td>");
			out.print("<td>");
			out.print("tickets_sold");
			out.print("</td>");
			out.print("</tr>");
			
			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current flight_id/airline_id/username:
				out.print(result.getString("flight_number"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("airline_id"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("aircraft_id"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("tickets_sold"));
				out.print("</td>");
				out.print("</tr>");
			}
			out.print("</table>");
		%>
</body>
</html>
