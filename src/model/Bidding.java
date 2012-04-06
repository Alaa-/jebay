package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.BidItemUserJoinVo;

import myutil.DB;

import com.opensymphony.xwork2.ActionSupport;

public class Bidding extends ActionSupport {

	public ArrayList<BidItemUserJoinVo> getAllBidDetails(int item_id) {
		
		ArrayList<BidItemUserJoinVo> bidList = new ArrayList<BidItemUserJoinVo>();
		ResultSet rs = null, rs3 = null, rs4 = null;
		int count = 0,maxbid = 0;
		String sqlQuery = "select * from bidding_details,item_details,user_details where bidding_item_id="+ item_id + " and item_id=bidding_item_id and user_id=item_seller";
		String sqlQuery3 = "select max(bidding_bid) as maxi from bidding_details where item_id="+item_id; //current highest bid
		String sqlQuery4 = "select count(*) as counti from bidding_details where bidding_item_id="+item_id; //number of bids
		rs = DB.readFromDB(sqlQuery);
		rs3 = DB.readFromDB(sqlQuery3);
		rs4 = DB.readFromDB(sqlQuery4);
		try {
			rs3.next();
			maxbid=rs3.getInt("maxi");
			rs4.next();
			count=rs4.getInt("counti");
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		try {
			while (rs.next()) {
				BidItemUserJoinVo objvo = new BidItemUserJoinVo();
				objvo.setBidding_bid(rs.getInt("bidding_bid"));
				objvo.setItem_baseprice(rs.getInt("item_baseprice"));
				objvo.setItem_id(item_id);
				objvo.setUser_city(rs.getString("user_city"));
				objvo.setUser_country(rs.getString("user_country"));
				objvo.setUser_email(rs.getString("user_email"));
				objvo.setItem_condition(rs.getString("item_condition"));
				objvo.setCount(count);
				objvo.setMax_bid(maxbid);
				bidList.add(objvo);
			}
			return bidList;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rs);
		}
		return null;

	}
}
