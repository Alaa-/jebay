package ebay;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

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
		int trans = (Integer.parseInt(session.get("t_id").toString()));
		System.out.println(trans);
		Connect c = new Connect();
		c.dml("update transaction_details set t_status=2 where t_id='" + trans + "'");
		return "success";

	}
}
