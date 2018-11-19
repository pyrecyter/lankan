<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  
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

   <body >
   

    <!-- Navigation -->
    <%@ include file="navigationbar.jsp"%>
	<br />
	<br />
	<br /> 
    <!-- Page Content -->
    <div class="container">

      <div class="row">

        <div class="col-lg-3">

          <h1 class="my-4">Welcome</h1>
          <div class="list-group">
            <a href="Desktop.jsp" class="list-group-item">Desktops</a>
            <a href="Network.jsp" class="list-group-item">Networks</a>
             <a href="mobile.jsp" class="list-group-item">Phones</a>
            <a href="Printers.jsp" class="list-group-item">Printers</a> 
            <a href="CCTV.jsp" class="list-group-item">CCTV</a>
            <a href="Laptops.jsp" class="list-group-item">Laptops</a>
             <a href="Processors.jsp" class="list-group-item">Processors</a>
            
          </div>
			           <%
    if ((session.getAttribute("Email") != null) ) {
    	
    	
%>
			<div class="list-group"><br><br>
			<a href="Quotation.jsp" class="list-group-item">Quotation</a>
            <a href="RepairRequestForm.jsp" class="list-group-item">Repair Request</a>
            
            
          </div>
        
      <%
    }

  %>
    </div>
       

        <div class="col-lg-9">

          <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
            <ol class="carousel-indicators">
              <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
               <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
              <div class="carousel-item active">
                <img class="d-block img-fluid" src="images\Network\frontend\link.png" alt="First slide">
              </div>
              <div class="carousel-item">
                 <img class="d-block img-fluid" src="images\Network\frontend\ra.jpg" alt="Second slide">
              </div>
             <div class="carousel-item">
                 <img class="d-block img-fluid" src="images\Network\frontend\as.jpg" alt="Second slide">
              </div>
               <div class="carousel-item">
                 <img class="d-block img-fluid" src="images\Network\frontend\er.png" alt="fourth slide">
              </div> 
              <div class="carousel-item">
                <img class="d-block img-fluid" src="images\Network\frontend\asus.jpg" alt="Fifth slide">
              </div>

            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
            </a>
          </div>
		
			<div class ="container">
				<table class="table">
					<tbody>
					<tr>
						<td><a href="NetworkView.jsp?network=ProLink"><img src="images/Network/frontend/prolink.png" width="300" height="120"></a></td>
						<td><a href="NetworkView.jsp?network=Dlink"><img src="images/Network/frontend/dlink.png" width="300" height="120"></a></td>
					</tr>
					<tr>
						<td><a href="NetworkView.jsp?network=Asus"><img src="images/Network/frontend/asuss.png"width="300" height="120"></a></td>
						<td><a href="NetworkView.jsp?network=Intel"><img src="images/Network/frontend/intel.png"width="300" height="120"></a></td>
					</tr>
					<tr>
						<td><a href="NetworkView.jsp?network=Rosewill"><img src="images/Network/frontend/rose.png"width="300" height="120"></a></td>
						<td><a href="NetworkView.jsp?network=Transition Networks"><img src="images/Network/frontend/tran.png"width="300" height="120"></a></td>
					</tr>
					<tr>
						<td><a href="NetworkView.jsp?network=Linksys"><img src="images/Network/frontend/linksys.png"width="300" height="120"></a></td>
						<td><a href="NetworkView.jsp?network=TRENDnet"><img src="images/Network/frontend/tren.png"width="300" height="120"></a></td>
					</tr>
					</tbody>
				
				</table>
			
			
			
			</div>

		

	
		
			</div>
			</div>
			</div>



    <!-- Bootstrap core JavaScript -->
    <script src="jquery/jquery.min.js"></script>
    <script src="bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="jquery/bootstrap.min.js"></script>

  </body>

</html>

