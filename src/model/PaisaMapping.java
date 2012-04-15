package model;

import java.sql.ResultSet;

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
	
	public static ResultSet getPaisaMappingDetails(String sellerid)
	{
		String sqlQuery="select account_no,account_holder,bank_name from account_details,paisapay_mapping,bank_details where seller_acc_id=account_id and seller_id='" + sellerid+"' and bank_id=account_bank_id";
		ResultSet rs=DB.readFromDB(sqlQuery);
		return rs;
	}

}
