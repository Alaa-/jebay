package ebay;

import java.util.Map;

import model.PaisaMapping;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class GetPaisa extends ActionSupport
{
	String paisaregister;
	public String execute()
	{
		Map session=ActionContext.getContext().getSession();
		String user_id=(String) session.get("User");
		PaisaMapping.getSellerPaisaStatus(user_id);
		return SUCCESS;
	}
	public String getPaisaregister()
	{
		return paisaregister;
	}
	public void setPaisaregister(String paisaregister)
	{
		this.paisaregister = paisaregister;
	}

}
