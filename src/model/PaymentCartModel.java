package model;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Map;

import myutil.DB;
import vo.PaymentCartVo;

import com.opensymphony.xwork2.ActionContext;


public class PaymentCartModel {
	static int cart_item_quantity;
	static Map session=ActionContext.getContext().getSession();
	public static int getShipping(int item_id)
	{
		int item_shipping_charge=0;
		
		ResultSet rs = null;
		String sqlQuery = "select item_shipping_charge from item_details where item_id ="+item_id;
		rs = DB.readFromDB(sqlQuery);
		try
		{
			if (rs.next())
			{
				item_shipping_charge=rs.getInt("item_shipping_charge");
				System.out.println(item_shipping_charge);	
			}
		}
		catch(Exception e){}
		
		return item_shipping_charge;
	}
	public static int getItemIdFromCart(int cart_id)
	{
		int item_id = 0;
	
		ResultSet rs = null;
		String sqlQuery = "select cart_item_id,cart_quantity from cart_details where cart_id ="+cart_id;
		rs = DB.readFromDB(sqlQuery);
		try
		{
			if (rs.next())
			{
				item_id=rs.getInt("cart_item_id");
				System.out.println(item_id+"siva");
				cart_item_quantity=rs.getInt("cart_quantity");
			
			session.put("cart_quantity",cart_item_quantity);
				System.out.println(item_id);	
			}
		}
		catch(Exception e){}
		return item_id;
	}

	public static ArrayList getItemDetails(int item_id)
	{
		ArrayList lstItemDetails = new ArrayList();
		String item_name,item_seller;
		int item_price,item_shipping_charge,itemid;
		
		ResultSet rs = null;
		String sqlQuery = "select * from item_details where item_id ="+item_id;
		rs = DB.readFromDB(sqlQuery);
		try
		{
			if (rs.next())
			{
				item_name=rs.getString("item_name");
				item_seller=rs.getString("item_seller");
				item_price=rs.getInt("item_price");
				
				item_shipping_charge=rs.getInt("item_shipping_charge");
				itemid=item_id;
				System.out.println(item_id);	
				PaymentCartVo pvo = new PaymentCartVo(item_name,item_seller,item_price,item_shipping_charge,itemid);
				lstItemDetails.add(pvo);
			}
		}
		catch(Exception e){}
		return lstItemDetails;
	}

public static int getPrice(int item_id)
{
	int item_price=0;
	ResultSet rs = null;
	String sqlQuery = "select item_price from item_details where item_id ="+item_id;
	rs = DB.readFromDB(sqlQuery);
	try
	{
		if (rs.next())
		{
			item_price=rs.getInt("item_price");
			System.out.println(item_price);	
			session.put("item_price",item_price);
		}
	}
	catch(Exception e){}
	return item_price;
}
}
