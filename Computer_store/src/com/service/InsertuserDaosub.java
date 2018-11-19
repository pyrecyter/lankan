package com.service;


import java.sql.*;

import com.model.User;

public class InsertuserDaosub implements InsertuserDao {

	
	public int insertuser(User U1) {
		int status=0;
		try{  
			Connection con=Connectionprovider.getCon();  
			PreparedStatement ps=con.prepareStatement("insert into member(Name,Address,Mobile,Birthday,Email,Password)values(?,?,?,?,?,?)");  
			ps.setString(1,U1.getname());  
			ps.setString(2,U1.getaddress());
			ps.setString(3,U1.getmobno());
			ps.setString(4,U1.getbday());
			ps.setString(5,U1.getemail());
			ps.setString(6,U1.getpassword());
			  
						              
			status=ps.executeUpdate(); 
			
		}  
			catch(Exception e){
				System.out.println(e.getMessage());
				
			}
		 return status;
	}	      
			
	}


