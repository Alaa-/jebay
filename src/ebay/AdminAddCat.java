package ebay;

import model.Category;

import com.opensymphony.xwork2.ActionSupport;

public class AdminAddCat extends ActionSupport
{
	String fcat;
	public String execute()
	{
		Category.addCat(fcat);
		return SUCCESS;
	}
	public String getFcat()
	{
		return fcat;
	}
	public void setFcat(String fcat)
	{
		this.fcat = fcat;
	}

}
