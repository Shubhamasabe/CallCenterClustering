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
 * Servlet implementation class VerifySignInOTP
 */
@WebServlet("/VerifySignInOTP")
public class VerifySignInOTP extends HttpServlet 
{

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session=request.getSession();
		String mobile=session.getAttribute("mobile").toString();
		String otp=session.getAttribute("otp").toString();
	
		System.out.println("Mobile "+mobile);
		System.out.println("OTP "+otp);
		
		
		String u_otp=request.getParameter("otp");
	
		if(otp.equals(u_otp))
		{
			
			System.out.println("OTP Match Successfully..!");
			response.sendRedirect("userChatbotRegistration.jsp?otp=verify");
		}
		else
		{
			System.out.println("OTP Not Match..! Please try Again..!");
			response.sendRedirect("UserSignIn.jsp?notmatch=otp");
		}
		
	}

}
