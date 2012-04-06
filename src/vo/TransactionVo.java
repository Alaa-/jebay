package vo;

public class TransactionVo {
int t_id,t_status,t_item_id,t_quantity;
String t_buyer,t_seller,t_timestamp;
public int getT_id() {
	return t_id;
}
public void setT_id(int t_id) {
	this.t_id = t_id;
}
public int getT_status() {
	return t_status;
}
public void setT_status(int t_status) {
	this.t_status = t_status;
}
public int getT_item_id() {
	return t_item_id;
}
public void setT_item_id(int t_item_id) {
	this.t_item_id = t_item_id;
}
public int getT_quantity() {
	return t_quantity;
}
public void setT_quantity(int t_quantity) {
	this.t_quantity = t_quantity;
}
public String getT_buyer() {
	return t_buyer;
}
public void setT_buyer(String t_buyer) {
	this.t_buyer = t_buyer;
}
public String getT_seller() {
	return t_seller;
}
public void setT_seller(String t_seller) {
	this.t_seller = t_seller;
}
public String getT_timestamp() {
	return t_timestamp;
}
public void setT_timestamp(String t_timestamp) {
	this.t_timestamp = t_timestamp;
}

}
