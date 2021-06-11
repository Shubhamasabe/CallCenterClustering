package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;

import dbConnector.DbConnection;

public class GlobalFunction 
{

	Connection con=DbConnection.getConnection();
	
	public String getDepartmentName(int d_id)
	{
		String result="Not_Found";
		try 
		{
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `data_bank` where id='"+d_id+"'");
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				result=rs.getString("d_name");
			}
		}
		catch (Exception e) 
		{
			System.out.println("Exc in Max get "+e);
		}
		return result;
	}

	public String getLastKeywords(String dd_name)
	{
		String result="Not_Found";
		try 
		{
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `data_bank` where d_name='"+dd_name+"'");
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				result=rs.getString("keywords");
			}
		}
		catch (Exception e) 
		{
			System.out.println("Exc in Max get "+e);
		}
		return result;
	}

	

	public String generateOtp()
	{
		char[] chars = "1234567890".toCharArray();
		StringBuilder sb = new StringBuilder();
		Random random = new Random();
		for (int i = 0; i < 6; i++) 
		{
		    char c = chars[random.nextInt(chars.length)];
		    sb.append(c);
		}
		String output = sb.toString();
		return output;
	}
	
	public static void main(String[] args){ 
	
			
	}
	
	
	
	
	

}
