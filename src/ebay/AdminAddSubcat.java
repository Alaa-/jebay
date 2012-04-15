package ebay;

import com.opensymphony.xwork2.ActionSupport;

import model.Category;
import model.SubCategory;

public class AdminAddSubcat extends ActionSupport
{
	int fcat,fsubcat;
	String newsub;

	public String execute()
	{
		SubCategory.addSubCat(fcat,newsub);
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
	public int getFsubcat()
	{
		return fsubcat;
	}
	public void setFsubcat(int fsubcat)
	{
		this.fsubcat = fsubcat;
	}
	public String getNewsub()
	{
		return newsub;
	}
	public void setNewsub(String newsub)
	{
		this.newsub = newsub;
	}

}
