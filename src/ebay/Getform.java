package ebay;

import com.opensymphony.xwork2.ActionSupport;

public class Getform extends ActionSupport
{
	int fcat, fsubcat;

	@Override
	public String execute()
	{
		System.out.println("Im printing what i got" + fcat + " " + fsubcat);
		if (fcat == 1)
		{
			return "mobile";
		}
		return ERROR;

	}

	public int getFcat()
	{
		return fcat;
	}

	public void setFcat(int fcat)
	{
		this.fcat = fcat;
	}

	public int getFsubcat()
	{
		return fsubcat;
	}

	public void setFsubcat(int fsubcat)
	{
		this.fsubcat = fsubcat;
	}

}
