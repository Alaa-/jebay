
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>
<html>
<head>
<sx:head/>
<title>REGISTER</title>
</head>
<body>
        <table border="1" cellpadding="2" cellspacing="2" align="center" width="1000">
          <tr>
                <td height="50" colspan="2" align="left">
                    <a href="HomePage.jsp"><img src="images/contact_but.png"></a>
                </td>
            </tr>
            <tr>
            <td align="center">
                    <s:form id="form" name="form" action="RegisterUser" method="post" enctype="multipart/form-data">
                        <s:actionerror/>
                        <s:fielderror/>
                               <s:textfield name="EmployeeID" key="Employee ID" size="40" />
                               <s:textfield name="EmployeeName" key="Employee Name" size="40"/>
                               <s:password name="EmployeePassword" key="Employee Password"></s:password>
                               <sx:datetimepicker name="DateOfBirth"  key="label.dob" displayFormat="dd-MMM-yyyy" formatLength="long" requiredposition="left"/>
                            
                            

                            <s:textfield name="Experience" key="Experience" size="40" />
                            <s:file name="upload" label="File"/>
                            <s:submit method="execute" key="REGISTER"/>
                    </s:form>
            </td>
            </tr>
        </table>
</body>
</html>