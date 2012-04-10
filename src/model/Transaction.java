package model;

import java.sql.ResultSet;

import ebay.Connect;

import myutil.DB;

public class Transaction {

	public static void makePayment(int price, String buyer,int item_id,int qty,int acc)
	{
		//ResultSet rs = null;
		
		String seller = ItemDetails.getSellerItem(item_id);
		String sqlQuery = "insert into `transaction_details` " +
				"(`t_buyer`,`t_seller`,`t_status`,`t_item_id`,`t_quantity`,`t_timestamp`,`cart_id`,`buyer_acc_no`) " +
				"values ('"+buyer+"','"+seller+"',1,"+item_id+","+qty+",now(),"+cart_id+","+acc+")";
		
		DB.update(sqlQuery);
		reduceQuantity(item_id);
		deductAmount(acc, price);
		
	}
	
	public static void removeFromCart(int cart_id){
		String sqlQuery = "update table cart_details set cart_status=0 where cart_id="+cart_id;
		DB.update(sqlQuery);
	}
	
	public static void reduceQuantity(int item_id)
	{
		ResultSet rs = null;
		int qty=0;
		String sqlQuery = "select item_quantity from item_details where item_id="+item_id;
		rs = DB.readFromDB(sqlQuery);
		try
		{
			if (rs.next())
			{
				qty=rs.getInt("item_quantity");
				qty=qty-1;
			}
		}
		catch(Exception e){}	
		finally{
			String sqlQuery1 = "update table item_details set item_quantity="+qty+" where item_id="+item_id;
			DB.update(sqlQuery1);
		}
	}
	
	public static void deductAmount(int acc, int price)
	{
		ResultSet rs = null;
		int balance=0;
		String sqlQuery = "select account_balance from account_details where account_no="+acc;
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
		finally{
			String sqlQuery1 = "update table account_details set account_balance="+balance+" where account_no="+acc;
			DB.update(sqlQuery1);
		}
	}
	
	public static void addToPaisaPay(int cart_id,int price,String seller,String buyer)
	{
		int tid = Cart.getTransactionId(cart_id);
		
	}
}
