package ebay;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.opensymphony.xwork2.ActionSupport;

public class sendmail extends ActionSupport{
public String execute()
{
	Connect c=new Connect();
	String query1,query2,query3,query4,query5;
	int item_id;
	query1="select * from biddingstatus where bidding_status='2' and email_sent=0";
	String winner = null;
	ResultSet rs2,rs3;
	try {
		ResultSet rs1=c.getResult(query1);
		while(rs1.next())
		{
			item_id=rs1.getInt("bidding_item_id");
			query2="select * from bidding_details where bidding_bid=(select max(bidding_bid) from bidding_details where bidding_item_id="+item_id+")";
			rs2=c.getResult(query2);
			if(rs2.next())
			{
				winner=rs2.getString("bidding_buyer");
				query3="update bidding_details set bidding_buyer='"+winner+"' where bidding_item_id="+item_id;
				query4="update bidding_details set email_sent=1 where bidding_item_id="+item_id;
				c.dml(query3);
				c.dml(query4);
				SendMail1 s = new SendMail1();
				query5="select user_email from user_details where user_id="+winner;
				rs3=c.getResult(query5);
				rs3.next();
				String  email=rs3.getString("user_email");
				s.to = email;
				s.subject = "JEBAY CONFIRMATION LINK";
				s.message = "<a href=\"http://192.16.11.80:8080/Jebay/Confirmation.action?cid=" + winner + "\">CLICK HERE </a>TO CONFIRM YOUR JEBAY REGISTRATION";
				try {
					s.main();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
		}
		
		
		
		
		
		
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	//query2="update biddingstatus";
	return SUCCESS;
}
}
