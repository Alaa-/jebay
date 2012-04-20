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
	width: 900px;
	border: 1px solid #8ED17C;
	align: center;
	padding: 25px 18px;
	margin-top: 65px;
	margin-left: auto;
	margin-right: auto;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
}

#outer {
	border-collapse: collapse;
	border: 1px solid black;
	border-spacing: 5px;
	padding: 20px;
}
</style>
</head>
<body>
	<div class="box">
		<h2 style="text-align: center;">Welcome ADMIN !!!</h2>
		<table id="outer" style="border: 2px solid black; border-width: 2px;">
			<tr id="outer">
				<td><s:form action="adminaddcat" method="post">
						<table>
							<tr>
								<td><label>Add New Category:&nbsp;&nbsp;</label></td>
								<td><s:textfield label="Add New Category" name="fcat"></s:textfield>
								</td>
							</tr>
							<tr>
								<td colspan="2" align="center"><s:submit value="Submit"></s:submit></td>
							</tr>
						</table>
					</s:form></td>
				<td id="outer"><s:form action="adminaddsubcat" method="post">

						<table>
							<tr>
								<td><label>Select Category to add
										Subcategories&nbsp;&nbsp;</label><br /> <label>(Current
										Subcategories are shown here)</label></td>
								<td><s:doubleselect label="Categories" id="fcat"
										name="fcat" list="catlist" listKey="category_id"
										listValue="category_name" doubleName="fsubcat"
										doubleId="fsubcat" doubleList="subcatlist"
										doubleListKey="subcategory_id"
										doubleListValue="subcategory_name" /></td>
							</tr>
							<tr>
								<td><label>Add new Subcategory under
										it:&nbsp;&nbsp;</label></td>
								<td><s:textfield label="Add New SubCategory" name="newsub"></s:textfield></td>
							</tr>
							<tr>
								<td colspan="2" align="center"><s:submit value="Submit"></s:submit>
								</td>
							</tr>
						</table>
					</s:form></td>
			</tr>


		</table>
	</div>
</body>
</html>