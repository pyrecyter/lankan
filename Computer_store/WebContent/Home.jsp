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
<%
if (application.getAttribute("hitCounter") != null){
int hitCounter = (int)application.getAttribute("hitCounter");
application.setAttribute("hitCounter", ++hitCounter);
}else{
	application.setAttribute("hitCounter", 1);
}

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
	ResultSet resultSet = null;
%>

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Home</title>

<!-- Bootstrap core CSS -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/shop-homepage.css" rel="stylesheet">


</head>

<body>

	<!-- Navigation -->
	<%@ include file="navigationbar.jsp"%>
	<br />
	<br />
	<br />
	<!-- Page Content -->
	<div class="container">
	<div class="row justify-content-md-center">
		<form class="form-inline" action="search.jsp">
			<input type="text" class="form-control" style="width:300px" name="search" required placeholder="Search for...">&nbsp;
			<span class="input-group-btn">
				<button type="submit" class="btn btn-primary">Search</button>
			</span>
		</form>
	</div>

		<div class="row">

			<div class="col-lg-3">

				<h1 class="my-4">Welcome</h1>
				<div class="list-group">
					<a href="Desktop.jsp" class="list-group-item">Desktops</a> <a
						href="Network.jsp" class="list-group-item">Networks</a> <a
						href="mobile.jsp" class="list-group-item">Phones</a> <a
						href="Printers.jsp" class="list-group-item">Printers</a> <a
						href="CCTV.jsp" class="list-group-item">CCTV</a> <a
						href="Laptops.jsp" class="list-group-item">Laptops</a> <a
						href="Processors.jsp" class="list-group-item">Processors</a>

				</div>
				<%
					if ((session.getAttribute("Email") != null)) {
				%>
				<div class="list-group">
					<br>
					<br> <a href="Quotation.jsp" class="list-group-item">Quotation</a>
					<a href="RepairRequestForm.jsp" class="list-group-item">Repair
						Request</a>


				</div>

				<%
					}
				%>
			</div>



			<!-- /.col-lg-3 -->

			<div class="col-lg-9">

				<div id="carouselExampleIndicators" class="carousel slide my-4"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carouselExampleIndicators" data-slide-to="0"
							class="active"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner" role="listbox">
						<div class="carousel-item active">
							<img class="d-block img-fluid" src="images/front/1.jpg"
								alt="First slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid" src="images/front/2.jpg"
								alt="Second slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid" src="images/front/3.png"
								alt="Third slide">
						</div>
					</div>
					<a class="carousel-control-prev" href="#carouselExampleIndicators"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>

				<div class="row">
					<%
						try {
							connection = DriverManager.getConnection(connectionUrl + database, userid, password);
							statement = connection.createStatement();
							String sql = "select * from network order by id desc limit 3;";
							resultSet = statement.executeQuery(sql);
							int i = 0;
							while (resultSet.next()) {
								String filename = resultSet.getString("filename");
					%>
					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<a href="Network_Item.jsp?id=<%=resultSet.getString("id")%>"><img
								class="card-img-top" src="images/Network/<%=filename%>"
								width="100" height="200" alt=""></a>
							<div class="card-body">
								<h4 class="card-title">
									<a href="#"><%=resultSet.getString("Name")%></a>
								</h4>
								<br />
								<h5>
									LKR
									<%=resultSet.getString("Price")%></h5>

							</div>
							<div class="card-footer">
								<small class="text-muted">&#9733; &#9733; &#9733;
									&#9733; &#9734;</small>
							</div>
						</div>
					</div>
					<%
						i++;
							}
							connection.close();
						} catch (Exception e) {
							e.printStackTrace();
						}
					%>

					<%
						try {
							connection = DriverManager.getConnection(connectionUrl + database, userid, password);
							statement = connection.createStatement();
							String sql = "select * from printers order by id desc limit 1;";
							resultSet = statement.executeQuery(sql);
							int i = 0;
							while (resultSet.next()) {
								String filename = resultSet.getString("filename");
					%>


					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<a href="Printer_Item.jsp?id=<%=resultSet.getString("id")%>"><img
								class="card-img-top" src="images/Printers/<%=filename%>"
								width="100" height="200" alt=""></a>
							<div class="card-body">
								<h4 class="card-title">
									<a href="#"><%=resultSet.getString("Name")%></a>
								</h4>
								<h5>
									LKR
									<%=resultSet.getString("Price")%></h5>

							</div>
							<div class="card-footer">
								<small class="text-muted">&#9733; &#9733; &#9733;
									&#9733; &#9734;</small>
							</div>
						</div>
					</div>

					<%
						i++;
							}
							connection.close();
						} catch (Exception e) {
							e.printStackTrace();
						}
					%>


					<%
						try {
							connection = DriverManager.getConnection(connectionUrl + database, userid, password);
							statement = connection.createStatement();
							String sql = "select * from computers order by id desc limit 3;";
							resultSet = statement.executeQuery(sql);
							int i = 0;
							while (resultSet.next()) {
								String filename = resultSet.getString("filename");
					%>

					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<a href="computers_Item.jsp?id=<%=resultSet.getString("id")%>"><img
								class="card-img-top" src="images/Desktop/<%=filename%>" alt=""></a>
							<div class="card-body">
								<h4 class="card-title">
									<a href="#"><%=resultSet.getString("Name")%></a>
								</h4>
								<br />
								<h5>
									LKR
									<%=resultSet.getString("Price")%></h5>

							</div>
							<div class="card-footer">
								<small class="text-muted">&#9733; &#9733; &#9733;
									&#9733; &#9734;</small>
							</div>
						</div>
					</div>

					<%
						i++;
							}
							connection.close();
						} catch (Exception e) {
							e.printStackTrace();
						}
					%>

					<%
						try {
							connection = DriverManager.getConnection(connectionUrl + database, userid, password);
							statement = connection.createStatement();
							String sql = "select * from laptops order by id desc limit 3;";
							resultSet = statement.executeQuery(sql);
							int i = 0;
							while (resultSet.next()) {
								String filename = resultSet.getString("filename");
					%>

					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<a href="Printer_Item.jsp?id=<%=resultSet.getString("id")%>"><img
								class="card-img-top" src="images/laptop/<%=filename%>" alt=""></a>
							<div class="card-body">
								<h4 class="card-title">
									<a href="#"><%=resultSet.getString("Name")%></a>
								</h4>
								<br />
								<h5>
									LKR
									<%=resultSet.getString("Price")%></h5>

							</div>
							<div class="card-footer">
								<small class="text-muted">&#9733; &#9733; &#9733;
									&#9733; &#9734;</small>
							</div>
						</div>
					</div>

					<%
						i++;
							}
							connection.close();
						} catch (Exception e) {
							e.printStackTrace();
						}
					%>

					<%
						try {
							connection = DriverManager.getConnection(connectionUrl + database, userid, password);
							statement = connection.createStatement();
							String sql = "select * from cctv order by id desc limit 3;";
							resultSet = statement.executeQuery(sql);
							int i = 0;
							while (resultSet.next()) {
								String filename = resultSet.getString("filename");
					%>

					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<a href="CCTV_Item.jsp?id=<%=resultSet.getString("id")%>"><img
								class="card-img-top" src="images/CCTV/<%=filename%>" alt=""></a>
							<div class="card-body">
								<h4 class="card-title">
									<a href="#"><%=resultSet.getString("Name")%></a>
								</h4>
								<br />
								<h5>
									LKR
									<%=resultSet.getString("Price")%></h5>

							</div>
							<div class="card-footer">
								<small class="text-muted">&#9733; &#9733; &#9733;
									&#9733; &#9734;</small>
							</div>
						</div>
					</div>

					<%
						i++;
							}
							connection.close();
						} catch (Exception e) {
							e.printStackTrace();
						}
					%>

					<%
						try {
							connection = DriverManager.getConnection(connectionUrl + database, userid, password);
							statement = connection.createStatement();
							String sql = "select * from mobile order by id desc limit 3;";
							resultSet = statement.executeQuery(sql);
							int i = 0;
							while (resultSet.next()) {
								String filename = resultSet.getString("filename");
					%>

					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<a href="computers_Item.jsp?id=<%=resultSet.getString("id")%>"><img
								class="card-img-top" src="images/Phone/<%=filename%>" alt=""></a>
							<div class="card-body">
								<h4 class="card-title">
									<a href="#"><%=resultSet.getString("Name")%></a>
								</h4>
								<br />
								<h5>
									LKR
									<%=resultSet.getString("Price")%></h5>

							</div>
							<div class="card-footer">
								<small class="text-muted">&#9733; &#9733; &#9733;
									&#9733; &#9734;</small>
							</div>
						</div>
					</div>

					<%
						i++;
							}
							connection.close();
						} catch (Exception e) {
							e.printStackTrace();
						}
					%>

					<%
						try {
							connection = DriverManager.getConnection(connectionUrl + database, userid, password);
							statement = connection.createStatement();
							String sql = "select * from processors order by id desc limit 3";
							resultSet = statement.executeQuery(sql);
							int i = 0;
							while (resultSet.next()) {
								String filename = resultSet.getString("filename");
					%>

					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<a href="Network_Item.jsp?id=<%=resultSet.getString("id")%>"><img
								class="card-img-top" src="images/Processors/<%=filename%>" alt=""></a>
							<div class="card-body">
								<h4 class="card-title">
									<a href="#"><%=resultSet.getString("Name")%></a>
								</h4>
								<br />
								<h5>
									LKR
									<%=resultSet.getString("Price")%></h5>

							</div>
							<div class="card-footer">
								<small class="text-muted">&#9733; &#9733; &#9733;
									&#9733; &#9734;</small>
							</div>
						</div>
					</div>

					<%
						i++;
							}
							connection.close();
						} catch (Exception e) {
							e.printStackTrace();
						}
					%>

				</div>
				<!-- /.row -->

			</div>
			<!-- /.col-lg-9 -->

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Lankan AN
				Global 2018</p>
		</div>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="jquery/jquery.min.js"></script>
	<script src="bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
