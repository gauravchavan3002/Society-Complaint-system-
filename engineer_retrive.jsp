<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show data from database to web page</title>
</head>
<body>
	<center>
		<%@ page import="java.sql.*,java.io.IOException,java.io.PrintWriter,java.sql.CallableStatement,java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.Statement, java.util.Scanner" %>
            <table border=1>
			<tr>
                <td>NAME</td>
				<td>ADDRESS</td>
				<td>E-MAIL</td>
				<td>PHONENO</td>
							
			</tr>	
	<%
Connection con = null;
Statement stmt = null;
ResultSet rs = null;


try {
	
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gaurav","root","root");
    
    
    stmt = con.createStatement();
    String sql = "SELECT * FROM enginner";
    rs = stmt.executeQuery(sql);
    
    while (rs.next())
    {
    	%>

		<tr>
			<td><%= rs.getString(1) %></td>
			<td><%= rs.getString(2) %></td>
			<td><%= rs.getString(3) %></td>
			<td><%= rs.getString(4) %></td>
			
		</tr>

		<%
    }
  }catch(Exception e) {}
    
   	%>

</center>
</body>
</html>