<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Purchase History</title>

<link href="css/global.css" rel="stylesheet"/>

<script src="script/jQuery.js" type="text/javascript"></script>
<script src="script/app.js" type="text/javascript"></script>
<script type="text/javascript">

function updaterating(a){
	var b=document.getElementById(a).value;
	//alert(b);
	window.location.href="UpdateRating.action?item_id="+a+"&item_rating="+b;
}
</script>
</head>

<body>


	<%@include file="header.jsp"%> 

<%@ page import="java.sql.*,ebay.*" %>
<%
String username=session.getAttribute("username").toString();
System.out.println(username);
Connect c=new Connect();
ResultSet rs=c.getResult("select distinct(t_item_id),t_item_id,item_name,item_id from transaction_Details,item_details where t_status='3' and t_item_id=item_id");
%>
<table border="1">
<tr><th>item id</th><th>item name</th><th>rating</th></tr>
<%
while(rs.next()){
	int t_item_id=rs.getInt("t_item_id");
	Connect c1=new Connect();
	%>
	<tr><td><%= rs.getString("item_id") %></td>
	<td><%= rs.getString("item_name") %></td>
	<%
	ResultSet rs1=c1.getResult("select * from rating where rating_item_id='"+t_item_id+"' and rating_username='"+username+"'");
	
	if(rs1.next()){
		String str="you have already rated";
		out.println("<td>"+str+"</td></tr>");
	}
	else{
		%>
		<td><select id=<%= rs.getInt("t_item_id") %>>
		<option value="1">1</option>
		<option value="2">2</option>
		<option value="3">3</option>
		<option value="4">4</option>
		<option value="5">5</option>
		</select></td><td><input type="button" value="rate" onclick="updaterating('<%= rs.getInt("t_item_id") %>')"/></td></tr>
	<% 
	}
}

%>
	
	
	<div><%@include file="footer.jsp"%></div>
</body>
</html>
