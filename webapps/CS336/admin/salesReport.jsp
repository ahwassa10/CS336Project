<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Sales Report</title>
	</head>
	
	<body>
		<h1>
			Sales Report for
			<% 
				String month = request.getParameter("month");
				String year = request.getParameter("year");
				out.print(month);
				out.print("/");
				out.print(year);
			%>
		</h1>
		<h2>
			All tickets sold/cancelled
		</h2>
		<%
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();

            Statement stmt = con.createStatement();
			String str = "SELECT ticket_id,((NOT was_cancelled)*booking_fee+was_cancelled*cancellation_fee) revenue FROM ticket WHERE MONTH(purchase_date)=? AND YEAR(purchase_date)=?";
			PreparedStatement ps = con.prepareStatement(str);

			ps.setString(1,month);
			ps.setString(2,year);

			ResultSet result = ps.executeQuery();
			
			int sum = 0;
			int count = 0;
			while (result.next()) {
				sum += result.getInt("booking_fee");
				count++;
			}
			if (count==0) {
				out.println("We sold no tickets this month :(");
			}
			else {
				out.println("We sold "+count+" ticket(s) this month for $"+sum);
			}
		%>
</body>
</html>
