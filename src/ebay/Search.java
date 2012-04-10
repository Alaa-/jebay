package ebay;

import java.util.ArrayList;

import model.Category_Camera;
import model.Category_Book;
import myutil.DB;

import com.opensymphony.xwork2.ActionSupport;

public class Search extends ActionSupport{
	private String _nkw;
	private ArrayList searchDetails = new ArrayList();
	private ArrayList colNames = new ArrayList();
	
	

	public ArrayList getSearchDetails() {
		return searchDetails;
	}


	public void setSearchDetails(ArrayList searchDetails) {
		this.searchDetails = searchDetails;
	}


	public String get_nkw() {
		return _nkw;
	}


	public void set_nkw(String _nkw) {
		this._nkw = _nkw;
	}




	public String execute(){
		System.out.println(""+_nkw);
		if(_nkw.equalsIgnoreCase("camera") || _nkw.equalsIgnoreCase("cameras"))
		{
			//searchDetails = Category_Camera.getCameraDetails(_nkw);
			//return "success";
		}
		if(_nkw.equalsIgnoreCase("book") || _nkw.equalsIgnoreCase("books"))
		{
			colNames = Category_Book.getCols();
			System.out.println(""+colNames.get(1));
			searchDetails = Category_Book.getBookDetails(_nkw);
			//return "books";
		}
		/*if(_nkw.equalsIgnoreCase("computer") || _nkw.equalsIgnoreCase("computers"))
			searchDetails = Category.getComputerDetails(_nkw);
		if(_nkw.equalsIgnoreCase("clothing") || _nkw.equalsIgnoreCase("clothings"))
			searchDetails = Category.getClothingDetails(_nkw);
		if(_nkw.equalsIgnoreCase("jewellery") || _nkw.equalsIgnoreCase("jewelleries"))
			searchDetails = Category.getJewelleryDetails(_nkw);
		if(_nkw.equalsIgnoreCase("electric") || _nkw.equalsIgnoreCase("electrics"))
			searchDetails = Category.getElectricDetails(_nkw);
		if(_nkw.equalsIgnoreCase("mobile") || _nkw.equalsIgnoreCase("mobiles"))
				searchDetails = Category.getMobileDetails(_nkw);
		if(_nkw.equalsIgnoreCase("storage device") || _nkw.equalsIgnoreCase("storage devices"))
			searchDetails = Category.getStorageDetails(_nkw);*/
		
		
		
		
		return "success";
	}
	
	
	
}
