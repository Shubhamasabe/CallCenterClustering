package dbConnector;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DbConnection {
PreparedStatement pst=null;
ResultSet rs=null;
private static Connection con;
String query=null;
public DbConnection() throws ClassNotFoundException, SQLException 
{
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/callcenter","root","");
}

public static Connection getConnection()
{
	Connection con = null;
	try 
	{
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/callcenter", "root", "");
		return con;
	} catch (Exception e) {
		// handle exception
		System.out.println("Exception is " + e);

	}
	return con;
}



public int inupdelOperation(String param) throws SQLException
{
	query=param;
	pst=con.prepareStatement(query);
	int result=pst.executeUpdate();
	return result;
}

public ResultSet selectOperation(String param) throws SQLException
{
	query=param;
	//System.out.println(query);
	pst=con.prepareStatement(query);
	rs=pst.executeQuery();
	return rs;
}

}
