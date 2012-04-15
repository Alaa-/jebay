package ebay;

import java.sql.ResultSet;
import java.util.ArrayList;

import org.apache.struts2.ServletActionContext;

import vo.ItemCartVo;
public class AddToCart {
	
	
	ArrayList<ItemCartVo>arr=new ArrayList<ItemCartVo>();
	
String item_id,quantity;
	public String getItem_id() {
	return item_id;
}
public void setItem_id(String item_id) {
	this.item_id = item_id;
}
public String getQuantity() {
	return quantity;
}
public void setQuantity(String quantity) {
	this.quantity = quantity;
}
	public ArrayList<ItemCartVo> getArr() {
		return arr;
	}
	public void setArr(ArrayList<ItemCartVo> arr) {
		this.arr = arr;
	}
	public String execute() throws Exception{
		
		String username=(String) ServletActionContext.getRequest().getSession().getAttribute("username");
		System.out.println(username);
		Connect c=new Connect();
		System.out.println(item_id);
		if(item_id!=null&&quantity!=null){
		ResultSet rs2=c.getResult("select * from cart_details where cart_buyer='"+username+"' and cart_item_id='"+item_id+"'");
		if(rs2.next()){
			c.dml("update cart_details set cart_quantity='"+quantity+"' where cart_id='"+rs2.getInt("cart_id")+"'");
			
		}
		else{
			c.dml("insert into cart_details(cart_item_id,cart_buyer,cart_quantity) values('"+item_id+"','"+username+"','"+quantity+"')");
			
		}
		}
		ResultSet rs=c.getResult("select * from cart_details where cart_buyer='"+username+"'");
		while(rs.next()){
		Connect c1=new Connect();
		ResultSet rs1=c1.getResult("select * from item_details where item_id='"+rs.getInt("cart_item_id")+"' and timediff(item_endtime,now())>0 and item_quantity>0");
	
	    while(rs1.next()){
	    	ItemCartVo i=new ItemCartVo();
	    	i.setItem_name(rs1.getString("item_name"));
	    	i.setItem_seller(rs1.getString("item_seller"));
	    	i.setItem_price(rs1.getInt("item_price"));
	    	i.setItem_total(rs1.getInt("item_price")*rs.getInt("cart_quantity"));
	    	i.setItem_quantity(rs1.getInt("item_quantity"));
	    	i.setItem_id(rs1.getInt("item_id"));
	    	i.setCart_id(rs.getInt("cart_id"));
	    	i.setCart_item_id(rs.getInt("cart_item_id"));
	    	i.setCart_quantity(rs.getInt("cart_quantity"));
	    	arr.add(i);
	    	
	    }
	    
			
			
		}
		return "success";
		
		}
	


}
