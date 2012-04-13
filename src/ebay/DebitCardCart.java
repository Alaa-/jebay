package ebay;

import java.util.Map;

import model.Account;
import model.Transaction;
import model.TransactionCart;
import model.User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class DebitCardCart extends ActionSupport{
	
	private String debitcardnumber;
	private String cvv;
	private String holdername;
	int trans_status;
	
	public String execute(){
		
		System.out.println("holder is"+holdername);
		
	    String holder = User.getUserName(holdername);
	    String debitCard = User.getDebitCardNumber(holdername);
	    
	    if(holdername.equals(holder) && debitcardnumber.equals(debitCard))
	    {
	    	Map session=ActionContext.getContext().getSession();
	    	String total=(String)session.get("totalPrice");
	    	int dcnumber = Integer.parseInt(debitcardnumber);
	    	int price = Integer.parseInt(total);
	    	System.out.println("total after is "+total);
	    	String buyer=(String)session.get("User");
	    	String itemid=(String)session.get("item_id");
	    	int item_id=Integer.parseInt(itemid);	    	
	    	String qtyi = (String)session.get("qty");
	    	int qty = Integer.parseInt(qtyi);
	    	int acc = Account.getAccountBuyerDebit(dcnumber);
	    	System.out.println("price after is "+price);
	    	System.out.println("item id in payment "+item_id);
	    	
	    	trans_status = TransactionCart.makePayment(price,buyer,item_id,qty,acc);
	    	
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
