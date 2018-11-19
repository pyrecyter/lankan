package com.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDao {

	public static boolean validate(String Email,String Password){  
		boolean status=false;  
		try{  
			Connection con=Connectionprovider.getCon();  
            
			PreparedStatement ps=con.prepareStatement("select * from member where Email=? and Password=?"); 
		ps.setString(1,Email);  
		ps.setString(2,Password);  
		      
		ResultSet rs=ps.executeQuery();  
		status=rs.next();  
		          
		}catch(Exception e){System.out.println(e);}  
		return status;  
		}  
}
