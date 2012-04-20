package ebay;

import java.io.File;
import java.util.Map;

import model.BiddingStatusMo;
import model.Image;
import model.ItemDetails;
import vo.ItemVo;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Save_item_details extends ActionSupport
{
	private String itemname;
	private int itemcatid;
	private int itemsubcatid;
	private String itemcondition;
	private int itemquantity;
	private String itemsellmode;
	private String itemimage;
	private int itemprice;
	private int itembaseprice;
	private int itemsc;
	private String duration;
	private File image;

	@Override
	public String execute()
	{
		int newGeneratedItemId = -1;
		try
		{

			ItemVo objitemvo = new ItemVo();
			objitemvo.setItem_name(itemname);
			objitemvo.setItem_category_id(itemcatid);
			objitemvo.setItem_subcategory_id(itemsubcatid);
			objitemvo.setItem_price(itemprice);
			System.out.println(itembaseprice); // printing value to check....
			if (itemsellmode.equals("1"))
			{
				objitemvo.setItem_price(itembaseprice);
			}
			objitemvo.setItem_baseprice(itembaseprice);
			objitemvo.setItem_mode(itemsellmode);
			System.out.println("item sell mode is :" + itemsellmode + ":");
			Map<String, Object> session = ActionContext.getContext().getSession();
			objitemvo.setItem_seller((String) session.get("User"));
			if (itemsellmode.equals("1"))
			{
				itemquantity = 1;
			}
			objitemvo.setItem_quantity(itemquantity);
			System.out.println("item quantity is :" + itemquantity + ":");
			objitemvo.setItem_condition(itemcondition);
			objitemvo.setItem_endtime(duration);
			objitemvo.setItem_shipping_charge(itemsc);

			newGeneratedItemId = ItemDetails.saveItemDetails(objitemvo);
			Image.saveImage(newGeneratedItemId, getImage());
			{
				if (itemsellmode != null && itemsellmode.equals("1"))

					System.out.println("Item is bidding item, init bidding status");
				BiddingStatusMo.initBiddingStatus(newGeneratedItemId);
			}
			System.out.println("Item details saved.");
		}
		catch (Exception ex)
		{
			System.out.println("Exception in save item details, :53:");
			ex.printStackTrace();
		}
		return SUCCESS;
	}

	public String getItemname()
	{
		return itemname;
	}

	public void setItemname(String itemname)
	{
		this.itemname = itemname;
	}

	public int getItemcatid()
	{
		return itemcatid;
	}

	public void setItemcatid(int itemcatid)
	{
		this.itemcatid = itemcatid;
	}

	public int getItemsubcatid()
	{
		return itemsubcatid;
	}

	public void setItemsubcatid(int itemsubcatid)
	{
		this.itemsubcatid = itemsubcatid;
	}

	public String getItemcondition()
	{
		return itemcondition;
	}

	public void setItemcondition(String itemcondition)
	{
		this.itemcondition = itemcondition;
	}

	public int getItemquantity()
	{
		return itemquantity;
	}

	public void setItemquantity(int itemquantity)
	{
		this.itemquantity = itemquantity;
	}

	public String getItemsellmode()
	{
		return itemsellmode;
	}

	public void setItemsellmode(String itemsellmode)
	{
		this.itemsellmode = itemsellmode;
	}

	public String getItemimage()
	{
		return itemimage;
	}

	public void setItemimage(String itemimage)
	{
		this.itemimage = itemimage;
	}

	public int getItemprice()
	{
		return itemprice;
	}

	public void setItemprice(int itemprice)
	{
		this.itemprice = itemprice;
	}

	public int getItembaseprice()
	{
		return itembaseprice;
	}

	public void setItembaseprice(int itembaseprice)
	{
		this.itembaseprice = itembaseprice;
	}

	public int getItemsc()
	{
		return itemsc;
	}

	public void setItemsc(int itemsc)
	{
		this.itemsc = itemsc;
	}

	public String getDuration()
	{
		return duration;
	}

	public void setDuration(String duration)
	{
		this.duration = duration;
	}

	public File getImage()
	{
		return image;
	}

	public void setImage(File image)
	{
		this.image = image;
	}
}
