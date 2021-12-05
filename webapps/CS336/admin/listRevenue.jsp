<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Revenue Summary</title>
	</head>
	
	<body>
		<h1>
			Revenue Summary for
			<% 
				String revenueBy = request.getParameter("revenueBy");
				out.print(revenueBy);
			%>
		</h1>
		<h3>
			<%
				if(revenueBy.equals("flight_number")){
					out.print("<br> Lists revenue from bookings/cancellations from tickets associated with each flight.");
				}
			%>
		</h3>
		<%
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();

            Statement stmt = con.createStatement();
			String str;
			if (revenueBy.equals("flight_number")) {
				str = "SELECT flight_number,SUM((NOT was_cancelled)*booking_fee+was_cancelled*cancellation_fee) revenue FROM ticket JOIN purchased USING(ticket_id) JOIN parts USING (ticket_id) GROUP BY airline_id,flight_number";
			}
			else if (revenueBy.equals("airline_id")) {
				str = "SELECT airline_id,SUM((NOT was_cancelled)*booking_fee+was_cancelled*cancellation_fee) revenue FROM ticket JOIN purchased USING(ticket_id) JOIN (SELECT DISTINCT ticket_id,airline_id FROM parts) ticketairline USING(ticket_id) GROUP BY airline_id";
			}
			else if (revenueBy.equals("username")) {
				str = "SELECT username,SUM((NOT was_cancelled)*booking_fee+was_cancelled*cancellation_fee) revenue FROM ticket JOIN purchased USING(ticket_id) GROUP BY username";
			}
			else {
				str = "SELECT ticket_id,SUM((NOT was_cancelled)*booking_fee+was_cancelled*cancellation_fee) revenue FROM ticket";
				out.println("Bad revenueBy");				
			}

			ResultSet result = stmt.executeQuery(str);
			
			out.print("<table>");
			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header
			out.print(revenueBy);
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("revenue");
			out.print("</td>");
			out.print("</tr>");
			
			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current flight_id/airline_id/username:
				out.print(result.getString(1));
				out.print("</td>");
				out.print("<td>");
				//Print out current revenue:
				out.print(result.getString("revenue"));
				out.print("</td>");
				out.print("</tr>");
			}
			out.print("</table>");
		%>
</body>
</html>
