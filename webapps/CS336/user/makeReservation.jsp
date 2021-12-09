<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE HTML>
<html>
<head>
	<title>Making a Reservation</title>
</head>
	<h1>Making a Reservation</h1>
	
	<p>Username: <%=session.getAttribute("username") %></p>
	<p>Ticket ID: <%=request.getParameter("ticket_id") %></p>

</html>