package controller;

import java.io.IOException; 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TreeSet;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.code.user.CheckDepartment;

import dbConnector.DbConnection;

/**
 * Servlet implementation class CarClassifications
 */
@WebServlet("/CarClassifications")
public class CarClassifications extends HttpServlet {

	String conversion="";
	static Connection con=null;
	
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
		
		String mobile=session.getAttribute("mobile").toString();
		
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
			String new_keyword="";
			for(String word:after_stop_word_remove)
			{
				new_keyword=new_keyword+" "+word;
			}
			
			CheckDepartment cd=new CheckDepartment();
			int dept_id=cd.getDepartmentName(after_stop_word_remove);
			GlobalFunction gf=new GlobalFunction();
			String dd_name="Not_Found";
			if(dept_id==1000)
			{
				dd_name="Not_Found";
				System.out.println("Department Name Not Found");
			}
			else
			{
				dd_name=gf.getDepartmentName(dept_id);
				System.out.println("Department Name "+dd_name);
			}
			
			SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
		    Date date = new Date();
		    String c_date_time=formatter.format(date);
			
			PreparedStatement ps=con.prepareStatement("INSERT INTO `all_request`(`dept_name`, `msg_request`, `user_id`, `c_date_time`) VALUES ('"+dd_name+"','"+keyword+"','"+mobile+"','"+c_date_time+"')");
			int insert=ps.executeUpdate();
			if(insert>0)
			{
				
				String last_keyword=gf.getLastKeywords(dd_name);
				new_keyword=last_keyword+" "+new_keyword;
				
				PreparedStatement ps1=con.prepareStatement("UPDATE `data_bank` SET `keywords`='"+new_keyword+"' WHERE `d_name`='"+dd_name+"'");
				int insert1=ps1.executeUpdate();
				System.out.println("PS 1 "+ps1);
				if(insert1>0)
				{
					System.out.println("Update Data bank ");
				}
				else
				{
					System.out.println("Fail to Update Data bank");
				}
			}				
			
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

