package vo;

public class PaymentCartVo {

	String item_name,item_seller;
	int item_price,item_shipping_charge,item_id;
	
	
	public int getItem_id() {
		return item_id;
	}

	public void setItem_id(int item_id) {
		this.item_id = item_id;
	}

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
			int item_shipping_charge,int item_id) {
		super();
		this.item_name = item_name;
		this.item_seller = item_seller;
		this.item_id=item_id;
		this.item_price = item_price;
		this.item_shipping_charge = item_shipping_charge;
		//this.item_price_quantity=item_price*quantity;
	}

	public PaymentCartVo() {
		super();
	}
	
}
