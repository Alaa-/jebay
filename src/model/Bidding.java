package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.BidItemUserJoinVo;
import vo.MobileVo;

import myutil.DB;

import com.opensymphony.xwork2.ActionSupport;

import ebay.Connect;

public class Bidding extends ActionSupport {

	public ArrayList<BidItemUserJoinVo> getAllBidDetails(int item_id) throws SQLException {
		
		ArrayList<BidItemUserJoinVo> bidList = new ArrayList<BidItemUserJoinVo>();
		ResultSet rs = null, rs3 = null, rs4 = null, rs5 = null;
		int count = 0,maxbid = 0;
		String str = null,status = null;
		Connect c=new Connect();
		String sqlQuery = "select * from item_details,user_details where item_id="+ item_id + " and user_id=item_seller";
		String sqlQuery3 = "select max(bidding_bid) as maxi from bidding_details where bidding_item_id="+item_id; //current highest bid
		String sqlQuery4 = "select count(*) as counti from bidding_details where bidding_item_id="+item_id; //number of bids
		String sqlQuery5 = "select bidding_status from biddingstatus where bidding_item_id="+item_id;
		rs = c.getResult(sqlQuery);
		rs3 = c.getResult(sqlQuery3);
		rs4 = c.getResult(sqlQuery4);
		rs5 = c.getResult(sqlQuery5);
		ResultSet rs1=c.getResult("select *,concat('',timediff(item_endtime,current_timestamp)) as diff from item_details where item_id="+item_id);
	    while(rs5.next())
	    {
	    	status=rs5.getString("bidding_status");
	    }
		while(rs1.next()){
	        String diff=rs1.getString("diff");
	        String[] a=diff.split(":");
	        int days=(Integer.parseInt(a[0])/24);
	        int hours=0;
	        if(days>0){
	            hours=Integer.parseInt(a[0])-days*24;
	        }
	        else{
	            hours=Integer.parseInt(a[0]);
	        }
	        int minutes=Integer.parseInt(a[1]);
	        str=days+"D "+hours+"H "+minutes+"M ";
	    }
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
				objvo.setItem_name(rs.getString("item_name"));
				//objvo.setBidding_bid(rs.getInt("bidding_bid"));
				objvo.setItem_baseprice(rs.getInt("item_baseprice"));
				objvo.setItem_id(item_id);
				objvo.setUser_city(rs.getString("user_city"));
				objvo.setUser_country(rs.getString("user_country"));
				objvo.setUser_email(rs.getString("user_email"));
				objvo.setItem_condition(rs.getString("item_condition"));
				objvo.setItem_mode(rs.getString("item_mode"));
				objvo.setUser_id(rs.getString("user_id"));
				objvo.setItem_id(item_id);
				objvo.setCount(count);
				objvo.setMax_bid(maxbid);
				objvo.setDiff(str);
				objvo.setBid_status(status);
				bidList.add(objvo);
				
			}
			return bidList;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
		}
		return null;
	}
}
