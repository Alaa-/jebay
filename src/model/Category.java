package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import myutil.*;
import vo.*;

public class Category
{
	public static ArrayList<CategoryVo> getAllCategories()
	{
		ArrayList<CategoryVo> catList = new ArrayList<CategoryVo>();
		ResultSet rs = null;
		String sqlQuery = "select * from category_details";

		rs = DB.readFromDB(sqlQuery);
		try
		{
			while (rs.next())
			{
				CategoryVo objcatvo = new CategoryVo();
				objcatvo.setCategory_id(rs.getInt("category_id"));
				objcatvo.setCategory_name(rs.getString("category_name"));
				catList.add(objcatvo);
			}
			return catList;
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

	public static ArrayList<CategoryVo> getAllCategoriesSubCategories()
	{
		ArrayList<CategoryVo> catList = new ArrayList<CategoryVo>();
		ResultSet rs = null;
		String sqlQuery = "select * from category_details";

		rs = DB.readFromDB(sqlQuery);
		try
		{
			while (rs.next())
			{
				CategoryVo objcatvo = new CategoryVo();
				objcatvo.setCategory_id(rs.getInt("category_id"));
				objcatvo.setCategory_name(rs.getString("category_name"));
				objcatvo.setSubcatlist(SubCategory.getAllSubCategoriesByCategoryId(rs.getInt("category_id")));
				System.out.println(objcatvo.getSubcatlist().size() + " is the size of subcat list returned");
				catList.add(objcatvo);
			}
			return catList;
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
