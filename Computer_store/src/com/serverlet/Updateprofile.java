package com.serverlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import com.service.*;

/**
 * Servlet implementation class Updateprofile
 */
@WebServlet("/Updateprofile")
public class Updateprofile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Updateprofile() {
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
		String first_name = request.getParameter("first_name");
		String last_name = request.getParameter("last_name");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		String mobno = request.getParameter("mobno");
		int intmobo = Integer.parseInt(mobno);
		String pass = request.getParameter("pass");
		Statement statement = null;
		System.out.println(email);
try {
			int i=0;
			Connection con=Connectionprovider.getCon();
			statement = con.createStatement();
			
			PreparedStatement ps =null;
			String sql ="update users set first_name=?,last_name=?,address=?,mobno=?,pass=? where email='"+email+"';";
			ps= con.prepareStatement(sql);
			ps.setString(1,first_name);
			ps.setString(2,last_name);
			ps.setString(3,address);
			ps.setInt(4,intmobo);
			ps.setString(5,pass);
			
			i = ps.executeUpdate();
			
			if (i==0) {
				
				JOptionPane.showMessageDialog(null,"Update Failed ","ERROR",JOptionPane.ERROR_MESSAGE);
			    response.sendRedirect("profileup.jsp");
				
				}else {
					
					JOptionPane.showMessageDialog(null,"Updated","Message",JOptionPane.PLAIN_MESSAGE);
				    response.sendRedirect("home.jsp");
				}
	}catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();

	}}}
