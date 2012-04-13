package vo;

public class BiddingStatusVo
{
	String bidding_status, bidding_winner, item_name, item_seller, item_mode;

	public String getItem_mode()
	{
		return item_mode;
	}

	public void setItem_mode(String item_mode)
	{
		this.item_mode = item_mode;
	}

	public String getItem_seller()
	{
		return item_seller;
	}

	public void setItem_seller(String item_seller)
	{
		this.item_seller = item_seller;
	}

	public String getItem_name()
	{
		return item_name;
	}

	public void setItem_name(String item_name)
	{
		this.item_name = item_name;
	}

	public int getItem_price()
	{
		return item_price;
	}

	public void setItem_price(int item_price)
	{
		this.item_price = item_price;
	}

	public int getItem_id()
	{
		return item_id;
	}

	public void setItem_id(int item_id)
	{
		this.item_id = item_id;
	}

	int bidding_item_id, email_sent, item_price, item_id, t_status;

	public int getT_status()
	{
		return t_status;
	}

	public void setT_status(int t_status)
	{
		this.t_status = t_status;
	}

	public String getBidding_status()
	{
		return bidding_status;
	}

	public void setBidding_status(String bidding_status)
	{
		this.bidding_status = bidding_status;
	}

	public String getBidding_winner()
	{
		return bidding_winner;
	}

	public void setBidding_winner(String bidding_winner)
	{
		this.bidding_winner = bidding_winner;
	}

	public int getBidding_item_id()
	{
		return bidding_item_id;
	}

	public void setBidding_item_id(int bidding_item_id)
	{
		this.bidding_item_id = bidding_item_id;
	}

	public int getEmail_sent()
	{
		return email_sent;
	}

	public void setEmail_sent(int email_sent)
	{
		this.email_sent = email_sent;
	}
}
