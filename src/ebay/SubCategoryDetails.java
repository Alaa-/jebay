package ebay;

import java.util.ArrayList;

import com.opensymphony.xwork2.ActionSupport;
import model.*;

public class SubCategoryDetails extends ActionSupport
{

	private int subcatid;
	private int cat_id;
	private ArrayList bidDetails = new ArrayList();
	private ArrayList buyDetails = new ArrayList();

	@Override
	public String execute()
	{
		bidDetails = SubCategory.getBidDetails(cat_id, subcatid);
		buyDetails = SubCategory.getBuyDetails(cat_id, subcatid);
		return "success";
	}

	public int getSubcatid()
	{
		return subcatid;
	}

	public void setSubcatid(int subcatid)
	{
		this.subcatid = subcatid;
	}

	public int getCat_id()
	{
		return cat_id;
	}

	public void setCat_id(int cat_id)
	{
		this.cat_id = cat_id;
	}

	public ArrayList getBidDetails()
	{
		return bidDetails;
	}

	public void setBidDetails(ArrayList bidDetails)
	{
		this.bidDetails = bidDetails;
	}

	public ArrayList getBuyDetails()
	{
		return buyDetails;
	}

	public void setBuyDetails(ArrayList buyDetails)
	{
		this.buyDetails = buyDetails;
	}

}
