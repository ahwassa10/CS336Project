<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>userConsole</title>
	</head>
	
	<body>
		<h1>Welcome to the User Console!</h1>
		
<form method="get" action="Search.jsp">
	<input type="submit" value="Browse Flights">
</form>

<br>

<form method="get" action="Homepage.jsp">
	<input type="submit" value="Logout">
	
	
	</body>

</html>
