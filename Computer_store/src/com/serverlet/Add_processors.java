package com.serverlet;

import java.io.File;
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
 * Servlet implementation class Upload_processors
 */
@WebServlet("/Add_processors")
@MultipartConfig(maxFileSize = 16177216)		//up up 16mb
public class Add_processors extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Add_processors() {
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
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String Name = request.getParameter("Name");
		String Content = request.getParameter("Content");
		String Price = request.getParameter("Price");
		Part part  = request.getPart("Image");
		String Type = request.getParameter("Type");
		

		String fileName = extractFileName(part);

		String savePath = "C:\\Users\\Sachira Nuwanga\\ITP\\Lankan\\Computer_store\\WebContent\\images\\Processors" + File.separator +fileName;

		File fileSaveDir = new File(savePath);
		
		
		part.write(savePath + File.separator);
		
		

		Connection con=Connectionprovider.getCon();
		try {
			PreparedStatement ps=con.prepareStatement("insert into processors (Name,Content,Price,Image,Type,fileName) values (?,?,?,?,?,?)");
			
			
			
			ps.setString(1,Name);
			ps.setString(2,Content );
			ps.setString(3,Price);
			ps.setString(4,savePath);
			ps.setString(5, Type);
			ps.setString(6, fileName);
			
			ps.executeUpdate();
			
				out.println("Processors Item added succesfull");
			
		
		
		} catch (SQLException e) {
			
			out.print(e);
			e.printStackTrace();
		}
	
}

	//This method will print the file name.
private String extractFileName(Part part) {
    String contentDisp = part.getHeader("content-disposition");
    String[] items = contentDisp.split(";");
    for (String s : items) {
        if (s.trim().startsWith("filename")) {
            return s.substring(s.lastIndexOf("\\") + 2, s.length() - 1);
        }
    }
    return "";
}
}

