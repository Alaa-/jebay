package model;

import java.sql.ResultSet;
import vo.*;
import myutil.DB;

public class Account {
	public static int getAccountBuyerCredit(int creditcardnumber){
		int acc=0;
		ResultSet rs = null;
		String sqlQuery = "select account_no from account_details where account_cc_no ="+creditcardnumber;
		rs = DB.readFromDB(sqlQuery);
		try
		{
			if (rs.next())
			{
				acc=rs.getInt("account_no");
			}
		}
		catch(Exception e){}
		AccountVo accVo = new AccountVo(acc);
		return acc;
	}
	
	public static int getAccountBuyerDebit(int debitcardnumber){
		int acc=0;
		ResultSet rs = null;
		String sqlQuery = "select account_no from account_details where account_dc_no ="+debitcardnumber;
		rs = DB.readFromDB(sqlQuery);
		try
		{
			if (rs.next())
			{
				acc=rs.getInt("account_no");
			}
		}
		catch(Exception e){}
		AccountVo accVo = new AccountVo(acc);
		return acc;
	}
}
