package controller;

import java.util.Random;

public class GlobalFunction 
{

	

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
