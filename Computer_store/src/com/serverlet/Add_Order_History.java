package com.serverlet;

import java.io.IOException;
import java.io.InputStream;
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

import com.service.Connectionprovider;

/**
 * Servlet implementation class Add_Order_History
 */
@WebServlet("/Add_Order_History")
public class Add_Order_History extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Add_Order_History() {
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
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String email = request.getParameter("email");
		
		Connection con=Connectionprovider.getCon();
		
		try {
			PreparedStatement res=con.prepareStatement("select * from mycart where email=\""+email+"\"");
			ResultSet res2 = res.executeQuery();
			while (res2.next()) {
				PreparedStatement ps=con.prepareStatement("insert into order_history(Product_Name,Quantity,Price,Email) values (?,?,?,?)");
				
				try {
					PreparedStatement ps2=con.prepareStatement("select * from "+res2.getString("prefix")+" where id=\""+res2.getString("itemcode")+"\"");
					ResultSet res5 = ps2.executeQuery();
					while (res5.next()) {
						ps.setString(1,res5.getString("Name"));
						int q=res2.getInt("quantity");
						int p=res5.getInt("Price");
						int tot= q*p;
						ps.setLong(3,tot);
						
					}
					} catch (SQLException e) {
						
						out.print(e);
						e.printStackTrace();
					}
					
				
				ps.setString(2,res2.getString("quantity"));
				ps.setString(4,email);

				
				ps.executeUpdate();
				
				try {
					PreparedStatement del=con.prepareStatement("delete from mycart where email=\""+email+"\"");
					del.executeUpdate();
					
					} catch (SQLException e) {
						
						out.print(e);
						e.printStackTrace();
						
					}
			}
		} catch (SQLException e) {
			
			out.print(e);
			e.printStackTrace();
		}
		response.sendRedirect("OrderHistory.jsp");
	}

}
