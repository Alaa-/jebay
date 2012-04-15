<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Seller Registration</title>
<link rel="stylesheet" type="text/css"
	href="https://secureir.ebaystatic.com/v4css/z/2c/gomrodp25eztvpiedfnc5kcom.css#GH-ZAM_ReskinEbayNoAutoComplete_e767i_Ear_en_IN">
<link rel="stylesheet" type="text/css"
	href="https://secureir.ebaystatic.com/v4css/z/qp/px24mdofkaylfhvddo4baaxma.css#SparkApp_EscrowSellerRegistration_e767i_Ear_en_IN">




<style type="text/css">
.coreFooterLinks 
a:active,.coreFooterLinks a:focus,.coreFooterLinks a:hover,.coreFooterLinks a:link
	{
	font-family: Verdana;
	font-size: x-small;
	color: #00c;
	display: inline-block
}

.gh-nav a:active,.gh-nav a:focus,.gh-nav 
a:hover,.gh-nav a:link {
	font-family: Arial;
	font-size: small;
	color: #333
}

.coreFooterLinks 
a:visited {
	font-family: Verdana;
	font-size: x-small
}

.coreFooterLegalNotice {
	font-family: Verdana;
	font-size: x-small;
	color: #666
}

.footerBG {
	padding: 1px 0 5px 0
}

.footerBGPost {
	padding: 1px 0 5px 0
}

.footerBG 
img,.footerBGPost img {
	margin-right: 6px
}

.footerBG .bgLinkTD,.footerBGPost .bgLinkTD {
	white-space: nowrap
}

.gh-vs {
	border: 1px solid #666;
	width: 340px;
	background-color: #efefef
}

.gh-vs 
.gh-cw {
	padding: 10px 0
}

.gh-vs .gh-cbtn {
	background-image:
		url(https://securepics.ebaystatic.com/aw/pics/buttons/btnClose_16x16.gif);
	background-repeat: no-repeat;
	background-position: bottom left;
	background-color: transparent;
	cursor: pointer;
	display: inline;
	float: right;
	height: 16px;
	width: 16px;
	position: absolute;
	top: 10px;
	right: 5px;
	padding: 0
}

.gh-vs 
.gh-ttl {
	color: #333;
	font-weight: bold;
	font-size: medium;
	padding: 0 15px
}

.gh-vs .gh-ct {
	clear: both;
	padding: 10px 15px 0
}

.gh-hdn {
	font-size: 0;
	height: 0;
	margin-top: 10px;
	overflow: hidden;
	width: 0;
	visibility: hidden
}

.gh-fol {
	border: 1px solid #ccc;
	background-color: #fff;
	position: absolute;
	margin-top: -85px;
	padding: 10px;
	width: 250px;
	z-index: 10000;
	display: none
}

.gh-fol div {
	float: left;
	width: 234px
}

.gh-fol-a {
	float: left
}

.gh-fol a 
b {
	background: transparent
		url(https://securepics.ebaystatic.com/aw/pics/buttons/btnClose_16x16.gif)
		no-repeat;
	width: 16px;
	height: 16px;
	display: block
}

.gh-ovr {
	position: absolute;
	left: -1000px;
	z-index: 10000
}

.gh-iovr {
	float: left;
	position: relative;
	background-color: #fff;
	border: 1px solid #ccc
}

.gh-ext {
	font-size: 0;
	margin-top: -1px;
	position: absolute;
	top: 0;
	left: 0;
	background: #fff;
	border-top: 1px solid #fff
}

.ebayfooter {
	font-family: Verdana;
	font-size: x-small;
	color: #666
}

.pagewidth {
	width: 100%;
	min-width: 760px
}

* html .pageminwidth {
	padding-left: 760px
}

* html 
.pagecontainer {
	margin-left: -760px;
	position: relative
}

* html .pageminwidth,* html .pagecontainer,* html 
.pagelayout {
	height: 1px
}

.brclear {
	clear: both;
	height: 0;
	margin: 0;
	font-size: 1px;
	line-height: 0;
	display: block
}

div.BreadCrumb {
	border: 0;
	padding: 0;
	margin: 0
}

.navTabContainer {
	clear: both;
	padding-right: 0;
	padding-le ft: 0;
	padding-bottom: 0;
	margin: 0;
	width: auto;
	padding-top: 1px
}

.navTabListContainer {
	padding-right: 0;
	padding-left: 0;
	float: left;
	padding-bottom: 0;
	margin: 0;
	width: 100%;
	padding-top: 0;
	margin-bottom: -1px;
	positio n: relative
}

ul.navtabs {
	padding-right: 0;
	padding-left: 0;
	padding-bottom: 0;
	margin: 0;
	padding-top: 0;
	list-style-type: none;
	margin-left: 7px
}

ul.navtabs 
li {
	background-color: #f0f2ff;
	background-image:
		url(https://securepics.ebaystatic.com/aw/pics/globalAssets/imgTabRgt_Off.gif);
	background-repeat: no-repeat;
	background-position: top right;
	float: left;
	margin: 0 5px 0 1px;
	padding: 0
}

ul.navtabs 
a {
	background: transparent;
	background-image:
		url(https://securepics.ebaystatic.com/aw/pics/globalAssets/imgTabLft_Off.gif);
	background-repeat: no-repeat;
	background-position: left top;
	font-weight: normal;
	display: block;
	float: left;
	height: 22px;
	padding: 0 5px;
	padding-top: 5px;
	margin-left: -3px
}

* html ul.navtabs 
a {
	background: transparent;
	background-image:
		url(https://securepics.ebaystatic.com/aw/pics/globalAssets/imgTabLft_Off.gif);
	background-repeat: no-repeat;
	background-position: left top;
	font-weight: normal;
	display: block;
	float: left;
	height: 22px;
	padding: 0 5px;
	padding-top: 5px;
	margin-left: 0
}

ul.navtabs 
li.active {
	background-color: #fff;
	background-image:
		url(https://securepics.ebaystatic.com/aw/pics/globalAssets/imgTabRgt_On.gif);
	border-bottom: 1px solid #fff;
	height: 27px;
	margin-left: 1px
}

ul.navtabs 
li.active 
a {
	background-image:
		url(https://securepics.ebaystatic.com/aw/pics/globalAssets/imgTabLft_On.gif);
	color: #000;
	cursor: default;
	font-weight: bold;
	padding-bottom: 0;
	text-decoration: none;
	padding-left: 8px;
	paddi ng-right: 8px
}

ul.navtabs li.active 
a:visited {
	background-image:
		url(https://securepics.ebaystatic.com/aw/pics/globalAssets/imgTabLft_On.gif);
	color: #000;
	cursor: default;
	font-weight: bold;
	padding-bottom: 0;
	text-decoration: none;
	padding-left: 8p x;
	padding-right: 8px
}

ul.navtabs 
li.highlight {
	background-color: #f0f2ff;
	background-image:
		url(https://securepics.ebaystatic.com/aw/pics/globalAssets/imgTabRgt_Off.gif);
	background-repeat: no-repeat;
	background-position: right top;
	float: left;
	margin: 0 5px 0 1px;
	padding: 0
}

ul.navtabs li.highlight 
a {
	background: transparent;
	background-image:
		url(https://securepics.ebaystatic.com/aw/pics/globalAssets/imgTabLft_Off.gif);
	background-repeat: no-repeat;
	background-position: left top;
	display: block;
	float: left;
	padding: 0 5px;
	padding-top: 5px
}

.txt-blue13normal {
	color: #00c;
	font-family: Arial;
	font-size: 13px;
	font-weight: normal
}

a.bluelink:link {
	color: #333;
	font-size: 12px;
	font-family: Arial;
	text-decoration: none;
	font-weight: bold;
	text -align: center;
	padding-left: 8px;
	padding-right: 8px
}

* html a.bluelink:link {
	color: #333;
	font-size: 12px;
	font-family: Arial;
	text-decoration: none;
	font-weight: bold;
	text-align: center;
	padding: 0 5px;
	padding-top: 5px;
	margin-left: -3px;
	position: relative
}

a.bluelink:visited {
	color: #333;
	font-size: 12px;
	font-family: Arial;
	text-decoration: none;
	font-weight: bold;
	text-align: center;
	padding-left: 8px;
	padding-right: 8 px
}

* html a.bluelink:visited {
	color: #333;
	font-size: 12px;
	font-family: Arial;
	text-decoration: none;
	font-weight: bold;
	text-align: center;
	padding: 0 5px;
	padding-top: 5px;
	margin-left: -3px;
	position: relative
}

a.bluelink:hover {
	color: #333;
	font-size: 12px;
	font-family: Arial;
	text-decoration: none;
	font-weight: bold;
	text-align: center;
	padding-left: 8px;
	padding-right: 8p x
}

* html a.bluelink:hover {
	color: #333;
	font-size: 12px;
	font-family: Arial;
	text-decoration: none;
	font-weight: bold;
	text-align: center;
	padding: 0 5px;
	padding-top: 5px;
	margin-left: -3px;
	position: relative
}

ul.navtabs 
li.leftspace {
	width: 2px
}

ul.navtabs 
li.hover {
	background-color: #f0f2ff;
	background-image:
		url(https://securepics.ebaystatic.com/aw/pics/globalAssets/imgTabRgt_Hover.gif);
	background-repeat: no-repeat;
	background-position: right top;
	float: left;
	margin: 0 5px 0 1px;
	padding: 0
}

ul.navtabs li.hover 
a {
	background-color: transparent;
	background-image:
		url(https://securepics.ebaystatic.com/aw/pics/globalAssets/imgTabLft_Hover.gif);
	background-repeat: no-repeat;
	background-position: left top;
	display: block;
	float: left;
	padding: 0 5px;
	padding-top: 5px
}
</style>




</head>
<body>



	<div class="CentralArea" id="CentralArea">
		<div>
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td class="txt-black25normal">My PaisaPay</td>
					<td align="right"><a
						href="/Jebay/home.jsp"
						class="bluelinkYukon">Back to My eBay</a></td>
				</tr>
			</table>
		</div>
		<div>
			<br>
		</div>
		<div class="blueboxld">
			<div
				style="background: transparent; background-image: url(https://securepics.ebaystatic.com/aw/pics/psp_new/Goldbar_topleft.gif); background-repeat: no-repeat; background-position: left top; position: relative">
				<div
					style="background: transparent; background-image: url(https://securepics.ebaystatic.com/aw/pics/psp_new/Goldbar_topright.gif); background-repeat: no-repeat; background-position: right top; position: relative">
					<div class="blueboxtb2">
						<div class="blueboxlr2">
							<div class="navstyle">
								<div class="navTabContainer">
									<div class="navTabListContainer">
										<div>
											<ul class="navtabs">
												<li class="highlight"><a href="getpaisa.action"
													id="tab1"
													onmouseover="return 
vjo.darwin.app.spark.escrow.dashboard.DashboardCheck.changeBG(&quot;tab1&quot;, true);"
													onmouseout="return 
vjo.darwin.app.spark.escrow.dashboard.DashboardCheck.changeBG(&quot;tab1&quot;, false);"
													class="bluelink">My PaisaPay summary</a></li>
												<li class="highlight"><a href="#" id="tab2"
													onmouseover="return vjo.darwin.app.spark.escrow.dashboard.DashboardCheck.changeBG(&quot;tab2&quot;, true);"
													onmouseout="return vjo.darwin.app.spark.escrow.dashboard.DashboardCheck.changeBG(&quot;tab2&quot;, false);"
													class="bluelink">Bought with PaisaPay</a></li>
												<li class="active"><a
													href="getpaisaform.action" id="tab5"
													class="bluelink">Register to sell with PaisaPay</a></li>
												<li class="highlight"><a href="#" id="tab6"
													onmouseover="return vjo.darwin.app.spark.escrow.dashboard.DashboardCheck.changeBG(&quot;tab6&quot;, true);"
													onmouseout="return vjo.darwin.app.spark.escrow.dashboard.DashboardCheck.changeBG(&quot;tab6&quot;, false);"
													class="bluelink">PaisaPay SMS Alerts</a></li>
											</ul>
										</div>
									</div>
									<div class="tabcontent_container">
										<div class="n">
											<div class="e">
												<div class="w"></div>
											</div>
										</div>
										<div class="tabcontentOuter">
											<div class="tabcontentInner">
												<div style="border: none"></div>
											</div>
										</div>
										<div class="s">
											<div class="e w">
												<div></div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

 		<s:if test="paisaregister == 0">	<%--//User is not registered as seller in paisapay Hence give him the form to register. --%>
			<div class="blueboxconld">
				<div class="blueboxconrd">
					<div class="blueboxcontb">
						<div class="blueboxconlrshort">
							<div class="content_area">
								<div>
									<div style="height: 60px" class="pagewidth">
										<div class="pageminwidth">
											<div class="pagelayout">
												<div class="pagecontainer">
													<div class="head-graybig">Register To Sell with	PaisaPay</div>
												</div>
											</div>
										</div>
									</div>
									<div class="grayboxld"
										style="background-image: url('https://securepics.ebaystatic.com/aw/pics/in/psp_new/seller_reg_corner_grey_ld_160707.gif'); background-repeat: no-repeat; background-position: left bottom; position: relative">
										<div class="grayboxrd"
											style="background-image: url('https://securepics.ebaystatic.com/aw/pics/in/psp_new/seller_reg_corner_grey_rd_160707.gif'); background-repeat: no-repeat; background-position: right bottom; position: relative">
											<div class="grayboxlt"
												style="background-image: url('https://securepics.ebaystatic.com/aw/pics/in/psp_new/seller_reg_corner_grey_lt_160707.gif'); background-repeat: no-repeat; background-position: left top; position: relative">
												<div class="grayboxrt"
													style="background-image: url('https://securepics.ebaystatic.com/aw/pics/in/psp_new/seller_reg_corner_grey_rt_160707.gif'); background-repeat: no-repeat; background-position: right top; position: relative">
													<div class="grayboxtb">
														<div class="grayboxlr">
															<div>
																<table style="width: 100%" class="padding-graytbl"
																	width="100%" cellspacing="0" cellpadding="0" border="0">
																	<tr>
																		<td width="1"></td>
																		<td
																			style="background-image: url('https://securepics.ebaystatic.com/aw/pics/in/psp_new/seller_reg_paisapay_160707.gif'); width: 138px; height: 55px; background-repeat: no-repeat"
																			align="left"></td>
																		<td style="padding-left: 15px; color: #5D5D5D"><b>Register
																				now and offer buyers the assurance of PaisaPay</b>- the
																			fast, easy, and secure way to accept credit card,
																			debit card and online bank transfer payments.</td>
																		<td><img
																			src="https://securepics.ebaystatic.com/aw/pics/in/psp_new/brd_blue.gif"
																			width="1" height="48"></td>
																		<td align="right"
																			style="border-left: 1px solid #9C96CE"><a
																			href="http://pages.ebay.in/help/sell/contextual/inframe/register-paisapay.html"
																			target="_blank" id="v4-0"><img
																				src="https://securepics.ebaystatic.com/aw/pics/syi/syi_icons/iconHelp_32x32.gif"
																				height="32" width="32" border="0" hspace="1"></a><br>
																			<a
																			href="http://pages.ebay.in/help/sell/contextual/inframe/register-paisapay.html"
																			target="_blank" id="h2" style="color: #EFEBEF"><label
																				style="color: #0000CE; padding-right: 4px">Help</label></a></td>
																	</tr>
																</table>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="eduheight">
									<div class="pagewidth">
										<div class="strPageMinWidth">
											<div class="pagelayout">
												<div class="strPageContainer">
													<div>
														<div class="titleDiv">
															<b>Here's how a PaisaPay transaction works.</b>
														</div>
														<div>
															<table width="100%" align="center" border="0"
																cellpadding="0" cellspacing="0">
																<tr>
																	<td valign="top" width="6"><img
																		src="https://securepics.ebaystatic.com/aw/pics/psp_new/seller_reg_left_160707.gif"
																		width="10" height="70"></td>
																	<td class="bg-steps"
																		style="background-image: url('https://securepics.ebaystatic.com/aw/pics/psp_new/seller_reg_middle_bg_160707.gif');"
																		width="24%"><table width="100%" border="0"
																			cellpadding="0" cellspacing="0" class="innerTables">
																			<tr>
																				<td width="43" class="paddingLeft"><img
																					src="https://securepics.ebaystatic.com/aw/pics/psp_new/seller_reg_step_1_160707.gif"
																					width="26" height="51"></td>
																				<td valign="top" class="txt-gray11normal"><span
																					class="dspan">Step 1 - </span> Buyer pays you
																					through PaisaPay. After processing payment,
																					PaisaPay asks you to ship the item.</td>
																			</tr>
																		</table></td>
																	<td width="32" valign="top"><img
																		src="https://securepics.ebaystatic.com/aw/pics/psp_new/seller_reg_middle_160707.gif"
																		height="70"></td>
																	<td class="bg-steps"
																		style="background-image: url('https://securepics.ebaystatic.com/aw/pics/psp_new/seller_reg_middle_bg_160707.gif');"
																		width="24%"><table width="100%" border="0"
																			cellpadding="0" cellspacing="0" class="innerTables">
																			<tr>
																				<td width="43" class="paddingLeft"><img
																					src="https://securepics.ebaystatic.com/aw/pics/psp_new/seller_reg_step_2_160707.gif"
																					width="43" height="51"></td>
																				<td valign="top" class="txt-gray11normal"><span
																					class="dspan">Step 2 - </span> You ship the item
																					and enter shipping details in your PaisaPay
																					account.*</td>
																			</tr>
																		</table></td>
																	<td width="32" valign="top"><img
																		src="https://securepics.ebaystatic.com/aw/pics/psp_new/seller_reg_middle_160707.gif"
																		height="70"></td>
																	<td class="bg-steps"
																		style="background-image: url('https://securepics.ebaystatic.com/aw/pics/psp_new/seller_reg_middle_bg_160707.gif');"
																		width="24%"><table width="100%" border="0"
																			cellpadding="0" cellspacing="0" class="innerTables">
																			<tr>
																				<td width="43" class="paddingLeft"><img
																					src="https://securepics.ebaystatic.com/aw/pics/psp_new/seller_reg_step_3_200508.gif"
																					width="43" height="51"></td>
																				<td valign="top" class="txt-gray11normal"><span
																					class="dspan">Step 3 - </span> Buyer confirms
																					receipt of the item to PaisaPay, or is entitled to
																					claim refund if item is not delivered.</td>
																			</tr>
																		</table></td>
																	<td width="32" valign="top"><img
																		src="https://securepics.ebaystatic.com/aw/pics/psp_new/seller_reg_middle_160707.gif"
																		height="70"></td>
																	<td class="bg-steps"
																		style="background-image: url('https://securepics.ebaystatic.com/aw/pics/psp_new/seller_reg_middle_bg_160707.gif');"
																		width="24%"><table width="100%" border="0"
																			cellpadding="0" cellspacing="0" class="innerTables">
																			<tr>
																				<td width="43" class="paddingLeft"><img
																					src="https://securepics.ebaystatic.com/aw/pics/psp_new/seller_reg_step_4_200508.gif"
																					width="43" height="51"></td>
																				<td valign="top" class="txt-gray11normal"><span
																					class="dspan">Step 4 - </span> Buyer's payment is
																					credited to your PaisaPay account, &amp;
																					transferred online to your bank account
																					periodically.</td>
																			</tr>
																		</table></td>
																	<td width="14" align="right" valign="top"><img
																		src="https://securepics.ebaystatic.com/aw/pics/psp_new/seller_reg_right_160707.gif"
																		width="14" height="70"></td>
																</tr>
															</table>
														</div>
														<div class="txt-gray11normal">
															<span class="txt-gray11normalasterisk"> <b>*</b></span> <b>Note:</b>
															You must enter shipping details for the transaction to
															proceed further.
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div>
									<form name="paisaform"
										action="savepaisaform"
										method="post">
										<div>
											<div class="sellerRegistration">
												<div>
													<div class="yellowboxld">
														<div class="yellowboxlt"
															style="background-image: url(https://securepics.ebaystatic.com/aw/pics/in/psp_new/seller_reg_corner_yellow_l_160707.gif);">
															<div class="yellowboxrt"
																style="background-image: url(https://securepics.ebaystatic.com/aw/pics/in/psp_new/seller_reg_corner_yellow_r_160707.gif);">
																<div class="yellowboxtb">
																	<div class="yellowboxlr">
																		<b>PaisaPay Registration Details</b>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="yellowboxconld"
														style="background-image: url(https://securepics.ebaystatic.com/aw/pics/in/psp_new/seller_reg_corner_wt_lb_160707.gif);">
														<div class="yellowboxconrd"
															style="background-image: url(https://securepics.ebaystatic.com/aw/pics/in/psp_new/seller_reg_corner_wt_rb_160707.gif);">
															<div class="yellowboxcontb">
																<div class="yellowboxconlr">
																	<div>
																		<div>
																			<div class="txt-gray13normallrtb">PaisaPay
																				requires your bank details to regularly send you the
																				payments you receive from your buyers. These
																				payments are transferred online to your bank
																				account, so you face no hassles or security risks in
																				receiving your money.</div>
																			<div class="txt-gray13normallrb">Please provide
																				the bank account details listed below.</div>
																		</div>
																	</div>
																	<div id="content-area" style="padding-bottom: 15px;">
																		<div id="left-table">
																			<div class="fe-padding">
																				<div style="padding-left: 0px"
																					class="txt-gray17normal">Account Holder Name</div>
																				<input name="acholdername" type="text" value="" required="required" maxlength="140">
																			</div>
																			<div class="fe-padding">
																				<div style="padding-left: 0px"
																					class="txt-gray17normal">Bank Account Number</div>
																				<input name="acnumber" value="" required="required" maxlength="20" type="text">
																			</div>
																			<div class="fe-padding">
																				<div style="padding-left: 0px"
																					class="txt-gray17normal">Bank Name</div>
																				<input name="bankname" value="" maxlength="20" type="text">
																			</div>
																			<div class="fe-padding">
																				<div style="padding-left: 0px"
																					class="txt-gray17normal">City</div>
																				<input name="city" value="" maxlength="20" type="text">
																			</div>
																			<div class="fe-padding">
																				<div style="padding-left: 0px"
																					class="txt-gray17normal">Branch</div>
																				<input name="branch" value="" maxlength="20" type="text">
																			</div>
																			<div>
																				<div>
																					<span class="txt-gray17normal">MICR code </span><br>
																					<span class="txt-gray11normal"> (9 digit
																						code found at the bottom of your cheque) </span>
																				</div>
																				<table cellpadding="0" cellspacing="0">
																					<tr>
																						<td><input name="micr" value="" maxlength="20" type="text"></td>
																						<td
																							style="background: url('https://securepics.ebaystatic.com/aw/pics/in/psp_new/seller_reg_micra_140408.gif'); background-repeat: repeat-x; height: 2px; background-position: center; width: 16%"></td>
																						<td style="float: right; padding-bottom: 3px"><img
																							src="https://securepics.ebaystatic.com/aw/pics/in/psp_new/seller_reg_micr_140408.gif"
																							alt="" align="absmiddle"></td>
																					</tr>
																				</table>
																			</div>
																		</div>
																		<div
																			style="margin-top: 10px; margin-left: 350px; width: 532px">
																			<div class="whiteboxld"
																				style="background-image: url(https://securepics.ebaystatic.com/aw/pics/in/psp_new/seller_reg_corner_wt_lb_160707.gif);">
																				<div class="whiteboxrd"
																					style="background-image: url(https://securepics.ebaystatic.com/aw/pics/in/psp_new/seller_reg_corner_wt_rb_160707.gif);">
																					<div class="whiteboxlt"
																						style="background-image: url(https://securepics.ebaystatic.com/aw/pics/in/psp_new/seller_reg_corner_wt_lt_160707.gif);">
																						<div class="whiteboxrt"
																							style="background-image: url(https://securepics.ebaystatic.com/aw/pics/in/psp_new/seller_reg_corner_wt_rt_160707.gif);">
																							<div class="whiteboxtb">
																								<div class="whiteboxlr">
																									<ul id="instruction">
																										<li><span class="txt-gray13normal">Please
																												provide accurate details to ensure you
																												receive your payments without any delays.</span></li>
																										<li><span class="txt-gray13normal">The
																												payee name should be the exact name in which
																												you hold your bank account.</span></li>
																										<li><span class="txt-gray13normal">The
																												details you provide to PaisaPay are
																												protected and secure. Please review our <a
																												href="http://pages.ebay.in/help/policies/paisapay-policy-data-privacy-security.html"
																												target="_blank">Data Privacy and
																													Security Policy</a> to know how PaisaPay
																												protects your bank account information.
																										</span></li>
																									</ul>
																								</div>
																							</div>
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																		<div
																			style="margin-top: 10px; margin-left: 350px; width: 532px"
																			id="right-table">
																			<div style="padding-bottom: 10px; padding-top: 10px">
																				<span style="color: #6E6E6E"><b>Can't
																						find your Bank, City or Branch? Contact us!</b></span>
																			</div>
																			<div>
																				<table>
																					<tr style="height: 45px">
																						<td><span><img
																								src="https://securepics.ebaystatic.com/aw/pics/psp_new/seller_reg_b_110408.gif"
																								alt="" align="absmiddle"></span></td>
																						<td><span style="color: #6E6E6E"><b>Phone
																									Support</b> - 1800 209 3229 (All networks)<br></span><span
																							class="txt-gray13normal">(7 days a week
																								9:30 AM to 7:30 PM)</span></td>
																					</tr>
																					<tr>
																						<td><span><img
																								src="https://securepics.ebaystatic.com/aw/pics/psp_new/seller_reg_a_110408.gif"
																								alt="" align="absmiddle"></span></td>
																						<td><span style="color: #6E6E6E"><b>Live
																									Chat</b> - </span><span><br></span><span class="txt-gray13normal">(Monday
																								to Friday,10:00 AM to 6:00 PM)</span></td>
																					</tr>
																					<tr>
																						<td><span><img
																								src="https://securepics.ebaystatic.com/aw/pics/psp_new/seller_reg_c_110408.gif"
																								alt="" align="absmiddle"></span></td>
																						<td><span style="color: #6E6E6E"><b>Email
																									Us</b> - </span><span></span></td>
																					</tr>
																				</table>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="agreement">
												<div>
													<div>
														<div class="yellowboxld">
															<div
																style="background: url('https://securepics.ebaystatic.com/aw/pics/in/psp_new/seller_reg_corner_yellow_l_160707.gif') no-repeat left top; position: relative;">
																<div
																	style="background: url('https://securepics.ebaystatic.com/aw/pics/in/psp_new/seller_reg_corner_yellow_r_160707.gif') no-repeat right top; position: relative;">
																	<div class="yellowboxtb">
																		<div class="yellowboxlr">
																			<b>PaisaPay Seller Terms &amp; Conditions</b>
																		</div>
																	</div>
																</div>
															</div>
														</div>
														<div
															style="background: #FFFFFF url('https://securepics.ebaystatic.com/aw/pics/in/psp_new/corner_i.gif') no-repeat scroll left bottom; position: relative;">
															<div
																style="background: transparent url('https://securepics.ebaystatic.com/aw/pics/in/psp_new/corner_j.gif') no-repeat right bottom;">
																<div class="yellowboxcontb">
																	<div class="yellowboxconlr">
																		<span class="txt-gray13normal"><table>
																				<tr>
																					<td valign="top"><input type="checkbox"
																						name="termscondition" required="required" title="Please agree to terms and conditions"></td>
																					<td>That by clicking on the box I agree that I
																						have read and understood the <a
																						href="#">PaisaPay Seller Terms &amp;
																							Conditions</a>(hereinafter referred as the "Seller
																						Terms &amp; Conditions") and unconditionally
																						accept to be legally bound by the following:
																					</td>
																				</tr>
																			</table></span>
																		<ul id="agreement">
																			<li>That I have had reasonable opportunity and
																				time to read, understand and take proper advice;</li>
																			<li>That while using PaisaPay services, I
																				unequivocally agree &amp; undertake to abide by and
																				comply with the Seller Terms &amp; Conditions,</li>
																			<li>I further agree that the Seller Terms &amp;
																				conditions are in all respects fair, reasonable and
																				nesessary in order to protect the users of PaisaPay
																				services and the legitimate business interests of
																				PaisaPay;</li>
																			<li>I understand that the information I provide
																				will be collected by PaisaPay (or its succesors and
																				assigns) and stored and processed in accordance with
																				PaisaPay Privacy Policy;</li>
																			<li>I agree that PaisaPay is only a service
																				provider and is not responsible for any
																				non-performance or breach of contract between users
																				of PaisaPay.</li>
																		</ul>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="button">
											<button
												style="background: transparent none repeat scroll 0%; border: 0px none; height: 25px; margin: 0px; padding: 0px; vertical-align: middle;"
												type="submit" value="Register" id="v4-3">
												<span
													style="background: transparent url('https://securepics.ebaystatic.com/aw/pics/viewitem/imgVIPrmryBtnLt.gif') no-repeat scroll left top; color: #FFFFFF; cursor: pointer; display: block; font-family: Arial; font-weight: bold; height: 24px; line-height: 190%; padding-left: 2px; vertical-align: middle; white-space: nowrap; float: left"><span
													style="background: transparent url('https://securepics.ebaystatic.com/aw/pics/buttons/btnViPrmry.gif') no-repeat scroll 100% 0px; font-size: 3.4mm; color: #FFFFFF; cursor: pointer; display: block; font-family: Arial; font-weight: bold; height: 24px; line-height: 190%; padding-left: 15px; padding-right: 15px; vertical-align: middle; white- space: nowrap;">Register
														&gt;</span></span>
											</button>
											<input type="hidden" name="registration">
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</s:if>
		
		
		
		
		
		
		
		
		
		
<!-- 		//User is already registered with paisapay so no registeration form show him the details if u can. -->
		<s:else>
			<div style="margin-left: 5px" class="content_area">
				<div>
					<div class="outer-div">
						<div>
							<strong>Registration details</strong>
						</div>
					</div>
					<div class="divspacer">
						<div>
							<div>
								<div>
									<div>
										<div>
											<div class="bluegrayboxld">
												<div
													style="background-image: url('https://securepics.ebaystatic.com/aw/pics/psp_new/corner_e.gif'); background-repeat: no-repeat; background-position: left top; position: relative">
													<div
														style="background-image: url('https://securepics.ebaystatic.com/aw/pics/psp_new/corner_f.gif'); background-repeat: no-repeat; background-position: right top;">
														<div class="bluegrayboxtb">
															<div class="bluegrayboxlr">
																<span class="txt-black13bold">PaisaPay seller
																	registration status</span>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="wrapper-div">
										<div
											style="background-image: url('https://securepics.ebaystatic.com/aw/pics/in/psp_new/seller_reg_corner_wt_lb_160707.gif'); background-repeat: no-repeat; background-position: left bottom;">
											<div
												style="background-image: url('https://securepics.ebaystatic.com/aw/pics/in/psp_new/seller_reg_corner_wt_rb_160707.gif'); background-repeat: no-repeat; background-position: right bottom;">
												<div class="yellowboxcontb"
													style="border-bottom: 1px solid #cfcfcf; margin-bottom: 0px; margin-left: 5px; margin-right: 5px">
													<div class="yellowboxconlr">
														<table width="100%" cellpadding="0" cellspacing="0"
															border="0">
															<tr>
																<td width="20" align="left"></td>
																<td align="left">Your PaisaPay seller registration
																	is active.
																</td>
															</tr>
														</table>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="remittanceDetail">
						<div>
							<div class="long-gray-box2">
								<div class="bluegrayboxld">
									<div
										style="background-image: url('https://securepics.ebaystatic.com/aw/pics/psp_new/corner_e.gif'); background-repeat: no-repeat; background-position: left top; position: relative">
										<div class="bluegrayboxrt"
											style="background-image: url('https://securepics.ebaystatic.com/aw/pics/psp_new/corner_f.gif'); background-repeat: no-repeat; background-position: right top; position: relative">
											<div class="bluegrayboxtb">
												<div class="bluegrayboxlr">
													<span class="txt-black13bold">Remittance details</span>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div
								style="background-image: url('https://securepics.ebaystatic.com/aw/pics/in/psp_new/seller_reg_corner_wt_lb_160707.gif'); background-repeat: no-repeat; background-position: left bottom; position: relative">
								<div
									style="background-image: url('https://securepics.ebaystatic.com/aw/pics/in/psp_new/seller_reg_corner_wt_rb_160707.gif'); background-repeat: no-repeat; background-position: right bottom; position: relative">
									<div class="yellowboxcontb">
										<div class="yellowboxconlr">
											<table>
												<tr>
													<td width="27%" class="txt-black13bold">Payee Name:</td>
													<td width="65%" class="txt1-black13normal"><s:property value="acc_holder"/></td>
													<td width="8%" class="txt2-black13norma"></td>
												</tr>
												<tr>
													<td class="txt-black13bold">Bank account number:</td>
													<td class="txt1-black13normal"><s:property value="acc_no"/></td>
													<td class="txt2-black13norma"></td>
												</tr>
												<tr>
													<td class="txt-black13bold">Bank name:</td>
													<td class="txt1-black13normal"><s:property value="bank_name"/></td>
													<td class="txt2-black13norma"></td>
												</tr>
													<div></div>
												
												<tr>
													<td colspan="3"><div
															style="background: #e9e9e9 no-repeat scroll bottom left; background-image: url('https://securepics.ebaystatic.com/aw/pics/psp_new/corner_k.gif'); background-repeat: no-repeat; background-position: left bottom;">
															<div
																style="background-image: url('https://securepics.ebaystatic.com/aw/pics/psp_new/corner_l.gif'); background-repeat: no-repeat; background-position: right bottom;">
																<div
																	style="background-image: url('https://securepics.ebaystatic.com/aw/pics/psp_new/corner_e.gif'); background-repeat: no-repeat; background-position: left top;">
																	<div
																		style="background-image: url('https://securepics.ebaystatic.com/aw/pics/psp_new/corner_f.gif'); background-repeat: no-repeat; background-position: right top;">
																		<div class="grayboxtb">
																			<div class="grayboxlr">
																				<span class="txt-black13normal">PaisaPay
																					remittances will be transferred online to your
																					registered bank account every Monday and Thursday.
																					Please provide accurate bank details to ensure you
																					receive your payments without any delays.</span>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
														<div></div></td>
												</tr>
												
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</s:else>
	</div>




</body>
</html>