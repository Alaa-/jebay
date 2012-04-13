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
	int trans_status;

	//private int item_id;
	public String execute(){
		
		System.out.println("holder is"+holdername);
	    String holder = User.getUserName(holdername);
	    String creditCard = User.getCreditCardNumber(holdername);
	    if(holdername.equals(holder) && creditcardnumber.equals(creditCard))
	    {
	    	Map session=ActionContext.getContext().getSession();
	    	String total=(String)session.get("totalPrice");
	    	int ccnumber = Integer.parseInt(creditcardnumber);
	    	int price = Integer.parseInt(total);
	    	String buyer=(String)session.get("User");
	    	String itemid=(String)session.get("item_id");
	    	int item_id=Integer.parseInt(itemid);	    	
	    	String qtyi = (String)session.get("qty");
	    	int qty = Integer.parseInt(qtyi);
	    	int acc = Account.getAccountBuyerCredit(ccnumber);
	    	System.out.println("price after is "+price);
	    	System.out.println("item id in payment "+item_id);
	    	trans_status = Transaction.makePayment(price,buyer,item_id,qty,acc);
	    	System.out.println("trans_status"+trans_status);
	    	if(trans_status==1)
		    	return "success";
		    else 
		    	return "error";
	    }
	    	
	    else
	    	return "error";
	    //System.out.println(""+buyer);
		
	}
    
   /* 
	public int getItem_id() {
		return item_id;
	}

	public void setItem_id(int item_id) {
		this.item_id = item_id;
	}*/

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
