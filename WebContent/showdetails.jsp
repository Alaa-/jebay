<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<s:action name='addcompactheader' executeResult='true' />
<table class="bodyFontSmall" width="100%" cellpadding="0" cellspacing="0"><tr


><td colspan="4" class="itemHeaderStyle"><span>&nbsp;</span></td><td class="itemHeaderStyle">
<span>Price</span></td><td class="itemHeaderStyle"><span>Shipping</span></td>
	<%-- <td class="itemHeaderRightAlignStyle"><span>Time left</span></td> --%></tr>
	<tr><td colspan="7" style="border-left:2px solid #e8e8e8;border-top:2px solid #e8e8e8;padding-top:5px;vertical-align:top;border-right:2px solid #e8e8e8;border-top:2px solid #e8e8e8;font-weight:bold;padding-left:3px;">
<span>Featured Item</span></td></tr>
<s:iterator value="bidDetails">
		<tr><td width="10%" height="100px" style="border-left:2px solid #e8e8e8;border-top:2px solid #e8e8e8;border-left:1px solid #6633CC;border-top:1px solid #6633CC;border-bottom:1px solid #6633CC;font-weight:bold;background:#E6CCFF;padding-left:3px;">
		<a clickid="srp listing_31221" href="bidding.action?item_id=<s:property value='item_id'/>" class="ebayLVTracking_clickthru">
		<img src="<s:property value='image'/>" alt="Item Image" style="border: 0px;"></a></td>
		<td width="40%" height="100px" style="padding-top:5px;vertical-align:top;border-top:2px solid #e8e8e8;border-top:1px solid #6633CC;border-bottom:1px solid #6633CC;font-weight:bold;background:#E6CCFF;">
			<div style="padding-left:5px;">
			<a clickid="srp listing_31221" href="bidding.action?item_id=<s:property value='item_id'/>" class="ebayLVTracking_clickthru"><s:property value="item_name"/></a>
			<!-- <div style="font-weight:normal;font-size:11px;">SEALED PACK MOBILE PHONE.BUY FROM TOP RATED POWERSELLER</div>
				<div style="font-weight:normal;font-size:11px;">Feedback: 697&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;99.6%</div> -->
					<%-- <div><a id="GPZoom280846673372" class="ppr" href="javascript:;">
<span style="padding-left:20px;">Enlarge</span></a></div> --%>
	<!-- <div id="OPanel_GalleryPlus_280846673372Oly_Outer" style="display:none">
		<div id="cnOPanel_GalleryPlus_280846673372">
			<div>
				<div>
					<img width="290px" height="250px" src="http://galleryplus.ebayimg.com/ws/web/280846673372_1_0_1.jpg">
				</div>
			</div>
		</div>
	</div>
</div></td> -->
<td align="center" height="100px" style="padding-top:5px;vertical-align:top;border-top:2px solid #e8e8e8;border-top:1px solid #6633CC;border-bottom:1px solid #6633CC;font-weight:bold;background:#E6CCFF;">
	<span>&nbsp;</span><br>
		<img src="images/iconEmi_40x25.gif" height="25" width="40"></td>
			<td style="padding-top:5px;vertical-align:top;border-top:2px solid #e8e8e8;border-top:1px solid #6633CC;border-bottom:1px solid #6633CC;font-weight:bold;background:#E6CCFF;">
				<span class="fontVerdanaXSmallGrayBold"><s:property value="mode"/></span></td>
					<td valign="top" style="padding-top:5px;vertical-align:top;border-top:2px solid #e8e8e8;border-top:1px solid #6633CC;border-bottom:1px solid #6633CC;font-weight:bold;background:#E6CCFF;">
					<span style="font-weight:bold">Rs. <s:property value="price"/></span></td>
						<td height="100px" style="padding-top:5px;vertical-align:top;border-top:2px solid #e8e8e8;border-top:1px solid #6633CC;border-bottom:1px solid #6633CC;font-weight:bold;background:#E6CCFF;">
							<span class="bodyFontSmall">+ Rs. <s:property value="shipping_charge"/></span></td>
								<td height="100px" style="padding-top:5px;vertical-align:top;border-right:2px solid #e8e8e8;border-top:2px solid #e8e8e8;border-right:1px solid #6633CC;border-top:1px solid #6633CC;border-bottom:1px solid #6633CC;font-weight:bold;background:#E6CCFF;padding-right:5px;text-align:right;">
									<%-- <span>6d 19h 37m</span> --%></td></tr>
										<tr><td colspan="7" style="padding-left:2px;border-left:2px solid #e8e8e8;border-top:2px solid #e8e8e8;border-right:2px solid #e8e8e8;" class="fontVerdanaXSmall">
											<%-- <span>Optimise your selling success! Find out how to <a href="http://cgi5.ebay.in/aw-cgi/eBayISAPI.dll?PromoteItemLanding">promote your items</a>
											</span> --%>
										</td></tr>
									<tr>
									</tr>
									</s:iterator>
<s:iterator value="buyDetails">
		<tr><td width="10%" height="100px" style="border-left:2px solid #e8e8e8;border-top:2px solid #e8e8e8;border-left:1px solid #6633CC;border-top:1px solid #6633CC;border-bottom:1px solid #6633CC;font-weight:bold;background:#E6CCFF;padding-left:3px;">
		<a clickid="srp listing_31221" href="BuyItNow.action?item_id=<s:property value='item_id'/>" class="ebayLVTracking_clickthru">
		<img src="<s:property value='image'/>" alt="Item Image" style="border: 0px;"></a></td>
		<td width="40%" height="100px" style="padding-top:5px;vertical-align:top;border-top:2px solid #e8e8e8;border-top:1px solid #6633CC;border-bottom:1px solid #6633CC;font-weight:bold;background:#E6CCFF;">
			<div style="padding-left:5px;">
			<a clickid="srp listing_31221" href="BuyItNow.action?item_id=<s:property value='item_id'/>" class="ebayLVTracking_clickthru"><s:property value="item_name"/></a>
			<!-- <div style="font-weight:normal;font-size:11px;">SEALED PACK MOBILE PHONE.BUY FROM TOP RATED POWERSELLER</div>
				<div style="font-weight:normal;font-size:11px;">Feedback: 697&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;99.6%</div> -->
					<%-- <div><a id="GPZoom280846673372" class="ppr" href="javascript:;">
<span style="padding-left:20px;">Enlarge</span></a></div> --%>
	<!-- <div id="OPanel_GalleryPlus_280846673372Oly_Outer" style="display:none">
		<div id="cnOPanel_GalleryPlus_280846673372">
			<div>
				<div>
					<img width="290px" height="250px" src="http://galleryplus.ebayimg.com/ws/web/280846673372_1_0_1.jpg">
				</div>
			</div>
		</div>
	</div>
</div></td> -->
<td align="center" height="100px" style="padding-top:5px;vertical-align:top;border-top:2px solid #e8e8e8;border-top:1px solid #6633CC;border-bottom:1px solid #6633CC;font-weight:bold;background:#E6CCFF;">
	<span>&nbsp;</span><br>
		<img src="images/iconEmi_40x25.gif" height="25" width="40"></td>
			<td style="padding-top:5px;vertical-align:top;border-top:2px solid #e8e8e8;border-top:1px solid #6633CC;border-bottom:1px solid #6633CC;font-weight:bold;background:#E6CCFF;">
				<span class="fontVerdanaXSmallGrayBold"><s:property value="mode"/></span></td>
					<td valign="top" style="padding-top:5px;vertical-align:top;border-top:2px solid #e8e8e8;border-top:1px solid #6633CC;border-bottom:1px solid #6633CC;font-weight:bold;background:#E6CCFF;">
					<span style="font-weight:bold">Rs. <s:property value="price"/></span></td>
						<td height="100px" style="padding-top:5px;vertical-align:top;border-top:2px solid #e8e8e8;border-top:1px solid #6633CC;border-bottom:1px solid #6633CC;font-weight:bold;background:#E6CCFF;">
							<span class="bodyFontSmall">+ Rs. <s:property value="shipping_charge"/></span></td>
								<td height="100px" style="padding-top:5px;vertical-align:top;border-right:2px solid #e8e8e8;border-top:2px solid #e8e8e8;border-right:1px solid #6633CC;border-top:1px solid #6633CC;border-bottom:1px solid #6633CC;font-weight:bold;background:#E6CCFF;padding-right:5px;text-align:right;">
									<%-- <span>6d 19h 37m</span> --%></td></tr>
										<tr><td colspan="7" style="padding-left:2px;border-left:2px solid #e8e8e8;border-top:2px solid #e8e8e8;border-right:2px solid #e8e8e8;" class="fontVerdanaXSmall">
											<%-- <span>Optimise your selling success! Find out how to <a href="http://cgi5.ebay.in/aw-cgi/eBayISAPI.dll?PromoteItemLanding">promote your items</a>
											</span> --%>
										</td></tr>
									<tr>
									</tr>
									</s:iterator>
</body>
</html>
	<%@ include file="footer.jsp" %>