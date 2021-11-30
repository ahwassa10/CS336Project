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
			String username = request.getParameter("username");
			String del = "DELETE FROM user WHERE username=?";
			PreparedStatement ps = con.prepareStatement(del);
			
			ps.setString(1, username);
			ps.executeUpdate();

			con.close();
			out.print("Deletion succeeded!");
		} catch (Exception ex) {
			out.print(ex);
			out.print("Deletion failed :()");
		}
		%>
</body>
</html>
