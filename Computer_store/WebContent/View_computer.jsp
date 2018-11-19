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
if ((session.getAttribute("Name") == null) || (session.getAttribute("Name") == "")) {
	response.sendRedirect("Admin.jsp");
}
%>
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
ResultSet resultSet = null;
%>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Computer</title>

    <!-- Bootstrap core CSS-->
    <link href="Adminbootstrap/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template-->
    <link href="Adminbootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Page level plugin CSS-->
    <link href="Adminbootstrap/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="Adminbootstrap/css/sb-admin.css" rel="stylesheet">

  </head>

  <body id="page-top">

    <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

      <a class="navbar-brand mr-1" href="index.html">Lankan AN Global</a>

      <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
        <i class="fas fa-bars"></i>
      </button>

      <!-- Navbar Search -->
      <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
        <div class="input-group">
           </div>
        </div>
      </form>

      <!-- Navbar -->
      <h4 style="color:white"> Admin : <%=session.getAttribute("Name") %> &nbsp;</h4>
      <ul class="navbar-nav ml-auto ml-md-0">

        <li class="nav-item dropdown no-arrow">
          <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-user-circle fa-fw"></i>
          </a>
          <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">Logout</a>
          </div>
        </li>
      </ul>

    </nav>

    <div id="wrapper">

      <!-- Sidebar -->
      <ul class="sidebar navbar-nav">
        <li class="nav-item active">
          <a class="nav-link" href="AdminControl.jsp">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Dashboard</span>
          </a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-fw fa-folder"></i>
            <span>Pages</span>
          </a>
          <div class="dropdown-menu" aria-labelledby="pagesDropdown">
            <h6 class="dropdown-header">Login Screens:</h6>
            <a class="dropdown-item" href="login.jsp">Login</a>
            <a class="dropdown-item" href="Register.jsp">Register</a>
            <a class="dropdown-item" href="forgot-password.html">Forgot Password</a>
            <div class="dropdown-divider"></div>
            <h6 class="dropdown-header">Other Pages:</h6>
            <a class="dropdown-item" href="Home.jsp">Home </a>
              <a class="dropdown-item" href="Desktop.jsp">Desktop</a>
            <a class="dropdown-item" href="Network.jsp">Network</a>
            <a class="dropdown-item" href="Phone.jsp">Phone</a>
            <a class="dropdown-item" href="Printers.jsp">Printers</a>
            <a class="dropdown-item" href="Processors.jsp">Processors</a>
            
          </div>
           <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-fw fa-folder"></i>
            <span>Stocks</span>
          </a>
          <div class="dropdown-menu" aria-labelledby="pagesDropdown">
           <a class="dropdown-item" href="sendmail.jsp">Alert Customer</a>
          </div>
        
           <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fas fa-fw fa-folder"></i>
            <span>Items</span></a>
             <div class="dropdown-menu" aria-labelledby="pagesDropdown">
            <a class="dropdown-item" href="sarComputer.jsp">Computers</a>
            <a class="dropdown-item" href="sarLaptopjsp.jsp">Laptops</a>
            <a class="dropdown-item" href="sarMobileDevices.jsp">Mobile Devices</a>
            <a class="dropdown-item" href="sarprinters.jsp">Printers</a>
               <a class="dropdown-item" href="saraCCtv.jsp">CCTV Cams</a>
                <a class="dropdown-item" href="sarProcessors.jsp">Processors</a>
                 <a class="dropdown-item" href="sarnetwork.jsp">Network</a>
                  <a class="dropdown-item" href="DisplayRepairReqAdnib.jsp">View Repair Requests</a>
         </div>
       </li>
      </ul>

      <div id="content-wrapper">

        <div class="container-fluid">

         
          <!-- DataTables Example -->
          <div class="card mb-3">
            <div class="card-header">
              <i class="fas fa-table"></i>
              </div>
            <div class="card-body">
            <div class="table-responsive">
               <form class="btn btn-info" action="DesktopReport" method="get">
            <input  type = "submit" class="btn btn-info" value="Print PDF"/>
            </form>
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>ID</th>
                      <th>Name</th>
                      <th>Content</th>
                      <th>Price</th>
                      <th>Image</th>
                      <th>Type</th>
                      <th></th>
                      <th></th>
                     
                    </tr>
 <%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement= connection.createStatement();
String sql ="select * from computers";
resultSet = statement.executeQuery(sql);
int i=0;
while(resultSet.next()){
%>
                  </thead>
                  
                   <tbody>
                    <tr>
                      <td><%=resultSet.getString("id") %></td>
                      <td><%=resultSet.getString("Name") %></td>
                      <td><%=resultSet.getString("Content") %></td>
                      <td><%=resultSet.getString("Price") %></td>
                      <td><%=resultSet.getString("Image") %></td>
                      <td><%=resultSet.getString("Type") %></td>
                      <td><a href="Delete_computers.jsp?id=<%=resultSet.getString("id") %>"><button type="button" class="delete">Delete</button></a></td>
                      <td><a href="Edit_computers.jsp?id=<%=resultSet.getString("id") %>"><button type="button" class="Edit">Edit</button></a></td>
                      
                    </tr>
<%
i++;
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
                    </tbody>
                  
                  
                </table>
              </div>
            </div>
            
          </div>

        </div>
        <!-- /.container-fluid -->


      </div>
      <!-- /.content-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">�</span>
            </button>
          </div>
          <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
            <form  class="btn btn-primary" action="Logout" method="post">
            <input class="btn btn-primary" type="submit" value="Logout"></form>
          </div>
        </div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="Adminbootstrap/vendor/jquery/jquery.min.js"></script>
    <script src="Adminbootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="Adminbootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Page level plugin JavaScript-->
    <script src="Adminbootstrap/vendor/chart.js/Chart.min.js"></script>
    <script src="Adminbootstrap/vendor/datatables/jquery.dataTables.js"></script>
    <script src="Adminbootstrap/vendor/datatables/dataTables.bootstrap4.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="Adminbootstrap/js/sb-admin.min.js"></script>

    <!-- Demo scripts for this page-->
    <script src="Adminbootstrap/js/demo/datatables-demo.js"></script>
    <script src="Adminbootstrap/js/demo/chart-area-demo.js"></script>

  </body>

</html>
