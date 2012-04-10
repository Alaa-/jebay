package ebay;

import model.*;
import vo.*;

import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import java.sql.*;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionContext;

public class BiddingStatus
{

	ArrayList<BiddingStatusVo> bidhis = new ArrayList<BiddingStatusVo>();

	public ArrayList<BiddingStatusVo> getBidhis()
	{
		return bidhis;
	}

	public void setBidhis(ArrayList<BiddingStatusVo> bidhis)
	{
		this.bidhis = bidhis;
	}

	public String execute()
	{

		Map session = ActionContext.getContext().getSession();
		String username = session.get("username").toString();
		BiddingStatusMo b = new BiddingStatusMo();
		bidhis = b.gethistory(username);
		return "success";
	}

}
