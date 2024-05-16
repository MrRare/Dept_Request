package com.database;

import java.sql.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;

public class DbClass {

	public static Connection takeConnection()
	{
		Connection con = null;
		try
		{
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBMS", "root", "harrypotter97");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return con;
	}
	
	public static int insertUserData(String name,String pass,String department)
	{
		int status = 0;
		try
		{
			Connection con = takeConnection();
			String query = "insert into user(name,password,department) values(?,?,?)";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, name);
			ps.setString(2, pass);
			ps.setString(3, department);


			status = ps.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return status;
	}
	public static int insertReqData(int Sno,String name,String desp,String reqBy,String department)
	{
		int status = 0;
		try
		{
			Connection con = takeConnection();
			String query = "insert into management(Sno,Title,Description,RequestBy,RequestTime,Department,ApprovalDate,ApprovalBy,Status) values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, Sno);
			ps.setString(2, name);
			ps.setString(3, desp);
			ps.setString(4, reqBy);
			LocalDateTime currentTime = LocalDateTime.now();
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	        String formattedTime = currentTime.format(formatter);
			ps.setString(5, formattedTime);
			ps.setString(6, department);
			ps.setString(7, null);
			ps.setString(8, null);
			ps.setString(9, "Not Approved");


			status = ps.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return status;
	}
	public static String checkUserData(String name, String pass) {
	    String status = "";
	    try {
	        Connection con = takeConnection();
	        String query = "SELECT * FROM user WHERE name=? AND password=?";
	        PreparedStatement ps = con.prepareStatement(query);
	        ps.setString(1, name);
	        ps.setString(2, pass);

	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	        	status= rs.getString(3);
	           
	        } else {
	            status= null;
	        }
	        
	       
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return status;
	   
	}
	public static int approve(String ans,String username,int Sno) {
		Connection con = DbClass.takeConnection();
        String query = "UPDATE management SET Status = ?, ApprovalDate = CURRENT_DATE(), ApprovalBy = ?  WHERE Sno = ?";
        PreparedStatement ps;
        int ru=0;
		try {
			ps = con.prepareStatement(query);
			 ps.setString(1, ans);
			 ps.setString(2, username); 
		      ps.setInt(3, Sno);
		     
		         ru = ps.executeUpdate();
		     
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return ru;
		
       
	   
	}

	
	
}













