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
			String str = "SELECT ticket.*,purchased.*,((NOT was_cancelled)*booking_fee+was_cancelled*cancellation_fee) revenue FROM ticket JOIN purchased USING(ticket_id) WHERE MONTH(purchase_date)=? AND YEAR(purchase_date)=?";
			PreparedStatement ps = con.prepareStatement(str);

			ps.setString(1,month);
			ps.setString(2,year);

			ResultSet result = ps.executeQuery();
			
			out.print("<table>");
			out.print("<tr>");
			out.print("<td>ticket_id</td>");
			out.print("<td>initial_departure_airport_id</td>");
			out.print("<td>final_arrival_airport_id</td>");
			out.print("<td>type_one_way_or_round_trip</td>");
			out.print("<td>type_domestic_or_international</td>");
			out.print("<td>number_of_stops</td>");
			out.print("<td>flight_duration</td>");
			out.print("<td>purchase_date</td>");
			out.print("<td>purchase_time</td>");
			out.print("<td>departure_date</td>");
			out.print("<td>departure_time</td>");
			out.print("<td>arrival_date</td>");
			out.print("<td>arrival_time</td>");
			out.print("<td>booking_fee</td>");
			out.print("<td>cancellation_fee</td>");
			out.print("<td>username</td>");
			out.print("<td>was_cancelled</td>");
			out.print("<td>revenue</td>");
			out.print("</tr>");

			int sum = 0;
			int count = 0;
			while (result.next()) {
				sum += result.getInt("revenue");
				count++;
				out.print("<tr>");

				out.print("<td>"+result.getString("ticket_id")+"</td>");
				out.print("<td>"+result.getString("initial_departure_airport_id")+"</td>");
				out.print("<td>"+result.getString("final_arrival_airport_id")+"</td>");
				out.print("<td>"+result.getString("type_one_way_or_round_trip")+"</td>");
				out.print("<td>"+result.getString("type_domestic_or_international")+"</td>");
				out.print("<td>"+result.getString("number_of_stops")+"</td>");
				out.print("<td>"+result.getString("flight_duration")+"</td>");
				out.print("<td>"+result.getString("purchase_date")+"</td>");
				out.print("<td>"+result.getString("purchase_time")+"</td>");
				out.print("<td>"+result.getString("departure_date")+"</td>");
				out.print("<td>"+result.getString("departure_time")+"</td>");
				out.print("<td>"+result.getString("arrival_date")+"</td>");
				out.print("<td>"+result.getString("arrival_time")+"</td>");
				out.print("<td>"+result.getString("booking_fee")+"</td>");
				out.print("<td>"+result.getString("cancellation_fee")+"</td>");
				out.print("<td>"+result.getString("username")+"</td>");
				out.print("<td>"+result.getString("was_cancelled")+"</td>");
				out.print("<td>"+result.getString("revenue")+"</td>");
				out.print("</tr>");
			}	
			out.print("</table>");

			if (count==0) {
				out.println("We sold no tickets this month :(");
			}
			else {
				out.println("We sold "+count+" ticket(s) this month for $"+sum);
			}
			con.close();
		%>
</body>
</html>
