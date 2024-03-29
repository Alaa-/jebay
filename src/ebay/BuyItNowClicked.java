package ebay;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Map;

import model.BankDetails;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;

public class BuyItNowClicked
{
	int item_id, quantity;
	ArrayList<xyz> arr = new ArrayList<xyz>();
	ArrayList lstBanks = new ArrayList();

	public ArrayList getLstBanks()
	{
		return lstBanks;
	}

	public void setLstBanks(ArrayList lstBanks)
	{
		this.lstBanks = lstBanks;
	}

	public ArrayList<xyz> getArr()
	{
		return arr;
	}

	public void setArr(ArrayList<xyz> arr)
	{
		this.arr = arr;
	}

	public int getItem_id()
	{
		return item_id;
	}

	public void setItem_id(int item_id)
	{
		this.item_id = item_id;
	}

	public int getQuantity()
	{
		return quantity;
	}

	public void setQuantity(int quantity)
	{
		this.quantity = quantity;
	}

	public String execute() throws Exception
	{
		lstBanks = BankDetails.getAllBanks();
		Connect c = new Connect();
		String username = ServletActionContext.getRequest().getSession().getAttribute("username").toString();
		ResultSet rs = c.getResult("select * from item_details where item_id='" + item_id + "'");
		while (rs.next())
		{
			xyz x = new xyz();
			x.setItem_name(rs.getString("item_name"));
			x.setItem_price(rs.getInt("item_price"));
			x.setItem_total(quantity * rs.getInt("item_price"));
			// change here for shipping policy
			x.setItem_total_shipping(quantity * rs.getInt("item_price") + rs.getInt("item_shipping_charge"));
			x.setItem_seller(rs.getString("item_seller"));
			x.setItem_id(rs.getInt("item_id"));
			x.setQuantity(quantity);
			int q = x.getQuantity();
			System.out.println("finally qty is " + q);
			int tot = x.getItem_total_shipping();
			String total = Integer.toString(tot);
			Map session = ActionContext.getContext().getSession();
			session.put("totalPrice", total);
			x.setItem_shipping_charge(rs.getInt("item_shipping_charge"));
			Connect c1 = new Connect();
			ResultSet rs1 = c.getResult("select * from user_details where user_id='" + username + "'");
			rs1.next();
			x.setUser_home_address(rs1.getString("user_home_address"));
			x.setUser_city(rs1.getString("user_city"));
			x.setUser_name(rs1.getString("user_first_name") + rs1.getString("user_last_name"));
			x.setUser_state(rs1.getString("user_state"));
			// int total=get
			arr.add(x);
		}
		return "success";

	}
}

class xyz
{
	String user_name, user_home_address, user_city, user_state;

	public String getUser_name()
	{
		return user_name;
	}

	public void setUser_name(String user_name)
	{
		this.user_name = user_name;
	}

	public String getUser_home_address()
	{
		return user_home_address;
	}

	public void setUser_home_address(String user_home_address)
	{
		this.user_home_address = user_home_address;
	}

	public String getUser_city()
	{
		return user_city;
	}

	public void setUser_city(String user_city)
	{
		this.user_city = user_city;
	}

	public String getUser_state()
	{
		return user_state;
	}

	public void setUser_state(String user_state)
	{
		this.user_state = user_state;
	}

	public int getTotal()
	{
		return total;
	}

	public void setTotal(int total)
	{
		this.total = total;
	}

	String item_seller, item_name;
	int item_total_shipping;
	int total = getItem_total();

	// Map session=ActionContext.getContext().getSession();
	// session.put("totalPrice",total);

	public int getItem_total_shipping()
	{
		return item_total_shipping;
	}

	public void setItem_total_shipping(int item_total_shipping)
	{
		this.item_total_shipping = item_total_shipping;
	}

	int quantity, item_price, item_total, item_id, item_shipping_charge;

	public int getItem_shipping_charge()
	{
		return item_shipping_charge;
	}

	public void setItem_shipping_charge(int item_shipping_charge)
	{
		this.item_shipping_charge = item_shipping_charge;
	}

	public String getItem_seller()
	{
		return item_seller;
	}

	public void setItem_seller(String item_seller)
	{
		this.item_seller = item_seller;
	}

	public String getItem_name()
	{
		return item_name;
	}

	public void setItem_name(String item_name)
	{
		this.item_name = item_name;
	}

	public int getQuantity()
	{
		return quantity;
	}

	public void setQuantity(int quantity)
	{
		this.quantity = quantity;
	}

	public int getItem_price()
	{
		return item_price;
	}

	public void setItem_price(int item_price)
	{
		this.item_price = item_price;
	}

	public int getItem_total()
	{
		return item_total;
	}

	public void setItem_total(int item_total)
	{
		this.item_total = item_total;
	}

	public int getItem_id()
	{
		return item_id;
	}

	public void setItem_id(int item_id)
	{
		this.item_id = item_id;
	}

}
