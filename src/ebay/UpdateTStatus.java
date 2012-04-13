package ebay;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.*;
import java.sql.Statement;
import java.util.Map;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UpdateTStatus
{
	int id;

	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public String execute() throws Exception
	{
		int balance = 0;
		String sellerid = null;
		int selleraccountid = 0;
		Connect c = new Connect();
		c.dml("update transaction_details set t_status=3 where t_id='" + id + "'");
		ResultSet rs = c.getResult("select * from paisapay_details where paisa_t_id='" + id + "'");
		while (rs.next())
		{
			balance = rs.getInt("paisa_amount");

		}
		rs = c.getResult("select * From transaction_Details where t_id='" + id + "'");
		if (rs.next())
		{
			sellerid = rs.getString("t_seller");
		}
		rs = c.getResult("select * from paisapay_mapping where seller_id='" + sellerid + "'");
		if (rs.next())
		{
			selleraccountid = rs.getInt("seller_acc_id");
		}
		c.dml("update account_details set account_balance= account_balance +'" + balance + "' where account_id='" + selleraccountid + "' ");
		return "success";

	}
}
