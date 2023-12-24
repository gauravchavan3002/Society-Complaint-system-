<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@ page import="java.sql.*,java.io.IOException,java.io.PrintWriter,java.sql.CallableStatement,java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.Statement, java.util.Scanner" %>
<%
Connection con = null;
Statement st = null;
PreparedStatement ps = null;

response.setContentType("text/html");

System.out.println("in do JSP");
String username = request.getParameter("username");
String f_no = request.getParameter("f_no");
String email = request.getParameter("email");
String phoneno = request.getParameter("phoneno");
String subject = request.getParameter("subject");
String complaint = request.getParameter("complaint");


try {

	Class.forName("com.mysql.cj.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gaurav","root","root");
	String q = "insert into detail(username,f_no,email,phoneno,subject,complaint) values(?,?,?,?,?,?)";
	ps = con.prepareStatement(q);
	ps.setString(1,username);
	ps.setString(2, f_no);
	ps.setString(3, email);
	ps.setString(4, phoneno);
	
	ps.setString(5, subject);
	ps.setString(6, complaint);
	
	int result = ps.executeUpdate();
	if (result > 0) {
		out.println("<h1>Data saved successfully..</h1>");
	}
	con.close();
	ps.close();
} catch (Exception e) {
	System.out.println(e);
}

%>
</body>
</html>