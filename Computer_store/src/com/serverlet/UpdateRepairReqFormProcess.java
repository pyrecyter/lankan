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
 * Servlet implementation class Update_laptop
 */
@WebServlet("/UpdateRepairReqFormProcess")

public class UpdateRepairReqFormProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateRepairReqFormProcess() {
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
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String contactNum = request.getParameter("Cnumber");
		String orderNum = request.getParameter("Onumber");
		String Reason = request.getParameter("reason");
		String Priority = request.getParameter("priority");
		String Comments = request.getParameter("comment");
		String Date = request.getParameter("date");
		String repairId = request.getParameter("Rid");

		
		
			Connection con=Connectionprovider.getCon();
			try {
				PreparedStatement ps=con.prepareStatement("update repair_req_tab set name=?,email=?,contactNum=?,orderNum=?,Reason=?,Priority=?,Comments=?,Date=?,repairId=? where repairId='"+repairId+"';");
				
				
				ps.setString(1,name);
				ps.setString(2,email );
				ps.setString(3,contactNum);
				ps.setString(4,orderNum);
				ps.setString(5, Reason);
				ps.setString(6,Priority);
				ps.setString(7,Comments);
				ps.setString(8,Date);
				ps.setString(9,repairId);
				
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


