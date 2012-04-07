package ebay;

import java.sql.ResultSet;
import java.util.ArrayList;

import org.apache.struts2.ServletActionContext;

import vo.ItemVo;
public class AddToCart {
	
	
	ArrayList<ItemVo>arr=new ArrayList<ItemVo>();
	
	
	
	public ArrayList<ItemVo> getArr() {
		return arr;
	}
	public void setArr(ArrayList<ItemVo> arr) {
		this.arr = arr;
	}
	public String execute() throws Exception{
		
		String username=(String) ServletActionContext.getRequest().getSession().getAttribute("username");
		System.out.println(username);
		Connect c=new Connect();
		ResultSet rs=c.getResult("select * from cart_details where cart_buyer='"+username+"'");
		while(rs.next()){
		Connect c1=new Connect();
		ResultSet rs1=c1.getResult("select * from item_details where item_id='"+rs.getInt("cart_item_id")+"'");
	
	    while(rs1.next()){
	    	ItemVo i=new ItemVo();
	    	i.setItem_name(rs1.getString("item_name"));
	    	i.setItem_seller(rs1.getString("item_seller"));
	    	i.setItem_price(rs1.getInt("item_price"));
	    	arr.add(i);
	    	
	    }
	    
			
			
		}
		return "success";
		
		}
	


}
