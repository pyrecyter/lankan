<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>


<html>
<head>
<%
if ((session.getAttribute("Name") == null) || (session.getAttribute("Name") == "")) {
	response.sendRedirect("Admin.jsp");
}
%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Display Repair Request Admin</title>
<link href="bootstrap/css/DisplayRepairReqCss.css" rel="stylesheet">
  
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
         
         

        <TABLE BORDER="1" align="center">
            <TR>
                <TH>NAME</TH>
                <TH>EMAIL</TH>
                <TH>CNUMBER</TH>
                <TH>ONUMBER</TH>
                <TH>REASON</TH>
                <TH>PRIORITY</TH>
                <TH>COMMENTS</TH>
                <TH>DATE</TH>
                <TH>ID</TH>
                <TH>PRIVILEDGE POINTS</TH>
                <Th>REMOVE REQUEST</Th>
               
            </TR>
            <%
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/lankan", "root", "root");
            try{
            	
            Statement statement = connection.createStatement() ;
            ResultSet resultset = statement.executeQuery("select * from repair_req_tab") ; 
            while(resultset.next()){ 
            Statement statement2= connection.createStatement() ;
            ResultSet resultset2 = statement2.executeQuery("select * from member where Email=\""+resultset.getString("email")+"\";"); 
            System.out.println(resultset.getString("Email"));
            while(resultset2.next()){ %>
            <TR>
                    <TD> <%= resultset.getString("name") %></td>
                    <TD> <%= resultset.getString("email") %></TD>
                    <TD> <%= resultset.getString("contactNum") %></TD>
                    <TD> <%= resultset.getString("orderNum") %></TD>
                    <TD> <%= resultset.getString("Reason") %></TD>
                    <TD> <%= resultset.getString("Priority") %></TD>
                    <TD> <%= resultset.getString("Comments") %></TD>
                    <TD> <%= resultset.getString("Date") %></TD>
                    <TD> <%= resultset.getString("repairId")  %></TD>
            	<TD> <%=resultset2.getString("ppoints") %></TD>
               <td id="td1"><a href="Delete_RepairReqForm.jsp?repairId=<%=resultset.getString("repairId") %>"><input Type="submit" value="Remove Request" class="x-button"></a></td> </TR>
            <%
            }
            }connection.close();
            }catch (Exception e) {
        	e.printStackTrace();
        	} %>
        </TABLE>

               <form class="btn btn-info" action="RepairReqTab" method="get">
            <input  type = "submit" class="btn btn-info" value="Print PDF"/>
            </form></div></div>
            
            <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
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