<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

    <%
String Email = request.getParameter("Email");				//current user
String id = request.getParameter("id");
String secondid = request.getParameter("seconditem");

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
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Compare</title>

    <!-- Bootstrap core CSS -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="bootstrap/css/modern-business.css" rel="stylesheet">

  </head>

  <body background="images/register.jpg">

    <!-- Navigation -->
<%@ include file="navigationbar.jsp"%>



	<br />
	<br />
	<br />
    <!-- Page Content -->
    <div class="container">

      <!-- Page Heading/Breadcrumbs -->
      <h1 class="mt-4 mb-3">Compare
        
      </h1>

      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="Home.jsp">Home</a>
        </li>
        <li class="breadcrumb-item active">Compare</li>
      </ol>

      <!-- Content Row -->
      <div class="row">
                <%    
 try{
	 connection = DriverManager.getConnection(connectionUrl+database, userid, password);
	 statement= connection.createStatement();
	 String sql ="select * from network where id='"+id+"';";
	 resultSet = statement.executeQuery(sql);
	 int i=0;
	 while(resultSet.next()){
	 	String filename = resultSet.getString("filename");
%>
        <div class="col-lg-4 mb-4">
          <div class="card h-100">
            <h3 class="card-header bg-primary text-white"><%=resultSet.getString("Name") %></h3> 
           
            <div class="card-body">
              <div class="display-4"><a href="Network_Item.jsp?id=<%=resultSet.getString("id")  %>"><img class="card-img-top" src="images/Network/<%=filename%>" height = "300" alt=""/></a></div>
              <br>
               <div class="display-4">LKR <%=resultSet.getString("Price") %></div>
               <%=resultSet.getString("Content") %>
             
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
 try{
	 connection = DriverManager.getConnection(connectionUrl+database, userid, password);
	 statement= connection.createStatement();
	 String sql ="select * from network where id='"+secondid+"';";
	 resultSet = statement.executeQuery(sql);
	 int i=0;
	 while(resultSet.next()){
	 	String filename = resultSet.getString("filename");
%>          
              
                     
             
      <div class="col-lg-4 mb-4">
          <div class="card h-100">
            <h3 class="card-header bg-primary text-white"><%=resultSet.getString("Name") %></h3> 
           
            <div class="card-body">
              <div class="display-4"><a href="Network_Item.jsp?id=<%=resultSet.getString("id")  %>"><img class="card-img-top" src="images/Network/<%=filename%>" height = "300" width="100" alt=""/></a></div>
              <br>
               <div class="display-4">LKR <%=resultSet.getString("Price") %></div>
               <%=resultSet.getString("Content") %>
             
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

        <div class="col-lg-4 mb-4">
        <div class="card h-100">
         <h3 class="card-header bg-primary text-white">Choose Item to Compare</h3> 
<%    
 try{
	 connection = DriverManager.getConnection(connectionUrl+database, userid, password);
	 statement= connection.createStatement();
	 String sql ="select * from network";
	 resultSet = statement.executeQuery(sql);
	 int i=0;
	 while(resultSet.next()){
	 	String filename = resultSet.getString("filename");
%>      
  
      		<table class="table table-hover">
			<tbody>
			<tr>
			
				<td><a href="Compare_Network.jsp?id=<%=request.getParameter("id")%>&seconditem=<%=resultSet.getString("id")%>"><%=resultSet.getString("Name") %></a></td>
				
				
			</tr>
			</tbody>
			</table>
 
    
         
                		 <%
i++;
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}     
 %> 
          
        
      <!-- /.row -->

   </div>
   </div>
   </div>
   </div>
    <!-- /.container -->

    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Lankan AN Global 2018</p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="jquery/jquery.min.js"></script>
    <script src="bootstrap/js/bootstrap.bundle.min.js"></script>

  </body>

</html>
