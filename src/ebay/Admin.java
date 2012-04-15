package ebay;

import java.util.ArrayList;

import model.Category;
import model.SubCategory;

import vo.CategoryVo;
import vo.SubCategoryVo;

import com.opensymphony.xwork2.ActionSupport;

public class Admin extends ActionSupport
{
	ArrayList<CategoryVo> catlist;
	
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
}
