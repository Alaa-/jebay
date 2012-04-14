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
	ArrayList<SubCategoryVo> subcatlist;
	
	public String execute()
	{
		catlist=Category.getAllCategories();
		subcatlist=SubCategory.getAllSubCategories();
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

	public ArrayList<SubCategoryVo> getSubcatlist()
	{
		return subcatlist;
	}

	public void setSubcatlist(ArrayList<SubCategoryVo> subcatlist)
	{
		this.subcatlist = subcatlist;
	}

}
