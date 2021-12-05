<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE HTML>

<html>
	<head>
		<title>Adding Question</title>
	</head>
	
	<body>
		<h1>Adding Question to the Database</h1>
		<br>
		<%
			// Initialize the Database Connection
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();
		
			String question = request.getParameter("question");
			String username = session.getAttribute("username").toString();
		
			String query = "INSERT INTO question " +
					   	   "VALUES(\"" + question + "\", \"\", \"" + username + "\")"; 
			
			// Print out database debug info
			out.print("<p>username = " + username + "</p>");
			out.print("<p>question = " + question + "</p>");
		%>
		
		<%
			int ret = 0;
			try {
				Statement browseQuestions = con.createStatement();
				ret = browseQuestions.executeUpdate(query);
				out.print("<p>Successfully added the question!</p>");
			} catch(Exception ex) {
				out.print("<p>Unable to add question, probably a duplicate</p>");
			}
		%>
		
		<form method="get" action="qa.jsp">
			<button type="submit">Go Back to Questions and Answers Page</button>
		</form>
		
	</body>

</html>