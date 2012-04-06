package ebay;

import java.util.ArrayList;

import vo.BidItemUserJoinVo;
import model.Bidding;

import com.opensymphony.xwork2.ActionSupport;

public class bid extends ActionSupport {
	ArrayList<BidItemUserJoinVo> arr = new ArrayList<BidItemUserJoinVo>();
	int item_id;

	public int getItem_id() {
		return item_id;
	}

	public void setItem_id(int item_id) {
		this.item_id = item_id;
	}

	public ArrayList<BidItemUserJoinVo> getArr() {
		return arr;
	}

	public void setArr(ArrayList<BidItemUserJoinVo> arr) {
		this.arr = arr;
	}

	public String execute() {
		Bidding b = new Bidding();
		arr = b.getAllBidDetails(item_id);
		return SUCCESS;
	}
}
