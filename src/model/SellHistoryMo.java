package model;

import model.*;
import vo.*;

import java.util.*;
import ebay.*;

import java.sql.*;

public class SellHistoryMo
{
	public ArrayList<PurchasehistoryVo> sellhis = new ArrayList<PurchasehistoryVo>();

	public ArrayList<PurchasehistoryVo> gethistory(String username)
	{
		try
		{
			Connect c = new Connect();
			ResultSet rs = c.getResult("select * from transaction_details,item_details where t_item_id=item_id and t_seller='" + username + "'");
			while (rs.next())
			{
				PurchasehistoryVo i = new PurchasehistoryVo();
				i.setItem_id(rs.getInt("item_id"));
				i.setItem_name(rs.getString("item_name"));
				i.setItem_price(rs.getInt("item_price"));
				i.setT_buyer(rs.getString("t_buyer"));
				i.setT_status(rs.getString("t_status"));
				i.setT_id(rs.getInt("t_id"));
				i.setT_timestamp(rs.getString("t_timestamp"));
				sellhis.add(i);

			}
			return sellhis;
		}
		catch (Exception e)
		{
			e.printStackTrace();
			return null;
		}

	}

}
