package com.serverlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.Connectionprovider;

/**
 * Servlet implementation class item_quantity
 */
@WebServlet("/quo_quantity")
public class quo_quantity extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public quo_quantity() {
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
		
		String id= request.getParameter("id");
		String type = request.getParameter("type");
		Connection con=Connectionprovider.getCon();
		if(type.matches("add")) {
		try {
			PreparedStatement res=con.prepareStatement("update quotation set quantity = quantity+1 where id =?");
			res.setString(1, id);
			res.executeUpdate();
		} catch (SQLException e) {
			
			out.print(e);
			e.printStackTrace();
		}}else {
			try {
				PreparedStatement res=con.prepareStatement("update quotation set quantity = quantity-1 where id =?");
				res.setString(1, id);
				res.executeUpdate();
			} catch (SQLException e) {
				
				out.print(e);
				e.printStackTrace();
		} }
		
		response.sendRedirect("Quotation.jsp");
	}
}
