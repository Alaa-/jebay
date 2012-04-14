package model;

import myutil.DB;

public class PaisaMapping
{
	
	public static int getSellerPaisaStatus(String user_id)
	{
		String table="paisapay_mapping";
		String sqlQueryWhere="where seller_id = '"+user_id+"'";
		if(DB.getTMSCount(table,sqlQueryWhere)>0)
		{
			System.out.println("Paisapay mapping will return 1");
			return 1;
		}
		else
		{
			System.out.println("Paisapay mapping will return 0");
			return 0;
		}
	}

	public static void savePaisaMapping(String sellerid,int accid)
	{
		String sqlQuery="insert into paisapay_mapping (seller_id,seller_acc_id) values ('"+sellerid+"',"+ accid+")";
		DB.update(sqlQuery);
		System.out.println("Paisa pay mapping saved");
	}

}
