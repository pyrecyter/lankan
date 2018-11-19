package com.serverlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.RepairReqFormClass;
import com.service.RepairReqFormDao;
import com.service.RepairReqFormDaoI;


@WebServlet("/RepairReqFormServlet")
public class RepairReqFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RepairReqFormServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		
			RepairReqFormClass R=new RepairReqFormClass();
			
			R.setName(request.getParameter("name"));
			R.setEmail(request.getParameter("email"));
			R.setContactNumber(request.getParameter("Cnumber"));
			R.setOrderNumber(request.getParameter("Onumber"));
			R.setReasonForRepair(request.getParameter("reason"));
			R.setPriority(request.getParameter("priority"));
			R.setComments(request.getParameter("comment"));
			R.setDate(request.getParameter("date"));
			
			RepairReqFormDaoI RRFD = new RepairReqFormDao();
			
			int r=RRFD.insertRepairReq(R);
			
			
			try {
				if (r==0) {
					response.sendRedirect("DisplayRepairReqClient.jsp");
					
					}else {
						response.sendRedirect("DisplayRepairReqClient.jsp");
					}}
				catch(Exception e) {
						e.printStackTrace();
					}
			
			
	}

}
