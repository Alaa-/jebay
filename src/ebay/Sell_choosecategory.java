package ebay;

import java.util.ArrayList;
import java.util.Map;

import model.Category;
import model.PaisaMapping;

import vo.CategoryVo;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Sell_choosecategory extends ActionSupport
{
	ArrayList<CategoryVo> catlist;
	int paisaregister;
	String defaultcat = "<select Category>", defaultsubcat = "<select subcategory>";

	@Override
	public String execute()
	{
		Map session = ActionContext.getContext().getSession();
		String user = (String) session.get("User");
		if (user == null)
		{
			return LOGIN;
		}
		paisaregister = PaisaMapping.getSellerPaisaStatus(user);
		if (paisaregister == 0)
		{
			addActionError("Please Register With Paisapay to enable Selling on eBay");
			return "paisa";
		}
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

	public int getPaisaregister()
	{
		return paisaregister;
	}

	public void setPaisaregister(int paisaregister)
	{
		this.paisaregister = paisaregister;
	}

}
