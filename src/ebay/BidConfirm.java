package ebay;

import com.opensymphony.xwork2.ActionSupport;

public class BidConfirm extends ActionSupport{
int item_id;

public int getItem_id() {
	return item_id;
}

public void setItem_id(int item_id) {
	this.item_id = item_id;
}
public String execute()
{
	BidConfirm bc=new BidConfirm();
	bc.setItem_id(item_id);
	return SUCCESS;
}

}
