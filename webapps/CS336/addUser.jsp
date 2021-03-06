<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New User</title>
</head>
<body>
	<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		//Get parameters from the HTML form at the Homepage.jsp
		String newUsername = request.getParameter("newUsername");
		String newPassword = request.getParameter("newPassword");
		String newFName = request.getParameter("newFName");
		String newLName = request.getParameter("newLName");
		String type = "customer";
		try {
			type = request.getParameter("type");
		} catch (Exception f) {
			type = "customer";
		} finally {
			if (type == null) type = "customer";
		}


		//Make an insert statement for the user table:
		String insert = "INSERT INTO user VALUES (?, ?, ?, ?, ?)";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, newUsername);
		ps.setString(2, newPassword);
		ps.setString(3, newFName);
		ps.setString(4, newLName);
		ps.setString(5, type);
		//Run the query against the DB
		ps.executeUpdate();

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();

		out.print("Insert succeeded!");
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("Insert failed :()");
	}
%>
<br>

<form method="get" action="Homepage.jsp">
    <input type="submit" value="Logout">
</form>

</body>
</html>
