<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Success</title>
</head>
<body>
<%
try{
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	String test1 = request.getParameter("thing");
	String test2 = request.getParameter("id");
	//String query = "DELETE FROM ? WHERE ? = ?";
	//PreparedStatement ps = con.prepareStatement(query);
	//id is the ID of the thing we're deleting
	//thing is what we're deleting specifically, so it will only be aircraft, airport, or flight
	
	if(test1.equals("aircraft")){
		//ps.setString(1, "aircraftOwned");
		//ps.setString(2, "aircraft_id");
		String query2 = "DELETE FROM aircraftOwned WHERE aircraft_id = ?";
		PreparedStatement ps2 = con.prepareStatement(query2);
		ps2.setString(1, test2);
		//ps.setString(3, test2);
		ps2.executeUpdate();
	} else if(test1.equals("airport")){
		String query2 = "DELETE FROM airport WHERE airport_id = ?";
		PreparedStatement ps2 = con.prepareStatement(query2);
		ps2.setString(1, test2);
		//ps.setString(3, test2);
		ps2.executeUpdate();
	} else {
		//Here we deal with flights
		String query1 = "SELECT DISTINCT t.ticket_id FROM ticket t, flightOperated f, parts p WHERE t.ticket_id = p.ticket_id and p.flight_number = ?";
		PreparedStatement ps1 = con.prepareStatement(query1);
		ps1.setString(1, test2);
		ResultSet r1 = ps1.executeQuery();
		while(r1.next()){
			String query3 = "DELETE FROM ticket WHERE ticket_id = ?";
			PreparedStatement ps3 = con.prepareStatement(query3);
			ps3.setString(1, r1.getString("ticket_id"));
			ps3.executeUpdate();
		}
		String query2 = "DELETE FROM flightOperated WHERE flight_number = ?";
		PreparedStatement ps2 = con.prepareStatement(query2);
		ps2.setString(1, test2);
		//ps.setString(3, test2);
		ps2.executeUpdate();
	}
	out.print("Deletion Succeeded");
	
} catch (Exception ex){
	out.print(ex);
	out.print("Deletion failure");
}
%>

<form method="post" action="representativeConsole.jsp">
	<input type="submit" value="Click here to go back to Representative Console">
</form>



</body>
</html>