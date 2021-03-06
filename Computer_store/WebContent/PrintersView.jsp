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
String printers= request.getParameter("printers");
System.out.print(printers);
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
            <a href="PrintersView.jsp?printers=Hp" class="list-group-item">Hp</a>
            <a href="PrintersView.jsp?printers=Canon" class="list-group-item">Canon</a>
            <a href="PrintersView.jsp?printers=Epson" class="list-group-item">Epson</a>
             <a href="PrintersView.jsp?printers=Panasonic" class="list-group-item">Panasonic</a>
             <a href="PrintersView.jsp?printers=Brother" class="list-group-item">Brother</a>
               <a href="PrintersView.jsp?printers=Lexmark" class="list-group-item">Lexmark</a>
                 <a href="PrintersView.jsp?printers=Ricoh" class="list-group-item">Ricoh</a>
                  <a href="PrintersView.jsp?printers=Kyocera" class="list-group-item">Kyocera</a>
          </div>
          

 
        </div>
       

        <div class="col-lg-9">  <!-- main div in the middle  -->
        
        
  <div class="card my-4">			<!-- div that make the table white to the end  -->
  
  
  
  <div class="row justify-content-md-center">
    
      
            <div class="card-body">
            <br>
              <div class="input-group">
                <input type="text" class="form-control" placeholder="Search for...">
                <span class="input-group-btn">
                  <button class="btn btn-secondary" type="button">Go!</button>
                </span>
              </div>
            </div>
    
    </div>
           <table class="table table-hover">
        
           <%    
 try{
	 connection = DriverManager.getConnection(connectionUrl+database, userid, password);
	 statement= connection.createStatement();
	 String sql ="select * from printers where Type='"+printers+"';";
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
           		<td><a href="Printer_Item.jsp?id=<%=resultSet.getString("id")  %>"><img src="images/Printers/<%=filename%>" height = "100" /></a></td>
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