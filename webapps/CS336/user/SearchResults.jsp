
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
  <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
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
String dep_date = request.getParameter("departure_date");   


String arr_air = request.getParameter("final_arrival_airport_id");
String arr_date = request.getParameter("arrival_date");   

String triptype = request.getParameter("button1") + "";   
String sort = request.getParameter("button2") + ""; 

String filter1 = request.getParameter("total_fare") + "";   
String filter2 = request.getParameter("number_of_stops") + "";
String filter3 = request.getParameter("airline_id") + "";
String filter4 = request.getParameter("departure_time") + "";
String filter5 = request.getParameter("arrival_time") + "";
String flexible = request.getParameter("flexible") + "";

String str = ("SELECT * FROM Travel.ticket WHERE initial_departure_airport_id = '" + dep_air 
+ "' AND departure_date = '" + dep_date + "' AND final_arrival_airport_id = '" + arr_air 
+ "' AND arrival_date = '" + arr_date + "' ");

if(!filter1.isBlank())
	str += ("AND total_fare = " + filter1);
if(!filter2.isBlank())
	str += ("AND number_of_stops = " + filter2);
if(!filter3.isBlank())
	str += ("AND airline_id = '" + filter3 + "'");
if(!filter4.isBlank())
	str += ("AND departure_time = '" + filter4 + "'");
if(!filter5.isBlank())
	str += ("AND arrival_time = '" + filter5 + "'");
if(triptype.equals("one_way"))
	str += ("AND type_one_way_or_round_trip = '1'");
if(triptype.equals("round_trip"))
	str += ("AND type_one_way_or_round_trip = '0'");
if(sort.equals("total_fare"))
	str += ("ORDER BY total_fare ASC");
if(sort.equals("departure_time"))
	str += ("ORDER BY departure_time ASC");
if(sort.equals("arrival_time"))
	str += ("ORDER BY arrival_time ASC");
if(sort.equals("flight_duration"))
	str += ("ORDER BY flight_duration ASC");
/* if(!flexible.isEmpty())
{
	str += ("UNION SELECT * FROM Travel.ticket WHERE initial_departure_airport_id = '" + dep_air 
			 + "' AND final_arrival_airport_id = '" + arr_air + "'");
}
*/


str += ";";
	
	
ResultSet result = stmt.executeQuery(str);

//if(!result.isBeforeFirst())
// out.print("No results found");

//Make an HTML table to show the results in:
out.print("<table>");

//make a row
out.print("<tr>");
//make a column
out.print("<td>");

out.print("   ");
out.print("</td>");
//print out column header
out.print("<td>");
out.print("Departure Airport ID  ");
out.print("</td>");
//make a column
out.print("<td>");
out.print("  Departure Date  ");
out.print("</td>");
//make a column
out.print("<td>");
out.print("  Arrival Airport ID  ");
out.print("</td>");
//column 
out.print("<td>");
out.print("  Arrival Date  ");
out.print("</td>");
//column
out.print("<td>");
out.print("  Flight Duration  ");
out.print("</td>");
//column
out.print("<td>");
out.print("  Price  ");
out.print("</td>");
//column
out.print("<td>");
out.print("  Stops ");
out.print("</td>");
//column
 out.print("<td>");
 out.print("  Airline  ");
 out.print("</td>");
//column
out.print("<td>");
out.print("Type");
out.print("</td>");
//column
out.print("<td>");
out.print("Departure Time");
out.print("</td>");
//column
out.print("<td>");
out.print("Arrival Time");
out.print("</td>");
out.print("</tr>");


//parse out the results
while (result.next()) {
	

	//make a row
	out.print("<tr>");
	//make a column
	out.print("</td>");
	out.print("<td>");
	out.print("<input type='radio' name='button3' value='ticket_id'>");
	out.print("</td>");
	out.print("<td>");
	//Print out dept airport id:
	out.print(result.getString("initial_departure_airport_id"));
	out.print("</td>");
	out.print("<td>");
	//Print out dept date:
	out.print(result.getString("departure_date"));
	out.print("</td>");
	out.print("<td>");
	//print arrival airport id
	out.print(result.getString("final_arrival_airport_id"));
	out.print("</td>");
	out.print("<td>");
	//Print out arrival date
	out.print(result.getString("arrival_date"));
	out.print("</td>");
	out.print("<td>");
	//print out flight duration
	out.print(result.getString("flight_duration"));
	out.print("</td>");
	out.print("<td>");
	// print out price
	out.print(result.getString("total_fare"));
	out.print("</td>");
	out.print("<td>");
	//print out stops
	out.print(result.getString("number_of_stops"));
	out.print("</td>");
	out.print("<td>");
	//print out airline
	out.print(result.getString("airline_id"));
	out.print("</td>");
	out.print("<td>");
	//print out type
	out.print(result.getString("type_one_way_or_round_trip"));
	out.print("</td>");
	out.print("<td>");
	//print out departure time
	out.print(result.getString("departure_time"));
	out.print("</td>");
	out.print("<td>");
	//print out arrival time
	out.print(result.getString("arrival_time"));
	out.print("</td>");
	out.print("</tr>");
	

}

out.print("</table>");

//close the connection.
con.close(); 


	
%>

    	
	

   
   
</body>
</html>
