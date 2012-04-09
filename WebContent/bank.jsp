<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--
Design by Free CSS Templates
http://www.freecsstemplates.org
-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd"> -->
   <%@taglib uri="/struts-tags" prefix="s" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Bank Transfer</title>
</head>
<body>
<h2 align="center"> Payment through <s:property value="#session['bank']"/></h2>
<h3 align="center">Payments made using this facility can NOT be stopped or modified.</h3>
<s:actionerror/>
<%-- <s:form action="banktransfer.action" method="post"> 
<table>
	<tr><s:label value="Your User ID" /><s:textfield  name="busername" key="label.busername" size="20" align="center" theme="simple"/></tr>
   <br></br> <tr><s:label value="Password" labelposition="center" /><s:password name="bpassword" key="label.bpassword" size="20" align="center" theme="simple"/></tr>
   <br></br> <tr><s:submit align="center" name="submit" key="label.blogin" /></tr>
    
    </table>
   
 <form>

 </form>
</s:form> --%>
<form name="form1" method="post" action="banktransfer.action">
<br></br>
         <div align="center"><span class="style1">Your User ID</span>
    <input type="text" name="busername" />
  </div>
  </label>
  <p align="center">
    <label><span class="style1">Password </span>
    <input type="password" name="bpassword" />
    </label>
  </p>
  <p align="center">
    <label>
    <input type="submit" name="Submit" value="Payment Login" />
    </label>
  </p>
 
</body>
</html>