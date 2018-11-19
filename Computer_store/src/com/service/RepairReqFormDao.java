package com.service;

import com.model.RepairReqFormClass;


import java.sql.Connection;

public class RepairReqFormDao implements RepairReqFormDaoI {

	public int insertRepairReq(RepairReqFormClass R) {
		int status=0;
		
		try {
			
			Connection conn=Connectionprovider.getCon();
			String insertQuery ="insert into repair_req_tab(name,email,contactNum,orderNum,Reason,Priority,Comments,Date) values(?,?,?,?,?,?,?,?)";
					
					
			java.sql.PreparedStatement ps1=conn.prepareStatement(insertQuery);
			ps1.setString(1,R.getName());
			ps1.setString(2,R.getEmail());
			ps1.setString(3,R.getContactNumber());
			ps1.setString(4,R.getOrderNumber());
			ps1.setString(5,R.getReasonForRepair());
			ps1.setString(6,R.getPriority());
			ps1.setString(7,R.getComments());
			ps1.setString(8, R.getDate());
			
			
			System.out.println("connected");
			status=ps1.executeUpdate();
			
			conn.close();
			
		}catch(Exception e) {

		e.printStackTrace();
		}
		
		return status;
	}

}
