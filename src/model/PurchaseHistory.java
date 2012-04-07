package model;

import model.*;
import vo.*;
import java.util.*;
import ebay.*;
import java.sql.*;

public class PurchaseHistory
{
	public ArrayList<PurchasehistoryVo> pur = new ArrayList<PurchasehistoryVo>();

	public ArrayList<PurchasehistoryVo> gethistory(String username)
	{
		try
		{
			Connect c = new Connect();
			ResultSet rs = c.getResult("select * from transaction_details,item_details where t_item_id=item_id and t_buyer='" + username + "'");
			while (rs.next())
			{
				PurchasehistoryVo p = new PurchasehistoryVo();
				p.setItem_id(rs.getInt("item_id"));
				p.setItem_name(rs.getString("item_name"));
				p.setItem_price(rs.getInt("item_price"));
				p.setT_seller(rs.getString("t_seller"));
				p.setT_timestamp(rs.getString("t_timestamp"));
				pur.add(p);

			}
			return pur;
		}
		catch (Exception e)
		{
			e.printStackTrace();
			return null;
		}

	}
}
