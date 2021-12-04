<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Waiting List</title>
</head>
<body>

<h1>Below is the waiting list for Flight Number <%String flightNumber = request.getParameter("flightNumber"); 
									out.println(flightNumber);%> </h1>
									
									
<%

	//Get the database connection
	ApplicationDB db = new ApplicationDB(); 
	Connection con = db.getConnection();
	
	//Create an SQL statement
	//Statement stmt = con.createStatement();
	
	//Get parameters from the HTML form at the Homepage.jsp
	//String flightNumber = request.getParameter("flightNumber");
	//out.print(flightNumber);
	
	//Now we have the sql statement
	String select = "SELECT w.username, u.first_name, u.last_name FROM waitlist w, user u WHERE u.username = w.username and w.flight_number = ?";
	//Creating a prepared statement
	PreparedStatement ps = con.prepareStatement(select);
	//Adding parameters to the query
	ps.setString(1, flightNumber);
	//This has the results from the query
	ResultSet result = ps.executeQuery();
	
	if(!result.isBeforeFirst()){
		out.print("The waiting list is currently empty.");
		return;
	}
	//this creates a table
	out.print("<table>");
	
	//this creates a row
	out.print("<tr>");
	
	//This makes the columns
	out.print("<td>");
	out.print("Username");
	out.print("</td>");
	
	out.print("<td>");
	out.print("First Name");
	out.print("</td>");
	
	out.print("<td>");
	out.print("Last Name");
	out.print("</td>");
	
	while(result.next()){
		out.print("<tr>");
		out.print("<td>");
		out.print(result.getString("username"));
		out.print("</td>");
		
		out.print("<td>");
		out.print(result.getString("first_name"));
		out.print("</td>");
		
		out.print("<td>");
		out.print(result.getString("last_name"));
		out.print("</td>");
		
		out.print("</tr>");
	}
	out.print("</table");
	con.close();
%>


</body>
</html>
