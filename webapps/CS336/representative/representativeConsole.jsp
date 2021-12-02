<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Customer Representative</title>
	</head>
<body>
	Welcome to the Customer Representative Page. Below are the options available to you.
	<%
	/*
	try{
		//Now we have the database connection in
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		
		//out.println("Click below to make a flight reservation for a user. Just enter the user's username and name below.");
		
		
		
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("");
	}
	*/
	%>
	<br>
	
	<br>
	<br>
	Make a reservation. Enter the user you'd like to make a reservation for.
	<br>
		<form method="post" action = "makeReservation.jsp">
			<table>
				<tr>
					<td> Enter user's username here:</td> <td> <input type = "text" name = "username"></td>
				</tr>
				<!--  
				<tr>
					<td> Enter user's first name here:</td> <td> <input type = "text" name = "First_name"></td>
				</tr>
				<tr>
					<td> Enter user's last name here:</td> <td> <input type = "text" name = "last_name"></td>
				</tr>
				-->
			</table>
			<input type="submit" value="Continue">
		</form>
		
	<br>
	
	Edit a flight reservation for a customer. Enter the customer's username below.
		<form method="post" action = "flightEdit.jsp">
			<table>
				<tr>
					<td> Enter user's username here:</td> <td> <input type = "text" name = "username"></td>
				</tr>
			</table>
			<input type="submit" value="Continue">
		</form>
	<br>
	
	
	In order to add, edit, or delete information for aircrafts, airports, and flights, please select from the options which 
	one you would like to edit.
	
		<form method="post" action="AddEditDelete.jsp">
			<select name="price" size=1>
				<option value="airport">Airport</option>
				<option value="airline">Airline</option>
				<option value="flight">Flight</option>
			</select><!--  &nbsp;<br> --> 
			<input type="submit" value="Continue">
		</form>
	
	
	
	
	<br>
	Enter a flight's flight number in order to view the waiting list for it.
	<form method="post" action="waitingList.jsp">
			<table>
				<tr>    
					<td>Flight Number: </td><td><input type="text" name="flightNumber"></td>
				</tr>
			</table>
			<input type="submit" value="Enter">
	</form>
	
	<br>
	
	<br>
	
	Enter an airport's airport ID to view all of its departing and arriving flights.
	<form method="post" action="ListOfFlights.jsp">
			<table>
				<tr>    
					<td>Airport ID: </td><td><input type="text" name="AirportID"></td>
				</tr>
			</table>
			<input type="submit" value="Enter">
	</form>
	
	<br>
	
	<br>
	Click the button below to be directed to the questions page to answer them.
	<form method="get" action="answerQuestions.jsp">
		<input type="submit" value="Continue">
	</form>

</body>
</html>