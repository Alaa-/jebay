package model;

import myutil.DB;

public class PaisaMapping
{
	
	public static String getSellerPaisaStatus(String user_id)
	{
		String sqlQueryWhere="where seller_id = '"+user_id+"'";
		String table="paisapay_mapping";
		if(DB.getTMSCount(table,sqlQueryWhere)>0)
		{
			return "1";
		}
		else
		{
			return "0";
		}
	}


}
