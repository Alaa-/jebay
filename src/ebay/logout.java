
package ebay;


import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class logout extends ActionSupport
{

	@Override
	public String execute() throws Exception
	{
		String user = "";
		Map session = ActionContext.getContext().getSession();
		if (session.containsKey("User"))
			user = (session.get("User").toString());
		session.remove("User");
		ServletActionContext.getRequest().getSession().invalidate();
		return SUCCESS;
	}
}
