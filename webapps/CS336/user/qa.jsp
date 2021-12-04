<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE HTML>

<%
	// Initialize the Database Connection
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	
	String query = "SELECT question, answer, username " +
				   "FROM question";
	
	Statement browseQuestions = con.createStatement();
	ResultSet resultBrowseQuestions = browseQuestions.executeQuery(query);
	
%>

<html>
<head>
	<title>Questions and Answers</title>
	<style>
	table, th, td {
		border: 1px solid black;
	}
	</style>
</head>
	
<body>
	<h1>Browsing Questions and Answers</h1>
	
	<table>
		<tr>
			<td>Question</td>
			<td>Answer</td>
			<td>From User</td>
		</tr>
		
		<%
			while(resultBrowseQuestions.next()) {
				out.print("<tr>");
				
				out.print("<td>");
				out.print(resultBrowseQuestions.getString("question"));
				out.print("</td>");
				
				out.print("<td>");
				// Specify if a question hasn't been answered yet.
				String qAnswer = resultBrowseQuestions.getString("answer");
				if (qAnswer.trim().isEmpty()) {
					out.print("Not answered yet");
				} else {
					out.print(qAnswer);
				}
				out.print("</td>");
				
				out.print("<td>");
				out.print(resultBrowseQuestions.getString("username"));
				out.print("</td>");
				
				out.print("</tr>");
				
			}
		%>
		
	
	</table>
	



</body>

</html>