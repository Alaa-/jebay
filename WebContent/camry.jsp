<%@ page import="java.sql.*"%>
<%@ page import="ebay.*"%>

<html>
<head>
<script type="text/javascript">
var t;
function reload(){
	t=setTimeout("loadthis()",10000);
}

function loadthis(){
	window.location.href="#";
	reload();
}
</script>

</head>
<body onload="reload()">
<div><%@ include file="fake.jsp" %></div>


<% 
ResultSet rs=c.getResult("select sum(paisa_amount) as amt from paisapay_details,transaction_details as t where paisa_t_id=t.t_id and t.t_status<>3");
rs.next();
%>
<h3>The current Paisa Pay Total of unfinished transactions is : </h3><h2>
<% 
out.print(rs.getInt("amt"));
%>
</h2>
</body>
</html>