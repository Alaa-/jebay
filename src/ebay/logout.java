
package ebay;


import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ActionContext;
import java.util.*;
import java.sql.*;

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
		return SUCCESS;
	}
}
