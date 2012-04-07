package vo;

public class ItemDetailsVo {
	private String item_name;
	private int price;
	private int shipping_charge;
	private String mode;
	
	
	
	public ItemDetailsVo(String item_name, int price, int shipping_charge,
			String mode) {
		super();
		this.item_name = item_name;
		this.price = price;
		this.shipping_charge = shipping_charge;
		this.mode = mode;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getShipping_charge() {
		return shipping_charge;
	}
	public void setShipping_charge(int shipping_charge) {
		this.shipping_charge = shipping_charge;
	}
	public String getMode() {
		return mode;
	}
	public void setMode(String mode) {
		this.mode = mode;
	}
	
	
}
