<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Lankan AN Globle</title>

<!-- Bootstrap core CSS -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/shop-item.css" rel="stylesheet">
</head>

<body background="images\register.jpg">

	<!-- Navigation -->
    <%@ include file="navigationbar.jsp"%>
	<br />
	<br />
	<br />
	<!-- Page Content -->
	<div class="container">


		<h1 class="my-4">Quotation</h1>
		<div class="card my-4">

			<table class="table table-hover" style="width: 100%" id=cart_table
				cellpadding="10">
				<thead>
					<tr id="header" style="border-bottom: 3pt solid black;">

						<th>Name</th>
						<th>Description</th>
						<th>Quantity</th>
						<th style="text-align: right">Price</th>
					</tr>
				</thead>
				<tbody>
					<%
						String driver = "com.mysql.jdbc.Driver";
						String connectionUrl = "jdbc:mysql://localhost:3306/";
						String database = "lankan";
						String userid = "root";
						String password = "root";
						try {
							Class.forName(driver);
						} catch (ClassNotFoundException e) {
							e.printStackTrace();
						}
						Connection connection = null;
						Statement statement = null;
						Statement statement2 = null;
						ResultSet resultSet = null;
						ResultSet resultSet2 = null;
						try {
							connection = DriverManager.getConnection(connectionUrl + database, userid, password);
							statement = connection.createStatement();
							String sql = "select * from quotation where email=\"" + session.getAttribute("Email") + "\";";
							resultSet = statement.executeQuery(sql);
							while (resultSet.next()) {
								String prefix = resultSet.getString("prefix");
								System.out.println(resultSet.getString("itemcode"));
								statement2 = connection.createStatement();
								String res = "select * from " + prefix + " where id=\"" + resultSet.getString("itemcode") + "\";";
								resultSet2 = statement2.executeQuery(res);
								while (resultSet2.next()) {
					%>
					<tr style="border-bottom: 1pt solid black;">
						<td><%=resultSet2.getString("Name")%><br><br>
						<form  action="quo_delete" method="post">
						<input type="hidden" name="id" value =<%=resultSet.getInt("id") %>>
						<input style="background-color:red;border:none" type="submit" value="delete" id="deleteitem" /></form>
						</td>
						<td><%=resultSet2.getString("Content")%></td>
						<td>
						<form  action="quo_quantity" method="post">
						<input type="hidden" name="id" value =<%=resultSet.getInt("id") %>>
						<input type="hidden" name="type" value ="remove">
						<input style="background-color:yellow;left-padding:5px" type="submit" value=" - "></form>
						<%=resultSet.getString("quantity")%>
						<form  action="quo_quantity" method="post">
						<input type="hidden" name="id" value =<%=resultSet.getInt("id") %>>
						<input type="hidden" name="type" value ="add">
						<input style="background-color:green;left-padding:5px" type="submit" value="+"></form>
						</td>
						<td style="text-align: right">
							<%
								int price = resultSet2.getInt("Price") * resultSet.getInt("quantity");
							%><%=price%></td>
					</tr>
					<%
						}
							}
							connection.close();
						} catch (Exception e) {
							e.printStackTrace();
						}
					%>
					
				</tbody>
			</table>
		</div>

		<a href="Home.jsp">&lt;&lt;&lt; Continue to shopping</a>
</body>

</html>
