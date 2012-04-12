package ebay;
import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;

import model.PaymentCartModel;
import model.BankDetails;
import model.UserDetailsModel;

public class PaymentCart {

	int cart_id, cart_quantity;
	ArrayList lstBanks = new ArrayList();
	int item_id,quantity;
	String buyer;
	String username;
	ArrayList lstItemDetails = new ArrayList();
	ArrayList lstUserDetails = new ArrayList();
	
	/*public static ArrayList concat(ArrayList first, ArrayList second) 
	{
			first.addAll(second);	
		  return first;
		  
	}*/

	
	
	public String execute()
	{
		System.out.println("cart_id");
		System.out.println("cart_quantity");
		quantity=cart_quantity;
		
		item_id = PaymentCartModel.getItemIdFromCart(cart_id);
		lstBanks = BankDetails.getAllBanks();
		
		Map session=ActionContext.getContext().getSession();
		username = (String)session.get("User");
		session.put("cart_id", cart_id);
		
		lstItemDetails=PaymentCartModel.getItemDetails(item_id);
		lstUserDetails=UserDetailsModel.getUserDetails(username);
		//ArrayList arr = concat(lstItemDetails,lstUserDetails);
		
		return "success";
	}
	
	
/*===================getters and setters==============================*/
	
	public int getCart_id() {
		return cart_id;
	}

	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}

	public int getCart_quantity() {
		return cart_quantity;
	}

	public void setCart_quantity(int cart_quantity) {
		this.cart_quantity = cart_quantity;
	}


	public int getItem_id() {
		return item_id;
	}


	public void setItem_id(int item_id) {
		this.item_id = item_id;
	}


	public String getBuyer() {
		return buyer;
	}


	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}


	public int getQuantity() {
		return quantity;
	}


	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	public ArrayList getLstBanks() {
		return lstBanks;
	}


	public void setLstBanks(ArrayList lstBanks) {
		this.lstBanks = lstBanks;
	}
}

