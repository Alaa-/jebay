package ebay;
import java.util.ArrayList;
import java.util.Map;

import model.BankDetails;
import model.PaymentCartModel;
import model.UserDetailsModel;
import vo.ItemVo;

import com.opensymphony.xwork2.ActionContext;

public class PaymentCart {

	int cart_id, cart_quantity;
	ArrayList lstBanks = new ArrayList();
	int item_id,quantity;
	String buyer;
	String username;
	ArrayList lstItemDetails = new ArrayList();
	ArrayList lstUserDetails = new ArrayList();
	ArrayList<ItemVo> arr=new ArrayList<ItemVo>();
	

	
	
	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public ArrayList getLstItemDetails() {
		return lstItemDetails;
	}


	public void setLstItemDetails(ArrayList lstItemDetails) {
		this.lstItemDetails = lstItemDetails;
	}


	public ArrayList getLstUserDetails() {
		return lstUserDetails;
	}


	public void setLstUserDetails(ArrayList lstUserDetails) {
		this.lstUserDetails = lstUserDetails;
	}


	public ArrayList<ItemVo> getArr() {
		return arr;
	}


	public void setArr(ArrayList<ItemVo> arr) {
		this.arr = arr;
	}


	public String execute()
	{
		System.out.println("cart_id "+cart_id);
		
		quantity=cart_quantity;
		System.out.println("cart_quantity "+quantity);
		item_id = PaymentCartModel.getItemIdFromCart(cart_id);
		lstBanks = BankDetails.getAllBanks();
		int item_price = PaymentCartModel.getPrice(item_id);
		
		Map session=ActionContext.getContext().getSession();
		username = (String)session.get("User");
		String cart_id_string = Integer.toString(cart_id);
		session.put("cart_id", cart_id_string);
		
		
		lstItemDetails=PaymentCartModel.getItemDetails(item_id);
		lstUserDetails=UserDetailsModel.getUserDetails(username);
		
		int item_shipping_charge = PaymentCartModel.getShipping(item_id);
		
		System.out.println("Shipping is "+item_shipping_charge);
		
		int totalprice = (quantity * item_price)+item_shipping_charge;
		String total = Integer.toString(totalprice);
		session.put("totalPrice",total);
		System.out.println("total price shreepriya "+totalprice);
		//ArrayList arr = concat(lstItemDetails,lstUserDetails);
		System.out.println(lstItemDetails.size());
		System.out.println(lstUserDetails.size());
		
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

