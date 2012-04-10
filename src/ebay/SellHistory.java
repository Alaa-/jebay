package ebay;

import model.*;
import vo.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import java.sql.*;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;

public class SellHistory
{
	ArrayList<PurchasehistoryVo> sellhis = new ArrayList<PurchasehistoryVo>();

	public String execute()
	{

		Map session = ActionContext.getContext().getSession();
		String username = session.get("username").toString();
		SellHistoryMo i = new SellHistoryMo();
		sellhis = i.gethistory(username);
		return "success";
	}

	public ArrayList<PurchasehistoryVo> getSellhis()
	{
		return sellhis;
	}

	public void setSellhis(ArrayList<PurchasehistoryVo> sellhis)
	{
		this.sellhis = sellhis;
	}

}
