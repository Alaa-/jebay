package ebay;

import java.util.ArrayList;
import vo.BiddingVo;
import model.Bidding;

import com.opensymphony.xwork2.ActionSupport;

public class bid extends ActionSupport {
	int itemid;
//get item id from the previous page where the user clicks on the link of the product.
	public int getItemid() {
		return itemid;
	}

	public void setItemid(int itemid) {
		this.itemid = itemid;
	}

	ArrayList<BiddingVo> bidlist;

	public String execute() {
		bidlist = Bidding.getAllBids(itemid);
		return SUCCESS;
	}

	public ArrayList<BiddingVo> getBidlist() {
		return bidlist;
	}

	public void setBidlist(ArrayList<BiddingVo> bidlist) {
		this.bidlist = bidlist;
	}
}
