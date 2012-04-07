package ebay;

import java.sql.SQLException;
import java.util.ArrayList;

import com.opensymphony.xwork2.ActionSupport;

import model.BidHistoryModel;

import vo.BiddingVo;

public class BidHistory extends ActionSupport{
	ArrayList<BiddingVo> arr = new ArrayList<BiddingVo>();
	int item_id;
	public ArrayList<BiddingVo> getArr() {
		return arr;
	}
	public void setArr(ArrayList<BiddingVo> arr) {
		this.arr = arr;
	}
	public int getItem_id() {
		return item_id;
	}
	public void setItem_id(int item_id) {
		this.item_id = item_id;
	}
	public String execute() {
		BidHistoryModel b = new BidHistoryModel();
		try {
			arr = b.getAllBids(item_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
}
