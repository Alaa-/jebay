package model;

import model.*;
import vo.*;
import java.util.*;
import ebay.*;
import java.sql.*;

public class PurchaseHistory
{
	public String shipping_id;

	public ArrayList<PurchasehistoryVo> pur = new ArrayList<PurchasehistoryVo>();

	public ArrayList<PurchasehistoryVo> gethistory(String username)
	{
		try
		{
			Connect c = new Connect();
			int t_id;
			ResultSet rs = c.getResult("select * from transaction_details,item_details where t_item_id=item_id and t_buyer='" + username + "'");

			while (rs.next())
			{
				PurchasehistoryVo p = new PurchasehistoryVo();
				t_id = rs.getInt("t_id");
				System.out.println(t_id);
				ResultSet rs1 = c.getResult("select * from courier_details where courier_t_id=" + t_id);
				if (rs1.next())
				{
					p.setCourier_name(rs1.getString("courier_name"));
					p.setCourier_shipping_id(rs1.getInt("courier_shipping_id"));
					System.out.println(rs1.getString("courier_name"));
				}

				p.setItem_id(rs.getInt("item_id"));
				p.setItem_name(rs.getString("item_name"));
				p.setItem_price(rs.getInt("item_price"));
				p.setT_seller(rs.getString("t_seller"));
				p.setT_status(rs.getInt("t_status"));
				p.setT_id(rs.getInt("t_id"));
				p.setT_quantity(rs.getInt("t_quantity"));
				p.setT_timestamp(rs.getString("t_timestamp"));
				p.setItem_totalprice(rs.getInt("t_quantity") * rs.getInt("item_price") + rs.getInt("item_shipping_charge"));

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
