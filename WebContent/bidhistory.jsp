<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ taglib prefix="s" uri="/struts-tags"%>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table>
<s:iterator value="arr">
<tr>
<td><s:property value="bidding_item_id"></s:property></td>
<td><s:property value="bidding_id"></s:property></td>
<td><s:property value="bidding_buyer"></s:property></td>
<td><s:property value="bidding_bid"></s:property></td>
<td><s:property value="bidding_timestamp"></s:property></td>
</tr>
</s:iterator>
</table>
</body>
</html>