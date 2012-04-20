package search;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Map;

import vo.ItemVo;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import ebay.Connect;

public class Paraaction extends ActionSupport
{
	String condition, mode, order, entity;

	public String getOrder()
	{
		return order;
	}

	public void setOrder(String order)
	{
		this.order = order;
	}

	public String getEntity()
	{
		return entity;
	}

	public void setEntity(String entity)
	{
		this.entity = entity;
	}

	String min, max;

	public String getMin()
	{
		return min;
	}

	public void setMin(String min)
	{
		this.min = min;
	}

	public String getMax()
	{
		return max;
	}

	public void setMax(String max)
	{
		this.max = max;
	}

	int min1, max1;

	ArrayList<ItemVo> arr = new ArrayList<ItemVo>();

	public ArrayList<ItemVo> getArr()
	{
		return arr;
	}

	public void setArr(ArrayList<ItemVo> arr)
	{
		this.arr = arr;
	}

	String globalquery, wherequery;

	public String getCondition()
	{
		return condition;
	}

	public void setCondition(String condition)
	{
		this.condition = condition;
	}

	public String getMode()
	{
		return mode;
	}

	public void setMode(String mode)
	{
		this.mode = mode;
	}

	@Override
	public String execute() throws Exception
	{
		Map session = ActionContext.getContext().getSession();
		int subcategory;
		String keyword = session.get("keyword").toString();
		String ordering = " ";
		if (entity.equals("price"))
		{
			ordering += "order by item_price";
			if (order.equals("desc"))
			{
				ordering += " desc";
			}

		}
		if (entity.equals("time"))
		{
			ordering += "order by item_endtime";
			if (order.equals("desc"))
			{
				ordering += " desc";
			}

		}
		if (entity.equals("rating"))
		{
			ordering += "order by item_rating";
			if (order.equals("desc"))
			{
				ordering += " desc";
			}

		}
		int category = Integer.parseInt(session.get("category").toString());
		if (session.get("subcategory") != null && !(session.get("subcategory").equals("")))
		{
			System.out.println((String) session.get("subcategory"));
			subcategory = Integer.parseInt(session.get("subcategory").toString());
			wherequery = "where item_subcategory_id='" + subcategory + "' ";
		}
		else
		{
			wherequery = "where 1=1 ";
		}
		if (category == 0)
		{
			wherequery += "and item_name like '%" + keyword + "%' and timediff(item_endtime,now())>0 and item_quantity>0 ";
		}
		else
		{
			wherequery += "and item_name like '%" + keyword + "%' and item_category_id='" + category + "' and timediff(item_endtime,now())>0 and item_quantity>0 ";
		}
		if (condition != null)
		{

			wherequery += "and item_condition='" + condition + "'";

		}
		if (mode != null)
		{

			wherequery += "and item_mode='" + mode + "'";
			System.out.println("hello" + mode);

		}
		if (min.length() != 0 && max.length() != 0)
		{
			min1 = Integer.parseInt(min);
			max1 = Integer.parseInt(max);
			wherequery += "and item_price between '" + min1 + "' and '" + max1 + "'";
		}
		Connect c = new Connect();
		globalquery = "select *,concat('',timediff(item_endtime,now())) as diff from item_details " + wherequery;
		System.out.println(globalquery);
		ResultSet rs = c.getResult(globalquery + ordering);
		while (rs.next())
		{
			ItemVo i = new ItemVo();
			i.setItem_id(rs.getInt("item_id"));
			i.setItem_name(rs.getString("item_name"));
			if (rs.getString("item_mode").equals("0"))
			{
				i.setItem_mode("Buy It Now");
			}
			else
			{
				System.out.println("hiiii");
				i.setItem_mode("Bidding");
			}
			i.setItem_condition(rs.getString("item_condition"));
			i.setItem_price(rs.getInt("item_price"));
			String diff = rs.getString("diff");
			String[] a = diff.split(":");
			int days = (Integer.parseInt(a[0]) / 24);
			int hours = 0;
			if (days > 0)
			{
				hours = Integer.parseInt(a[0]) - days * 24;
			}
			else
			{
				hours = Integer.parseInt(a[0]);
			}
			int minutes = Integer.parseInt(a[1]);
			String str = days + "D " + hours + "H " + minutes + "M ";
			i.setItem_endtime(str);
			i.setItem_quantity(rs.getInt("item_quantity"));
			i.setItem_seller(rs.getString("item_seller"));
			i.setItem_rating(rs.getFloat("item_rating"));
			arr.add(i);
		}
		if (arr.size() == 0)
		{
			addActionError("NO RESULTS FOUND");
		}
		return "success";

	}

}
