package ebay;

import model.*;
import vo.*;

import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import java.sql.*;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;

public class EbaySummary
{

	ArrayList<PurchasehistoryVo> sum = new ArrayList<PurchasehistoryVo>();

	public ArrayList<PurchasehistoryVo> getSum()
	{
		return sum;
	}

	public void setSum(ArrayList<PurchasehistoryVo> sum)
	{
		this.sum = sum;
	}

	public String execute()
	{

		Map session = ActionContext.getContext().getSession();
		String username = session.get("username").toString();
		EbaySummaryMo m = new EbaySummaryMo();
		sum = m.gethistory(username);
		return "success";
	}

}
