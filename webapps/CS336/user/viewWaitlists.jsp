<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE HTML>
<html>
<head>
	<title>View Waitlists</title>
</head>

<%
ApplicationDB db = new ApplicationDB();
Connection con = db.getConnection();

String username = session.getAttribute("username").toString();

%>

<body>
	<h1>Showing Waitlists for <%=username%></h1>


</body>


<%con.close();%>
</html>