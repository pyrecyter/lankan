<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
 <%
    if ((session.getAttribute("Email") == null) || (session.getAttribute("Email") == "")) {
    	response.sendRedirect("Admin.jsp");
    }
%>
<%@page import="java.sql.*,java.util.*"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete</title>
</head>
<body>
<%
String repairId=request.getParameter("repairId");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lankan", "root", "root");
Statement st=conn.createStatement();
int i=st.executeUpdate("DELETE FROM repair_req_tab WHERE repairId='"+repairId+"';");
out.println("Data Deleted Successfully!");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
</body>
</html>