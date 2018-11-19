<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "lankan";
String userid = "root";
String password = "root";
String roll_no=request.getParameter("search");
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Lankan AN Global</title>

    <!-- Bootstrap core CSS -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->

<style>
th{
cursor:default;
}
tr{
cursor:pointer;
}
</style>
  </head>
<body>
  <!-- Navigation -->
  <%@ include file="navigationbar.jsp"%><br/><br/><br/>
	
	<div class="container">
	<div class="row justify-content-md-center">
		<form class="form-inline" action="search.jsp">
			<input type="text" class="form-control" style="width:300px" name="search" required placeholder="Search for...">&nbsp;
			<span class="input-group-btn">
				<button type="submit" class="btn btn-primary">Search</button>
			</span>
		</form>
	</div>
<h1>Search Results for Item "<%=roll_no%>"</h1>
<table class="table table-hover">
<tr>
<th>Item</th>
<th>Name</th>
<th>Description</th>
<th>Price</th>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from network where Name like '%"+roll_no+"%'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
	String filename = resultSet.getString("filename");
%>
<tr onclick="location.href='Network_Item.jsp?id=<%=resultSet.getString("id")  %>'">
<td><img src="images/Network/<%=filename%>" height = "100" /></td>
<td><%=resultSet.getString("Name") %></td>
<td><%=resultSet.getString("Content") %></td>
<td><%=resultSet.getString("Price") %></td>
</tr>
<%
}

sql ="select * from cctv where Name like '%"+roll_no+"%'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
	String filename = resultSet.getString("filename");
%>
<tr onclick="location.href='CCTV_Item.jsp?id=<%=resultSet.getString("id")  %>'">
<td><img src="images/CCTV/<%=filename%>" height = "100" /></td>
<td><%=resultSet.getString("Name") %></td>
<td><%=resultSet.getString("Content") %></td>
<td><%=resultSet.getString("Price") %></td>
</tr>
<%
}
sql ="select * from computers where Name like '%"+roll_no+"%'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
	String filename = resultSet.getString("filename");
%>
<tr onclick="location.href='computers_Item.jsp?id=<%=resultSet.getString("id")  %>'">
<td><img src="images/Desktop/<%=filename%>" height = "100" /></td>
<td><%=resultSet.getString("Name") %></td>
<td><%=resultSet.getString("Content") %></td>
<td><%=resultSet.getString("Price") %></td>
</tr>
<%
}
sql ="select * from laptops where Name like '%"+roll_no+"%'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
	String filename = resultSet.getString("filename");
%>
<tr onclick="location.href='Laptop_Item.jsp?id=<%=resultSet.getString("id")  %>'">
<td><img src="images/laptop/<%=filename%>" height = "100" /></td>
<td><%=resultSet.getString("Name") %></td>
<td><%=resultSet.getString("Content") %></td>
<td><%=resultSet.getString("Price") %></td>
</tr>
<%
}
sql ="select * from mobile where Name like '%"+roll_no+"%'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
	String filename = resultSet.getString("filename");
%>
<tr onclick="location.href='mppobile_Item.jsp?id=<%=resultSet.getString("id")  %>'">
<td><img src="images/Phone/<%=filename%>" height = "100" /></td>
<td><%=resultSet.getString("Name") %></td>
<td><%=resultSet.getString("Content") %></td>
<td><%=resultSet.getString("Price") %></td>
</tr>
<%
}
sql ="select * from printers where Name like '%"+roll_no+"%'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
	String filename = resultSet.getString("filename");
%>
<tr onclick="location.href='Printer_Item.jsp?id=<%=resultSet.getString("id")  %>'">
<td><img src="images/Printers/<%=filename%>" height = "100" /></td>
<td><%=resultSet.getString("Name") %></td>
<td><%=resultSet.getString("Content") %></td>
<td><%=resultSet.getString("Price") %></td>
</tr>
<%
}
sql ="select * from processors where Name like '%"+roll_no+"%'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
	String filename = resultSet.getString("filename");
%>
<tr onclick="location.href='Processors_Item.jsp?id=<%=resultSet.getString("id")  %>'">
<td><img src="images/Processors/<%=filename%>" height = "100" /></td>
<td><%=resultSet.getString("Name") %></td>
<td><%=resultSet.getString("Content") %></td>
<td><%=resultSet.getString("Price") %></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table></div>
</body>
</html>