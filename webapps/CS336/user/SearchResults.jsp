
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
  <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.util.Date,java.text.SimpleDateFormat, java.util.Calendar"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>	Results </title>
</head>
<body>



<%
ApplicationDB db = new ApplicationDB();
Connection con = db.getConnection();
Statement stmt = con.createStatement();


List<String> list = new ArrayList<String>();


String dep_air = request.getParameter("initial_departure_airport_id");   
String  dep_date =request.getParameter("departure_date");   


String arr_air = request.getParameter("final_arrival_airport_id");
String arr_date = request.getParameter("arrival_date");  

Date dept_date = new SimpleDateFormat("yyyy-MM-dd").parse(dep_date);
Date arri_date = new SimpleDateFormat("yyyy-MM-dd").parse(arr_date);

String triptype = request.getParameter("button1") + "";   
String sort = request.getParameter("button2") + ""; 

String filter1 = request.getParameter("total_fare") + "";   
String filter2 = request.getParameter("number_of_stops") + "";
String filter3 = request.getParameter("airline_id") + "";
String filter4 = request.getParameter("departure_time") + "";
String filter5 = request.getParameter("arrival_time") + "";
String flexible = request.getParameter("button3");

Calendar cal = Calendar.getInstance();
Calendar cal2 = Calendar.getInstance();
cal.setTime(dept_date);
cal2.setTime(arri_date);


String str = ("SELECT * FROM Travel.ticket WHERE initial_departure_airport_id = '" + dep_air 
+ "' AND departure_date = '" + dep_date + "' AND final_arrival_airport_id = '" + arr_air 
+ "' AND arrival_date = '" + arr_date + "' ");

if(triptype.equals("one_way"))
	str += ("AND type_one_way_or_round_trip = '1'");
if(triptype.equals("round_trip"))
	str += ("AND type_one_way_or_round_trip = '0'");

if(!filter1.isBlank())
	str += (" AND total_fare = " + filter1);

if(!filter2.isBlank())
	str += (" AND number_of_stops = " + filter2);

if(!filter3.isBlank())
	str += (" AND airline_id = '" + filter3 + "'");

if(!filter4.isBlank())
	str += (" AND departure_time = '" + filter4 + "'");

if(!filter5.isBlank())
	str += (" AND arrival_time = '" + filter5 + "'");


if(flexible!= null)
if(flexible.equals("flexible"))
{
	int arr_count = 0;
	while(arr_count < 3)
	{
	cal2.add(Calendar.DAY_OF_YEAR, -1);
	arri_date = cal2.getTime();
	SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
	String arrival_date = format1.format(arri_date);
	
	int dep_count = 0;	
	
	dept_date = new SimpleDateFormat("yyyy-MM-dd").parse(dep_date);
	cal.setTime(dept_date);
	
	while(dep_count < 3)
	{ 
		
		cal.add(Calendar.DAY_OF_YEAR, -1);
		dept_date = cal.getTime();
		SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
		String departure_date = format2.format(dept_date);
		
	 str += (" UNION SELECT * FROM Travel.ticket WHERE initial_departure_airport_id = '" + dep_air 
	 + "' AND final_arrival_airport_id = '" + arr_air + "' AND departure_date = '" + departure_date
	 + "' AND arrival_date = '" + arrival_date + "'");
	  dep_count++;
	}
	arr_count++;
	
}
	
	arri_date = new SimpleDateFormat("yyyy-MM-dd").parse(arr_date);
	cal2.setTime(arri_date);

	int arr_count2 = 0;
	while(arr_count2 < 3)
	{
	cal2.add(Calendar.DAY_OF_YEAR, 1);
	arri_date = cal2.getTime();
	SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
	String arrival_date = format1.format(arri_date);
	
	int dep_count2 = 0;		
	dept_date = new SimpleDateFormat("yyyy-MM-dd").parse(dep_date);
	cal.setTime(dept_date);
	
	while(dep_count2 < 3)
	{ 
		cal.add(Calendar.DAY_OF_YEAR, 1);
		dept_date = cal.getTime();
		SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
	    String departure_date = format2.format(dept_date);
		
	 str += (" UNION SELECT * FROM Travel.ticket WHERE initial_departure_airport_id = '" + dep_air 
	 + "' AND final_arrival_airport_id = '" + arr_air + "'" + "AND departure_date = '" + departure_date
	 + "' AND arrival_date = '" + arrival_date + "'");
	  dep_count2++;
	}
	arr_count2++;
	
}
	
	
}

if(sort.equals("total_fare"))
	str += (" ORDER BY total_fare ASC");
if(sort.equals("departure_time"))
	str += (" ORDER BY departure_time ASC");
if(sort.equals("arrival_time"))
	str += (" ORDER BY arrival_time ASC");
if(sort.equals("flight_duration"))
	str += (" ORDER BY flight_duration ASC");



str += ";";

//out.print(str);



ResultSet result = stmt.executeQuery(str);

//if(!result.isBeforeFirst())
// out.print("No results found");

//Make an HTML table to show the results in:
out.print("<table>");

//make a row
out.print("<tr>");
//make a column


out.print("<td>");
out.print(" Ticket Number  ");
out.print("</td>");
//print out column header
out.print("<td>");
out.print("Departure Airport ID  ");
out.print("</td>");
//make a column
out.print("<td>");
out.print("  Arrival Airport ID ");
out.print("</td>");
//make a column
out.print("<td>");
out.print("  Departure Date  ");
out.print("</td>");
//column 
out.print("<td>");
out.print("  Arrival Date  ");
out.print("</td>");
//column
out.print("<td>");
out.print("  Departure Time  ");
out.print("</td>");
//column
out.print("<td>");
out.print("  Arrival Time  ");
out.print("</td>");
//column
out.print("<td>");
out.print("  Airline ");
out.print("</td>");
//column
 out.print("<td>");
 out.print("  Flight Duration  ");
 out.print("</td>");
//column
out.print("<td>");
out.print("Stops");
out.print("</td>");
//column
out.print("<td>");
out.print("Type");
out.print("</td>");
//column
out.print("<td>");
out.print("Price");
out.print("</td>");

out.print("<td>");
out.print("  ");
out.print("</td>");
out.print("</tr>");



//parse out the results
while (result.next()) {
	

	//make a row
	out.print("<tr>");
	//make a column
	out.print("</td>");
	out.print("<td>");
	//print out ticket id
	out.print(result.getString("ticket_id"));
	out.print("</td>");
	out.print("<td>");
	//Print out dept airport id:
	out.print(result.getString("initial_departure_airport_id"));
	out.print("</td>");
	out.print("<td>");
	//Print out arrival airport:
	out.print(result.getString("final_arrival_airport_id"));
	out.print("</td>");
	out.print("<td>");
	//print arrival departure date
	out.print(result.getString("departure_date"));
	out.print("</td>");
	out.print("<td>");
	//Print out arrival date
	out.print(result.getString("arrival_date"));
	out.print("</td>");
	out.print("<td>");
	//print out departure time
	out.print(result.getString("departure_time"));
	out.print("</td>");
	out.print("<td>");
	//print out arrival time
	out.print(result.getString("arrival_time"));
	out.print("</td>");
	out.print("<td>");
	//print out airline
	out.print(result.getString("airline_id"));
	out.print("</td>");
	out.print("<td>");
	// print out flight_duration
	out.print(result.getString("flight_duration"));
	out.print("</td>");
	out.print("<td>");
	//print out stops
	out.print(result.getString("number_of_stops"));
	out.print("</td>");
	out.print("<td>");
	//print out type
	if(result.getString("type_one_way_or_round_trip").equals("1"))
	{out.print("One-way");
	out.print("</td>");
	out.print("<td>");
	}
	if(result.getString("type_one_way_or_round_trip").equals("0"))
	{out.print("Roundtrip");
	out.print("</td>");
	out.print("<td>");
	}
	out.print(result.getString("total_fare"));
	out.print("</td>");
	
	%>
	<form method="get" action="makeReservation.jsp">
	<form method="get" action="joinWaitlist.jsp">
	</td>
	<td>
	<form action = "makeReservation.jsp">
	<input type = "submit" name = "makeReservation" value = "Make Reservation">
	<input type = "hidden" name = ticket_id value ="<%=result.getString("ticket_id")%>">
	<input type = "hidden" name = initial_departure_airport_id value ="<%=result.getString("initial_departure_airport_id")%>">
	<input type = "hidden" name = final_arrival_airport_id value ="<%=result.getString("final_arrival_airport_id")%>">
	</form>
	
	<form action = "joinWaitlist.jsp">
	<input type = "submit" name = "makeReservation" value = "Join Waitlist">
	<input type = "hidden" name = ticket_id value ="<%=result.getString("ticket_id")%>">
	<input type = "hidden" name = initial_departure_airport_id value ="<%=result.getString("initial_departure_airport_id")%>">
	<input type = "hidden" name = final_arrival_airport_id value ="<%=result.getString("final_arrival_airport_id")%>">
	</form>
	
	</td>
	<td>
	<% 
	out.print("</tr>");
	

}

out.print("</table>");

//close the connection.
con.close(); 


	%>
	

		
		
		
	
	

   
   
</body>
</html>
