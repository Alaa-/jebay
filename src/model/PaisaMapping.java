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


}
