package ebay;

import model.*;
import vo.*;
import javax.servlet.*;
import javax.servlet.http.*;

import java.util.*;
import java.sql.*;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Myebay extends ActionSupport
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

	@Override
	public String execute()
	{
		String username;
		try
		{
			Map session = ActionContext.getContext().getSession();
			username = session.get("username").toString();
		}
		catch (Exception ex)
		{
			return ERROR;
		}
		PurchaseHistory p = new PurchaseHistory();
		pur = p.gethistory(username);
		return "success";
	}

}
