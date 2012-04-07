package ebay;

import java.util.ArrayList;

import model.Category;

import vo.CategoryVo;

import com.opensymphony.xwork2.ActionSupport;

public class Sell_choosecategory extends ActionSupport
{
	ArrayList<CategoryVo> catlist;
	String defaultcat = "<select Category>", defaultsubcat = "<select subcategory>";

	@Override
	public String execute()
	{
		catlist = Category.getAllCategoriesSubCategories();
		return SUCCESS;
	}

	public ArrayList<CategoryVo> getCatlist()
	{
		return catlist;
	}

	public void setCatlist(ArrayList<CategoryVo> catlist)
	{
		this.catlist = catlist;
	}

	public String getDefaultcat()
	{
		return defaultcat;
	}

	public void setDefaultcat(String defaultcat)
	{
		this.defaultcat = defaultcat;
	}

	public String getDefaultsubcat()
	{
		return defaultsubcat;
	}

	public void setDefaultsubcat(String defaultsubcat)
	{
		this.defaultsubcat = defaultsubcat;
	}

}
