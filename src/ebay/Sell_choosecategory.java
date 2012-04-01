package ebay;

import java.util.ArrayList;

import model.Category;

import vo.CategoryVo;

import com.opensymphony.xwork2.ActionSupport;

public class Sell_choosecategory extends ActionSupport
{
	ArrayList<CategoryVo> catlist;

	@Override
	public String execute()
	{
		catlist = Category.getAllCategories();
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

}
