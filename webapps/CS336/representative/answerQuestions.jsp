<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Answer Questions Page</title>
<style>
	table, th, td {
		border: 1px solid black;
	}
</style>
</head>
<body>
Below are unanswered questions. Choose one to respond to.

<%
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	String unansweredq = "SELECT * FROM question q WHERE q.answer like \"\"";
	PreparedStatement ps = con.prepareStatement(unansweredq);
	ResultSet result = ps.executeQuery();
	//String Q;
	
	if(!result.isBeforeFirst()){
		out.print("There are no unanswered questions");
	} else {
		
		//this creates a table
		out.print("<table>");
		
		//this creates a row
		out.print("<tr>");
		
		//This makes the columns
		out.print("<th>");
		out.print("Question");
		out.print("</th>");
		
		out.print("<th>");
		out.print("User");
		out.print("</th>");
		
		out.print("<th>");
		out.print("Enter Answer Below");
		out.print("</th>");
		
		out.println("</tr");
		
		while(result.next()){
			//Q = result.getString("question");
			out.print("<tr>");
			out.print("<td>");
			out.print(result.getString("question"));
			out.print("</td>");
			
			
			out.print("<td>");
			out.print(result.getString("username"));
			out.print("</td>");
			
			out.print("<td>");
			%>
			<form method="post" action = "answerPage.jsp">
				<textarea name = "answer" rows = "8" cols = "32" maxlength = "255"></textarea>
				<input type = "hidden" name = "question" value = "<%=result.getString("question")%>" >
				<input type="submit" value="Add Answer">
			</form>
			<% 
			//out.print("Submit");
			out.print("</td>");
			
			out.print("</tr>");
		}
		
		
		
		
	}
	
	


%>
<br>
	<form method="post" action="representativeConsole.jsp">
		<input type="submit" value="Back">
	</form>



</body>
</html>