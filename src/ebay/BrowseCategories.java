package ebay;

import java.util.ArrayList;

import model.Category;

import com.opensymphony.xwork2.ActionSupport;

public class BrowseCategories extends ActionSupport{
	private ArrayList allCats;
	private ArrayList allSubCats[];
	
	public ArrayList getAllCats() {
		return allCats;
	}
	public void setAllCats(ArrayList allCats) {
		this.allCats = allCats;
	}
	
	
	public ArrayList[] getAllSubCats() {
		return allSubCats;
	}
	public void setAllSubCats(ArrayList[] allSubCats) {
		this.allSubCats = allSubCats;
	}
	public String execute(){
		
		//allCats = Category.getAllCat();
		allCats = Category.getAllCategoriesSubCategories();
		System.out.println(""+allCats);
		/*//allSubCats = new ArrayList[allCats.size()];
		
		for(int i=0;i<allCats.size();i++)
		{
			
		}*/
		return "success";
	}

}
