<%-- 
    Document   : header_new
    Created on : 5 Apr, 2011, 3:31:14 PM
    Author     : samrat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      
        <table width="100%" align="center">
            <tr>
                <td>
                    <s:a href="home.jsp"><img src="images/logoEbay_x45.gif"></s:a>
                </td>
                <td valign="bottom" style="font-family: verdena">
                    <font size="2" ><s:if test="#session['User']==null">
                    Welcome!&ensp;<s:property value="#session['User']"/>
                    <s:a href="user_sign_in.jsp">Sign in</s:a>
                        &ensp;
                    or&ensp;
                    <s:a rel="nofollow" href="register.jsp">register</s:a>
                        </s:if>
                    <s:else> Welcome!<s:property value="#session['User']"/>
                        <s:url id="url1" action="Logout" encode="true">

                                    </s:url>
                                             <s:a id="registerLink" href="%{url1}" rel="nofollow" >  logout </s:a>
                    </s:else></font>
                </td>
                <td width="75%" align="right" style=" font-family: verdena, sans-serif">
                    <table>
                        <tr>
                            <td colspan="7" align="center">
                                <table>
                                    <tr>
                                        <td valign="top">
                                            <font size="2" ><s:a href="my_ebay.jsp">My eBay </s:a></font>
                                        </td>
                                        <td width="15"align="center">
                                            <font size="2" >|</font>
                                        </td>
                                        <td>
                                            <font size="2" ><s:a href="start_sell.jsp">Sell</s:a></font>
                                        </td>
                                        <td width="15"align="center">
                                            <font size="2" >|</font>
                                        </td>
                                        <td>
                                            <font size="2" ><s:a href="my_ebay.jsp">Community</s:a></font>
                                        </td>
                                        <td width="15"align="center">
                                            <font size="2" >|</font>
                                        </td>
                                        <td>
                                            <font size="2" ><s:a href="my_ebay.jsp">Help</s:a></font>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br>
                            </td>
                        </tr>
                        <tr>
                            <td valign="bottom">
                                <font size="2" ><img src="images/cart.gif"><s:url id="url1" action="view_cart"></s:url>&ensp;&ensp;<s:a href="%{url1}">My shopping Cart   </s:a> ( <s:property value="quantity"/> )</font>
                            </td>
                            <td width="15"align="center">
                                <font size="2" >|</font>
                            </td>
                            <td>
                                <font size="2" ><s:url id="url2" action="check_bid"></s:url><s:a href="%{url2}">   Check Bid   </s:a></font>
                            </td>
                            <td width="15"align="center">
                                <font size="2" >|</font>
                            </td>
                            <td>
                                <font size="2" ><s:a href="start_sell.jsp">   My PaisaPay   </s:a></font>
                            </td>
                            <td width="15"align="center">
                                <font size="2" >|</font>
                            </td>
                            <td>
                                <font size="2" ><s:a href="my_ebay.jsp">   Contact Us   </s:a></font>
                            </td>
                            <td width="15"align="center">
                                <font size="2" >|</font>
                            </td>
                            <td>
                                <font size="2" ><s:a href="my_ebay.jsp">   Site Map</s:a></font>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td bgcolor="#F4F4F4" colspan="3">
                    <fieldset>
                    <table>
                        
                        <tr>
                            <s:form action="header_dropdown_select">
                            <td colspan="3">
                                
                                <s:textfield size="100" name="text" value="Search"></s:textfield>
                            </td>
                            <td align="center">
                                <s:select
    name="category"
    headerKey="1"
    headerValue="All Categories"
    list="#{'01':'Mobiles','02':'Books','03':'Cameras','04':'Clothing',
'05':'Jewellery','06':'Storage','07':'Electronics'}"
    ></s:select>
                            </td>
                            <td>
                                <s:submit value="Search" src="images/search.png"></s:submit>
                            </td>
                            </s:form>
                            <td align="right" width="32%" colspan="2">
                                <s:url id="url2" action="advance_search"></s:url><s:a href="%{url2}">Advanced Search</s:a>
                            </td>
                            <td width="5%">

                            </td>
                            
                        </tr>
                        <tr>
                            <td>
                                <hr style="color: #CC1111">
                            </td>
                            <td>
                                <hr style="color: brown">
                            </td>
                            <td>
                                <hr style="color: #003DAD">
                            </td>
                            <td>
                                <hr style="color: #CC6600">
                            </td>
                            <td>
                                <hr style="color: #009900">
                            </td>
                            <td>
                                <hr style="color: #FCD13C">
                            </td>
                            <td colspan="2">
                                <hr style="color: #a7b5ef">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="8">
                                <table>
                                    <tr>
                                        <td>
                                            <font size="2" ><s:a href="categories.jsp">CATEGORIES</s:a></font>
                                        </td>
                                        <td width="15"align="center">
                                            <font size="3" >|</font>
                                        </td>
                                        <td>
                                            <font size="2" ><s:a href="start_sell.jsp">SHOPS</s:a></font>
                                        </td>
                                        <td width="15"align="center">
                                            <font size="3" >|</font>
                                        </td>
                                        <td>
                                            <font size="2" ><s:a href="my_ebay.jsp">MOTORS</s:a></font>
                                        </td>
                                        <td width="15"align="center">
                                            <font size="3" >|</font>
                                        </td>
                                        <td>
                                            <font size="2" ><s:a href="my_ebay.jsp">PHOTO CENTRE</s:a></font>
                                        </td>
                                        <td width="15"align="center">
                                            <font size="3" >|</font>
                                        </td>
                                        <td>
                                            <font size="2" ><s:a href="my_ebay.jsp">JOBS</s:a></font>
                                        </td>
                                        <td width="15"align="center">
                                            <font size="3" >|</font>
                                        </td>
                                        <td width="15"align="center">
                                            <font size="3" >|</font>
                                        </td>
                                        <td>
                                            <img src="images/logoIN_TM_eBay_RGB.gif" width="130" height="40">
                                        </td>
                                        <td width="48%" align="right">
                                            <img src="images/pmoGuarantee120111_248x50.jpg"  width="180" height="40">
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    </fieldset>
                </td>
            </tr>
        </table>
      
    </body>
</html>
