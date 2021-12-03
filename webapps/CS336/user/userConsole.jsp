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
		
		<form method="get" action="Search.jsp">
			<button type="submit">Browse Flights</button>
		</form>
		
		<form method="get" action="qa.jsp">
			<button type="submit">Browse Questions and Answers</button>
		</form>
		
		<form method="get" action="reservations.jsp">
			<button type="submit">Browse Your Reservations</button>
		</form>

		<form method="get" action="../Homepage.jsp">
			<button type="submit">Logout</button>
		</form>
			
	</body>

</html>
