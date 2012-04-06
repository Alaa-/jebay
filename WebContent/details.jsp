<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Details</title>
</head>
<body>
<h1 align="center">Details of search</h1> 
<form action="details">
<table>
<tr> 
	<th>Image</th>
    <th>Brand</th>
    <th>Name</th>
    <th>Memory</th>
    <th>Pixel</th>
    <th>Price</th>
    
    
</tr>
<%-- <%@ page import="java.util.ArrayList,edu.iiitb.bookstore.models.*" %> --%>
<s:iterator value="searchDetails" >
<tr>
<td> <img alt="" src="<s:property value='image'/>">
<td> <s:property value="brand" /></td>
<td> <s:property value="name" /></td>
<td> <s:property value="memory" /></td>
<td> <s:property value="pixel" /></td>
<td> <s:property value="condition" /></td>
<td> <s:property value="price" /></td>

<%-- <td><img src="./images/Books.PNG" alt="image text"/> </td>
<!--<td> <a href="ModifyBook3?book_id=<s:property value="id" />">Modify</a> </td>-->
<s:hidden name="id"></s:hidden>
<td><s:submit name="modify" value="Modify"></s:submit> </td>
</tr> --%>
</s:iterator>

</table>
</form>
</body>
</html>
<%@ include file="footer.jsp" %>