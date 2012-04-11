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
		try
		{
			Connect c = new Connect();
			ResultSet rs = c.getResult("select * from biddingstatus,item_details where bidding_item_id=item_id and bidding_winner='" + username + "'");
			while (rs.next())
			{
				BiddingStatusVo b = new BiddingStatusVo();
				b.setItem_id(rs.getInt("item_id"));
				b.setItem_name(rs.getString("item_name"));
				b.setItem_price(rs.getInt("item_price"));
				b.setItem_seller(rs.getString("item_seller"));

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
		String sqlQuery="insert into biddingstatus (bidding_item_id) values("+item_id+")";
		DB.update(sqlQuery);
		System.out.println("Biddingstatus initialized");
	}

}
