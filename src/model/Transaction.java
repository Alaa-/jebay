package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Map;

import myutil.DB;

import com.opensymphony.xwork2.ActionContext;

public class Transaction {

	public static int makePayment(int price, String buyer,int item_id,int qty,int acc)
	{
		
		int trans_status=0;
		
		trans_status= deductAmount(acc, price);
		
		if(trans_status == 1)
		{
		String seller = ItemDetails.getSellerItem(item_id);
		int transaction_id = getTransactionId(price, buyer, item_id, qty, acc,seller);
		System.out.println(transaction_id);
		reduceQuantity(item_id,qty);
		addToPaisaPay(price, seller, buyer, transaction_id);
		}
		
		return trans_status;
		
	}
	
	
	
	public static int getTransactionId(int price, String buyer,int item_id,int qty,int acc, String seller)
	{

		String sqlQuery;
		Connection conn;
		Statement stmt;
		ResultSet rs = null;
		int newGeneratedItemid = -1;
		conn = DB.getConnection();
		Map session=ActionContext.getContext().getSession();
		String temp=session.get("temp").toString();
		sqlQuery = "insert into transaction_details " +
				"(t_buyer,t_seller,t_status,t_item_id,t_quantity,t_timestamp,t_buyer_account_no,t_shipping_address) " +
				"values ('"+buyer+"','"+seller+"',1,"+item_id+","+qty+",now(),"+acc+",'"+temp+"')";
		session.remove("temp");
		System.out.println(sqlQuery);
		try
		{
			stmt = conn.createStatement();

			System.out.println(sqlQuery);
			stmt.executeUpdate(sqlQuery, Statement.RETURN_GENERATED_KEYS);
			rs = stmt.getGeneratedKeys();
			if (rs.next())
			{
				newGeneratedItemid = rs.getInt(1);
				System.out.println("New generated Item_id is " + newGeneratedItemid);

			}
			else
			{
				System.out.println("no key generated");
			}
		}
		catch (Exception ex)
		{
			System.out.println("no key generated");
			ex.getStackTrace();
		}
		finally
		{
			DB.close(rs);
			DB.close(conn);
		}

		return newGeneratedItemid;

	}
		
	public static void removeFromCart(int cart_id){
		String sqlQuery = "update table cart_details set cart_status=0 where cart_id="+cart_id;
		DB.update(sqlQuery);
	}
	
	public static void reduceQuantity(int item_id, int quan)
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
				qty=qty-quan;
			}
		}
		catch(Exception e){}	
		finally{
			String sqlQuery1 = "update item_details set item_quantity="+qty+" where item_id="+item_id;
			DB.update(sqlQuery1);
		}
	}
	
	public static int deductAmount(int acc, int price)
	{
		ResultSet rs = null;
		int balance=0;
		int trans_status=0;
		String sqlQuery = "select account_balance from account_details where account_no="+acc;
		rs = DB.readFromDB(sqlQuery);
		try
		{
			if (rs.next())
			{
				balance=rs.getInt("account_balance");
				if(balance>price)
				{
				balance=balance-price;
				trans_status=1;
				}
			
			else 
			{		
				trans_status=0;	
			}
			}
		}
		catch(Exception e){}	
		finally{
			String sqlQuery1 = "update account_details set account_balance="+balance+" where account_no="+acc;
			DB.update(sqlQuery1);
		}
		
		return trans_status;
	}
	
	public static void addToPaisaPay(int price,String seller,String buyer, int transaction_id)
	{
		String sqlQuery = "insert into `paisapay_details` " +
				"(`paisa_seller`,`paisa_buyer`,`paisa_amount`,`paisa_t_id`) " +
				"values ('"+seller+"','"+buyer+"',"+price+","+transaction_id+")";
		
		DB.update(sqlQuery);
		
	}
}
