package ebay;
public class RemoveFromCart {
	int cart_id;
public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
public String execute() throws Exception{
	Connect c=new Connect();
	c.dml("delete from cart_details where cart_id='"+cart_id+"'");
	 return "success";
}
}
