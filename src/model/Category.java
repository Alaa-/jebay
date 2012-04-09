package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import ebay.*;
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
	
	public static ArrayList getAllCat()
	{
		ArrayList listCat=new ArrayList();
		try{
		Connect c=new Connect();
		String strQuery="select * from category_details";
		System.out.println(strQuery);
		ResultSet rs=c.getResult(strQuery);
		while(rs.next())
		{
			listCat.add(rs.getString("category_name"));
			//listId.add(rs.getString("sem_id"));
		}
		System.out.println(listCat);
		//System.out.println(listId);
		}
		catch(Exception e){System.out.println(e);}
		return listCat;
		}
}
