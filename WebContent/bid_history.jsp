<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ taglib prefix="s" uri="/struts-tags"%>
<head>
<!--eBay V3- msxml 6.0 XXXXXXXXXXXXXXXXXXXXXXXXXX-->
<!--srcId: ViewBids-->
<META name="XslBuildInfo"
	content="2012-03-30 13:52:14,,, v.rn77(6215bia,RcmdId ViewBids,RlogId p4lc%60bqlhso%3F%3Cw%7B%28qo31%2B7676cmg-13691d27c65">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/bidhistory3.css">
<link type="text/css" href="css/bidhistory2.css" media="all"
	rel="stylesheet">
<title>eBay India Item Bid History</title>

</head>
<body>
<div><%@ include file="header.jsp"%></div>
<s:iterator value="arr1">
	<div class="pagewidth">
		<div class="pageminwidth">
			<div class="pagelayout">
				<div class="pagecontainer">
					<link rel="stylesheet" type="text/css" href="css/bidhistory.css">

					<div id="gnheader" class="gh-w">
						<div id="cobrandHeader"></div>
						<a href="#mainContent" rel="nofollow"
							style="display: block; position: absolute; left: -9999px">Skip
							to main content</a>
						<div>
							<!-- headerType=FULL:DEFAULT:BUY-->
							<noscript>
								<link rel="stylesheet" type="text/css" href="css/ebay.css">
							</noscript>
							<div class="gh-ovr" id="gbh_ovl">
								<div class="gh-iovr"></div>
							</div>
						</div>
					</div>

					<!--@sghp@ headerStyle=FULL:DEFAULT:BUY:NOSKIPLINK @eghp@-->
					<!-- End eBay Header -->
					<style type="text/css">
<!--
.NewActionBaseTable {
	border: #7F9DB9 1px solid;
	width: 100%;
}

.NewActionBaseTable TD {
	border: none;
	font-size: 12px;
}

.menuItem {
	background-color: white;
}

.myactions {
	border-right: cornflowerblue 1px solid;
	border-top: cornflowerblue 1px solid;
	display: none;
	border-left: cornflowerblue 1px solid;
	width: 150px;
	border-bottom: cornflowerblue 1px solid;
	position: absolute;
	background-color: white;
}
-->
</style>
					<div id="pcce" style="display: none; z-index: 1;"></div>

					<div style="margin-top: -2px;">

						<a
							href="bidding.action?item_id=<s:property value="item_id"/>"
							style="vertical-align: middle;"><img
							src="http://pics.ebaystatic.com/aw/pics/viewitem/backArrow_14x14.gif"
							width="14" height="14" border="0" align="absmiddle" alt=" "><img
							src="http://pics.ebaystatic.com/aw/pics/s.gif" width="5"
							height="1" alt=" " border="0">Back to item description</a>
					</div>
					<table width="100%">
					
						<tr>
							<td valign="top"><table width="100%" border="0"
									cellpadding="0" cellspacing="0">
									
									<tr>
										<td colspan="4" valign="middle"><img
											src="http://pics.ebaystatic.com/aw/pics/s.gif" width="1"
											height="6" alt=" "></td>
									</tr>
									<tr>
										<td colspan="4" valign="middle" bgcolor="#9999CC"><img
											src="http://pics.ebaystatic.com/aw/pics/s.gif" width="1"
											height="2" alt=" "></td>
									</tr>
									<tr bgcolor="#d6dcfe">
										<td valign="middle"><img
											src="http://pics.ebaystatic.com/aw/pics/s.gif" width="16"
											height="3" alt=" " title=""></td>
										<td><img src="http://pics.ebaystatic.com/aw/pics/s.gif"
											width="6" height="1" alt=" "></td>
										<td width="70%" class="pagetitle"><a name="mainContent"></a>
											<h1
												style="display: inline; font-size: 24px; font-weight: normal;">
												Bid History</h1></td>
												
										<td align="right" width="30%">Item number:<a
											href="bidding.action?item_id=<s:property value="item_id"></s:property>"><s:property value="item_id"></s:property></a>
										
										</td>
										
									</tr>
									<tr>
										<td colspan="4" valign="middle" bgcolor="#9999CC"><img
											src="http://pics.ebaystatic.com/aw/pics/s.gif" width="1"
											height="2" alt=" "></td>
									</tr>
									
								</table>
								<table cellpadding="0" cellspacing="0" width="98%" border="0"
									align="center">
									<tr>
										<td colspan="4"><img
											src="http://pics.ebaystatic.com/aw/pics/s.gif" width="1"
											height="5" alt=" " title=""></td>
									</tr>
									<tr>
										<td bgcolor="#FFE166" colspan="4"><img
											src="http://pics.ebaystatic.com/aw/pics/s.gif" width="1"
											height="2" border="0" alt=" "></td>
									</tr>
									<tr>
										<td bgcolor="#FFE166"><img
											src="http://pics.ebaystatic.com/aw/pics/s.gif" width="2"
											height="1" border="0" alt=" "></td>
										<td valign="middle"><table cellpadding="0"
												cellspacing="0" width="100%" border="0">
												<tr>
													<td colspan="4"><img
														src="http://pics.ebaystatic.com/aw/pics/s.gif" width="1"
														height="5" border="0" alt=" "></td>
												</tr>
												<tr>
													<td><img
														src="http://pics.ebaystatic.com/aw/pics/s.gif" width="5"
														height="1" border="0" alt=" "></td>
													<td valign="top"><img
														src="http://pics.ebaystatic.com/aw/pics/icon/iconMessage_16x16.gif"
														alt="Info"></td>
													<td><img
														src="http://pics.ebaystatic.com/aw/pics/s.gif" width="5"
														height="1" border="0" alt=" "></td>
													<td>To help keep the eBay community safe, enhance
														bidder privacy, and protect our members from fraudulent
														emails (such as fake second chance offers), eBay has
														changed how bid history information is displayed. If you
														place a bid on a higher-priced item, only you and the
														seller of the item can view your User ID in the bid
														history. Other members can no longer view User IDs and
														will see anonymous names, such as x***y.</td>
												</tr>
												<tr>
													<td colspan="4"><img
														src="http://pics.ebaystatic.com/aw/pics/s.gif" width="1"
														height="5" border="0" alt=" "></td>
												</tr>
											</table></td>
										<td bgcolor="#FFE166"><img
											src="http://pics.ebaystatic.com/aw/pics/s.gif" width="2"
											height="1" border="0" alt=" "></td>
									</tr>
									<tr>
										<td bgcolor="#FFE166" colspan="4"><img
											src="http://pics.ebaystatic.com/aw/pics/s.gif" width="1"
											height="2" border="0" alt=" "></td>
									</tr>
								</table>
								<table border="0" cellspacing="0" cellpadding="0">
								
									<tr>
										<td colspan="3"><img
											src="http://pics.ebaystatic.com/aw/pics/x.gif" width="12"
											height="20" alt=" " title=""></td>
									</tr>
									
									<tr>
										<td><img src="http://pics.ebaystatic.com/aw/pics/x.gif"
											width="20" height="1" alt=" "></td>
										<td nowrap>Item title:</td>
										<td><img src="http://pics.ebaystatic.com/aw/pics/x.gif"
											width="10" height="1" alt=" "></td>
										<td width="100%"><s:property value="item_name"></s:property></td>
									</tr>
									
									<tr>
										<td colspan="3"><img
											src="http://pics.ebaystatic.com/aw/pics/x.gif" width="1"
											height="5" alt=" "></td>
									</tr>
									
									<tr>
										<td></td>
										<td nowrap>Time left:</td>
										<td></td>
										<td><s:property value="diff"/></td>
									</tr>
									
									
									<tr>
										<td colspan="3"><img
											src="http://pics.ebaystatic.com/aw/pics/x.gif" width="12"
											height="10" alt=" " title=""></td>
									</tr>
									<tr>
										<td></td>
									</tr>
									<tr>
										<td colspan="4"><img
											src="http://pics.ebaystatic.com/aw/pics/x.gif" width="12"
											height="10" alt=" " title=""></td>
									</tr>
									
								</table>
								<table cellpadding="0" cellspacing="0" width="100%">
									<tr>
										<td height="15"><img
											src="http://pics.ebaystatic.com/aw/pics/s.gif" alt=" ">
										</td>
									</tr>
								</table>
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="20"><img
											src="http://pics.ebaystatic.com/aw/pics/x.gif" alt=" "
											title="" width="20"></td>
										<td>Only actual bids (not automatic bids generated up to
											a bidder's maximum) are shown. Automatic bids may be placed
											days or hours before a listing ends. <a
											href="http://pages.ebay.in/help/buy/bidding-ov.html">Learn
												more about bidding<b class="g-hdn"> - opens in a new
													window or tab</b> </a>.</td>
										<td width="20"><img
											src="http://pics.ebaystatic.com/aw/pics/x.gif" alt=" "
											title="" width="20"></td>
									</tr>
								</table>
								<div>
									<div>
										<div>
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr style="background-color: #efefef;">
													<th valign="middle" align="left" scope="col" width="10"><img
														src="http://pics.ebaystatic.com/aw/pics/s.gif" width="10"
														height="20" alt=" "><img
														src="http://pics.ebaystatic.com/aw/pics/s.gif" width="10"
														height="20" alt=" "></th>
													<th nowrap width="25%" valign="middle" align="left"
														scope="col"><span class="standardtitle"><b>Bidder</b><img
															src="http://pics.ebaystatic.com/aw/pics/s.gif" width="5"
															height="1" alt=" "><a href="javascript:;"
															id="AnonBidHelp1"><img
																src="http://pics.ebaystatic.com/aw/pics/in/buttons/btnHelp.gif"
																border="0"
																alt="Click here to know more about anonymous user IDs"
																title="" align="absmiddle"> </a> </span></th>
													<th align="center" nowrap width="25%" valign="middle"
														scope="col" class="standardtitle" bgcolor="#cccccc"><img
														src="http://pics.ebaystatic.com/aw/pics/s.gif" width="10"
														alt=" ">Bid Amount</th>
													<th nowrap width="25%" valign="middle" align="left"
														scope="col" class="standardtitle">Date of bid</th>

													<th align="left" scope="col"><img
														src="http://pics.ebaystatic.com/aw/pics/s.gif" alt=" "
														width="10"></th>
												</tr>
												<tr>
													<td height="2" colspan="6" bgcolor="#ffffcc"><img
														src="http://pics.ebaystatic.com/aw/pics/s.gif" height="1"
														width="100%" alt=" "></td>
												</tr>
												<tr>
													<td height="2" colspan="6" bgcolor="#ffffcc"><img
														src="http://pics.ebaystatic.com/aw/pics/s.gif" height="1"
														width="100%" alt=" "></td>
												</tr>
												<tr>
													<td height="2" colspan="6" bgcolor="#f9f9f9"><img
														src="http://pics.ebaystatic.com/aw/pics/s.gif" height="1"
														width="100%" alt=" "></td>
												</tr>
												<tr>
													<td height="2" colspan="6" bgcolor="#f9f9f9"><img
														src="http://pics.ebaystatic.com/aw/pics/s.gif" height="1"
														width="100%" alt=" "></td>
												</tr>
												<tr>
													<td height="2" colspan="6" bgcolor="#ffffff"><img
														src="http://pics.ebaystatic.com/aw/pics/s.gif" height="1"
														width="100%" alt=" "></td>
												</tr>
												
												<s:iterator value="arr">
												<tr bgcolor="#ffffff" height="30px">
													<td valign="middle" width="10">
													<td><s:property value="bidding_buyer"></s:property>
													<span>
													</span></td>
													<td align="center" nowrap><span><s:property value="bidding_bid"></s:property></span></td>
													<td align="left"><div>
															<span><s:property value="bidding_timestamp"></s:property></span>
														</div></td>												
												</tr>
												</s:iterator>
												<tr>
													<td height="2" colspan="6" bgcolor="#ffffff"><img
														src="http://pics.ebaystatic.com/aw/pics/s.gif" height="1"
														width="100%" alt=" "></td>
												</tr>
											</table>
											<table width="100%" border="0" cellpadding="0"
												cellspacing="0" bgcolor="#cccccc">
												<tr>
													<td><img
														src="http://pics.ebaystatic.com/aw/pics/s.gif" width="1"
														height="1" alt=" "></td>
												</tr>
											</table>
										</div>
									</div>
								</div>

								<div style="padding-top: 15px;">
									<div>
										<div></div>
									</div>
								</div>
								<div>
									<div>
										<div>
											<p>
												<a name="dutch"></a>
											</p>
										</div>
									</div>
								</div>
								<div id="hlpBubR" style="display: none; position: absolute;"
									class="hlpBub">
									<table cellpadding="0" cellspacing="0" border="0" summary=""
										ID="Table1">
										<tr>
											<td class="hlpBubNW" rowspan="2"></td>
											<td class="hlpBubNSpacer" colspan="2"></td>
											<td class="hlpBubNSpacer"></td>
										</tr>
										<tr>
											<td class="hlpBubN" colspan="2"></td>
											<td class="hlpBubNE"></td>
											<td></td>
										</tr>
										<tr>
											<td class="hlpBubW"></td>
											<td class="hlpBubText">&lt;#1#&gt;</td>
											<td class="hlpBubText" valign="top"><a href="#"
												name="hlpBubCloseR"><img border="0" alt="Close"
													src="http://pics.ebaystatic.com/aw/pics/in/buttons/btnClose_16x16.gif">
											</a></td>
											<td class="hlpBubE"></td>
										</tr>
										<tr>
											<td class="hlpBubSW" rowspan="2"></td>
											<td class="hlpBubS" colspan="2"></td>
											<td class="hlpBubSE"></td>
										</tr>
										<tr>
											<td class="hlpBubSSpacer" colspan="3"></td>
										</tr>
									</table>
								</div>
								<div id="hlpBubL" style="display: none; position: absolute;"
									class="hlpBub">
									<table cellpadding="0" cellspacing="0" border="0" summary=""
										ID="Table1">
										<tr>
											<td class="hlpBubNW" rowspan="2"></td>
											<td class="hlpBubNSpacer" colspan="2"></td>
											<td class="hlpBubNSpacer"></td>
										</tr>
										<tr>
											<td class="hlpBubN" colspan="2"></td>
											<td class="hlpBubNE"></td>
											<td></td>
										</tr>
										<tr>
											<td class="hlpBubW"></td>
											<td class="hlpBubText">&lt;#1#&gt;</td>
											<td class="hlpBubText" valign="top"><a href="#"
												name="hlpBubCloseL"><img border="0" alt="Close"
													src="http://pics.ebaystatic.com/aw/pics/in/buttons/btnClose_16x16.gif"
													style="margin-right: 5px;"> </a></td>
											<td class="hlpBubE"></td>
										</tr>
										<tr>
											<td class="hlpBubSW"></td>
											<td class="hlpBubS" colspan="2"></td>
											<td class="hlpBubSE" rowspan="2"></td>
										</tr>
										<tr>
											<td class="hlpBubSSpacer" colspan="3"></td>
										</tr>
									</table>
								</div></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!--End eBay Footer-->
	</s:iterator>
	<div><%@ include file="footer.jsp"%></div>
</body>
</html>