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
String idcctv=request.getParameter("idcctv");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lankan", "root", "root");
Statement st=conn.createStatement();
int i=st.executeUpdate("DELETE FROM cctv WHERE id='"+idcctv+"';");
out.println("Data Deleted Successfully!");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
<a href ="View_cctv.jsp">Go back</a>