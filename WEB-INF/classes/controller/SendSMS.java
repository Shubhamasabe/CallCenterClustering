package controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.nio.charset.Charset;

public class SendSMS {

	public String callURL(String msgC, String PhoneNumber) throws UnsupportedEncodingException 
	{

		String msg = URLEncoder.encode(msgC, "ISO-8859-1");
		String user = "demo93";
		String password = "demo93";
		String sender = "TSTSMS";
		
		String bb="http://www.global91sms.in/app/smsapi/index.php?key=25CFBBD60D726E&routeid=459&type=text&contacts="+PhoneNumber+"&senderid=SMBSMS&msg="+msg; 
		
		String RURL = bb;//myURL + "?PhoneNumber=" + PhoneNumber + "&Text=" + msg+ "&user=demo93&password=demo93&sender=TSTSMS";
		System.out.println("Requeted URL After:" + RURL);

		StringBuilder sb = new StringBuilder();
		URLConnection urlConn = null;
		InputStreamReader in = null;
		try 
		{
			URL url = new URL(RURL);
			urlConn = url.openConnection();
			if (urlConn != null)
				urlConn.setReadTimeout(60 * 2000);
			if (urlConn != null && urlConn.getInputStream() != null) {
				in = new InputStreamReader(urlConn.getInputStream(),
						Charset.defaultCharset());
				BufferedReader bufferedReader = new BufferedReader(in);
				if (bufferedReader != null) {
					int cp;
					while ((cp = bufferedReader.read()) != -1) {
						sb.append((char) cp);
					}
					bufferedReader.close();
				}
			}
			in.close();
		}
		catch (Exception e) 
		{
		
			System.out.println("Exp "+e);
			
		}

		return sb.toString();
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
