package ebay;

import java.awt.List;
import java.util.ArrayList;
import java.util.Map;

import model.BankDetails;
import model.ItemDetails;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class PaymentCartMode extends ActionSupport{

	private int item_id;
	private int quantity;
	private String paymentmode;
	private String banks;
	
	public String execute()
	{
		String id = new Integer(item_id).toString();
		String quant = new Integer(quantity).toString();
		Map session=ActionContext.getContext().getSession();
		session.put("item_id", id);
		session.put("qty", quant);
		System.out.println("item id is"+item_id);
		System.out.println("mode is"+paymentmode);
		System.out.println("Qty is "+quantity);	
		String seller = ItemDetails.getSellerItem(item_id);
		System.out.println("seller is "+seller);
		if(paymentmode.equals("1"))
		{   
			return "credit";
		}
		else
		{
			if(paymentmode.equals("2"))
			{
				return "debit";
			}
			
			else{
		    	session.put("bank",banks);
		    	System.out.println("banks is "+banks);
				return "bank";
			}
				
		}
	}
	public String getBanks() {
		return banks;
	}
	public void setBanks(String banks) {
		this.banks = banks;
	}
	public String getPaymentmode() {
		return paymentmode;
	}
	public void setPaymentmode(String paymentmode) {
		this.paymentmode = paymentmode;
	}
	public int getItem_id() {
		return item_id;
	}
	public void setItem_id(int item_id) {
		this.item_id = item_id;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}
