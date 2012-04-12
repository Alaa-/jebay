package model;

import java.sql.ResultSet;
import java.util.ArrayList;

import vo.PaymentCartVo;

import myutil.DB;


public class PaymentCartModel {
	public static int getItemIdFromCart(int cart_id)
	{
		int item_id = 0;
		
		ResultSet rs = null;
		String sqlQuery = "select cart_item_id from cart_details where cart_id ="+cart_id;
		rs = DB.readFromDB(sqlQuery);
		try
		{
			if (rs.next())
			{
				item_id=rs.getInt("cart_item_id");
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
		int item_price,item_shipping_charge;
		
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
				System.out.println(item_id);	
				PaymentCartVo pvo = new PaymentCartVo(item_name,item_seller,item_price,item_shipping_charge);
				lstItemDetails.add(pvo);
			}
		}
		catch(Exception e){}
		return lstItemDetails;
	}
}
