package ebay;
import java.util.ArrayList;

import model.BuyItNowModel;

import org.apache.struts2.ServletActionContext;

import vo.ItemVo;
public class BuyItNow {
	int item_id;
	ArrayList<ItemVo>arr=new ArrayList<ItemVo>();
	public int getItem_id() {
		return item_id;
	}
	public void setItem_id(int item_id) {
		this.item_id = item_id;
	}
	public ArrayList<ItemVo> getArr() {
		return arr;
	}
	public void setArr(ArrayList<ItemVo> arr) {
		this.arr = arr;
	}
	public String execute(){
		String refererPage =ServletActionContext.getRequest().getHeader("referer");
		//System.out.println(refererPage);
		BuyItNowModel b=new BuyItNowModel();
		arr=b.getitemdetails(item_id);
		
		return "success";
		
		}
	


}
