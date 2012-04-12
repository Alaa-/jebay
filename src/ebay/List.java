package ebay;

import java.util.ArrayList;

import model.Category;

import com.opensymphony.xwork2.ActionSupport;

public class List extends ActionSupport{
	
	private ArrayList allCats;
	
	public ArrayList getAllCats() {
		return allCats;
	}

	public void setAllCats(ArrayList allCats) {
		this.allCats = allCats;
	}

	public String execute()
	{
		allCats = Category.getAllCategoriesSubCategories();
		return "success";
	}
}
