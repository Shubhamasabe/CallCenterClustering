package controller;

import java.io.IOException; 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.TreeSet;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbConnector.DbConnection;

/**
 * Servlet implementation class CarClassifications
 */
@WebServlet("/CarClassifications")
public class CarClassifications extends HttpServlet {

	String conversion="";
	Connection con=null;
	
	public void init(ServletConfig config) throws ServletException 
	{
		try
		{
			con=DbConnection.getConnection();
		} catch (Exception  e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session=request.getSession();
		conversion=request.getParameter("conversion");
		System.out.println("Last Conversion "+conversion);
		
		String keyword=request.getParameter("search");
		keyword=keyword.toLowerCase();
		keyword=keyword.trim();
		
		
		
		TreeSet<String> ts=new TreeSet<String>();
		
		//ArrayList<String> dd_id=new ArrayList<>();
		try
		{
			
			ExtractDataAndCreateTokens obj=new ExtractDataAndCreateTokens();
			obj.setData(keyword);
			TreeSet<String> tokens = obj.getTokens();
			
			StopWordsRemoval obj1=new StopWordsRemoval();
			obj1.setTokens(tokens);
			TreeSet<String> after_stop_word_remove = obj1.getTokens();
			System.out.println("------------------------------------------------------------------------");
			System.out.println("After Stopwords Remove "+after_stop_word_remove);
			
			
			
			System.out.println("TS Size is "+ts.size());
			int ii=0;
			String final_rsl="";
			
			final_rsl=final_rsl.trim();
			if(final_rsl.equals(""))
			{
				final_rsl="No Department Found_0";
			}
			
			conversion=conversion+"@"+keyword+"#"+final_rsl;
			
			System.out.println("Final Conversion is "+conversion);
			
			session.setAttribute("questionanswer",conversion);
			
			System.out.println("Size of dd_id "+ts.size());
			
			response.sendRedirect("userChatbotRegistration.jsp");
		
		}
		catch(Exception e)
		{
			System.out.println("Exc "+e);
		}
		

		
	}

}

