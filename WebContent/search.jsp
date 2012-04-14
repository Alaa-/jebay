<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*,ebay.*" %>
<form action="Search.action" method="get">
<table align="center">
<tr><td><input type="text" name="keyword" required="true"/></td>
<td>
<%

Connect c=new Connect();
ResultSet rs=c.getResult("select * from category_details");
int count=0;
%>
<select name="category">
<option value="0">ALL CATEGORIES</option>

<%
try{
while(rs.next())
{
	count++;
%>
<option value="<%= count%>"><%= rs.getString("category_name") %></option>
<%
}
}
catch(Exception e){e.printStackTrace();}
%>
</select></td>


<td><input type="submit" value="Search" /></td>
</tr>

</tr>


</table>
</form>
</body>
</html>