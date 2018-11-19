package com.service;

import static com.service.Provider.*;


import java.sql.Connection;
import java.sql.DriverManager;

public class Connectionprovider {
	private static Connection con=null;  
	static{  
	try{  
	Class.forName(DRIVER);  
	con=DriverManager.getConnection(CONNECTION_URL,USERNAME,PASSWORD);  
	}catch(Exception e){}  
	}  
	  
	public static Connection getCon(){  
	    return con;  
	}  

}
