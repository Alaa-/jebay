package ebay;

import com.opensymphony.xwork2.ActionSupport;

public class Getform extends ActionSupport
{
	String fcat;

	@Override
	public String execute()
	{
		System.out.println("Im printing what i got" + fcat);
		System.out.println("I came here.");
		return "mobile";
	}

	public String getFcat()
	{
		return fcat;
	}

	public void setFcat(String fcat)
	{
		this.fcat = fcat;
	}

}
