<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
<style type="text/css">@import "jquery.realperson.css";</style> 
<script type="text/javascript" src="jquery.realperson.js"></script>
<script type="text/javascript">
function load(){
	$('#d1').realperson({length: 6,includeNumbers: false,regenerate: 'Click to change',hashName: 'Hash'}); 
}

</script>
</head>
<body onload="load()">
<form action="hello.jsp" method="get">
<table>
<tr><td><div id="d1"/></div></td></tr>
<tr><td><input type="text" name="hello"/></td></tr>
<tr><td><input type="submit" value="submit"/></td></tr>
</table>
</form>
</body>
</html>