package model;

import java.sql.ResultSet;

import myutil.DB;

public class Transaction {

	public static void makePayment(int price, String buyer,int item_id,int qty)
	{
		ResultSet rs = null;
		String mode=null;
		String seller = ItemDetails.getSellerItem(item_id);
		/*String sqlQuery = "insert into transaction_details " +
				"(t_id,t_buyer,t_seller,t_status,t_item_id,t_quantity,t_timestamp,cart_id,buyer_acc_no) " +
				"values ('"++"','"+buyer+"','"+seller+"',0,'"+item_id+"','"+qty+"','"+timestamp+"','','"+acc+"'";*/
		//DB.update(sqlQuery);
	}
}
