<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Redirect Page</title>
</head>


</head>
<body>
Press the button below to continue
<%

	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	String test1 = request.getParameter("editing");
	String test2 = request.getParameter("act");
	
	if(test2.equals("add")){
%>
		<form method = post action = "CusRepAdd.jsp">
			<input type = "hidden" name = "act" value = "<%=test2%>" >
			<input type = "hidden" name = "editing" value = "<%=test1%>" >
			<input type = "submit" value = "Continue">
		</form>
<%
	} else if(test2.equals("edit")){
%>
		<form method = post action = "CusRepEdit.jsp">
			<input type = "hidden" name = "act" value = "<%=test2%>" >
			<input type = "hidden" name = "editing" value = "<%=test1%>" >
			<input type = "submit" value = "Continue">
		</form>		
<% 
	} else {
%>	
		<form method = post action = "CusRepDelete.jsp">
			<input type = "hidden" name = "act" value = "<%=test2%>" >
			<input type = "hidden" name = "editing" value = "<%=test1%>" >
			<input type = "submit" value = "Continue">
		</form>
<%
	}
%>

<form method="post" action="representativeConsole.jsp">
		<input type="submit" value="Press Here to go Back To Previous Page">
	</form>
</body>
</html>