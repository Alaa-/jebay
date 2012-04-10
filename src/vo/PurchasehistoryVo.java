package vo;

public class PurchasehistoryVo
{
	String t_seller, item_name, t_buyer;

	public String getT_buyer()
	{
		return t_buyer;
	}

	public void setT_buyer(String t_buyer)
	{
		this.t_buyer = t_buyer;
	}

	int item_price, item_id;
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
