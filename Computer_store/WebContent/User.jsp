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

String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "lankan";
String userid = "root";
String password = "root";
String Email = (String)session.getAttribute("Email");
System.out.print(Email);
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

    <title>Profile</title>

    <!-- Bootstrap core CSS -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="bootstrap/css/shop-homepage.css" rel="stylesheet">

  </head>

   <body>
   

    <!-- Navigation -->
    <%@ include file="navigationbar.jsp"%>
 
    <!-- Page Content -->
    <div class="container">

      <div class="row">

        <div class="col-lg-3">

          <h1 class="my-4">Welcome</h1>
          <div class="list-group">
            <a href="Desktop.jsp" class="list-group-item">Desktops</a>
            <a href="Network.jsp" class="list-group-item">Networks</a>
             <a href="Phone.jsp" class="list-group-item">Phones</a>
            <a href="Printer" class="list-group-item">Printers</a> 
            <a href="CCTV.jsp" class="list-group-item">CCTV</a>
            <a href="Laptop.jsp" class="list-group-item">Laptops</a>
            
          </div>

        </div>
       

        <div class="col-lg-9">  <!-- main div in the middle  -->
        
        
  <div class="card my-4">			<!-- div that make the table white to the end  -->
  
  
  
  
           <table class="table table-hover">
        
           <%    
 try{
	 connection = DriverManager.getConnection(connectionUrl+database, userid, password);
	 statement= connection.createStatement();
	 String sql ="select * from member where Email='"+Email+"';";
	 resultSet = statement.executeQuery(sql);
	 int i=0;
	 while(resultSet.next()){
	 	
%>
			<thead>
           		<tr>
           		<th >Name</th>
           		<th>Mobile</th>
           		<th>Birthday</th>
           		<th>Email</th>
           		<th>Privilaged points</th>
           		
           		</tr>
           	</thead>
           	<tbody>
           	<tr>
           		
           		<td><%=resultSet.getString("Name") %></td>
           		<td><%=resultSet.getString("Mobile") %></td>
           		<td><%=resultSet.getString("Birthday") %></td>
           		<td><%=resultSet.getString("Email") %></td>
           		<td><%=resultSet.getString("ppoints") %></td>
           		
           		</tr>
           	</tbody>
         

		 <%
i++;
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
     
           </table>

		

		</div>
		
</div>
		

		
		
		
		
                     

          
          <!-- /.row -->

        </div>
        <!-- /.col-lg-9 -->

      </div>
      <!-- /.row -->



    <!-- Bootstrap core JavaScript -->
    <script src="jquery/jquery.min.js"></script>
    <script src="bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="jquery/bootstrap.min.js"></script>

  </body>

</html>
