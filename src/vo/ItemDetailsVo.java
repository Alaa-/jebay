package vo;

public class ItemDetailsVo {
	private String item_name;
	private int price;
	private int shipping_charge;
	
	private String mode;
	private int item_id;
	private String image;
	private String seller;
	
	public ItemDetailsVo(){
		
	}
	public ItemDetailsVo(String seller) {
		super();
		this.seller = seller;
	}


	public ItemDetailsVo(String item_name, int price, int shipping_charge,
			String mode) {
		super();
		this.item_name = item_name;
		this.price = price;
		this.shipping_charge = shipping_charge;
		this.mode = mode;
		
	}
	
	
	public ItemDetailsVo(String item_name, int price, int shipping_charge,
			String mode, int item_id,String image) {
		super();
		this.item_name = item_name;
		this.price = price;
		this.shipping_charge = shipping_charge;
		this.mode = mode;
		this.item_id = item_id;
		this.image=image;
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


	public int getItem_id() {
		return item_id;
	}


	public void setItem_id(int item_id) {
		this.item_id = item_id;
	}


	public String getImage() {
		return image;
	}


	public void setImage(String image) {
		this.image = image;
	}


	public String getSeller() {
		return seller;
	}


	public void setSeller(String seller) {
		this.seller = seller;
	}
	
	
}
