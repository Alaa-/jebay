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
vertical-align:top;

}
</style>
<script type="text/javascript" src="hello.js"></script>
<script type="text/javascript">
function submitForm() {
    $.ajax({type:'POST', url: 'Paraaction.action', data:$('#f1').serialize(), success: 
    	function(response) {
        $("#d1").html(response);
    }});

    return false;
}

function check(){
	var a=document.getElementById('min').value;
	var b=document.getElementById('max').value;
	if(Math.floor(a)!=a){
		
		alert("not a number");
		if(b.length==0){
			alert("enter maximum amount");
			
		}
	     document.getElementById('min').focus();
		
	}
	if(Math.floor(b)!=b){
		alert("not a number");
		if(a.length==0){
			alert("enter minimum amount");
			
		}
	     document.getElementById('max').focus();
	}
	if(a>b){
		alert("minimum price should be less than maximum price");
	     document.getElementById('min').focus();
	}
	else{
		submitForm();
	}
}
</script>
<script type="text/javascript" src="js/paging.js"></script>
	 <style type="text/css">    
            .pg-normal {
                color: black;
                font-weight: normal;
                text-decoration: none;    
                cursor: pointer;    
            }
            .pg-selected {
                color: black;
                font-weight: bold;        
                text-decoration: underline;
                cursor: pointer;
            }
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
<%@ include file="header.jsp" %>
<table border="1" width="100%" cellpadding="0" cellspacing="0" style="border-collapse: collapse;">
<td width="20%" >
<form id="f1" onsubmit="return submitForm();">
<table width="100">
<tr><td><h4>Condition</td></tr>
<tr><Td><input type="radio" name="condition" value="New">New</input></Td></tr>
<tr><td><input type="radio" name="condition" value="Used">Used</input></td></tr>
<tr><td><h4>Mode</td></tr>


<tr><Td><input type="radio" name="mode" value="0">Buy It Now</input></Td></tr>
<tr><td><input type="radio" name="mode" value="1">Bidding</input></td></tr>
<tr><td><h4>Price Range</h4></td></tr>
<tr><td>Rs.<input type="text" id="min" name="min" size="5"/></td></tr>
<tr><td>To</td></tr>
<tr><td>Rs.<input type="text" id="max" name="max" size="5"/></td></tr>
<tr><td><input type="button" name="b1" value="Submit" onclick="check()"/></td></tr>
</table></form></td>

<td>
<div id="d1">
<table id="t1" width="810">

<tr><th><h3>Item Image</th><th><h3>Item Name</th><th><h3>Mode</h3></th><th><h3>Condition</h3></th><th><h3>Price</th>
<th><h3>Time Left</th>
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
</tr>
</s:iterator>




</table><div id="navigation" align="center"></div></div></td></table>
<script type="text/javascript">
    var pager = new Pager('t1', 5); 
    pager.init(); 
    pager.showPageNav('pager', 'navigation'); 
    pager.showPage(1);
</script>
</body>
</html>