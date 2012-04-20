package ebay;

import java.sql.*;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

public class UpdateRating
{
	int item_id;
	float item_rating;

	public float getItem_rating()
	{
		return item_rating;
	}

	public void setItem_rating(float item_rating)
	{
		this.item_rating = item_rating;
	}

	public int getItem_id()
	{
		return item_id;
	}

	public void setItem_id(int item_id)
	{
		this.item_id = item_id;
	}

	public String execute() throws Exception
	{
		Connect c = new Connect();
		Map session = ActionContext.getContext().getSession();
		String username = session.get("username").toString();
		c.dml("insert into rating values('" + item_id + "','" + username + "','" + item_rating + "')");
		ResultSet rs = c.getResult("select avg(rating_rating) as avgrating from rating where rating_item_id='" + item_id + "' group by rating_item_id ");
		rs.next();
		float rating = rs.getFloat("avgrating");
		c.dml("update item_details set item_rating='" + rating + "'");
		return "success";
	}
}
