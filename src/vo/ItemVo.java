package vo;

public class ItemVo
{
	int item_id, item_category_id, item_subcategory_id, item_price, item_baseprice, item_quantity, item_shipping_charge, item_total;

	float item_rating;

	public float getItem_rating()
	{
		return item_rating;
	}

	public void setItem_rating(float item_rating)
	{
		this.item_rating = item_rating;
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

	public int getItem_category_id()
	{
		return item_category_id;
	}

	public void setItem_category_id(int item_category_id)
	{
		this.item_category_id = item_category_id;
	}

	public int getItem_subcategory_id()
	{
		return item_subcategory_id;
	}

	public void setItem_subcategory_id(int item_subcategory_id)
	{
		this.item_subcategory_id = item_subcategory_id;
	}

	public int getItem_price()
	{
		return item_price;
	}

	public void setItem_price(int item_price)
	{
		this.item_price = item_price;
	}

	public int getItem_baseprice()
	{
		return item_baseprice;
	}

	public void setItem_baseprice(int item_baseprice)
	{
		this.item_baseprice = item_baseprice;
	}

	public int getItem_quantity()
	{
		return item_quantity;
	}

	public void setItem_quantity(int item_quantity)
	{
		this.item_quantity = item_quantity;
	}

	public int getItem_shipping_charge()
	{
		return item_shipping_charge;
	}

	public void setItem_shipping_charge(int item_shipping_charge)
	{
		this.item_shipping_charge = item_shipping_charge;
	}

	public String getItem_name()
	{
		return item_name;
	}

	public void setItem_name(String item_name)
	{
		this.item_name = item_name;
	}

	public String getItem_mode()
	{
		return item_mode;
	}

	public void setItem_mode(String item_mode)
	{
		this.item_mode = item_mode;
	}

	public String getItem_seller()
	{
		return item_seller;
	}

	public void setItem_seller(String item_seller)
	{
		this.item_seller = item_seller;
	}

	public String getItem_condition()
	{
		return item_condition;
	}

	public void setItem_condition(String item_condition)
	{
		this.item_condition = item_condition;
	}

	public String getItem_endtime()
	{
		return item_endtime;
	}

	public void setItem_endtime(String item_endtime)
	{
		this.item_endtime = item_endtime;
	}

	String item_name, item_mode, item_seller, item_condition, item_endtime;
}
