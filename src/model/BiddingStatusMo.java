package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import myutil.DB;
import vo.*;
import ebay.Connect;

public class BiddingStatusMo
{
	public ArrayList<BiddingStatusVo> bidhis = new ArrayList<BiddingStatusVo>();

	public ArrayList<BiddingStatusVo> gethistory(String username)
	{
		int item_id;
		try
		{
			Connect c = new Connect();
			ResultSet rs = c.getResult("select * from biddingstatus,item_details where bidding_item_id=item_id and bidding_status=2 and bidding_winner='" + username + "'");

			while (rs.next())
			{
				BiddingStatusVo b = new BiddingStatusVo();
				b.setItem_id(rs.getInt("item_id"));
				item_id = rs.getInt("item_id");
				ResultSet rs1 = c.getResult("select * from transaction_details where t_item_id=" + item_id);
				ResultSet rs3 = c.getResult("select * from bidding_details where bidding_buyer='" + username + "' and bidding_item_id=" + item_id);
				if (rs1.next())
				{
					b.setT_status(rs1.getInt("t_status"));
					System.out.println("transaction status : " + rs1.getInt("t_status"));
				}
				else
				{
					b.setT_status(0);
				}
				if (rs3.next())
				{
					b.setItem_price(rs3.getInt("bidding_bid"));
				}
				else
				{
					b.setItem_price(rs.getInt("item_price"));
				}
				b.setItem_name(rs.getString("item_name"));

				b.setItem_seller(rs.getString("item_seller"));
				b.setBidding_winner(rs.getString("bidding_winner"));
				b.setItem_mode(rs.getString("item_mode"));
				bidhis.add(b);

			}
			return bidhis;
		}
		catch (Exception e)
		{
			e.printStackTrace();
			return null;
		}

	}

	public static void initBiddingStatus(int item_id)
	{
		Connect c = new Connect();
		String seller = null;
		try
		{
			ResultSet rs = c.getResult("select * from item_details where item_id=" + item_id);
			rs.next();
			seller = rs.getString("item_seller");
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String sqlQuery = "insert into biddingstatus (bidding_item_id,bidding_winner) values(" + item_id + ", '" + seller + "')";
		DB.update(sqlQuery);
		System.out.println("Biddingstatus initialized");
	}

}
