package com.helper;

import java.net.URL;
import java.util.Random;

import javax.net.ssl.HttpsURLConnection;


public class OtpGenerator {

	public String generateOtp() {
		Random random = new Random();
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < 6; i++) {
			sb.append(random.nextInt(10));
		}
		String otp= sb.toString();
		return otp;
	}
	
	public void sendOtp(String otp,String number) {
		try {
			
			String myUrl = "https://www.fast2sms.com/dev/bulkV2?authorization=SOMIFfPiBevam8gWTx4DL3jyZlKVhQdCc1NH6XbRtnw7U2uA0GFroVPpqZnJONyXiR4szDMkB8wleW5I&variables_values="+otp+"&route=otp&numbers="+number; 		
			URL url = new URL(myUrl); 
			HttpsURLConnection connection = (HttpsURLConnection)url.openConnection();
			connection.setRequestMethod("GET");
			int responseCode = connection.getResponseCode();
			System.out.println(responseCode);
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
}
