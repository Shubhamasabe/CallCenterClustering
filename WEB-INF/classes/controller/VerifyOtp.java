package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbConnector.DbConnection;

/**
 * Servlet implementation class VerifyOtp
 */
@WebServlet("/VerifyOtp")
public class VerifyOtp extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session=request.getSession();
		String mobile=session.getAttribute("mobile").toString();
		String name=session.getAttribute("name").toString();
		String otp=session.getAttribute("otp").toString();
	
		System.out.println("1 "+mobile);
		System.out.println("2 "+name);
		System.out.println("3 "+otp);
		
		
		String u_otp=request.getParameter("otp");
	
		if(otp.equals(u_otp))
		{
			try 
			{
				Connection con=DbConnection.getConnection();
				PreparedStatement ps=con.prepareStatement("INSERT INTO `users_details`(`e_fname`, `mobile`) VALUES ('"+name+"','"+mobile+"')");
				int i=ps.executeUpdate();
				
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			System.out.println("OTP Match Successfully..!");
			response.sendRedirect("UserSignIn.jsp?otp=verify");
		}
		else
		{
			System.out.println("OTP Not Match..! Please try Again..!");
			response.sendRedirect("UserSignIn.jsp?notmatch=notmatch");
		}
		
	}

}
