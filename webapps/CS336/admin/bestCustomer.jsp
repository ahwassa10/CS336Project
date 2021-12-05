<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Best Customer</title>
	</head>
	
	<body>
		<h1>
			The customer that generated the most revenue was:
		</h1>
		<%
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();

            Statement stmt = con.createStatement();
			String str = "SELECT username,SUM((NOT was_cancelled)*booking_fee+was_cancelled*cancellation_fee) revenue FROM ticket JOIN purchased USING(ticket_id) GROUP BY username ORDER BY revenue DESC";

			ResultSet result = stmt.executeQuery(str);
			if(result.next()) {
				str = "SELECT * FROM user WHERE username=?";
				PreparedStatement ps = con.prepareStatement(str);
				ps.setString(1,result.getString("username"));
	
				ResultSet result2 = stmt.executeQuery(str);
				result2.next();
	
				out.print(result2.getString("first_name")+" "+result2.getString("last_name"));
			}
			else {
				out.print("no one :(");
			}
		%>
</body>
</html>
