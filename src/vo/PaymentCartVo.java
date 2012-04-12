package vo;

public class PaymentCartVo {

	String item_name,item_seller;
	int item_price,item_shipping_charge;
	
	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	public String getItem_seller() {
		return item_seller;
	}

	public void setItem_seller(String item_seller) {
		this.item_seller = item_seller;
	}

	public int getItem_price() {
		return item_price;
	}

	public void setItem_price(int item_price) {
		this.item_price = item_price;
	}

	public int getItem_shipping_charge() {
		return item_shipping_charge;
	}

	public void setItem_shipping_charge(int item_shipping_charge) {
		this.item_shipping_charge = item_shipping_charge;
	}

	public PaymentCartVo(String item_name, String item_seller, int item_price,
			int item_shipping_charge) {
		super();
		this.item_name = item_name;
		this.item_seller = item_seller;
		this.item_price = item_price;
		this.item_shipping_charge = item_shipping_charge;
	}

	public PaymentCartVo() {
		super();
	}
	
}
