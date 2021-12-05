<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE HTML>

<%
	// Initialize the Database Connection
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	
	String query = "SELECT q.question, q.answer, q.username " +
				   "FROM question q " +
				   "WHERE q.question like \"%" + request.getParameter("keyword") + "%\"";
	
	Statement browseQuestions = con.createStatement();
	ResultSet resultBrowseQuestions = browseQuestions.executeQuery(query);
	
%>

<html>
<head>
	<title>Search Results</title>
	<style>
	table, th, td {
		border: 1px solid black
	}
	</style>
</head>
<body>
	<h1>Printing Questions that Match the Keyword: <%=request.getParameter("keyword")%> </h1>
	
	<table>
		<tr>
			<th>Question</th>
			<th>Answer</th>
			<th>From User</th>
		</tr>
		
		<%
		int numberOfResults = 0;
		if (resultBrowseQuestions.next() == false) {
			out.print("<tr>");
			out.print("<td>...</td>");
			out.print("<td>...</td>");
			out.print("<td>...</td>");
		} else {
			do {
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
				
				numberOfResults += 1;
				
			} while (resultBrowseQuestions.next());
		}
		%>
	</table>

	<%
		String keyword = request.getParameter("keyword");
		
		if (numberOfResults == 0) {
			out.print("<p>We were not able to find any results for the keyword \"" + keyword + "\" :(</p>");
		} else if (numberOfResults == 1) {
			out.print("<p>We found exactly one result for the keyword \"" + keyword + "\"</p>");
		} else {
			out.print("<p>We found " + numberOfResults + " results for the keyword \"" + keyword + "\"</p>");
		}
	
	%>
	
	<form method="get" action="qa.jsp">
		<button type="submit">Go Back to Questions and Answers Page</button>
	</form>
</body>

<%
	// Close Database Connection
	con.close();
%>
</html>