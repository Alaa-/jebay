package ebay;

import com.opensymphony.xwork2.ActionSupport;

import model.Category;
import model.SubCategory;

public class AdminAddSubcat extends ActionSupport
{
	int fcat;
	String fsubcat;

	public String execute()
	{
		SubCategory.addSubCat(fcat,fsubcat);
		return SUCCESS;
	}
	public int getFcat()
	{
		return fcat;
	}
	public void setFcat(int fcat)
	{
		this.fcat = fcat;
	}
	public String getFsubcat()
	{
		return fsubcat;
	}
	public void setFsubcat(String fsubcat)
	{
		this.fsubcat = fsubcat;
	}

}
