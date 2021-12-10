<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE HTML>
<html>
<head>
	<title>Deleting Waitlist</title>
</head>

<%
String airline_id = request.getParameter("airline_id").toString();
String flight_number = request.getParameter("flight_number").toString();
String username = session.getAttribute("username").toString();



%>

<body>


</body>

</html>