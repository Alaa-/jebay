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

}
