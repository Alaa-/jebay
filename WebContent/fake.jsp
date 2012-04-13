<%@ page import="java.sql.*"%>
<%@ page import="ebay.*"%>
<html>
<body>

	<!-- <a href="bidding.action?item_id=2">click here</a> -->
	<br>
	<form name="details" method="post" action="fake.jsp">
		Select the account through which the buyer has paid the amount:
		<%
		{
			Connect c = new Connect();

			ResultSet rs = c.getResult("select * from paisapay_mapping");
			ResultSet rs3 = c.getResult("select * from account_details");
	%>
		<select name="buyer_id">
			<%
				while (rs3.next()) {
			%><option
				value="<%=rs3.getString("account_holder")%>">
				<%
					out.print(rs3.getString("account_holder"));
				%>
			</option>
			<%
				}
			%>
		</select> <br> Select the seller's username: <select name="seller_id">
			<%
				while (rs.next()) {
			%><option value="<%=rs.getString("seller_id")%>">
				<%
					out.print(rs.getString("seller_id"));
				%>
			</option>
			<%
				}
			%>
		</select>
		<%
			}
		%>
		<br>
		<input type="submit">
	</form>
	

	<%
		Connect c=new Connect();
		String buyer_id = request.getParameter("buyer_id") + "";
		String seller_id = request.getParameter("seller_id") + "";
		if (!buyer_id.equals("null")) {
			ResultSet rs4 = c.getResult("select * from account_details where account_holder='"+ buyer_id + "'");
			ResultSet rs5 = c.getResult("select * from account_details where account_holder='"+ seller_id + "'");
		
		{
			rs4.next();
			rs5.next();
	%>
	<table>
		<tr bgcolor="663333">

			<th><font color="white"><% out.print(rs4.getString("account_holder"));%>'s account balance</font>
			</th>
			<th><font color="white"><% out.print(rs5.getString("account_holder"));%>'s account balance</font>
			</th>

		</tr>
	
		<tr>
			<td>
				<%
					out.print(rs4.getString("account_balance"));
				%>
			</td>
			<td>
				<%
					out.print(rs5.getString("account_balance"));
				%>
			</td>
		</tr>
		<%}} %>
	</table>
</body>
</html>