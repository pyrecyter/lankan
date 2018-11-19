package com.serverlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.service.Connectionprovider;

/**
 * Servlet implementation class Add_cart
 */
@WebServlet("/Add_cart")
public class Add_cart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Add_cart() {
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
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String email = request.getParameter("email");
		String id = request.getParameter("id");
		String prefix = request.getParameter("prefix");
		int quantity = 1;
		
		
		Connection con=Connectionprovider.getCon();
		int count = 0;
		try {
			PreparedStatement res=con.prepareStatement("select * from mycart where prefix =\""+ prefix +"\" and itemcode=\""+ id +"\" and email=\""+email+"\"");
			ResultSet res2 = res.executeQuery();
			res2.last();
			count = res2.getRow();
			res2.beforeFirst();
		} catch (SQLException e) {
			
			out.print(e);
			e.printStackTrace();
		}
		if(count >0) {
			try {
				PreparedStatement update=con.prepareStatement("update mycart set quantity=quantity + 1 where prefix =\""+ prefix +"\" and itemcode=\""+ id +"\" and email=\""+email+"\"");
				update.executeUpdate();
				JOptionPane.showMessageDialog(null,"Item already exsist, quantity increased","Message",JOptionPane.PLAIN_MESSAGE);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				out.print(e);
			}
			
		}else {
		try {
			PreparedStatement ps=con.prepareStatement("insert into mycart(email,itemcode,prefix,quantity) values (?,?,?,?)");
			
			ps.setString(1,email);
			ps.setString(2,id );
			ps.setString(3,prefix);
			ps.setInt(4,quantity);
			
			ps.executeUpdate();
			JOptionPane.showMessageDialog(null,"Item added to cart","Message",JOptionPane.PLAIN_MESSAGE);
		} catch (SQLException e) {
			
			out.print(e);
			e.printStackTrace();
		}
		}
		
		response.sendRedirect(request.getHeader("Referer"));
	}

}
