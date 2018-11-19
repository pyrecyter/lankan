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

import com.service.LoginDao;


/**
 * Servlet implementation class LogCheck
 */
@WebServlet("/LogCheck")
public class LogCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogCheck() {
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
	          
	    String Email=request.getParameter("Email");  
	    String Password=request.getParameter("Password");
	    
	          
	    HttpSession session = request.getSession();
	   
	    	
	     if(LoginDao.validate(Email, Password)) {
	    	 out.println("<script type=\"text/javascript\">");  
	    	 out.println("alert('deadbeef');");
	    	 out.println("location = 'Login.jsp';");
	    	 out.println("</script>");
	    	session.setAttribute("Email",Email);
	    	request.getRequestDispatcher("Home.jsp").include(request, response);  
	    	response.sendRedirect("Home.jsp");
	    	
	    }else{
	    	session.setAttribute("log",1);
	        response.sendRedirect("Login.jsp");
	       
	    }  
	     
	    out.close();  
	 
	    }  
		
	}


