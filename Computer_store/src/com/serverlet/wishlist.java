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
 * Servlet implementation class wishlist
 */
@WebServlet("/wishlist")
public class wishlist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public wishlist() {
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
		
		Connection con=Connectionprovider.getCon();
		int count = 0;
		try {
			PreparedStatement res=con.prepareStatement("select * from wishlist where prefix =\""+ prefix +"\" and itemcode=\""+ id +"\" and email=\""+email+"\"");
			ResultSet res2 = res.executeQuery();
			res2.last();
			count = res2.getRow();
			res2.beforeFirst();
		} catch (SQLException e) {
			
			out.print(e);
			e.printStackTrace();
		}
		if(count <=0) {
			try {
				PreparedStatement ps=con.prepareStatement("insert into wishlist(email,itemcode,prefix) values (?,?,?)");
				
				ps.setString(1,email);
				ps.setString(2,id );
				ps.setString(3,prefix);
				
				ps.executeUpdate();
				JOptionPane.showMessageDialog(null, "Item added to WishList","Message",JOptionPane.PLAIN_MESSAGE);
			
			} catch (SQLException e) {
			
				
				out.print(e);
				e.printStackTrace();
			}
			
		
		}else {
			JOptionPane.showMessageDialog(null, "Item already in WishList","Message",JOptionPane.PLAIN_MESSAGE);
		}
		response.sendRedirect(request.getHeader("Referer"));
	}
			
}
