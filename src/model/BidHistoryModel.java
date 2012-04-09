package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.BiddingVo;
import ebay.Connect;

public class BidHistoryModel {
	public ArrayList<BiddingVo> getAllBids(int item_id) throws SQLException {
		
		ArrayList<BiddingVo> allBids = new ArrayList<BiddingVo>();
		Connect c=new Connect();
		ResultSet rs=c.getResult("select * from bidding_details where bidding_item_id="+item_id+" order by bidding_bid desc");
		while(rs.next())
		{
			BiddingVo bvo=new BiddingVo();
			bvo.setBidding_bid(rs.getInt("bidding_bid"));
			bvo.setBidding_buyer(rs.getString("bidding_buyer"));
			bvo.setBidding_id(rs.getInt("bidding_id"));
			bvo.setBidding_item_id(rs.getInt("bidding_item_id"));
			bvo.setBidding_timestamp(rs.getTimestamp("bidding_timestamp")+"");
			allBids.add(bvo);
		}
		return allBids;
}
}
