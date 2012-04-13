package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

import vo.ItemDetailsVo;
import vo.ItemVo;
import myutil.DB;

public class ItemDetails
{

	public static ArrayList getDetails(String pdt, String category)
	{
		ArrayList details = new ArrayList();
		ResultSet rs = null;
		String mode=null;
		String sqlQuery = "select * from item_details where item_name like '%" + pdt + "%' and " +
				"item_category_id=" + "" + getCategory(category) + " and item_mode=1 " +
						"and item_quantity>0 and datediff(item_endtime,now())>0";
		rs = DB.readFromDB(sqlQuery);
		try
		{
			while (rs.next())
			{
				String item_name = rs.getString("item_name");
				System.out.println("" + item_name);
				int price = rs.getInt("item_price");
				int shipping_charge = rs.getInt("item_shipping_charge");
				String mod = rs.getString("item_mode");
				String image = rs.getString("item_image");
				int item_id = rs.getInt("item_id");
				if(mod.equals("1"))
					mode="Bid Now";
				Map session = ActionContext.getContext().getSession();
				session.put("pdtMode", mode);
				ItemDetailsVo itemVo = new ItemDetailsVo(item_name, price, shipping_charge, mode,item_id,image);
				details.add(itemVo);
			}
		}
		catch (Exception e)
		{

		}

		return details;
	}

	
	public static ArrayList getNameBuyDetails(String pdt, String category)
	{
		ArrayList details = new ArrayList();
		ResultSet rs = null;
		String mode=null;
		String sqlQuery = "select * from item_details where item_name like '%" + pdt + "%' and " +
				"item_category_id=" + "" + getCategory(category) + " and item_mode=0 "+
				"and item_quantity>0 and datediff(item_endtime,now())>0";
		rs = DB.readFromDB(sqlQuery);
		try
		{
			while (rs.next())
			{
				String item_name = rs.getString("item_name");
				System.out.println("" + item_name);
				int price = rs.getInt("item_price");
				int shipping_charge = rs.getInt("item_shipping_charge");
				String mod = rs.getString("item_mode");
				String image = rs.getString("item_image");
				int item_id = rs.getInt("item_id");
				if(mod.equals("0"))
					
					mode="Buy Now";
				Map session = ActionContext.getContext().getSession();
				session.put("pdtMode", mode);
				ItemDetailsVo itemVo = new ItemDetailsVo(item_name, price, shipping_charge, mode,item_id,image);
				details.add(itemVo);
			}
		}
		catch (Exception e)
		{

		}

		return details;
	}
	
	public static String getCategory(String category)
	{
		String id = null;
		ResultSet rs = null;
		String sqlQuery = "select category_id from category_details where category_name='" + category + "'";
		rs = DB.readFromDB(sqlQuery);
		try
		{
			if (rs.next())
				id = rs.getString("category_id");
		}
		catch (Exception e)
		{

		}

		return id;
	}

	public static int saveItemDetails(ItemVo objitemvo)
	{

		String sqlQuery;
		Connection conn;
		Statement stmt;
		ResultSet rs = null;
		int newGeneratedItemid = -1;
		conn = DB.getConnection();
		sqlQuery = "insert into item_details (item_name,item_category_id,item_subcategory_id,item_mode,item_price,item_baseprice,item_seller,item_quantity,item_condition,item_endtime,item_shipping_charge)" + " values('" + objitemvo.getItem_name() + "'," + objitemvo.getItem_category_id() + "," + objitemvo.getItem_subcategory_id() + ",'" + objitemvo.getItem_mode() + "'," + objitemvo.getItem_price() + "," + objitemvo.getItem_baseprice() + ",'" + objitemvo.getItem_seller() + "'," + objitemvo.getItem_quantity() + ",'" + objitemvo.getItem_condition()
				+ "',DATE_ADD(now(), Interval " + objitemvo.getItem_endtime() + " day),'" + objitemvo.getItem_shipping_charge() + "')";
		System.out.println(sqlQuery);
		try
		{
			stmt = conn.createStatement();

			System.out.println(sqlQuery);
			stmt.executeUpdate(sqlQuery, Statement.RETURN_GENERATED_KEYS);
			rs = stmt.getGeneratedKeys();
			if (rs.next())
			{
				newGeneratedItemid = rs.getInt(1);
				System.out.println("New generated Item_id is " + newGeneratedItemid);

			}
			else
			{
				System.out.println("no key generated");
			}
		}
		catch (Exception ex)
		{
			System.out.println("no key generated");
			ex.getStackTrace();
		}
		finally
		{
			DB.close(rs);
			DB.close(conn);
		}

		return newGeneratedItemid;

	}

	public static ArrayList getAllCategoryDetails(String pdtName)
	{
		ArrayList biddetails = new ArrayList();

		ResultSet rs = null;
		String mode=null;
		String sqlQuery = "select * from item_details where item_name like '%" + pdtName + "%' and item_mode=1 "+
				"and item_quantity>0 and datediff(item_endtime,now())>0";
		rs = DB.readFromDB(sqlQuery);
		try
		{
			while (rs.next())
			{
				String item_name = rs.getString("item_name");
				System.out.println("" + item_name);
				int price = rs.getInt("item_price");
				int item_id=rs.getInt("item_id");
				int shipping_charge = rs.getInt("item_shipping_charge");
				String image = rs.getString("item_image");
				String mod = rs.getString("item_mode");
				if(mod.equals("1"))
					mode="Bid Now";
				Map session = ActionContext.getContext().getSession();
				session.put("pdtMode", mode);
				ItemDetailsVo itemVo = new ItemDetailsVo(item_name, price, shipping_charge, mode,item_id,image);
				biddetails.add(itemVo);
			}
		}
		catch (Exception e)
		{

		}
		return biddetails;
	}
	
	public static ArrayList getBuyPdtDetails(String pdtName)
	{
		ArrayList buydetails = new ArrayList();

		ResultSet rs = null;
		String mode=null;
		String sqlQuery = "select * from item_details where item_name like '%" + pdtName + "%' and item_mode=0 "+
				"and item_quantity>0 and datediff(item_endtime,now())>0";
		rs = DB.readFromDB(sqlQuery);
		try
		{
			while (rs.next())
			{
				String item_name = rs.getString("item_name");
				System.out.println("" + item_name);
				int price = rs.getInt("item_price");
				int item_id=rs.getInt("item_id");
				int shipping_charge = rs.getInt("item_shipping_charge");
				String image = rs.getString("item_image");
				String mod = rs.getString("item_mode");
				if(mod.equals("0"))
					mode="Buy Now";
				Map session = ActionContext.getContext().getSession();
				session.put("pdtMode", mode);
				ItemDetailsVo itemVo = new ItemDetailsVo(item_name, price, shipping_charge, mode,item_id,image);
				buydetails.add(itemVo);
			}
		}
		catch (Exception e)
		{

		}
		return buydetails;
	}
	
	public static String getItemName(int itemId)
	{
		String item=null;
		return item;
	}
	
	public static int getItemPrice(int itemId)
	{
		int price = 0;
		return price;
	}
	
	public static ArrayList getCatPdtDetails(int catid)
	{
		ArrayList details = new ArrayList();
		ResultSet rs = null;
		String mode=null;
		String sqlQuery = "select * from item_details where item_category_id ="+catid+" and item_mode=1 "+
				"and item_quantity>0 and datediff(item_endtime,now())>0";
		rs = DB.readFromDB(sqlQuery);
		try
		{
			while (rs.next())
			{
				String item_name = rs.getString("item_name");
				System.out.println("" + item_name);
				int price = rs.getInt("item_price");
				int shipping_charge = rs.getInt("item_shipping_charge");
				String mod = rs.getString("item_mode");
				String image = rs.getString("item_image");
				int item_id = rs.getInt("item_id");
				if(mod.equals("1"))
					mode="Bid Now";
				Map session = ActionContext.getContext().getSession();
				session.put("pdtMode", mode);
				ItemDetailsVo itemVo = new ItemDetailsVo(item_name, price, shipping_charge, mode,item_id,image);
				details.add(itemVo);
			}
		}
		catch(Exception ex)
		{
			
		}
		return details;
		
	}
	
	
	public static ArrayList getCatPdtBuyDetails(int catid)
	{
		ArrayList details = new ArrayList();
		ResultSet rs = null;
		String mode=null;
		String sqlQuery = "select * from item_details where item_category_id ="+catid+" and item_mode=0 "+
				"and item_quantity>0 and datediff(item_endtime,now())>0";
		rs = DB.readFromDB(sqlQuery);
		try
		{
			while (rs.next())
			{
				String item_name = rs.getString("item_name");
				System.out.println("" + item_name);
				int price = rs.getInt("item_price");
				int shipping_charge = rs.getInt("item_shipping_charge");
				String mod = rs.getString("item_mode");
				String image = rs.getString("item_image");
				int item_id = rs.getInt("item_id");
				if(mod.equals("0"))
					mode="Buy Now";
				Map session = ActionContext.getContext().getSession();
				session.put("pdtMode", mode);
				ItemDetailsVo itemVo = new ItemDetailsVo(item_name, price, shipping_charge, mode,item_id,image);
				details.add(itemVo);
			}
		}
		catch(Exception ex)
		{
			
		}
		return details;
	}
	
	public static String getSellerItem(int item_id)
	{
		String seller=null;
		ResultSet rs = null;
		String sqlQuery = "select item_seller from item_details where item_id ="+item_id;
		rs = DB.readFromDB(sqlQuery);
		try
		{
			if (rs.next())
			{
				seller = rs.getString("item_seller");
			}
		}
		catch(Exception e){}
		ItemDetailsVo itVo = new ItemDetailsVo(seller);
		return seller;
	}
}
