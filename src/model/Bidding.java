package model;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import myutil.*;
import vo.*;

public class Bidding {
	
	public static ArrayList<BiddingVo> getAllBids(int itemid)
	{
		ArrayList<BiddingVo> bidList = new ArrayList<BiddingVo>();
		ResultSet rs = null;
		
		String sqlQuery = "select * from bidding where itemid="+itemid;
		String sqlQuery2="select * from item where itemid="+itemid;
		rs = DB.readFromDB(sqlQuery);
		try
		{
			while (rs.next())
			{
				BiddingVo objcatvo = new BiddingVo();
				objcatvo.setBuyerid(rs.getInt("buyerid"));
				objcatvo.setItemid(rs.getInt("itemid"));
				bidList.add(objcatvo);
			}
			return bidList;
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			DB.close(rs);
		}

		return null;
	}

}
