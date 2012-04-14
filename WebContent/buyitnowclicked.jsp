<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ taglib prefix="s" uri="/struts-tags"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Select shipping and payment method</title>
<link rel="stylesheet" type="text/css"
	href="buyitnow/44sahi3l3azqpahlonk2cetjj.css">
<link rel="stylesheet" type="text/css"
	href="buyitnow/43j513lpmi0mzpaok33s5y2u0.css">
<style type="text/css">
.pagewidth {
	width: 100%;
	min-width: 760px
}

* html .pageminwidth {
	padding-left: 760px
}

* html .pagecontainer {
	margin-left: -760px;
	position: relative
}

* html .pageminwidth,* html .pagecontainer,* html .pagelayout {
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

.sp-txt {
	font: normal 1.231em trebuchet, "trebuchet MS";
	float: left;
	color: #333;
	padding-right: 5px
}

.sp-w table {
	padding-top: 6px
}

.sp-w td {
	text-align: right;
	vertical-align: top
}

.sp-d,.sp-a,.sp-c {
	position: relative;
	margin-left: 4px;
	padding: 10px 0 0 29px;
	background: repeat-x 0 -263px;
	font: normal 1em arial
}

.sp-a,.sp-c {
	position: relative;
	margin-left: 4px;
	background: repeat-x 0 -33px;
	padding: 10px 3px 0 29px
}

.sp-d,.sp-a {
	color: #777
}

.sp-c {
	color: #333
}

.sp-c u {
	background: no-repeat 0 0;
	position: absolute;
	right: -1px;
	top: 0;
	width: 10px;
	height: 10px
}

.sp-d,.sp-a,.sp-c,.sp-c u {
	background-image:
		url(http://q.ebaystatic.com/aw/pics/cmp/ds2/sprSignPost.png)
}

.sp-bpd {
	padding-bottom: 20px
}

.btn-w,.btn-b,.btn-b input,.btn-b b,.btn-b a {
	background: transparent none no-repeat 0 0;
	height: 25px;
	display: inline-block;
	outline: none
}

.btn-w {
	text-align: left;
	height: 26px
}

.btn-p {
	padding: 0 8px 0 8px
}

.btn-h {
	display: none
}

.btn-m {
	margin: 8px 0
}

.btn-b {
	background-position: 100% -35px;
	padding: 0 3px 0 0;
	vertical-align: middle;
	z-index: 2
}

.btn-b input,.btn-b b,.btn-b a {
	border: 0;
	color: #fff;
	font: bold small Arial !important;
	padding: 2px 15px 3px;
	cursor: pointer;
	margin: 0 -3px;
	white-space: nowrap
}

.btn-bo {
	background-position: 100% -105px
}

.btn-bo input,.btn-bo a {
	background-position: 0 -70px
}

.btn-bp {
	background-position: 100% -175px
}

.btn-bp input,.btn-bp a {
	background-position: 0 -140px;
	padding: 3px 14px 2px 16px
}

.btn-bd {
	background-position: 100% -245px;
	cursor: default
}

.btn-bd input,.btn-bd b,.btn-bd a {
	background-position: 0 -210px;
	cursor: default;
	color: #f5f5f5
}

.btn-b b,.btn-b a {
	padding: 4px 17px 6px;
	height: auto
}

.btn-w,.btn-b,.btn-b b,.btn-b a {
	position: relative !important
}

.btn-b a,.btn-b a:hover,.btn-b a:visited,.btn-b a:active {
	text-decoration: none;
	color: #fff !important
}

.btn-b b {
	display: none
}

.btn-bp a {
	padding: 5px 16px 5px 18px
}

.btn-w i {
	background: #3c58c5 none repeat scroll 0 0;
	border: 2px outset;
	color: #3c58c5;
	margin: 1px 0 1px 4px;
	padding: 2px 5px 1px;
	position: absolute;
	white-space: nowrap;
	font-size: .923em
}

.pbn-P,.pbn-P input,.pbn-P b,.pbn-P a {
	background-image:
		url(http://q.ebaystatic.com/aw/pics/cmp/btn/sprbtnprimary.png)
}

div.btnMsgBar span.msg {
	font-family: Arial, Helvetica, sans-serif;
	font-size: small;
	white-space: nowrap
}

div.btnMsgBar input.btnMsgBar-bTxt {
	font-family: Arial, Helvetica, sans-serif;
	font-size: small;
	text-align: center;
	text-decoration: none;
	white-space: nowrap;
	cursor: pointer
}

.coreFooterLinks a:active,.coreFooterLinks a:focus,.coreFooterLinks a:hover,.coreFooterLinks a:link
	{
	font-family: Verdana;
	font-size: x-small;
	color: #00c;
	display: inline-block
}

.gh-nav a:active,.gh-nav a:focus,.gh-nav a:hover,.gh-nav a:link {
	font-family: Arial;
	font-size: small;
	color: #333
}

.coreFooterLinks a:visited {
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

.footerBG img,.footerBGPost img {
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

.gh-vs .gh-cw {
	padding: 10px 0
}

.gh-vs .gh-cbtn {
	background-image:
		url(http://p.ebaystatic.com/aw/pics/buttons/btnClose_16x16.gif);
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

.gh-vs .gh-ttl {
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

.gh-fol a b {
	background: transparent
		url(http://p.ebaystatic.com/aw/pics/buttons/btnClose_16x16.gif)
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

.cr-hr {
	padding: 0 0 10px;
	margin: 0 0 12px;
	border-bottom: 1px solid #ccc;
	color: #333;
	font: bold 1.231em Trebuchet, "Trebuchet MS"
}

.cr-mz {
	margin: 0
}

.cr-c .cr-hr {
	padding: 0 0 5px;
	margin: 0 0 5px
}

.cr-nr .cr-hr {
	margin: 0;
	border: 0
}

.cr-lt .cr-hr {
	font-weight: normal;
	font-size: 1.385em;
	padding-bottom: 9px;
	margin-bottom: 8px
}

.cr-brd,.cr-bt {
	border: 1px solid #ccc;
	padding: 9px 11px
}

.cr-bt .cr-hr {
	margin: -2px 0 0;
	border: 0;
	padding: 0 0 3px
}

.cr-bt .cr-cnt {
	padding: 0
}

.cr-st .cr-hr {
	font-size: 1.077em;
	font-weight: bold
}

.cr-cp .cr-hr {
	padding: 5px 15px;
	margin: 0
}

.cr-cp .cr-cnt {
	padding: 12px 15px
}
</style>
<!--[if lt IE 8]><style>.btn-b input{position:relative;left:-3px;padding:0 16px 0 15px;width:1%}.btn-b b,.btn-b a{left:-3px;padding:4px 15px 5px 16px}.btn-bp a{padding:5px 14px 4px 17px}</style><![endif]-->
<!--[if IE 6]><style>.btn-b input{overflow:visible;width:0}</style><![endif]-->
<!--[if IE 8]><style>.btn-b input{padding:2px 17px 3px}.btn-bp input{background-position:1px -139px}</style><![endif]-->
<script type="text/javascript" src="buyitnow/a.js"></script>
<link href="buyitnow/a.css" type="text/css" rel="stylesheet">
</head>
<body id="body">
	<script type="text/javascript"
		src="buyitnow/5oiu3dmnniy4tculwdphcncts.js"></script>
	<mytubeelement savebandwidth="false" enablefullscreen="true"
		onlynotification="false" fshd="false" quality="small"
		autoplayonsmartbuffer="true" autoplayonbufferpercentage="42"
		autoplayonbuffer="false" autobuffer="false" autoplay="false"
		hidepopup="false" loop="false" enable="true" soundnotification="true"
		desktopnotification="true" id="myTubeElement">
	<bundle any_moment="Any Moment" sec="Sec" min="Min" hr="Hr"
		stopped="Stopped" completed="Completed"
		will_start_playing_when_initialized="Will start playing when initialized"
		will_start_buffering_when_initialized="Will start buffering when initialized"
		waiting="Waiting" calculating="Calculating"
		adblock_interferance_message="Adblock (or similar extension) is known to interfere with SmartVideo. Please add this url to adblock whitelist."
		error="Error" notification_status_delimitor=";"
		desktop_notification_denied="You have denied permission for desktop notification for this site"
		click_to_enable_for_this_site="Click to enable for this site"
		off="Off" on="On" not_supported="Not Supported"
		buffered_message="The video has been buffered as requested and is ready to play."
		hyphen="-" buffered="Buffered" video_buffered="Video Buffered"
		no_notification_supported_on_your_browser="No notification style supported on your browser version"
		global_preferences="Global Preferences"
		estimated_time="Estimated Time" only_notify="Only Notify" loop="Loop"
		continuation_on_next_line="-"
		desktop_notification="Desktop Notification" sound="Sound"
		start_playing_when_buffered="Start playing when buffered"
		smart_buffer="Smart Buffer" percentage="%" label_delimitor=":"></bundle></mytubeelement>
	<script type="text/javascript">vjo.dsf.error.ErrorHandlerManager.register(new vjo.dsf.error.DefaultErrorHandler());
vjo.dsf.error.ErrorHandlerManager.enableOnError(true, false);
vjo.dsf.cookie.VjCookieJar.sCookieDomain = '.ebay.in';vjo.dsf.cookie.VtotojCookieJar.writeCookielet('ebay','js','1');
</script>
	<script type="text/javascript">var _GlobalNavHeaderUtf8Encoding=true;
</script>
	<div></div>
	<div class="pagewidth">
		<div class="pageminwidth">
			<div class="pagelayout">
				<div class="pagecontainer">
					<div class="GlobalNavigation" id="GlobalNavigation">
						<!--cacheStatus: true-->
						<script>var _GlobalNavHeaderUtf8Encoding=true;</script>
						<script src="buyitnow/dmbqkc3eg20rvfehnpdqdnwpy.js"></script>
						<div id="gnheader" class="gh-w">
							<div id="cobrandHeader"></div>
							<a href="#mainContent" rel="nofollow"
								style="display: block; position: absolute; left: -9999px;">Skip
								to main content</a>
							<div>
								<!-- headerType=MIN:DEFAULT:BUY-->
								<script type="text/javascript">var svrGMT = 1333797554828;</script>
								<div></div>
								<div class="gh-eb" style="visibility: hidden; display: none;">
									<div class="gh-emn">&nbsp;</div>
								</div>
								<div class="gh-log">
									<span class="gh-lg"><a href="http://www.ebay.in/"
										rel="nofollow"> <img
											src="buyitnow/logoEbay_x45.gif" alt="eBay"
											border="0">
									</a>
									</span>
								</div>
								<span></span>
								<div class="gh-cl"></div>
								<div class="gh-col">
									<b class="gh-c1"></b><b class="gh-c2"></b><b class="gh-c3"></b><b
										class="gh-c4"></b><b class="gh-c5"></b><b class="gh-c6"></b><b
										class="gh-c7"></b>
									<div class="gh-clr"></div>
								</div>
								<a name="mainContent"></a>
							</div>
						</div>
					</div>
					<div class="AreaNavigation" id="AreaNavigation"></div>
					<div class="AreaTitle" id="AreaTitle">
						<table class="widthpercent">
							<tbody>
								<tr>
									<td><div class="sp-w">
											<table cellpadding="0" cellspacing="0">
												<tbody>
													<tr>
														<td style="width: 50%;"><div class="sp-c">
																<u></u>Order
															</div>
														</td>
														<td style="width: 50%;"><div class="sp-d">Pay
																Securely</div>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</td>
									<td align="right"><span><font
											style="font-size: 20px; color: #948e8c; font-weight: bold; vertical-align: middle">&lt;
										</font><a
											href="http://cgi.ebay.in/ws/eBayISAPI.dll?ViewItem&amp;item=270950260152"
											style="color: rgb(0, 51, 255);"
											title="Back to item description">
										</a>
									</span>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="PageLevelMessageArea" id="PageLevelMessageArea">
						<div id="qtyerrid"></div>
					</div>
					<div class="CentralArea" id="CentralArea">
						<table style="width: 100%;">
							<tbody>
								<tr>
									<td><form name="pageForm" autocomplete="OFF"
											action="ProceedToPayment.action"
											method="get" id="SSPMformID">
											<input value="CreateOrder" name="MfcISAPICommand"
												type="hidden"><input name="paymenthidden"
												id="paymenthidden" value="29" type="hidden"><input
												name="shippinghidden" id="shippinghidden" value="20301"
												type="hidden"><input name="siteid" value="203"
												id="siteid" type="hidden"><input name="saleid"
												value="270950260152" id="saleid" type="hidden"><input
												name="bucketid" value="1" id="bucketid" type="hidden"><input
												name="clientId" value="10" id="clientId" type="hidden"><input
												name="action" value="update" id="action" type="hidden"><input
												name="isbinflow" value="1" id="isbinflow" type="hidden"><input
												name="cartid" value="6741964010" id="cartid" type="hidden"><input
												name="addrid" value="502596568025" id="addrid" type="hidden"><input
												name="savecart" value="savecart" id="savecart" type="hidden"><input
												name="buyerId" value="1098404850" id="buyerId" type="hidden"><input
												name="pageid" id="pageid" value="3965" type="hidden"><input
												name="guestflow" id="guestflow" value="false" type="hidden">
											<div class="mainHeader">
												<div>
													<div class="mainHeader">
														<div>
															<div class="pageIntroSC" style="padding-top: 15px;">
																<div style="color: #333333">
																	Please select a payment method, and click the <b>Continue</b>
																	button at the bottom of the page.
																</div>
																<span align="right"
																	style="float: right; margin-top: -15px;"><span><a
																		href="javascript:void()"><img
																			src="buyitnow/ico_Livehelp_new.gif"
																			id="livechathelp" name="livechathelp" border="0">
																	</a>
																</span>
																</span>
															</div>
															<div>
																<table class="cr-w cr-nr" style="width: 100%;"
																	cellpadding="0" cellspacing="0">
																	<tbody>
																		<tr>
																			<td><div class="cr-hr">
																					<div class="itemsumstyle">
																						<b>Review the items you are buying and your
																							order total</b>
																					</div>
																				</div>
																			</td>
																		</tr>
																		<s:iterator value="arr">
																		<input type="hidden" name="item_id" value="<s:property value="item_id"/>"/>
																		<input type="hidden" name="quantity" value="<s:property value="quantity"/>"/>
																		<tr>
																			<td><div class="cr-cnt">
																					<div>
																						<div
																							style="margin-left: -10px; margin-right: -10px; margin-top: -7px;"
																							class="sellerinst">
																							<table style="width: 100%; border: 0px none;">
																								<tbody>
																									<tr>
																										<td class="txt-black13bold"
																											style="width: 71%; text-align: right;">Price</td>
																										<td style="width: 14%;"><span
																											class="txt-black13bold"
																											style="text-align: middle; padding-left: 70px;">Quantity</span>
																										</td>
																										<td class="txt-black13bold"
																											style="width: 15%; text-align: right; padding-right: 10px;">Sub-total</td>
																									</tr>
																								</tbody>
																							</table>
																						</div>
																						<div>
																							<div
																								style="color: #333333; border-bottom: 1px solid #cccccc">
																								<div id="270950260152">
																									<div class="item-summ-body-c">
																										<div class="item-summ-body-image">
																											<div style="Height: 80px; Width: 80px;">
																												<a
																													href="#"><img height="75" width="75"
																													src="retrieve.jsp?item_id=<s:property value="item_id"/>"
																													alt="" border="0">
																												</a>
																											</div>
																										</div>
																										<div class="item-summ-body-title-57"
																											style="padding-bottom: 40px;">
																											<div>
																												<div class="item-summ-body-titleinline">
																													<a
																														href="BuyItNow.action?item_id=<s:property value="item_id"/>"
																														style="color: rgb(0, 51, 255);"><s:property value="item_name"/></a>
																												</div>
																											</div>
																											<div>
																												<b class="item-summ-bseller-pad">From
																													seller:</b>
																												<div class="item-summ-body-titleinline"
																													style="color: #0033ff;">
																													<a title="Member id itplaza2011"
																														href="http://myworld.ebay.in/itplaza2011"><b
																														class="g-hdn">Member id </b><span
																														class="mbg-nw"><s:property value="item_seller"/></span>
																													</a> 
																												</div>
																											</div>
																										</div>
																										<div class="single-item-summ-body-price">Rs.
																											<s:property value="item_price"/></div>
																										<div class="single-item-summ-body-qty">
																											<s:property value="quantity"/>
																										</div>
																										<div class="stDiv">
																											<table class="amountTable">
																												<tbody>
																													<tr>
																														<td class="symDivTd"><div
																																class="symDiv">Rs.</div>
																														</td>
																														<td class="priceDivTd"><div
																																class="priceDiv" id="regsubtotal"><s:property value="item_price"/></div>
																														</td>
																													</tr>
																												</tbody>
																											</table>
																										</div>
																										<input name="req_item" id="req_item"
																											value="270950260152" type="hidden">
																									</div>
																								</div>
																							</div>
																						</div>
																					</div>
																				</div>
																			</td>
																		</tr>
																	</tbody>
																</table>
															</div>
															<div class="tbl1viewaddr1"></div>
															<div>
																<div class="left-blue-box">
																	<div>
																		<div style="color: #333333">
																			<div class="cr-w">
																				<div class="cr-hr">
																					<div>
																						<b><div>
																								<span>Your shipping address</span>
																							</div>
																						</b>
																					</div>
																				</div>
																				<div class="cr-cnt">
																					<div style="height: 150px; padding-left: 5px">
																						<div>
																							<input id="addDsplCountry"
																								value="com.ebay.darwin.app.spark.pres.AddressLayoutIN"
																								type="hidden">
																							<div class="g-std" id="addrrow">
																								<div id="addrrow">
																									<b><s:property value="user_name"/></b>
																								</div>
																								<div id="addrrow">
																									<span><s:property value="user_home_address"/></span>
																								</div>
																								<div id="addrrow"></div>
																								<div id="addrrow">
																									<span><s:property value="user_city"/></span>
																								</div>
																								<div id="addrrow">
																									<span><s:property value="user_state"/></span>
																								</div>
																								<div id="addrrow"></div>
																								<div id="addrrow"></div>
																							</div>
																						</div>
																						<div style="padding-top: 10px;">
																							
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="right-blue-box">
																	<div style="color: #333333">
																		<div>
																			<div>
																				<div>
																					<div class="cr-w">
																						<div class="cr-hr">
																							<div class="shipmethod">
																								<span><b>Order Total and Shipping
																										Charges</b>
																								</span>
																							</div>
																						</div>
																						<div class="cr-cnt">
																							<div>
																								<div>
																									<div class="sub-div" style="height: 100px;"
																										id="gxoshippingid">
																										<div class="sub-div-left2">
																											<b>Sub-Total</b>
																										</div>
																										<div class="sub-div-middle2">Rs.</div>
																										<div class="sub-div-right2"><s:property value="item_price"/></div>
																										<div class="sub-div-left">
																											<b>Shipping method: </b><input
																												name="shipping_method" id="shipping_method"
																												value="20301" type="hidden">National
																											Courier - Delivery outside seller's city
																										</div>
																										<div class="sub-div-middle"
																											style="width: 7.7%">Rs.</div>
																										<div class="sub-div-right"><s:property value="item_shipping_charge"/></div>
																										<div class="separator">
																											<img src="buyitnow/s.gif"
																												height="1" width="1">
																										</div>
																										<div class="sub-div-ltotal">Total</div>
																										<div class="sub-div-mtotal"
																											style="width: 7.7%">Rs.</div>
																										<div class="sub-div-rtotal"><s:property value="item_total_shipping"/></div>
																										<div class="taxmessage">The item price
																											is inclusive of all applicable taxes.</div>
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
															</div>
														</div>
														<div class="spacer10" style="clear: both"></div>
														<div style="color: #333333">
															<div>
																<table class="cr-w cr-nr" style="width: 100%;"
																	cellpadding="0" cellspacing="0">
																	<tbody>
																		<tr>
																			<td><div class="cr-hr">
																					<div class="widthpercent paymentheader">
																						<b>Select payment method</b>
																					</div>
																				</div>
																			</td>
																		</tr>
																		<tr>
																			<td><div class="cr-cnt">
																					<div>
																						<table cellpadding="0" cellspacing="0">
																							<tbody>
																								<tr>
																									<td valign="top" width="68%"><div>
																											<div class="ps-ppImgEscrow"
																												style="padding-left: 25px; float: none;">
																												<img
																													src="buyitnow/pp_escrow_full_tag_130807_135x70.gif"
																													height="70" width="135"><span
																													class="ps-span"
																													style="padding-left: 10px; font-size: 11px">To
																													know more about PaisaPay <a
																													href="http://pages.ebay.in/help/buy/payment.html"
																													target="_blank">click here.</a>
																												</span>
																											</div>
																										</div>
																										<div class="ps-ppButton">
																										<s:radio label="paymentmode" name="paymentmode" list="#{'1':'Credit Card','2':'Debit Card'}" value="1" />
																										<s:select name="banks" headerKey="-1" headerValue="--Select Bank--" list = "lstBanks"/>
																											<!-- <input name="payment_method" value="29"
																												id="29"> -->
																												<!-- onclick='return vjo.Registry._7.handlePaymentMethod("emiselected", "29", true);'
																												checked="checked" type="radio"> -->
																										</div>
																										<!-- <div style="margin-left: 26px;">Credit
																											card, debit card, online bank transfer, cash
																											cards, mobile payments and eBay gift voucher
																											/ promotion code.</div> -->
																										
																										<div></div>
																									</td>
																									<td rowspan="2" class="ps-tdEscrow" width="22%"><div>
																											<div class="cr-w">
																												<div class="cr-hr">
																													<div
																														style="border-bottom: 1px solid #cccccc; padding-bottom: 5px">
																														<b>PaisaPay, the smart choice</b>
																													</div>
																												</div>
																												<div class="cr-cnt">
																													<div style="white-space: nowrap;">
																														<img
																															src="buyitnow/icoPasiaPay_GXO_110311.gif"
																															alt="" class="ps-bImg" height="25"
																															width="25"><font color="#333333">PaisaPay
																															sends your money to the seller</font>
																														<div
																															style="padding-left: 43px; margin-top: -5px; color: #333333">
																															<font color="#333333">after you
																																get the item</font>
																														</div>
																														<br>
																														<img
																															src="buyitnow/icoShipping_GXO_180311.jpg"
																															alt="" class="ps-bImg" height="25"
																															width="25"><font color="#333333">Most
																															items are shipped within 2 days</font>
																														<div
																															style="padding-left: 43px; margin-top: -5px; color: #333333">
																															<font color="#333333">of payment</font>
																														</div>
																														<br>
																														<img
																															src="buyitnow/icoGuarantee_GXO_110311.gif"
																															alt="" class="ps-bImg" height="25"
																															width="25"><font color="#333333">Replacement
																															or Refund if you are not</font>
																														<div
																															style="padding-left: 43px; margin-top: -5px; color: #333333">
																															<font color="#333333">100%
																																satisfied*</font>
																														</div>
																														<br>
																														<div align="right">
																															<a
																																href="http://pages.ebay.in/help/policies/paisapay/paisapay-refund-claim.html"
																																target="_blank"
																																style="color: rgb(0, 51, 255);">Know
																																more</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
																																color="#333333">*T&amp;C apply</font>
																														</div>
																													</div>
																												</div>
																											</div>
																										</div>
																									</td>
																								</tr>
																							</tbody>
																						</table>
																					</div>
																				</div>
																			</td>
																		</tr>
																	</tbody>
																</table>
															</div>
														</div>
														<div class="spacer"></div>
													</div>
												</div>
											</div>
											<div
												style="margin-left: 8px; padding-left: 8px; display: none; color: #0000cc; width: 40%; padding: 5px 5px 5px 5px"
												id="orderMsgId" class="orderTotalAlert">
												<b>Your order total may have changed. Please review your
													order before proceeding</b>
											</div>
											<div>
												<div class="btnMsgBar">
													<input class="continuebutton btnMsgBar-bTxt" type="hidden"><span
														style="vertical-align: middle;"><b id="continue"
														class="btn-w btn-m btn-p"><i>Continue &gt;</i><span
															id="spn_continue" class="btn-b moz btn-b pbn-P"><input
																id="but_continue" name="" value="Continue &gt;"
																type="submit"><b id="txt_continue">Continue
																	&gt;</b>
														</span>
													</b>
													</span>&nbsp;&nbsp;<span class="msg">You will confirm the
														order in the next step.</span>
												</div>
											</div>
											</s:iterator>
										</form>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="SupportiveNavigation" id="SupportiveNavigation">
						<script>var pageID='CreateOrder';
var pageName='SIPSelectShippingPayment';

</script>
						<div class="aboveFooter"></div>
						<!--cacheStatus: false-->
						<span class="ebay"><div class="coreFooterLinks"
								id="glbfooter">
								<table border="0" cellpadding="0" cellspacing="0" width="100%">
									<tbody>
										<tr>
											<td class="g-pipe"><img src="buyitnow/s.gif"
												alt="" height="10" width="1"><br>
											<a href="http://pages.ebay.in/aboutebay.html">About eBay</a>
												| <a href="http://www2.ebay.com/aw/marketing-in.shtml">Announcements</a>
												| <a href="http://hub.shop.ebay.in/">Buy Hub</a> | <a
												href="https://scgi.ebay.in/ws/eBayISAPI.dll?RegisterEnterInfo">Register</a>
												| <a href="http://pages.ebay.in/securitycentre/index.html">Security
													&amp; Resolution Centre</a> | <a
												href="http://pages.ebay.in/services/forum/feedback.html">Feedback
													Forum</a> | <a href="http://pages.ebay.in/sitemap.html">Site
													Map</a> | <a
												href="http://ocs.ebay.in/ws/eBayISAPI.dll?CustomerSupportRedirect&amp;target=help">Customer
													Support</a>
											</td>
										</tr>
										<tr>
											<td height="5"></td>
										</tr>
										<tr>
											<td colspan="2" bgcolor="#CCCCCC" height="1"></td>
										</tr>
										<tr>
											<td height="5"></td>
										</tr>
										<tr class="g-hlp" valign="top">
											<td class="g-nav coreFooterLegalNotice">Copyright ©
												1995-2012 eBay Inc. All Rights Reserved. Designated
												trademarks and brands are the property of their respective
												owners. Use of this Web site constitutes acceptance of the
												eBay <a title=" "
												href="http://pages.ebay.in/help/policies/user-agreement.html"
												target="_blank" rel="nofollow">User Agreement</a> and <a
												title=" "
												href="http://pages.ebay.in/help/policies/privacy-policy.html"
												target="_blank" rel="nofollow">Privacy Policy</a>.<br>
											<img src="buyitnow/s.gif" alt="" height="20">
											<table border="0" cellpadding="0" cellspacing="0"
													width="100%">
													<tbody>
														<tr>
															<td class="g-nav" width="100%"><a rel="nofollow"
																href="http://viv.ebay.in/ws/eBayISAPI.dll?EbayTime">eBay
																	official time&nbsp;</a>
															</td>
														</tr>
													</tbody>
												</table>
											</td>
										</tr>
									</tbody>
								</table>
								<div id="cobrandFooter"></div>
							</div>
						</span>
						<script type="text/javascript">var _GlobalNavHeaderStatic=false,_GlobalNavHeaderCookieTracking=true,_GlobalNavHeaderSrcPageId=PageCreateOrder=3965;</script>
						<script type="text/javascript">var un="undefined";if(typeof(vjo)!=un && typeof(vjo.darwin)!=un && typeof(vjo.darwin.core)!=un && typeof(vjo.darwin.core.ebayheader)!=un && typeof(vjo.darwin.core.ebayheader.rtm)!=un && typeof(vjo.darwin.core.ebayheader.rtm.GlobalHeaderRtmCall)!=un)vjo.darwin.core.ebayheader.rtm.GlobalHeaderRtmCall.submitRTMCall("")</script>
						<script type="text/javascript">var un="undefined";if(typeof(vjo)!=un && typeof(vjo.darwin)!=un && typeof(vjo.darwin.core)!=un && typeof(vjo.darwin.core.ebayheader)!=un && typeof(vjo.darwin.core.ebayheader.rover)!=un && typeof(vjo.darwin.core.ebayheader.rover.FooterRover)!=un)vjo.darwin.core.ebayheader.rover.FooterRover.roverService("http://rover.ebay.in/idmap/0?footer")</script>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>