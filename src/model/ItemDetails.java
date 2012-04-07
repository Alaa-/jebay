package model;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

import vo.ItemDetailsVo;
import myutil.DB;

public class ItemDetails {

	public static ArrayList getDetails(String pdt, String category)
	{
		ArrayList details = new ArrayList();
		ResultSet rs = null;
		String sqlQuery = "select * from item_details where item_name like '%"+pdt+"%' and item_category_id=" +
				""+getCategory(category)+" and item_mode<>2";
		rs = DB.readFromDB(sqlQuery);
		try
		{
			while(rs.next()){
				String item_name = rs.getString("item_name");
				System.out.println(""+item_name);
				int price = rs.getInt("item_price");
				int shipping_charge = rs.getInt("item_shipping_charge");
				String mode = rs.getString("item_mode");
				Map session = ActionContext.getContext().getSession();
				session.put("pdtMode",mode);
				ItemDetailsVo itemVo = new ItemDetailsVo(item_name,price,shipping_charge,mode);
				details.add(itemVo);
			}
		}
		catch(Exception e)
		{
			
		}
		
		return details;
	}
	
	public static String getCategory(String category){
		String id=null;
		ResultSet rs = null;
		String sqlQuery = "select category_id from category_details where category_name='"+category+"'";
		rs = DB.readFromDB(sqlQuery);
		try
		{
			if(rs.next())
				id = rs.getString("category_id");
		}
		catch(Exception e)
		{
			
		}
			
		return id;
	}
	
	
	public static ArrayList getAllCategoryDetails(String pdtName)
	{
		ArrayList details=new ArrayList();
		
		ResultSet rs = null;
		String sqlQuery = "select * from item_details where item_name like '%"+pdtName+"%' and item_mode<>2";
		rs = DB.readFromDB(sqlQuery);
		try
		{
			while(rs.next()){
				String item_name = rs.getString("item_name");
				System.out.println(""+item_name);
				int price = rs.getInt("item_price");
				int shipping_charge = rs.getInt("item_shipping_charge");
				String mode = rs.getString("item_mode");
				Map session = ActionContext.getContext().getSession();
				session.put("pdtMode",mode);
				ItemDetailsVo itemVo = new ItemDetailsVo(item_name,price,shipping_charge,mode);
				details.add(itemVo);
			}
		}
		catch(Exception e)
		{
			
		}
		return details;
	}
}

