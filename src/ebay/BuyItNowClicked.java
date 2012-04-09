package ebay;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Map;

import model.BankDetails;

import com.opensymphony.xwork2.ActionContext;
public class BuyItNowClicked {
int item_id,quantity;
ArrayList<xyz> arr=new ArrayList<xyz>();
ArrayList lstBanks = new ArrayList();


public ArrayList getLstBanks() {
	return lstBanks;
}
public void setLstBanks(ArrayList lstBanks) {
	this.lstBanks = lstBanks;
}
public ArrayList<xyz> getArr() {
	return arr;
}
public void setArr(ArrayList<xyz> arr) {
	this.arr = arr;
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
public String execute() throws Exception
{
	lstBanks = BankDetails.getAllBanks();
	Connect c=new Connect();
	ResultSet rs=c.getResult("select * from item_details where item_id='"+item_id+"'");
	while(rs.next()){
		xyz x=new xyz();
		x.setItem_name(rs.getString("item_name"));
		x.setItem_price(rs.getInt("item_price"));
		x.setItem_total(quantity*rs.getInt("item_price"));
		x.setItem_total_shipping(quantity*rs.getInt("item_price")+rs.getInt("item_shipping_charge"));
		x.setItem_seller(rs.getString("item_seller"));
		x.setItem_id(rs.getInt("item_id"));
		x.setQuantity(quantity);
		x.setItem_shipping_charge(rs.getInt("item_shipping_charge"));
		//int total=get
		arr.add(x);
	}
	return "success";
	
}
}
class xyz{
	String item_seller,item_name;int item_total_shipping;
	int total=getItem_total();
	
	//Map session=ActionContext.getContext().getSession();
    //session.put("totalPrice",total);
    
	public int getItem_total_shipping() {
		return item_total_shipping;
	}
	public void setItem_total_shipping(int item_total_shipping) {
		this.item_total_shipping = item_total_shipping;
	}
	int quantity,item_price,item_total,item_id,item_shipping_charge;

	public int getItem_shipping_charge() {
		return item_shipping_charge;
	}
	public void setItem_shipping_charge(int item_shipping_charge) {
		this.item_shipping_charge = item_shipping_charge;
	}
	public String getItem_seller() {
		return item_seller;
	}
	public void setItem_seller(String item_seller) {
		this.item_seller = item_seller;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getItem_price() {
		return item_price;
	}
	public void setItem_price(int item_price) {
		this.item_price = item_price;
	}
	public int getItem_total() {
		return item_total;
	}
	public void setItem_total(int item_total) {
		this.item_total = item_total;
	}
	
	public int getItem_id() {
		return item_id;
	}
	public void setItem_id(int item_id) {
		this.item_id = item_id;
	}

}
