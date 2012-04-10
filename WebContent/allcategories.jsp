<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Browse</title>
</head>
<body>
<s:action name='addcompactheader' executeResult='true' />
<h1>All Categories</h1>
<form action="details">
<s:iterator value="allCats">
	<a href="catDetails.action?catid=<s:property value='category_id'/>" ><s:property value="category_name"/></a><br>
		<s:iterator value="allCats">
			<s:property value="subcategory_name"/>
		</s:iterator>
		<%-- <s:property value="subcategory_name"/> --%>
</s:iterator>
</form>
</body>
</html>
<%@ include file="footer.jsp" %>