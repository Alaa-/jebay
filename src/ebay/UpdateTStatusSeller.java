package ebay;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.*;
import java.sql.Statement;
import java.util.Map;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UpdateTStatusSeller
{
	int tid;

	public int getTid()
	{
		return tid;
	}

	public void setTid(int tid)
	{
		this.tid = tid;
	}

	public String execute() throws Exception
	{
		Map session = ActionContext.getContext().getSession();
		int trans = (int) session.get("t_id");
		System.out.println(trans);
		Connect c = new Connect();
		c.dml("update transaction_details set t_status=2 where t_id='" + trans + "'");
		return "success";

	}
}
