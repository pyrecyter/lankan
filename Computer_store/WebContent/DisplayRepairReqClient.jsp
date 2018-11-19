<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<%@ page import="java.sql.*" %>



<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Display Repair Request Client</title>
<link rel="stylesheet" href="bootstrap/css/style.css">
 <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
 <link href="bootstrap/css/DisplayRepairReqCss.css" rel="stylesheet">
</head>
<%
	if((session.getAttribute("Email") == null)){
		response.sendRedirect("Login.jsp");
	}
%>
<body background="images/register.jpg">
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

  <%@ include file="navigationbar.jsp"%>



	<br />
	<br />
	<br />
	<br />
	<br />

        <TABLE BORDER="1">
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
                <TH>ACTION</TH>
                <TH>ACTION</TH>
                
            </TR>
            
               <%try{
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/lankan", "root", "root");

            Statement statement = connection.createStatement() ;
            
            String email= (String)session.getAttribute("Email");
            String sql ="select * from repair_req_tab where email='"+email+"'";
            ResultSet resultSet = statement.executeQuery(sql);
            while(resultSet.next()){ %>
            <TR>
               
                <TD><%= resultSet.getString("name") %></td>
                <TD> <%= resultSet.getString("email") %></TD>
                <TD> <%= resultSet.getString("contactNum") %></TD>
                <TD> <%= resultSet.getString("orderNum") %></TD>
                <TD> <%= resultSet.getString("Reason") %></TD>
                <TD> <%= resultSet.getString("Priority") %></TD>
                <TD> <%= resultSet.getString("Comments") %></TD>
                <TD> <%= resultSet.getString("Date") %></TD>
                <TD> <%= resultSet.getString("repairId")  %></TD>
                <td id="td1"><a href="Delete_RepairReqForm.jsp?repairId=<%=resultSet.getString("repairId") %>"><input type="submit" value="Delete" class="x-button"></a></td>
				<td id="td1"><a href="UpdateRepairReqForm.jsp?repairId=<%=resultSet.getString("repairId") %>"><input type="submit" value="Update" class="x-button"></a></td>
	  
            </TR>
            <% 
            }
        	connection.close();
        	} catch (Exception e) {
        	e.printStackTrace();
        	} %>
        </TABLE>

</body>
</html>