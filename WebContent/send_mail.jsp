<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="ebay.*" %>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
var t;
function reload(){
	t=setTimeout("loadthis()",10000);
}

function loadthis(){
	window.location.href="send_mail.jsp";
	reload();
}
</script>
</head>
<body onload="reload()">
Mail Sent..!!

<%

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
			query3="update biddingstatus set bidding_winner='"+winner+"' where bidding_item_id="+item_id;
			query4="update biddingstatus set email_sent=1 where bidding_item_id="+item_id;
			c.dml(query3);
			c.dml(query4);
			SendMail1 s = new SendMail1();
			query5="select * from user_details where user_id='"+winner+"'";
			rs3=c.getResult(query5);
			rs3.next();
			String  email=rs3.getString("user_email");
			
			s.to = email;
			s.subject = "Congratulations "+"Mr/Ms."+winner+"  You have won the bid";
			s.message = "<a href=\"http://localhost:8080/Jebay/Intermediate.action?winnerid=" + winner + "&item_id="+item_id+"\">Click here </a> To Confirm your Bid";
			try {
				s.main();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}finally
{}

%>
</body>
</html>