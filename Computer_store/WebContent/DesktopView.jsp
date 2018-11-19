<%@ page import="java.io.*" %> 
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<%
String id = request.getParameter("email");				//current user
String computers = request.getParameter("computers");
System.out.print(computers);
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

    <title>Lankan AN  Global</title>

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
            <a href="DesktopView.jsp?computers=Asus" class="list-group-item">Asus</a>
            <a href="DesktopView.jsp?computers=Apple" class="list-group-item">Apple</a>
            <a href="DesktopView.jsp?computers=HP" class="list-group-item">HP</a>
             <a href="DesktopView.jsp?computers=Dell" class="list-group-item">Dell</a>
              <a href="DesktopView.jsp?computers=Alienware" class="list-group-item">Alienware</a>
               <a href="DesktopView.jsp?computers=MSI" class="list-group-item">MSI</a>
                 <a href="DesktopView.jsp?computers=Toshiba" class="list-group-item">Toshiba</a>
                  <a href="DesktopView.jsp?computers=Lenevo" class="list-group-item">Lenevo</a>
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
	 String sql ="select * from computers where Type='"+computers+"';";
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
           		<td><a href="computers_Item.jsp?id=<%=resultSet.getString("id")  %>"><img src="images/Desktop/<%=filename%>" height = "100" /></a></td>
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
