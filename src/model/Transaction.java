package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import vo.ItemVo;

import ebay.Connect;

import myutil.DB;

public class Transaction {

	public static void makePayment(int price, String buyer,int item_id,int qty,int acc)
	{
		
		/*ResultSet rs = null;
		String sqlQuery = "insert into `transaction_details` " +
				"(`t_buyer`,`t_seller`,`t_status`,`t_item_id`,`t_quantity`,`t_timestamp`,+`buyer_acc_no`) " +
				"values ('"+buyer+"','"+seller+"',1,"+item_id+","+qty+",now(),"+acc+")";
		
		//DB.update(sqlQuery);*/
		//
		String seller = ItemDetails.getSellerItem(item_id);
		int transaction_id = getTransactionId(price, buyer, item_id, qty, acc,seller);
		System.out.println(transaction_id);
		reduceQuantity(item_id);
		deductAmount(acc, price);
		addToPaisaPay(price, seller, buyer, transaction_id);
		
	}
	
	
	
	public static int getTransactionId(int price, String buyer,int item_id,int qty,int acc, String seller)
	{

		String sqlQuery;
		Connection conn;
		Statement stmt;
		ResultSet rs = null;
		int newGeneratedItemid = -1;
		conn = DB.getConnection();
		sqlQuery = "insert into transaction_details " +
				"(t_buyer,t_seller,t_status,t_item_id,t_quantity,t_timestamp,buyer_acc_no) " +
				"values ('"+buyer+"','"+seller+"',1,"+item_id+","+qty+",now(),"+acc+")";
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
			String sqlQuery1 = "update item_details set item_quantity="+qty+" where item_id="+item_id;
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
			String sqlQuery1 = "update account_details set account_balance="+balance+" where account_no="+acc;
			DB.update(sqlQuery1);
		}
	}
	
	public static void addToPaisaPay(int price,String seller,String buyer, int transaction_id)
	{
		String sqlQuery = "insert into `paisapay_details` " +
				"(`paisa_seller`,`paisa_buyer`,`paisa_amount`,`paisa_t_id`) " +
				"values ('"+seller+"','"+buyer+"',"+price+","+transaction_id+")";
		
		DB.update(sqlQuery);
		
	}
}
