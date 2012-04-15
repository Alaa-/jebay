package ebay;

import java.sql.ResultSet;
import java.util.Map;

import model.PaisaMapping;
import myutil.DB;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class GetPaisaForm extends ActionSupport
{
	int paisaregister;
	String acc_holder,acc_no,bank_name;
	public String execute()
	{
		Map<String, Object> session=ActionContext.getContext().getSession();
		String user_id=(String) session.get("User");
		ResultSet rs=null;
		paisaregister=PaisaMapping.getSellerPaisaStatus(user_id);
		if(paisaregister==1)
		{
			try{
				rs=PaisaMapping.getPaisaMappingDetails(user_id);
				if(rs!=null && rs.next())
				{
					acc_holder=rs.getString("account_holder");
					acc_no=rs.getString("account_no");
					bank_name=rs.getString("bank_name");
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			finally
			{
				DB.close(rs);
			}
		}
		return SUCCESS;
	}
	public int getPaisaregister()
	{
		return paisaregister;
	}
	public void setPaisaregister(int paisaregister)
	{
		this.paisaregister = paisaregister;
	}
	public String getAcc_holder()
	{
		return acc_holder;
	}
	public void setAcc_holder(String acc_holder)
	{
		this.acc_holder = acc_holder;
	}
	public String getAcc_no()
	{
		return acc_no;
	}
	public void setAcc_no(String acc_no)
	{
		this.acc_no = acc_no;
	}
	public String getBank_name()
	{
		return bank_name;
	}
	public void setBank_name(String bank_name)
	{
		this.bank_name = bank_name;
	}

}
