package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.CameraVo;

import myutil.DB;

import myutil.*;
import vo.*;

public class Category_Camera
{
	public static ArrayList<CameraVo> getAllCategories()
	{
		ArrayList<CameraVo> catList = new ArrayList<CameraVo>();
		ResultSet rs = null;
		String sqlQuery = "select * from category_details";

		rs = DB.readFromDB(sqlQuery);
		try
		{
			while (rs.next())
			{
				CameraVo objcatvo = new CameraVo();
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
	
	
	public static ArrayList getCameraDetails(String search,String category){
		ArrayList details = new ArrayList();
		String tbl_name=null;
		ResultSet resultSet = null;
		String query = "select tbl_name from category_details where category_name = '"+search+"'";
		Connection connection = DB.getConnection();
		resultSet = DB.readFromDB(query, connection);
		try{
			while(resultSet.next())
			{
				tbl_name = resultSet.getString("tbl_name"); 
			}
		}
		catch(Exception e)
		{
			
		}
		ResultSet rs = null;
		String strQuery = "select brand,name,memory,pixel,price,image from camera_details";
		Connection conn = DB.getConnection();
		rs = DB.readFromDB(strQuery, conn);
		try{
			while(rs.next())
			{
				
				String brand = rs.getString("brand");
				String name = rs.getString("name");
				String memory = rs.getString("memory");
				String pixel = rs.getString("pixel");
				//String condition = rs.getString("condition");
				int price = rs.getInt("price");
				String image = rs.getString("image");
				CameraVo catVo = new CameraVo(brand,name,memory,pixel,price,image);
				details.add(catVo);
			}
		}
		catch(Exception ex)
		{
			
		}
		return details;
	}
}
