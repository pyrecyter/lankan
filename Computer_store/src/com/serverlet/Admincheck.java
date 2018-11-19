package com.serverlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import com.service.AdminLoginDao;


/**
 * Servlet implementation class Admincheck
 */
@WebServlet("/Admincheck")
public class Admincheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admincheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");  
	    PrintWriter out = response.getWriter();  
	          
	    String Name=request.getParameter("Name");  
	    String Password=request.getParameter("Password");
	    
	          
	    HttpSession session = request.getSession();
	   
	    	
	     if(AdminLoginDao.validate(Name, Password)) {
	    	session.setAttribute("Name",Name);
	    	request.getRequestDispatcher("AdminControl.jsp").include(request, response);  
	    	response.sendRedirect("AdminControl.jsp");
	    	
	    }
	    		    
	    else{  
	    	session.setAttribute("logad",1);
	        response.sendRedirect("Admin.jsp");
	       
	    }  
	          
	    out.close();  
	    }  

}
