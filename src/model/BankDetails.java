package model;

import java.awt.List;
import java.sql.ResultSet;
import java.util.ArrayList;
//import java.util.ArrayList;

import myutil.DB;

public class BankDetails {
	public static ArrayList getAllBanks(){
		ArrayList lstBanks =new ArrayList();
		//String cardNumber=null;
		ResultSet rs = null;
		String sqlQuery = "select * from bank_details";

		rs = DB.readFromDB(sqlQuery);
		try{
			while(rs.next())
			{
				String bank_name = rs.getString("bank_name");
				lstBanks.add(bank_name);
			}
		}
		catch(Exception e){
			
		}
		return lstBanks;
	}
}
