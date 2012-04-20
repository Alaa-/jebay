package vo;

public class PurchasehistoryVo
{
	String t_seller, item_name, t_buyer, courier_name, t_shipping_address;

	public String getT_shipping_address()
	{
		return t_shipping_address;
	}

	public void setT_shipping_address(String t_shipping_address)
	{
		this.t_shipping_address = t_shipping_address;
	}

	public String getT_buyer()
	{
		return t_buyer;
	}

	public void setT_buyer(String t_buyer)
	{
		this.t_buyer = t_buyer;
	}

	int item_price, item_id, t_status, t_id, courier_shipping_id, t_quantity, item_totalprice, item_shipping_charge;

	public int getItem_shipping_charge()
	{
		return item_shipping_charge;
	}

	public void setItem_shipping_charge(int item_shipping_charge)
	{
		this.item_shipping_charge = item_shipping_charge;
	}

	public int getItem_totalprice()
	{
		return item_totalprice;
	}

	public void setItem_totalprice(int item_totalprice)
	{
		this.item_totalprice = item_totalprice;
	}

	public int getT_quantity()
	{
		return t_quantity;
	}

	public void setT_quantity(int t_quantity)
	{
		this.t_quantity = t_quantity;
	}

	public String getCourier_name()
	{
		return courier_name;
	}

	public void setCourier_name(String courier_name)
	{
		this.courier_name = courier_name;
	}

	public int getCourier_shipping_id()
	{
		return courier_shipping_id;
	}

	public void setCourier_shipping_id(int courier_shipping_id)
	{
		this.courier_shipping_id = courier_shipping_id;
	}

	public int getT_status()
	{
		return t_status;
	}

	public void setT_status(int t_status)
	{
		this.t_status = t_status;
	}

	public int getT_id()
	{
		return t_id;
	}

	public void setT_id(int t_id)
	{
		this.t_id = t_id;
	}

	String t_timestamp;

	public String getT_seller()
	{
		return t_seller;
	}

	public void setT_seller(String t_seller)
	{
		this.t_seller = t_seller;
	}

	public String getItem_name()
	{
		return item_name;
	}

	public void setItem_name(String item_name)
	{
		this.item_name = item_name;
	}

	public int getItem_price()
	{
		return item_price;
	}

	public void setItem_price(int item_price)
	{
		this.item_price = item_price;
	}

	public int getItem_id()
	{
		return item_id;
	}

	public void setItem_id(int item_id)
	{
		this.item_id = item_id;
	}

	public String getT_timestamp()
	{
		return t_timestamp;
	}

	public void setT_timestamp(String t_timestamp)
	{
		this.t_timestamp = t_timestamp;
	}
}
