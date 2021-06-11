package com.code.admin;

import java.io.IOException; 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import controller.GlobalFunction;
import controller.SendSMS;
import dbConnector.DbConnection;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet 
{
	static Connection con;
	
	public void init(ServletConfig config) throws ServletException 
	{
		try 
		{
			con=DbConnection.getConnection();
		} 
		catch (Exception e) 
		{
			System.out.println("Exception "+e);
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();

		try 
		{
			
			PreparedStatement ps1 = con.prepareStatement("SELECT * FROM `admin_details` where username='"+ email + "' AND password='" + password + "'");
			ResultSet rs = ps1.executeQuery();
			if (rs.next()) 
			{
				
				session.setAttribute("email", email);
				System.out.println("Login Done");
				response.sendRedirect("AdminHome.jsp?login=done");
			}
			else 
			{
				System.out.println("Login fail");
				response.sendRedirect("AdminSignIn.jsp?login=fail");
			}
		}
		catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
	}

}
