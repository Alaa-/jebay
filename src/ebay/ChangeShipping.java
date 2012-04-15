package ebay;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

public class ChangeShipping {
String temp;

public String getTemp() {
	return temp;
}

public void setTemp(String temp) {
	this.temp = temp;
}
public String execute(){
	Map session=ActionContext.getContext().getSession();
	session.put("temp",temp);
	return "success";
}
}
