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
<%
	if ((session.getAttribute("Email") == null) || (session.getAttribute("Email") == "") ) {
		response.sendRedirect("Login.jsp");
	}
%>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="css/shop-item.css" rel="stylesheet">

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
	<br>
	<br>
	<br>
	<!-- Page Content -->
	<div class="container">


		<h1 class="my-4">CART</h1>
		<div class="card my-4">

			<table class="table table-hover" style="width: 100%" id=cart_table >
				<thead>
					<tr id="header" style="border-bottom: 3pt solid black;">

						<th>Name</th>
						<th style="width: 50%">Description</th>
						<th>Unit Price</th>
						<th style="text-align: center">Quantity</th>
						<th style="text-align: right">Total Price</th>
					</tr>
				</thead>
				<tbody>
					<%
						String driver = "com.mysql.jdbc.Driver";
						String connectionUrl = "jdbc:mysql://localhost:3306/";
						String database = "lankan";
						String userid = "root";
						String password = "root";
						int i = 0;
						boolean cartempty = false;
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
						int tot = 0;
						try {
							String email = (String) session.getAttribute("Email");
							connection = DriverManager.getConnection(connectionUrl + database, userid, password);
							statement = connection.createStatement();
							String sql = "select * from mycart where email=\"" + email + "\";";
							resultSet = statement.executeQuery(sql);
							resultSet.last();
							i = resultSet.getRow();
							resultSet.beforeFirst();
							if (i > 0) {
								cartempty = false;
								while (resultSet.next()) {
									String prefix = resultSet.getString("prefix");
									statement2 = connection.createStatement();
									String res = "select * from " + prefix + " where id=\"" + resultSet.getString("itemcode")
											+ "\";";
									resultSet2 = statement2.executeQuery(res);
									while (resultSet2.next()) {
					%>
					<tr style="border-bottom: 2pt solid black;">
						<td><%=resultSet2.getString("Name")%><br>
						<br>
							<form action="delete_item" method="post">
								<input type="hidden" name="id"
									value=<%=resultSet.getInt("id")%>>
								<button class="btn btn-info" style="background-color: red;"
									type="submit" id="deleteitem">Delete</button>
							</form></td>
						<td><%=resultSet2.getString("Content")%></td>
						<td><%=resultSet2.getString("Price")%></td>
						<td style="text-align: center">
							<form action="item_quantity" method="post">
								<input type="hidden" name="id"
									value=<%=resultSet.getInt("id")%>> <input
									type="hidden" name="type" value="remove">
								<button class="btn btn-info"
									style="background-color: orange; left-padding: 5px"
									type="submit" <%if (resultSet.getInt("quantity") <= 1) {%>
									disabled <%}%>>&nbsp;-&nbsp;</button>
							</form> <%=resultSet.getString("quantity")%>
							<form action="item_quantity" method="post">
								<input type="hidden" name="id"
									value=<%=resultSet.getInt("id")%>> <input
									type="hidden" name="type" value="add">
								<button class="btn btn-info"
									style="background-color: orange; left-padding: 5px"
									type="submit">+</button>
							</form>
						</td>
						<td style="text-align: right">
							<%
								int price = resultSet2.getInt("Price") * resultSet.getInt("quantity");
												tot = tot + price;
							%><%=price%></td>
					</tr>
					<%
						}
								}
							} else {
								cartempty = true;
					%>
					<tr style="text-align: left" id="subtotal">
						<td colspan="5"><h3>Empty Cart !</h3> <%
 	}
 		connection.close();
 	} catch (Exception e) {
 		e.printStackTrace();
 	}
 %>
							<%
								if (!cartempty) {
							%>
					<tr style="text-align: right" id="subtotal">
						<td colspan="5"><h2>
								Subtotal :
								<%=tot%></h2> <span id="sum"></span></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>

		<%
			if (!cartempty) {
		%>
		<form action="Add_Order_History" method="post">
			<input type="hidden" value=<%=session.getAttribute("Email")%>
				name="email" class="btn btn-info"> <input type="Submit"
				value="Pay Using Paypal" class="btn btn-info">
		</form>
		<%
			}
		%>
		<br> <a href="Home.jsp">&lt;&lt;&lt; Continue to shopping</a>
	</div>
</body>

</html>
