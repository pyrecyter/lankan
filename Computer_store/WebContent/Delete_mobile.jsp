<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC>
 <%
 if ((session.getAttribute("Name") == null) || (session.getAttribute("Name") == "")) {
 	response.sendRedirect("Admin.jsp");
 }
%>
<%@page import="java.sql.*,java.util.*"%>

<%
String idmobile = request.getParameter("idmobile");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lankan", "root", "root");
Statement st=conn.createStatement();
int i=st.executeUpdate("DELETE FROM mobile WHERE id='"+idmobile+"';");
out.println("Data Deleted Successfully!");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
<a href ="View_Mobile.jsp">Go back</a>