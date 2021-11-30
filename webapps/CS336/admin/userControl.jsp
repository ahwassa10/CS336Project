<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>User Control</title>
	</head>
	
	<body>
		<h1>
			User Control
		</h1>
		<%
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();

            Statement stmt = con.createStatement();
			String action = request.getParameter("action");
			String str = "SELECT * FROM user";

			ResultSet result = stmt.executeQuery(str);

			out.print("<table>");
			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header
			out.print("username");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("password");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("first name");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("last name");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("type");
			out.print("</td>");
			out.print("</tr>");
			
			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current username:
				out.print(result.getString("username"));
				out.print("</td>");
				out.print("<td>");
				//Print out current password:
				out.print(result.getString("password"));
				out.print("</td>");
				out.print("<td>");
				//Print out current first name:
				out.print(result.getString("first_name"));
				out.print("</td>");
				out.print("<td>");
				//Print out current last name:
				out.print(result.getString("last_name"));
				out.print("</td>");
				out.print("<td>");
				//Print out current type
				out.print(result.getString("type"));
				out.print("</td>");
				out.print("</tr>");
			}
			out.print("</table>");

			
			//add to user table
			if (action.equals("add")) {
		%>
			<form method="post" action="../addUser.jsp">
				<table>
					<tr>
					<td>Username</td><td><input type="text" name="newUsername"></td>
					</tr>
					<tr>
					<td>Password</td><td><input type="text" name="newPassword"></td>
					</tr>
					<tr>
					<td>First Name</td><td><input type="text" name="newFName"></td>
					</tr>
					<tr>
					<td>Last Name</td><td><input type="text" name="newLName"></td>
					</tr>
				</table>
				<select name="type" size=1>
					<option value="representative">Customer Representative</option>
					<option value="customer">Customer</option>
				</select>
				<br>
				<input type="submit" value="Add User">
			</form>
			<%
			}
			//edit user table
			else if (action.equals("edit")) {
			%>
			<form method="post" action="edUser.jsp">
				<table>
					<tr>
					<td>Which User?</td><td><input type="text" name="username"></td>
					</tr>
					<tr>
					<td>New Password</td><td><input type="text" name="password"></td>
					</tr>
					<tr>
					<td>New First Name</td><td><input type="text" name="firstName"></td>
					</tr>
					<tr>
					<td>New Last Name</td><td><input type="text" name="lastName"></td>
					</tr>
				</table>
				<select name="type" size=1>
					<option value="representative">Customer Representative</option>
					<option value="customer">Customer</option>
				</select>
				<br>
				<input type="submit" value="Update User">
			</form>
			<%
			}
			//del from user table
			else if (action.equals("del")) {
				%>
				<form method="post" action="delUser.jsp">
					<table>
						<tr>
						<td>Username</td><td><input type="text" name="username"></td>
						</tr>
					</table>
					<br>
					<input type="submit" value="Delete User">
				</form>
				<%
			}
			else out.println("Bad action");
			
		%>
<!--
		Hello World1 <!__ the usual HTML way __>
		<% out.println("Hello World2"); %> <!__ output the same thing, but using 
	                                      jsp programming __>
							  
		<br>
	
		 <!__ Show html form to i) display something, ii) choose an action via a 
		  | radio button __>
		<!__ forms are used to collect user input 
			The default method when submitting form data is GET.
			However, when GET is used, the submitted form data will be visible in the page address field__>
		<form method="post" action="show.jsp">
		    <!__ note the show.jsp will be invoked when the choice is made __>
			<!__ The next lines give HTML for radio buttons being displayed __>
		  <input type="radio" name="command" value="beers"/>Let's have a beer! Click here to see the beers.
		  <br>
		  <input type="radio" name="command" value="bars"/>Let's go to a bar! Click here to see the bars.
		    <!__ when the radio for bars is chosen, then 'command' will have value 
		     | 'bars', in the show.jsp file, when you access request.parameters __>
		  <br>
		  <input type="submit" value="submit" />
		</form>
		<br>
 	
	Type your username and password:
	<br>
		<form method="get" action="login.jsp">
			<table>
				<tr>    
					<td>Username</td><td><input type="text" name="username"></td>
				</tr>
				<tr>
					<td>Password</td><td><input type="text" name="password"></td>
				</tr>
			</table>
			<input type="submit" value="Log In">
		</form>
	<br>
	
	
	If you're a new customer, create an account:
	<br>
		<form method="post" action="addUser.jsp">
		<table>
		<tr>    
		<td>Username</td><td><input type="text" name="newUsername"></td>
		</tr>
		<tr>
		<td>Password</td><td><input type="text" name="newPassword"></td>
		</tr>
		<tr>
		<td>First Name</td><td><input type="text" name="newFName"></td>
		</tr>
		<tr>
		<td>Last Name</td><td><input type="text" name="newLName"></td>
		</tr>
		</table>
		<input type="submit" value="Register">
		</form>
	<br>
	-->
<!-- 	Or we can query the beers with price:
	<br>
		<form method="get" action="query.jsp">
			<select name="price" size=1>
				<option value="3.0">$3.0 and under</option>
				<option value="5.0">$5.0 and under</option>
				<option value="8.0">$8.0 and under</option>
			</select>&nbsp;<br> <input type="submit" value="submit">
		</form>
	<br>
 -->
</body>
</html>
