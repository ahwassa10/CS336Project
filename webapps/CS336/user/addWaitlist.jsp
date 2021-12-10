<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE HTML>
<html>
<head>
	<title>Adding to Waitlist</title>
</head>

<%
String airline_id    = request.getParameter("airline_id");
String flight_number = request.getParameter("flight_number");
String username      = session.getAttribute("username").toString();
String ticket_id     = request.getParameter("ticket_id");
boolean queryFailed  = false;

ApplicationDB db = new ApplicationDB();
Connection con = db.getConnection();

String query = "INSERT INTO waitlist VALUE(\"" + airline_id + "\", \"" + flight_number + "\", \"" + username + "\", \"" + ticket_id + "\")";

try {
	Statement createWaitlist = con.createStatement();
	int ret = createWaitlist.executeUpdate(query);
	if (ret != 1) {
		queryFailed = true;
	}
	
} catch(Exception e) {
	queryFailed = true;	
}

%>

<body>
	<h1>Adding to the Waitlist</h1>
	<p>Airline ID: <%=airline_id%></p>
	<p>Flight Number: <%=flight_number %></p>
	<p>Username: <%=username%></p>
	<p>Ticket ID: <%=ticket_id %></p>
	<%
	if (queryFailed == true) {
		out.print("<h1>Unable to Join the Waitlist. Please Try Again</h1>");
	} else {
		out.print("<h1>Successfully Joined the Waitlist</h1>");
	}
	%>

</body>
<%con.close();%>
</html>