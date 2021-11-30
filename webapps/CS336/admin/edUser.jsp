<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>User Control</title>
	</head>
	
	<body>
		<%
		try {
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();

            Statement stmt = con.createStatement();
			String update = "UPDATE user SET password=?, first_name=?, last_name=?, type=? WHERE username=?";
			PreparedStatement ps = con.prepareStatement(update);
			
			String password = request.getParameter("password");
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			String type = request.getParameter("type");
			String username = request.getParameter("username");

			ps.setString(1, password);
			ps.setString(2, firstName);
			ps.setString(3, lastName);
			ps.setString(4, type);
			ps.setString(5, username);
			ps.executeUpdate();

			con.close();
			out.print("Update succeeded!");
		} catch (Exception ex) {
			out.print(ex);
			out.print("Update failed :()");
		}
		%>
</body>
</html>
