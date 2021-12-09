<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
	<head>
		<title>userConsole</title>
	</head>
	
	<body>
		<h1>Welcome to the User Console <%=session.getAttribute("username")%>!</h1>
		
		<p>What would you like to do?</p>
		
		<form method="get">
			<button type="submit" formaction="Search.jsp">Search for a Flight</button>
			<br>
			
			<button type="submit" formaction="viewTickets.jsp">View all Tickets and Make Reservations</button>
			<br>
			
			<button type="submit" formaction="viewReservations.jsp">Manage your Reservations</button>
			<br>
			
			<button type="submit" formaction="qa.jsp">Manage Questions and Answers</button>
			<br>
			
			<button type="submit" formaction="../Homepage.jsp">Logout</button>
			<br>
		</form>
			
	</body>

</html>
