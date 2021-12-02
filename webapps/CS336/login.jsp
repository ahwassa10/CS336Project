<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Logging In</title>
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
		String username = request.getParameter("username");
		String password = request.getParameter("password");


		//Make a select query for user
		String select = "SELECT * FROM user "
				+ "WHERE username=? and password=?";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(select);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, username);
		ps.setString(2, password);
		//Run the query against the DB
		ResultSet result = ps.executeQuery();
		String type = "customer";
		if (result.next()){
			out.println("Valid login, welcome "+result.getString("first_name")+" "+result.getString("last_name")+".<br>");
			out.println("You are a "+result.getString("type")+".<br>");
			type = result.getString("type");
		}
		else {
			out.println("Bad login<br>");
		}

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		
		if (type.equals("admin")) {
			response.sendRedirect("admin/adminConsole.jsp");
		}
		else if(type.equals("representative")) {
			response.sendRedirect("representative/representativeConsole.jsp");
		}
		else if(type.equals("customer")) {
			response.sendRedirect("user/userConsole.jsp");
		}
		
		
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("Login failed :()");
	}
%>


 
 <br>

<form method="get" action="Homepage.jsp">
	<input type="submit" value="Logout">
</form>

</body>
</html>
