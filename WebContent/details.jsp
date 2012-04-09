<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<title>Details</title>
</head>
<body>
<s:action name='addcompactheader' executeResult='true' />
<h1 align="center">Details of search</h1> 
<form action="details">
<table>
<tr> 
	<th>Image</th>
    <th>Name</th>
    <th>Price</th>
    <th>Shipping Charge</th>
    
    
</tr>
<%-- <%@ page import="java.util.ArrayList,edu.iiitb.bookstore.models.*" %> --%>
<s:iterator value="buyDetails" >
<tr>
<td> <a href="BuyItNow.action?item_id=<s:property value='item_id'/>"> <img alt="" src="<s:property value='image'/>"/></td>
<td><a href="BuyItNow.action?item_id=<s:property value='item_id'/>"> <s:property value="item_name"/></a></td>
<td> Rs <s:property value="price" /></td>
<td> Rs <s:property value= "shipping_charge" /></td>
<td><s:property value="mode"/>
<td> 
<%-- <s:set name="mod" value="%{' <s:property value= " mode " /> '} "/>
<s:if test="#session['pdtMode']==1">Bid Now</s:if></td>
<td><s:elseif test="#session['pdtMode']==0">
  Buy Now
  </s:elseif></td>
  <s:if test="%{#mod=='1'}">Bid Now</s:if></td>
<s:elseif test="%{#mod=='0'}">
  Buy Now
  </s:elseif> --%>
</s:iterator>
<s:iterator value="bidDetails" >
<tr>
<td> <a href="bidding.action?item_id=<s:property value='item_id'/>"> <img alt="" src="<s:property value='image'/>"/></td>
<td><a href="bidding.action?item_id=<s:property value='item_id'/>"> <s:property value="item_name"/></a></td>
<td> Rs <s:property value="price" /></td>
<td> Rs <s:property value= "shipping_charge" /></td>
<td><s:property value="mode"/>
<td> 
<%-- <s:set name="mod" value="%{' <s:property value= " mode " /> '} "/>
<s:if test="#session['pdtMode']==1">Bid Now</s:if></td>
<td><s:elseif test="#session['pdtMode']==0">
  Buy Now
  </s:elseif></td>
  <s:if test="%{#mod=='1'}">Bid Now</s:if></td>
<s:elseif test="%{#mod=='0'}">
  Buy Now
  </s:elseif> --%>
</s:iterator>

</table>
</form>
</body>
</html>
<%@ include file="footer.jsp" %>