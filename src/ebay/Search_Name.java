package ebay;

import java.util.ArrayList;
import java.util.Map;

import model.Category_Camera;
import model.Category_Book;
import model.ItemDetails;
import myutil.DB;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Search_Name extends ActionSupport{
	private String _nkw;
	private String _sacat;
	private ArrayList bidDetails = new ArrayList();
	private ArrayList colNames = new ArrayList();
	private ArrayList buyDetails = new ArrayList();
	



	public ArrayList getBidDetails() {
		return bidDetails;
	}


	public void setBidDetails(ArrayList bidDetails) {
		this.bidDetails = bidDetails;
	}


	public ArrayList getBuyDetails() {
		return buyDetails;
	}


	public void setBuyDetails(ArrayList buyDetails) {
		this.buyDetails = buyDetails;
	}


	public String get_nkw() {
		return _nkw;
	}


	public void set_nkw(String _nkw) {
		this._nkw = _nkw;
	}

	public String get_sacat() {
		return _sacat;
	}


	public void set_sacat(String _sacat) {
		this._sacat = _sacat;
	}


	public String execute(){
		System.out.println(""+_nkw);
		System.out.println(""+_sacat);
		if(_sacat.equals("See-All-Categories"))
		{

			bidDetails = ItemDetails.getAllCategoryDetails(_nkw);
			buyDetails = ItemDetails.getBuyPdtDetails(_nkw);
			Map session = ActionContext.getContext().getSession();
			String pdtMode =(String)session.get("pdtMode");
			return "success";
		}
		else
		{
			bidDetails = ItemDetails.getDetails(_nkw,_sacat);
			buyDetails = ItemDetails.getNameBuyDetails(_nkw, _sacat);
			Map session = ActionContext.getContext().getSession();
			String pdtMode =(String)session.get("pdtMode");
			return "success";
		}
		//System.out.println(""+searchDetails.get(0));
		/*if(_nkw.equalsIgnoreCase("camera") || _nkw.equalsIgnoreCase("cameras"))
		{
			searchDetails = Category_Camera.getCameraDetails(_nkw,_sacat);
			//return "success";
		}
		if(_nkw.equalsIgnoreCase("book") || _nkw.equalsIgnoreCase("books"))
		{
			colNames = Category_Book.getCols();
			System.out.println(""+colNames.get(1));
			searchDetails = Category_Book.getBookDetails(_nkw);
			//return "books";w	
		}*/
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
		
	}
	
	
	
}
