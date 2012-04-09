package ebay;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

public class Getform extends ActionSupport
{
	int fcat, fsubcat;
	List<String> brands, types;

	@Override
	public String execute()
	{
		System.out.println("Im printing what i got " + fcat + " " + fsubcat);
		if (fcat == 1)
		{
			brands = new ArrayList<String>();
			types = new ArrayList<String>();
			brands.add("Apple");
			brands.add("HTC");
			brands.add("Motorola");
			brands.add("Nokia");
			brands.add("Micromax");
			brands.add("Samsung");
			brands.add("Others");

			types.add("Budget");
			types.add("Classic");
			types.add("Exclusive");
			types.add("Smartphone");

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

	public List<String> getBrands()
	{
		return brands;
	}

	public void setBrands(List<String> brands)
	{
		this.brands = brands;
	}

	public List<String> getTypes()
	{
		return types;
	}

	public void setTypes(List<String> types)
	{
		this.types = types;
	}

}
