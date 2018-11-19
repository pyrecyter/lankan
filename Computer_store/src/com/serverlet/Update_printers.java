package com.serverlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.service.Connectionprovider;

/**
 * Servlet implementation class Update_processors
 */
@WebServlet("/Update_printers")
@MultipartConfig(maxFileSize = 16177216)		//up up 16mb
public class Update_printers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Update_printers() {
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
	PrintWriter out;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		out = response.getWriter();
		int result  = 0;
		
		String id = request.getParameter("id");
		String Name = request.getParameter("Name");
		String Content = request.getParameter("Content");
		String Price = request.getParameter("Price");
		String Type = request.getParameter("Type");
		
		
		{
			Connection con=Connectionprovider.getCon();
			try {
				PreparedStatement ps=con.prepareStatement("update printers set Name=?,Content=?,Price=?,Type=? where id='"+id+"';");
				
				
				ps.setString(1,Name);
				ps.setString(2,Content );
				ps.setString(3,Price);
				ps.setString(4, Type);
				
				result = ps.executeUpdate();
				if(result > 0) 
				{
					out.println("Updated succesfull");
				}
			
			
			} catch (SQLException e) {
				
				out.print(e);
				e.printStackTrace();
			}
		}
	}
	}

