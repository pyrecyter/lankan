package com.serverlet;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.swing.JOptionPane;

import com.model.User;
import com.service.InsertuserDao;
import com.service.InsertuserDaosub;

/**
 * Servlet implementation class Add_Member
 */
@WebServlet("/Add_Member")
public class Add_Member extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Add_Member() {
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
		User U=new User();
		
		
		U.setname(request.getParameter("Name"));
		U.setaddress(request.getParameter("Address"));
		U.setemail(request.getParameter("Email"));
		U.setbday(request.getParameter("Bday"));
		U.setmobno(request.getParameter("Mobile"));
		U.setpassword(request.getParameter("Password"));
		
		
		
		
		InsertuserDao W=new InsertuserDaosub();
		int r=W.insertuser(U);
		
		if (r==0) {
		
		JOptionPane.showMessageDialog(null,"You have not Sucessfully Registered ","ERROR",JOptionPane.ERROR_MESSAGE);
	    response.sendRedirect("Register.jsp");
		
		}else {
			
			JOptionPane.showMessageDialog(null,"Registered Successfully","Message",JOptionPane.PLAIN_MESSAGE);
		    response.sendRedirect("Login.jsp");
		}
		
		
		


		
	}
		
	}


