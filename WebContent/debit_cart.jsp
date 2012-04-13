<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Credit Card</title>
</head>
<body>
<h1>Debit Card Details</h1>
<form id="form1" name="form1" method="post" action="debitPaymentCart">
<table width="968" height="239" border="0">
  <tr>
    <td>
    Debit Card Number
    <s:textfield name="debitcardnumber" value=""></s:textfield>
    <th></th>
       </td>
  <!--   <td>&nbsp;Valid Till</td> -->
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;
    Card holder name (as it appears on card)
    <s:textfield name="holdername" value=""></s:textfield>
    </td>
    <td colspan="2">&nbsp;
    CVV (3-digit card verification number)
    <s:textfield type="password" size="5" name="cvv" value=""></s:textfield><img alt="" src="images/icon_card_back.gif">
    </td>
  </tr>
  
</table>
<s:submit name="submit" value="Pay Now"/>
</form> 
</body>
</html>