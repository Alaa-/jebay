package model;

import java.sql.ResultSet;

import myutil.DB;

public class Cart {
	
	public static int getTransactionId(int cart_id)
	{
		int tid=0;
		ResultSet rs = null;
		String sqlQuery = "select _balance from account_details where account_no="+acc;
		rs = DB.readFromDB(sqlQuery);
		try
		{
			if (rs.next())
			{
				balance=rs.getInt("account_balance");
				balance=balance-price;
			}
		}
		catch(Exception e){}
		return tid;
		
	}

}
