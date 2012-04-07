package ebay;

import model.*;
import vo.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import java.sql.*;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;

public class Myebay
{
	ArrayList<PurchasehistoryVo> pur = new ArrayList<PurchasehistoryVo>();

	public ArrayList<PurchasehistoryVo> getPur()
	{
		return pur;
	}

	public void setPur(ArrayList<PurchasehistoryVo> pur)
	{
		this.pur = pur;
	}

	public String execute()
	{

		Map session = ActionContext.getContext().getSession();
		String username = session.get("username").toString();
		PurchaseHistory p = new PurchaseHistory();
		pur = p.gethistory(username);
		return "success";
	}

}
