package vo;

import java.util.ArrayList;

public class CategoryVo
{
	int category_id;
	String category_name;
	String cat_name;
	
	ArrayList<SubCategoryVo> subcatlist;

	public CategoryVo()
	{
	}

	public CategoryVo(String cat_name) {
		super();
		this.cat_name = cat_name;
	}
	public CategoryVo(int category_id, String category_name)
	{
		this.category_id = category_id;
		this.category_name = category_name;
	}

	public ArrayList<SubCategoryVo> getSubcatlist()
	{
		return subcatlist;
	}

	public void setSubcatlist(ArrayList<SubCategoryVo> subcatlist)
	{
		this.subcatlist = subcatlist;
	}

	public int getCategory_id()
	{
		return category_id;
	}

	public void setCategory_id(int category_id)
	{
		this.category_id = category_id;
	}

	public String getCategory_name()
	{
		return category_name;
	}

	public void setCategory_name(String category_name)
	{
		this.category_name = category_name;
	}

	public String getCat_name() {
		return cat_name;
	}

	public void setCat_name(String cat_name) {
		this.cat_name = cat_name;
	}
	
}
