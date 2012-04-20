package ebay;

import java.util.Map;

import model.Account;
import model.PaisaMapping;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class SavePaisaForm extends ActionSupport
{
	String acholdername, acnumber;

	int paisaregister;

	@Override
	public String execute()
	{
		int accid = Account.verifyAccount(acnumber, acholdername);
		if (accid != -1)
		{
			Map<String, Object> session = ActionContext.getContext().getSession();
			String user = (String) session.get("User");
			PaisaMapping.savePaisaMapping(user, accid);
			return SUCCESS;
		}
		else
		{
			Map<String, Object> session = ActionContext.getContext().getSession();
			String user_id = (String) session.get("User");
			addActionError("Account can not be verified");
			paisaregister = PaisaMapping.getSellerPaisaStatus(user_id);
			return ERROR;
		}

	}

	public String getAcholdername()
	{
		return acholdername;
	}

	public void setAcholdername(String acholdername)
	{
		this.acholdername = acholdername;
	}

	public String getAcnumber()
	{
		return acnumber;
	}

	public void setAcnumber(String acnumber)
	{
		this.acnumber = acnumber;
	}

	public int getPaisaregister()
	{
		return paisaregister;
	}

	public void setPaisaregister(int paisaregister)
	{
		this.paisaregister = paisaregister;
	}

}
