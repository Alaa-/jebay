package vo;

public class BiddingVo {
int bidding_id,bidding_item_id,bidding_bid;
public int getBidding_id() {
	return bidding_id;
}
public void setBidding_id(int bidding_id) {
	this.bidding_id = bidding_id;
}
public int getBidding_item_id() {
	return bidding_item_id;
}
public void setBidding_item_id(int bidding_item_id) {
	this.bidding_item_id = bidding_item_id;
}
public int getBidding_bid() {
	return bidding_bid;
}
public void setBidding_bid(int bidding_bid) {
	this.bidding_bid = bidding_bid;
}
public String getBidding_buyer() {
	return bidding_buyer;
}
public void setBidding_buyer(String bidding_buyer) {
	this.bidding_buyer = bidding_buyer;
}
public String getBidding_timestamp() {
	return bidding_timestamp;
}
public void setBidding_timestamp(String bidding_timestamp) {
	this.bidding_timestamp = bidding_timestamp;
}
String bidding_buyer,bidding_timestamp;
}
