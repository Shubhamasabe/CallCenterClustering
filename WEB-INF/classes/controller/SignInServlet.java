package controller;

import java.io.IOException; 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




import dbConnector.DbConnection;

@WebServlet("/SignInServlet")
public class SignInServlet extends HttpServlet {
    String name,mobile;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session=request.getSession();
		mobile=request.getParameter("mobile");
		
		try
		{
			Connection con=DbConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM `users_details` WHERE mobile='"+mobile+"'");
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				GlobalFunction gf = new GlobalFunction();
				String otp = gf.generateOtp();
				session.setAttribute("otp", otp);
				session.setAttribute("mobile", mobile);
				
				System.out.println("OTP is "+otp);
				
			
				SendSMS sms=new SendSMS();
				//sms.callURL("Your OTP is " + otp + " for Call Center Voice Clustering",mobile);
				
				response.sendRedirect("UserVerifyOtpSignIn.jsp?Result=");
			
			}
			else
			{
				response.sendRedirect("UserSignIn.jsp?not=reg");
			}
			
		}catch(Exception e)
		{
			System.out.println("Ex "+e);
		}
		
		
		
	}

}
