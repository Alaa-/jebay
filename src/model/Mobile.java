package model;

import myutil.DB;

public class Mobile
{
	public static void saveMobileDetails(int item_id, String brand, String os, String camera, String type)
	{
		String sqlQuery = "insert into mobile_details (mobile_item_id,mobile_brand,mobile_os,mobile_camera,mobile_type) values (" + item_id + ",'" + brand + "','" + os + "','" + camera + "','" + type + "')";
		DB.update(sqlQuery);
	}
}
