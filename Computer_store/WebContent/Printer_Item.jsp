<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<%
String id = request.getParameter("email");				//current user
String idprinter = request.getParameter("id");
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
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Lankan AN Globle</title>

    <!-- Bootstrap core CSS -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/shop-item.css" rel="stylesheet">

  </head>

   <body>

    <!-- Navigation -->
    <%@ include file="navigationbar.jsp"%>
	<br />
	<br />
	<br />
    <!-- Page Content -->
    <div class="container">

      <div class="row">

        <div class="col-lg-3"><br><br>
          
          <div class="list-group">
           <a href="printersView.jsp?printers=Hp" class="list-group-item">Hp</a>
            <a href="printersView.jsp?printers=Canon" class="list-group-item">Canon</a>
            <a href="printersView.jsp?printers=Epson" class="list-group-item">Epson</a>
             <a href="printersView.jsp?printers=Panasonic" class="list-group-item">Panasonic</a>
              <a href="printersView.jsp?printers=Brother" class="list-group-item">Brother</a>
               <a href="printersView.jsp?printers=Ricoh" class="list-group-item">Ricoh</a>
                 <a href="printersView.jsp?printers=Lexmark" class="list-group-item">Lexmark</a>
                  <a href="printersView.jsp?printers=Kyocera" class="list-group-item">Kyocera</a>
         
          </div>
          
           <div class="card my-4">
            <h5 class="card-header">Search</h5>
            <div class="card-body">
              <div class="input-group">
                <input type="text" class="form-control" placeholder="Search for...">
                <span class="input-group-btn">
                  <button class="btn btn-secondary" type="button">Go!</button>
                </span>
              </div>
            </div>
          </div>
        </div>
        
        
        <!-- /.col-lg-3 -->

        <div class="col-lg-9">
			 <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
            <ol class="carousel-indicators">
              <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
               <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
            </ol>
<% 
try{
	 connection = DriverManager.getConnection(connectionUrl+database, userid, password);
	 statement= connection.createStatement();
	 String sql ="select * from printers where id='"+idprinter +"';";
	 resultSet = statement.executeQuery(sql);
	 int i=0;
	 while(resultSet.next()){
	 	String filename = resultSet.getString("filename");
%>
          <div class="card mt-4">
            <img class="card-img-top img-fluid" src="images/Printers/<%=filename%>" height = "100" alt="">
            <div class="card-body">
              <h3 class="card-title"><%=resultSet.getString("Name") %></h3>
              <h4>LKR <%=resultSet.getString("Price") %></h4>
              <p class="card-text">
				
              <span class="text-warning">&#9733; &#9733; &#9733; &#9733; &#9734;</span>
              4.0 stars
              </div>
              <%if ((session.getAttribute("Email") != null)) { %>
              <div class="card-footer">
                  <form method="post" action="wishlist">
                <input type="hidden" name="email" value=<%=session.getAttribute("Email") %>>
                <input type="hidden" name="id" value=<%=idprinter %>>
                <input type="hidden" name="prefix" value="printers">
                <input type="submit" value="+wishlist" class="btn">
                </form><%} %>
                  <div class="icon-cart" style="float: right;">
                   <div class="container">
                   <a href="Compare_Printers.jsp?id=<%=idprinter%>" class ="btn btn-info">Compare</a>
                   <%if ((session.getAttribute("Email") != null)) { %>
                    <form class="btn btn-primary"  action="Add_Quotation" method="post">
                   <input type="hidden" name="email" value=<%=session.getAttribute("Email") %>>
                    <input type="hidden" name="id" value= "<%=idprinter %>">
                      <input type="hidden" name="prefix" value="printers">
                   <button type="submit" class="btn btn-primary">Get Quotation</button></form>
                   <form class="btn btn-success" action="Add_cart" method="post">
                   <input type="hidden" name="prefix" value="printers">
                   <input type="hidden" name="id" value=<%=idprinter%>>
                   <input type="hidden" name="email" value=<%=session.getAttribute("Email") %>>
                  <input type="submit" class="btn btn-success" value="Add to cart">
                  </form><%} %>
            </div>
          </div>
          <!-- /.card -->

          <div class="card card-outline-secondary my-4">
            <div class="card-header">
              <h5>Product Specifications</h5>
            </div>
            <div class="card-body">
              <p align="center">	
              <%=resultSet.getString("Content") %>
              <hr>
             
            </div>
          </div>
          <!-- /.card -->

        </div>
        <!-- /.col-lg-9 -->

      </div>

    </div>
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
    
    <!-- /.container -->

   

    <!-- Bootstrap core JavaScript -->
    <script src="jquery/jquery.min.js"></script>
    <script src="bootstrap/js/bootstrap.bundle.min.js"></script>

  </body>

</html>
