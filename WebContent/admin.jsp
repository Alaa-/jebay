<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>Ebay Admin</title>
<style type="text/css">
h1 {
	padding: 0;
	border: none;
	background-color: transparent;
	color: #227A0A;
	font-weight: bold;
}

td {
	padding-bottom: 10px;
}

td.label {
	width: 80px;
}

.box {
	width: 800px;
	border: 1px solid #8ED17C;
	align: center;
	padding: 25px 18px;
	margin-top: 65px;
	margin-left: auto;
	margin-right: auto;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
}
table,th,td{
border-collapse:collapse;
	border:1px solid black;
	border-spacing: 5px;
	padding: 20px;

}

</style>
</head>
<body>
	<div class="box">
		<h2 style="text-align: center;">Welcome ADMIN !!!</h2>
		<table style="border: 2px solid black;border-width: 2px;">
			<tr>
				<td><s:form action="adminaddcat" method="post">
						<label>Add New Category:&nbsp;&nbsp;</label><s:textfield label="Add New Category" name="fcat"></s:textfield>
						<s:submit value="Submit"></s:submit>
					</s:form></td>
				<td><s:form action="adminaddsubcat" method="post">
						<label>Select Category:&nbsp;&nbsp;</label><s:select list="catlist" listKey="category_id"
							listValue="category_name" name="fcat" /><br/><br/>
						<label>Add new Subcategory under it:&nbsp;&nbsp;</label><s:textfield label="Add New SubCategory" name="fsubcat"></s:textfield>
						<s:submit value="Submit"></s:submit>
					</s:form></td>
			</tr>


		</table>
	</div>
</body>
</html>