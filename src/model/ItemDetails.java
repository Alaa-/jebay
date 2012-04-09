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
		String sqlQuery = "select * from item_details where item_name like '%" + pdt + "%' and item_category_id=" + "" + getCategory(category) + " and item_mode<>2";
		rs = DB.readFromDB(sqlQuery);
		try
		{
			while (rs.next())
			{
				String item_name = rs.getString("item_name");
				System.out.println("" + item_name);
				int price = rs.getInt("item_price");
				int shipping_charge = rs.getInt("item_shipping_charge");
				String mode = rs.getString("item_mode");
				Map session = ActionContext.getContext().getSession();
				session.put("pdtMode", mode);
				ItemDetailsVo itemVo = new ItemDetailsVo(item_name, price, shipping_charge, mode);
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
		sqlQuery = "insert into item_details (item_name,item_subcategory_id,item_mode,item_price,item_baseprice,item_seller,item_quantity,item_condition,item_endtime,item_shipping_charge)" + " values('" + objitemvo.getItem_name() + "'," + objitemvo.getItem_subcategory_id() + ",'" + objitemvo.getItem_mode() + "'," + objitemvo.getItem_price() + "," + objitemvo.getItem_baseprice() + ",'" + objitemvo.getItem_seller() + "'," + objitemvo.getItem_quantity() + ",'" + objitemvo.getItem_condition()
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
		ArrayList details = new ArrayList();

		ResultSet rs = null;
		String sqlQuery = "select * from item_details where item_name like '%" + pdtName + "%' and item_mode<>2";
		rs = DB.readFromDB(sqlQuery);
		try
		{
			while (rs.next())
			{
				String item_name = rs.getString("item_name");
				System.out.println("" + item_name);
				int price = rs.getInt("item_price");
				int shipping_charge = rs.getInt("item_shipping_charge");
				String mode = rs.getString("item_mode");
				Map session = ActionContext.getContext().getSession();
				session.put("pdtMode", mode);
				ItemDetailsVo itemVo = new ItemDetailsVo(item_name, price, shipping_charge, mode);
				details.add(itemVo);
			}
		}
		catch (Exception e)
		{

		}
		return details;
	}
}
