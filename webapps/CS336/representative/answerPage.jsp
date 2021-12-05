<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Question Answered</title>
</head>
<body>
<br>

<% 
try{
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	
	String Q = request.getParameter("question");
	String A = request.getParameter("answer");
	
	String addAnswer = "UPDATE question SET answer = ? WHERE question.question LIKE ?";
	PreparedStatement ps = con.prepareStatement(addAnswer);
	ps.setString(1, A);
	ps.setString(2, Q);
	ps.executeUpdate();
	
	out.print("Answer successfully inserted");
} catch (Exception ex) {
	out.print(ex);
	out.print("Answer insert failed");
}
%>


<form method="post" action="representativeConsole.jsp">
	<input type="submit" value="Click here to go back to Representative Console">
</form>

<form method="post" action="answerQuestions.jsp">
	<input type="submit" value="Click here to go back to Questions Page">
</form>

</body>
</html>