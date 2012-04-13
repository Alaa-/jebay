package ebay;

import java.util.*;
import java.sql.*;
import java.util.Map;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ShippingDetail
{
	int shippingid, t_id;
	String courier_name;

	public int getT_id()
	{
		return t_id;
	}

	public void setT_id(int t_id)
	{
		this.t_id = t_id;
	}

	public int getShippingid()
	{
		return shippingid;
	}

	public void setShippingid(int shippingid)
	{
		this.shippingid = shippingid;
	}

	public String getCourier_name()
	{
		return courier_name;
	}

	public void setCourier_name(String courier_name)
	{
		this.courier_name = courier_name;
	}

	public String execute() throws Exception
	{
		Map session = ActionContext.getContext().getSession();
		session.put("t_id", t_id);
		session.put("shippingid", shippingid);
		String user_id = session.get("username").toString();
		System.out.println(user_id);
		Connect c = new Connect();
		c.dml("insert into courier_details(courier_seller_id,courier_name,courier_shipping_id) values('" + user_id + "','" + courier_name + "','" + shippingid + "')");
		return "success";

	}
}
