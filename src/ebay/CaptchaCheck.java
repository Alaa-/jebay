package ebay;

public class CaptchaCheck {
	static String captcha="IUNIIE";
		public static void main(String args[]) { 
	    int hash = 5381; 
	   captcha= captcha.toUpperCase(); 
	    for(int i = 0; i <captcha.length(); i++) { 
	        hash = ((hash << 5) + hash) + captcha.charAt(i); 
	    }
	    System.out.println(hash);
	    
	} 
}
