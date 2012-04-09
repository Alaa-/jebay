package ebay;

import java.util.ArrayList;

import model.ItemDetails;

import com.opensymphony.xwork2.ActionSupport;

public class CatDetailsAction extends ActionSupport{
	private int catid;
	private ArrayList searchDetails;
	
	
	public ArrayList getSearchDetails() {
		return searchDetails;
	}

	public void setSearchDetails(ArrayList searchDetails) {
		this.searchDetails = searchDetails;
	}

	public int getCatid() {
		return catid;
	}

	public void setCatid(int catid) {
		this.catid = catid;
	}
	
	public String execute()
	{
		searchDetails = ItemDetails.getCatPdtDetails(catid);
		return "success";
	}

}
