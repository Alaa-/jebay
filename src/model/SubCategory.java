package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import myutil.DB;
import vo.*;

public class SubCategory
{
	public static ArrayList<SubCategoryVo> getAllSubCategories()
	{
		ArrayList<SubCategoryVo> subcatList = new ArrayList<SubCategoryVo>();
		ResultSet rs = null;
		String sqlQuery = "select * from subcategory_details";

		rs = DB.readFromDB(sqlQuery);
		try
		{
			while (rs.next())
			{
				SubCategoryVo objcatvo = new SubCategoryVo();
				objcatvo.setSubcategory_id(rs.getInt("subcategory_id"));
				objcatvo.setSubcategory_name(rs.getString("subcategory_name"));
				subcatList.add(objcatvo);
			}
			return subcatList;
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			DB.close(rs);
		}

		return null;

	}

	public static ArrayList<SubCategoryVo> getAllSubCategoriesByCategoryId(int category_id)
	{
		ArrayList<SubCategoryVo> subcatList = new ArrayList<SubCategoryVo>();
		ResultSet rs = null;
		System.out.println("This method is being called with " + category_id);
		String sqlQuery = "select * from subcategory_details where subcategory_category_id=" + category_id;

		rs = DB.readFromDB(sqlQuery);
		try
		{
			while (rs.next())
			{
				SubCategoryVo objcatvo = new SubCategoryVo();
				objcatvo.setSubcategory_id(rs.getInt("Subcategory_id"));
				objcatvo.setSubcategory_name(rs.getString("Subcategory_name"));
				subcatList.add(objcatvo);
			}
			return subcatList;
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			DB.close(rs);
		}

		return null;

	}

	public static ArrayList getBidDetails(int cat_id,int sub_cat_id)
	{
		ArrayList lstDetails = new ArrayList();
		ResultSet rs = null;
		String mode=null;
		System.out.println("This method is being called with " + cat_id+" sub category "+sub_cat_id);
		String sqlQuery = "select * from item_details where item_category_id="+cat_id+" and " +
				"item_subcategory_id="+sub_cat_id+" and item_mode=1 and item_quantity>0 " +
						"and datediff(item_endtime,now())>0";

		rs = DB.readFromDB(sqlQuery);
		try
		{
			while (rs.next())
			{
				String item_name = rs.getString("item_name");
				int price = rs.getInt("item_price");
				int shipping_charge = rs.getInt("item_shipping_charge");
				int item_id = rs.getInt("item_id");
				String image = rs.getString("item_image");
				String mod = rs.getString("item_mode");
				if(mod.equals("1"))
					mode="Bid Now";
				ItemDetailsVo ivo = new ItemDetailsVo(item_name, price, shipping_charge, mode, item_id, image);
				lstDetails.add(ivo);
			}
		}
		catch(Exception e){}
		return lstDetails;
	}
	
	public static ArrayList getBuyDetails(int cat_id,int sub_cat_id)
	{
		ArrayList lstDetails = new ArrayList();
		ResultSet rs = null;
		String mode=null;
		System.out.println("This method is being called with " + cat_id+" sub category "+sub_cat_id);
		String sqlQuery = "select * from item_details where item_category_id="+cat_id+" and " +
				"item_subcategory_id="+sub_cat_id+" and item_mode=0 and item_quantity>0 " +
						"and datediff(item_endtime,now())>0";

		rs = DB.readFromDB(sqlQuery);
		try
		{
			while (rs.next())
			{
				String item_name = rs.getString("item_name");
				int price = rs.getInt("item_price");
				int shipping_charge = rs.getInt("item_shipping_charge");
				int item_id = rs.getInt("item_id");
				String image = rs.getString("item_image");
				String mod = rs.getString("item_mode");
				if(mod.equals("0"))
					mode="Buy Now";
				ItemDetailsVo ivo = new ItemDetailsVo(item_name, price, shipping_charge, mode, item_id, image);
				lstDetails.add(ivo);
			}
		}
		catch(Exception e){}
		return lstDetails;
	}
}
