package com.code.user;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.GlobalFunction;
import controller.SendSMS;

/**
 * Servlet implementation class UserRegistration
 */
@WebServlet("/UserRegistration")
public class UserRegistration extends HttpServlet {
	  String name,mobile;
		
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
		{
			HttpSession session=request.getSession();
			name=request.getParameter("name");
			mobile=request.getParameter("mobile");
			
			GlobalFunction gf = new GlobalFunction();
			String otp = gf.generateOtp();
			session.setAttribute("otp", otp);
			session.setAttribute("name", name);
			session.setAttribute("mobile", mobile);
			
			System.out.println("OTP is "+otp);
			
		
			SendSMS sms=new SendSMS();
			sms.callURL("Your OTP is " + otp + " for Call Center Voice Clustering",mobile);
			
			response.sendRedirect("UserVerifyOtp.jsp?Result=");
		
		}

	}
