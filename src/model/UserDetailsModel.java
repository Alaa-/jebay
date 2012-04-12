package model;

import java.sql.ResultSet;
import java.util.ArrayList;

import myutil.DB;
import vo.UserDetailsVo;

public class UserDetailsModel {
	
	public static ArrayList getUserDetails(String user_id)
	{
		ArrayList lstUserDetails = new ArrayList();
		String user_home_address,user_city,user_first_name,user_last_name,user_state;

		ResultSet rs = null;
		String sqlQuery = "select * from user_details where user_id = '"+user_id+"'";
		rs = DB.readFromDB(sqlQuery);
		try
		{
			if (rs.next())
			{
				user_first_name=rs.getString("user_first_name");
				user_last_name=rs.getString("user_last_name");
				user_home_address=rs.getString("user_home_address");
				user_city=rs.getString("user_city");
				user_state=rs.getString("user_state");
				
				System.out.println(user_id);
				UserDetailsVo uvo = new UserDetailsVo(user_home_address, user_city,user_first_name,user_last_name,user_state);
				lstUserDetails.add(uvo);
			}
		}
		catch(Exception e){}
		return lstUserDetails;
	}
}
