<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE HTML>
<html>
<head>
	<title>Deleting Waitlist</title>
</head>

<%
String airline_id = request.getParameter("airline_id");
String flight_number = request.getParameter("flight_number");
String username = session.getAttribute("username").toString();
boolean queryFailed = false;

ApplicationDB db = new ApplicationDB();
Connection con = db.getConnection();

String query = "DELETE FROM waitlist WHERE airline_id=\"" + airline_id + "\" and flight_number=\"" + flight_number +
               "\" and username=\"" + username + "\"";

try {
	Statement deleteWaitlists = con.createStatement();
	int ret = deleteWaitlists.executeUpdate(query);
	if (ret != 1) {
		queryFailed = true;
	}
} catch (Exception e) {
	queryFailed = true;
}

%>

<body>
	<h1>Deleting Your Spot on the Waitlist</h1>
	<p>Airline ID: <%=airline_id%></p>
	<p>Flight Number: <%=flight_number%></p>
	<p>Username: <%=username%></p>
	
	<%
	if (queryFailed == true) {
		out.print("<h1>Failed to Delete the Waitlist Entry. Please Try Again</h1>");
	} else {
		out.print("<h1>Sucessfully Deleted the Waitlist Entry</h1>");
	}
	%>
	<form method="get" action="viewWaitlists.jsp">
		<button type="submit">Go Back to View Waitlists</button>
	</form>
	
</body>

<%con.close(); %>
</html>