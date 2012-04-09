package ebay;

import java.util.ArrayList;

import model.Category;
import model.ItemDetails;

import com.opensymphony.xwork2.ActionSupport;

public class CatDetailsAction extends ActionSupport{
	private int catid;
	private ArrayList bidDetails;
	private ArrayList buyDetails;
	
	public ArrayList getBidDetails() {
		return bidDetails;
	}

	public void setBidDetails(ArrayList bidDetails) {
		this.bidDetails = bidDetails;
	}

	public ArrayList getBuyDetails() {
		return buyDetails;
	}

	public void setBuyDetails(ArrayList buyDetails) {
		this.buyDetails = buyDetails;
	}

	public int getCatid() {
		return catid;
	}

	public void setCatid(int catid) {
		this.catid = catid;
	}
	
	public String execute()
	{
		String catname=Category.getCatName(catid);
		bidDetails = ItemDetails. getCatPdtDetails(catid);	
		buyDetails = ItemDetails.getCatPdtBuyDetails(catid);
		return "success";
	}

}
