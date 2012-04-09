/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ebay;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ActionContext;
import java.util.*;
import java.io.File;
import java.sql.*;

import vo.ItemVo;

import model.ItemDetails;
import model.Mobile;

/**
 * 
 * @author Rohit
 */
public class Save_mobile_detail extends ActionSupport
{

	private File image;
	private String imageContentType; // The content type of the file
	private String imageFileName; // The uploaded file name
	private String mobilename;
	private String mobilebrand;
	private String mobiletype;
	private String mobileos;
	private String camera;
	private String mobilecondition;
	private String mobilesellmode;
	private String mobileimage;
	private String duration;
	private int mobilesubcatid;
	private int mobilequantity;
	private int mobileprice;
	private int mobilebaseprice;
	private int mobilesc;
	private String feature;

	public String getCamera()
	{
		return camera;
	}

	public void setCamera(String camera)
	{
		this.camera = camera;
	}

	public String getFeature()
	{
		return feature;
	}

	public void setFeature(String feature)
	{
		this.feature = feature;
	}

	public String getMobilebrand()
	{
		return mobilebrand;
	}

	public void setMobilebrand(String mobilebrand)
	{
		this.mobilebrand = mobilebrand;
	}

	public String getMobilecondition()
	{
		return mobilecondition;
	}

	public void setMobilecondition(String mobilecondition)
	{
		this.mobilecondition = mobilecondition;
	}

	public String getMobileimage()
	{
		return mobileimage;
	}

	public void setMobileimage(String mobileimage)
	{
		this.mobileimage = mobileimage;
	}

	public String getMobilename()
	{
		return mobilename;
	}

	public void setMobilename(String mobilename)
	{
		this.mobilename = mobilename;
	}

	public int getMobileprice()
	{
		return mobileprice;
	}

	public void setMobileprice(int mobileprice)
	{
		this.mobileprice = mobileprice;
	}

	public int getMobilequantity()
	{
		return mobilequantity;
	}

	public void setMobilequantity(int mobilequantity)
	{
		this.mobilequantity = mobilequantity;
	}

	public int getMobilesc()
	{
		return mobilesc;
	}

	public void setMobilesc(int mobilesc)
	{
		this.mobilesc = mobilesc;
	}

	public String getMobiletype()
	{
		return mobiletype;
	}

	public void setMobiletype(String mobiletype)
	{
		this.mobiletype = mobiletype;
	}

	@Override
	public String execute() throws Exception
	{
		int newGeneratedItemId = -1;
		try
		{

			ItemVo objitemvo = new ItemVo();
			objitemvo.setItem_name(mobilename);
			objitemvo.setItem_subcategory_id(mobilesubcatid);
			objitemvo.setItem_price(mobileprice);
			System.out.println(mobilebaseprice); // printing value to check....
			objitemvo.setItem_baseprice(mobilebaseprice);
			objitemvo.setItem_mode(mobilesellmode);
			Map session = ActionContext.getContext().getSession();
			objitemvo.setItem_seller((String) session.get("User"));
			objitemvo.setItem_quantity(mobilequantity);
			objitemvo.setItem_condition(mobilecondition);
			objitemvo.setItem_endtime(duration);
			objitemvo.setItem_shipping_charge(mobilesc);

			newGeneratedItemId = ItemDetails.saveItemDetails(objitemvo);

			Mobile.saveMobileDetails(newGeneratedItemId, mobilebrand, mobileos, camera, mobiletype);

			int total_price = getMobileprice() + getMobilesc();
		}
		catch (Exception e)
		{
			System.out.println(e);
		}
		return SUCCESS;
	}

	public String getMobileos()
	{
		return mobileos;
	}

	public void setMobileos(String mobileos)
	{
		this.mobileos = mobileos;
	}

	public String getDuration()
	{
		return duration;
	}

	public void setDuration(String duration)
	{
		this.duration = duration;
	}

	public int getMobilesubcatid()
	{
		return mobilesubcatid;
	}

	public void setMobilesubcatid(int mobilesubcatid)
	{
		this.mobilesubcatid = mobilesubcatid;
	}

	public File getImage()
	{
		return image;
	}

	public void setImage(File image)
	{
		this.image = image;
	}

	public String getImageContentType()
	{
		return imageContentType;
	}

	public void setImageContentType(String imageContentType)
	{
		this.imageContentType = imageContentType;
	}

	public String getImageFileName()
	{
		return imageFileName;
	}

	public void setImageFileName(String imageFileName)
	{
		this.imageFileName = imageFileName;
	}

	public String getMobilesellmode()
	{
		return mobilesellmode;
	}

	public void setMobilesellmode(String mobilesellmode)
	{
		this.mobilesellmode = mobilesellmode;
	}

	public int getMobilebaseprice()
	{
		return mobilebaseprice;
	}

	public void setMobilebaseprice(int mobilebaseprice)
	{
		this.mobilebaseprice = mobilebaseprice;
	}
}
