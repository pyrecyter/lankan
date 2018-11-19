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
 * Servlet implementation class UpdateQuote
 */
@WebServlet("/UpdateQuote")
public class UpdateQuote extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateQuote() {
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
		String item_name1 = request.getParameter("item_name1");
		String quantity1 = request.getParameter("quantity1");
		String item_name2 = request.getParameter("item_name2");
		String quantity2 = request.getParameter("quantity2");
		String item_name3 = request.getParameter("item_name3");
		String quantity3 = request.getParameter("quantity3");
		String item_name4 = request.getParameter("item_name4");
		String quantity4 = request.getParameter("quantity4");
		String cust_name = request.getParameter("cust_name");
		String email = request.getParameter("email");
		Statement statement = null;
		System.out.println(email);
try {
			int i=0;
			Connection con=Connectionprovider.getCon();
			statement = con.createStatement();
			
			PreparedStatement ps =null;
			String sql ="update quote1 set item_name1=?,quantity1=?,item_name2=?,quantity2=?,item_name3=?,quantity3=?,item_name4=?,quantity4=?cust_name=?,email=? where email='"+email+"';";
			ps= con.prepareStatement(sql);
			ps.setString(1,item_name1);
			ps.setString(2,quantity1);
			ps.setString(1,item_name2);
			ps.setString(2,quantity2);
			ps.setString(1,item_name3);
			ps.setString(2,quantity3);
			ps.setString(1,item_name4);
			ps.setString(2,quantity4);
			ps.setString(3,cust_name);
			ps.setString(4,email);
			
			
			i = ps.executeUpdate();
			
			if (i==0) {
				
				JOptionPane.showMessageDialog(null,"Update Failed ","ERROR",JOptionPane.ERROR_MESSAGE);
			    response.sendRedirect("Quote.jsp");
				
				}else {
					
					JOptionPane.showMessageDialog(null,"Updated","Message",JOptionPane.PLAIN_MESSAGE);
				    response.sendRedirect("home.jsp");
				}
	}catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();

	}}}