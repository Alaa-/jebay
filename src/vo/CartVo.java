package vo;

public class CartVo {
int cart_id,cart_item_id,cart_quantity;
public int getCart_id() {
	return cart_id;
}
public void setCart_id(int cart_id) {
	this.cart_id = cart_id;
}
public int getCart_item_id() {
	return cart_item_id;
}
public void setCart_item_id(int cart_item_id) {
	this.cart_item_id = cart_item_id;
}
public int getCart_quantity() {
	return cart_quantity;
}
public void setCart_quantity(int cart_quantity) {
	this.cart_quantity = cart_quantity;
}
public String getCart_buyer() {
	return cart_buyer;
}
public void setCart_buyer(String cart_buyer) {
	this.cart_buyer = cart_buyer;
}
String cart_buyer;
}
