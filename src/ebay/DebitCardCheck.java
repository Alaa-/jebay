package ebay;

import java.util.Map;

import model.User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class DebitCardCheck extends ActionSupport{
	
	private String debitcardnumber;
	private String cvv;
	private String holdername;
	
	public String execute(){
		
		System.out.println("holder is"+holdername);
	    String buyer = User.getUserName(holdername);
	    String debitCard = User.getDebitCardNumber(holdername);
	    if(holdername.equals(buyer) && debitcardnumber.equals(debitCard))
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
    
   	
	public String getDebitcardnumber() {
		return debitcardnumber;
	}

	public void setDebitcardnumber(String debitcardnumber) {
		this.debitcardnumber = debitcardnumber;
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
