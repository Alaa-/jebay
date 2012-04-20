<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="trial.jsp">
		<input type="text" name="item" /> <input type="text" name="item" /> <input
			type="text" name="item" /> <input type="text" name="item" /> <input
			type="text" name="item" /> <input type="submit" />
	</form>

	<%
		String[] item = null;

		item = request.getParameterValues("item");
		if (item != null) {
			for (int i = 0; i < item.length; i++)
				out.println("" + item[i] + "" + i);
		}
	%>

</body>
</html>