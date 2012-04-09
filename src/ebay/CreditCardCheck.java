package ebay;

import java.util.*;
import java.lang.*;
import model.*;
//import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CreditCardCheck extends ActionSupport{
	
	private String creditcardnumber;
	private String cvv;
	private String holdername;
	
	public String execute(){
		
		System.out.println("holder is"+holdername);
	    String buyer = User.getUserName(holdername);
	    String creditCard = User.getCreditCardNumber(holdername);
	    if(holdername.equals(buyer) && creditcardnumber.equals(creditCard))
	    {
	    	Map session=ActionContext.getContext().getSession();
	    	String total=(String)session.get("totalPrice");
	    	int price = Integer.parseInt(total);
	    	System.out.println("total after is "+total);
	    	
	    	return "success";
	    }
	    	
	    else
	    	return "error";
	    //System.out.println(""+buyer);
		
	}
    
   
    
	public String getCreditcardnumber() {
		return creditcardnumber;
	}
	public void setCreditcardnumber(String creditcardnumber) {
		this.creditcardnumber = creditcardnumber;
	}
	public String getCvv() {
		return cvv;
	}
	public void setCvv(String cvv) {
		this.cvv = cvv;
	}
	public String getHoldername() {
		return holdername;
	}
	public void setHoldername(String holdername) {
		this.holdername = holdername;
	}
	
	
}
