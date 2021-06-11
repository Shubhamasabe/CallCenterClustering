package com.code.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;
import java.util.TreeSet;

import dbConnector.DbConnection;

public class CheckDepartment 
{
	Connection con=DbConnection.getConnection();
	
	public int getDepartmentName(TreeSet<String> after_stop_word_remove)
	{
		int l_value=0;
		try 
		{
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `data_bank`");
			ResultSet rs=ps.executeQuery();
			int match_count=0;
			TreeMap<Integer, Integer> rsl=new TreeMap<>();
			while(rs.next())
			{
				String keywords=rs.getString("keywords").toLowerCase();
				String[] db_key_array=keywords.split(" ");
				for(String word:after_stop_word_remove)
				{
					word=word.trim();
					for(String db_ke:db_key_array)
					{
						db_ke=db_ke.trim();
					//	System.out.println(word+" -- "+db_ke);
						if(word.equals(db_ke))
						{
							++match_count;
						}
					}
				}
				rsl.put(match_count,rs.getInt(1));
				match_count=0;
			}
			
			TreeMap<Integer, Integer> sorted_result = CheckDepartment.sortbykey(rsl);
			
			System.out.println("Final Result is "+sorted_result.size());
			int sz=sorted_result.size();
			if(sz==1)
			{
				System.out.println("Not Found ");
				l_value=1000; //set for not found
			}
			else
			{
				int l_key=sorted_result.lastKey();
			
				l_value=sorted_result.get(l_key);
				//System.out.println("Department Found "+l_value);
			}
		} catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
		return l_value;
		
	}
	public static TreeMap<Integer, Integer> sortbykey(TreeMap<Integer, Integer> map)
    {
		TreeMap<Integer, Integer> result = new TreeMap<>();
		// TreeMap to store values of HashMap
        TreeMap<Integer, Integer> sorted = new TreeMap<>();
 
        // Copy all data from hashMap into TreeMap
        sorted.putAll(map);
 
        // Display the TreeMap which is naturally sorted
        for (Map.Entry<Integer, Integer> entry : sorted.entrySet())
        {
            System.out.println("Key = " + entry.getKey() + ", Value = " + entry.getValue());
        	result.put(entry.getKey(), entry.getValue());
        }	
        
        return result;
    }

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
