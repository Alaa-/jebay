package model;

import java.sql.ResultSet;

import myutil.DB;

public class User {

	public static String getUserName(String uid)
	{
		String buyer=null;
		ResultSet rs = null;
		String sqlQuery = "select account_holder from account_details where account_holder='"+uid+"'";

		rs = DB.readFromDB(sqlQuery);
		try
		{
			if(rs.next())
			{
				buyer = rs.getString("account_holder");
				System.out.println(""+buyer);
			}
		}
		catch(Exception e)
		{
			
		}
		return buyer;
	}
	
	public static String getCreditCardNumber(String uid)
	{
		String cardNumber=null;
		ResultSet rs = null;
		String sqlQuery = "select account_cc_no from account_details where account_holder='"+uid+"'";

		rs = DB.readFromDB(sqlQuery);
		try
		{
			if(rs.next())
			{
				cardNumber = rs.getString("account_cc_no");
				System.out.println(""+cardNumber);
			}
		}
		catch(Exception e)
		{
			
		}
		return cardNumber;
	}
	
	public static String getDebitCardNumber(String uid)
	{
		String cardNumber=null;
		ResultSet rs = null;
		String sqlQuery = "select account_dc_no from account_details where account_holder='"+uid+"'";

		rs = DB.readFromDB(sqlQuery);
		try
		{
			if(rs.next())
			{
				cardNumber = rs.getString("account_dc_no");
				System.out.println(""+cardNumber);
			}
		}
		catch(Exception e)
		{
			
		}
		return cardNumber;
	}
}
