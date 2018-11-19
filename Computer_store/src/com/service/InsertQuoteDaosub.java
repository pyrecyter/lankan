package com.service;
import java.sql.*;

import com.model.Quote;
public class InsertQuoteDaosub implements InsertQuoteDao {

	public int insertQuote(Quote Q1) {
		int status=0;
		try{  
			Connection con=Connectionprovider.getCon();  
			PreparedStatement ps=con.prepareStatement("insert into quote1(itemname1,quantity1,itemname2,quantity2,itemname3,quantity3,itemname4,quantity4,name,email)values(?,?,?,?,?,?,?,?,?,?)");  
			  
			ps.setString(1,Q1.getitemname1());
			ps.setString(2,Q1.getquantity1());
			ps.setString(3,Q1.getitemname2());
			ps.setString(4,Q1.getquantity2());
			ps.setString(5,Q1.getitemname3());
			ps.setString(6,Q1.getquantity3());
			ps.setString(7,Q1.getitemname4());
			ps.setString(8,Q1.getquantity4());
			ps.setString(9,Q1.getcustname());
			ps.setString(10,Q1.getemail());
			status=ps.executeUpdate(); 
			
		}  
			catch(Exception e){
				System.out.println(e.getMessage());
				
			}
		 return status;
	}	      
			


}
