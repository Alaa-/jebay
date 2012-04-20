<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
 td{
            text-align:center;
           
            }
            th{
            text-align:center;
            font-color:blue;
            color: blue;
            }

</style>
</head>

<body>
<table id="t1" width="810">

<tr><th><h3>Item Image</th><th><h3>Item Name</th><th><h3>Mode</h3></th><th><h3>Condition</h3></th><th><h3>Price</th>
<th><h3>Time Left</th><th><h3>Quantity</th><th><h3>Seller</th><th>Rating</th>
<tr><th colspan="4"><s:actionerror/></th></tr>
</tr>
<s:iterator value="arr">
<tr><td><img src="retrieve.jsp?item_id=<s:property value="item_id"/>" height="100" width="100"/></td>
<td><h4>

<s:if test='item_mode.equals("Buy It Now")'>
<a href="BuyItNow.action?item_id=<s:property value="item_id"/>"><s:property value="item_name"/></td></a>
</s:if>
<s:else>
<a href="bidding.action?item_id=<s:property value="item_id"/>"><s:property value="item_name"/></td></a>
</s:else>
<td><h5><s:property value="item_mode"/></td>
<td><h5><s:property value="item_condition"/></td>
<td><h4><s:property value="item_price"/></td>
<td><h4><s:property value="item_endtime"/></td>
<td><h4><s:property value="item_quantity"/></td>
<td><h4><s:property value="item_seller"/></td>
<td><h4><s:property value="item_rating"/></td>
</tr>
</s:iterator>




</table>
<div id="navigation" align="center"></div></div></td></table>
<script type="text/javascript">
    var pager = new Pager('t1', 4); 
    pager.init(); 
    pager.showPageNav('pager', 'navigation'); 
    pager.showPage(1);
</script>
</body>
</html>