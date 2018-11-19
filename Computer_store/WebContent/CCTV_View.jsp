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
String cctv = request.getParameter("cctv");
System.out.print(cctv);
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

    <title>Lankan AN Global</title>

    <!-- Bootstrap core CSS -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="bootstrap/css/shop-homepage.css" rel="stylesheet">

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

        <div class="col-lg-3">
			  <div class="list-group">
            <a href="CCTV_View.jsp?cctv=Avtech" class="list-group-item">Avtech</a>
            <a href="CCTV_View.jsp?cctv=Panasonic" class="list-group-item">Panasonic</a>
            <a href="CCTV_View.jsp?cctv=Samsung" class="list-group-item">Samsung</a>
             <a href="CCTV_View.jsp?cctv=Sanyo" class="list-group-item">Sanyo</a>
              <a href="CCTV_View.jsp?cctv=Sony" class="list-group-item">Sony</a>
               <a href="CCTV_View.jsp?cctv=Zicom" class="list-group-item">Zicom</a>
          </div>
          

 
        </div>
       

        <div class="col-lg-9">  <!-- main div in the middle  -->
        
        
  <div class="card my-4">			<!-- div that make the table white to the end  -->
  
  
  
  
           <table class="table table-hover">
        
           <%    
 try{
	 connection = DriverManager.getConnection(connectionUrl+database, userid, password);
	 statement= connection.createStatement();
	 String sql ="select * from cctv where Type='"+cctv+"';";
	 resultSet = statement.executeQuery(sql);
	 int i=0;
	 while(resultSet.next()){
	 	String filename = resultSet.getString("filename");
%>
			<thead>
           		<tr>
           		<th colspan="3"><%=resultSet.getString("Name") %></th>
           		</tr>
           	</thead>
           	<tbody>
           	<tr>
           		<td><a href="CCTV_Item.jsp?id=<%=resultSet.getString("id")  %>"><img src="images/CCTV/<%=filename%>" height = "100" /></a></td>
           		<td><%=resultSet.getString("Content") %></td>
           		<td><b>LKR <%=resultSet.getString("Price") %></b></td>
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
