<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Thank You</title>
</head>
<body>
<s:action name='addcompactheader' executeResult='true' />
<form action="continue.action">
<h1>Payment Successful</h1>
<h3>Congratulations! Your transaction is successful. Press Continue to go to Home</h3>
<s:submit name="submit" value="Continue"></s:submit>
</form>
</body>
</html>
<%@ include file="footer.jsp" %>