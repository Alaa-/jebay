<%-- 
    Document   : logout
    Created on : 9 Mar, 2011, 3:00:47 PM
    Author     : samrat
--%>

<%--
    Document   : Logout
    Created on : Mar 8, 2011, 5:33:19 PM
    Author     : Rohit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<div></div>
<div></div>
<meta content="text/html">
<%-- <%@include file="header_new.jsp"%> --%>
<title>You've signed out. See you again soon!</title>
<script>
	var pageHasRtmPlacements = true;
</script>
<link rel="stylesheet" type="text/css"
	href="http://include.ebaystatic.com/v4css/z/yj/hmco4xtdui0mbaqnrjmsvolon.css#GH-ZAM_ReskinEbay_e709i_12824318_en_IN">
<link rel="stylesheet" type="text/css"
	href="http://include.ebaystatic.com/v4css/z/in/5ezmrqkeay1lrghatjjmlfuuf.css#SignInApp_SignOutConfirm_e709i_12775436_en_IN">
<!--[if lt IE 8]><style>.btn-b input{position:relative;left:-3px;padding:0 16px 0 15px;width:1%}.btn-b b,.btn-b a{left:-3px;padding:4px 15px 5px 16px}.btn-bp a{padding:5px 14px 4px 17px}</style><![endif]-->
<!--[if IE 6]><style>.btn-b input{overflow:visible;width:0}</style><![endif]-->
<!--[if IE 8]><style>.btn-b input{padding:2px 17px 3px}.btn-bp input{background-position:1px -139px}</style><![endif]-->
</head>
<body id="body">
	<script type="text/javascript"
		src="http://include.ebaystatic.com/v4js/z/uz/3d2nn02w5q513lvn21bocmpte.js#SYS-ZAM_vjo_e709i_1_12775434_en_IN"></script>
	<script type="text/javascript">
		vjo.dsf.error.ErrorHandlerManager
				.register(new vjo.dsf.error.DefaultErrorHandler());
		vjo.dsf.error.ErrorHandlerManager.enableOnError(true);
		vjo.dsf.cookie.VjCookieJar.sCookieDomain = '.ebay.in';
		vjo.dsf.cookie.VjCookieJar.writeCookielet('ebay', 'js', '1');
	</script>
	<div></div>
	<div class="pagewidth">
		<div class="pageminwidth">
			<div class="pagelayout">
				<div class="pagecontainer">
					<div class="GlobalNavigation" id="GlobalNavigation">
						<!--cacheStatus: false-->
						<script>
							var _GlobalNavHeaderUtf8Encoding = true;
						</script>
						<script
							src="http://include.ebaystatic.com/v4js/z/24/fuz03usnx2y1pkpvb00ydm4qb.js#GH-ZAM_ReskinEbay_e709i_1_12775434_en_IN"></script>
						<script type="text/javascript">
							vjo
									.ctype(
											"vjo.darwin.core.ebayheader.cart.Cart")
									.needs(
											[ "vjo.dsf.cookie.VjCookieJar",
													"vjo.dsf.Element",
													"vjo.dsf.client.Browser" ])
									.props(
											{
												init : function(pId,
														pServerUrl, pCartLink) {
													var oC = vjo.dsf.client.Browser, sc = vjo.darwin.core.ebayheader.cart.Cart;
													sc.sId = pId;
													sc.sCartLink = pCartLink;
													sc.bUpdated = false;
													if ((oC.bNav && oC.iVer < 7)
															|| (oC.bOpera && (oC.iVer + oC.fMinorVer) < 0.5)
															|| (oC.bIE && oC.iVer < 5))
														return;
													if (!sc.isSignedIn())
														return;
													if (sc.isCartReadDone()) {
														sc.update(sc.sId,
																sc.sCartLink);
													} else {
														sc
																.doRequest(pServerUrl);
													}
												},
												doRequest : function(pServerUrl) {
													if (pServerUrl
															&& pServerUrl.length > 1) {
														document
																.write('<img height="1" width="1" src="'+pServerUrl+'" style="display:none;">');
													}
												},
												isSignedIn : function() {
													var c = this.vj$.VjCookieJar
															.readCookie("ebaysignin");
													return c && c.is('in');
												},
												update : function(pId,
														pCartLink) {
													var sc = vjo.darwin.core.ebayheader.cart.Cart;
													sc.sId = pId;
													sc.sCartLink = pCartLink;
													if (!sc.isSignedIn())
														return;
													var oL = vjo.dsf.Element
															.get(sc.sId), c;
													if (oL
															&& sc
																	.isCartReadDone()) {
														c = sc.getCount();
														if (c > 0
																&& !sc.bUpdated) {
															oL.innerHTML = '&nbsp;<a href="'+sc.sCartLink+'">('
																	+ c
																	+ ')</a>';
															sc.bUpdated = true;
														}
													}
												},
												isCartReadDone : function() {
													var VJ = this.vj$.VjCookieJar;
													var c = VJ.readCookie(
															"ebay", "sbf");
													if (c == 'true') {
														return true;
													} else
														return VJ.getBitFlag(c,
																22) == 1;
												},
												getCount : function() {
													return this.vj$.VjCookieJar
															.readCookie("dp1",
																	"exc")
															|| "";
												}
											}).endType();
						</script>
						<script type="text/javascript">
							(function() {
								var _d = vjo.dsf.EventDispatcher;
								var _r = vjo.Registry;
								_d
										.add(
												'body',
												'load',
												function(event) {
													this
															.update("glb_cart",
																	"http://orders.ebay.in/ws/eBayISAPI.dll?ShoppingCartMgmt");
												},
												vjo.darwin.core.ebayheader.cart.Cart);
							})();
						</script>
						<div id="gnheader" class="gh-w">
							<div id="cobrandHeader"></div>
							<a href="#mainContent" rel="nofollow"
								style="display: block; position: absolute; left: -9999px">Skip
								to main content</a>
							<div>
								<!-- headerType=FULL:DEFAULT:COMMUNITY-->
								<script type="text/javascript">
									var svrGMT = 1299585343074;
								</script>
								<div></div>
								<div class="gh-eb">
									<div class="gh-emn">
										<div class="gh-hid"></div>
										<div class="gh-mn">
											<span class="gh-fst"><a id="MyEbay"
												href="http://my.ebay.in/ws/eBayISAPI.dll?MyEbay&amp;gbh=1"
												rel="nofollow">My eBay</a></span><a id="Sell"
												href="http://sell.ebay.in/sell">Sell</a><a id="Community"
												href="http://hub.ebay.in/community">Community</a><a
												id="Help" href="http://pages.ebay.in/help/index.html">Help</a><span
												class="gh-nho"><span></span></span>
										</div>
									</div>
								</div>
								<div class="gh-log">
									<span class="gh-lg"><a href="http://www.ebay.in"
										rel="nofollow"><img
											src="http://p.ebaystatic.com/aw/pics/in/logos/logoEbay_x45.gif"
											alt="From collectables to cars, buy and sell all kinds of items on eBay"
											border="0"></img></a></span><span class="greeting gh-ui"> <!-- BEGIN: GREETING:SIGNEDOUT -->Welcome!
										<a href="user_sign_in.jsp" rel="nofollow">Sign in</a> or <a
										href="register.jsp" id="registerLink" rel="nofollow">register</a>
										<!-- END: GREETING:SIGNEDOUT --> <span id="bta"></span>
									</span><span class="coupon"></span><span></span>
								</div>
								<div class="gh-rph">
									<span class="addllinks"><img
										src="http://q.ebaystatic.com/aw/pics/cart.gif" height="15"
										width="15"> <a
										href="http://orders.ebay.in/ws/eBayISAPI.dll?ShoppingCartMgmt">My
											Shopping Cart</a><span id="glb_cart"></span> <script
											type="text/javascript">
										vjo.darwin.core.ebayheader.cart.Cart
												.init(
														"glb_cart",
														"http://payments.ebay.in/ws/eBayISAPI.dll?GetCartDetails",
														"http://orders.ebay.in/ws/eBayISAPI.dll?ShoppingCartMgmt");
									</script> | <a
										href="http://orders.ebay.in/ws/eBayISAPI.dll?MyPaisaPaySummary">My
											PaisaPay</a> | <a
										href="http://pages.ebay.in/help/contact_us/_base/index.html">Contact
											us</a> | <a href="http://pages.ebay.in/sitemap.html">Site Map</a></span>
								</div>
								<div class="gh-cl"></div>
								<div id="v4-17acl" class="acrc-roundcont acrc-roundtopside acl">
									<div class="acrc-roundoutside">
										<div style="background-color: #ffffff;">
											<div id="v4-0acl" class="sug">
												<div class="hide unsel" id="v4-1acl"></div>
												<div class="hide unsel" id="v4-2acl"></div>
												<div class="hide unsel" id="v4-3acl"></div>
												<div class="hide unsel" id="v4-4acl"></div>
												<div class="hide unsel" id="v4-5acl"></div>
												<div class="hide unsel" id="v4-6acl"></div>
												<div class="hide unsel" id="v4-7acl"></div>
												<div class="hide unsel" id="v4-8acl"></div>
												<div class="hide unsel" id="v4-9acl"></div>
												<div class="hide unsel" id="v4-10acl"></div>
											</div>
											<div style="word-break: normal" class="prd" id="prdDivWrp">
												<div class="pln">
													<span class="ptl">Popular products</span>
												</div>
												<div class="tbw">
													<table width="100%" cellspacing="0">
														<tr id="v4-11acl">
															<td></td>
															<td width="100%"></td>
														</tr>
														<tr id="v4-12acl">
															<td></td>
															<td width="100%"></td>
														</tr>
													</table>
												</div>
											</div>
											<div style="word-break: normal" id="tdDivWrp">
												<div class="pln"></div>
												<div id="tdDiv">
													<div id="v4-13acl"></div>
													<div id="v4-14acl"></div>
												</div>
											</div>
											<div id="v4-15acl" class="nosug hide">No suggestions.</div>
											<div class="affooter">
												<a href="javascript:;" id="v4-16acl" class="hlink">Hide
													eBay suggestions</a>
											</div>
										</div>
									</div>
									<div class="acrc-roundbottom">
										<div class="acrc-roundbottomright">
											<div class="acrc-roundbottomMiddle"></div>
										</div>
									</div>
								</div>
								<script>
									vjo.darwin.core.ebayheader.autocomplete.layer.AutoCompleteLayerLazyInit
											.init({
												"trkProduct" : "p4712.l1428",
												"siteId" : 203,
												"trkBrandedLogo" : "p4712.l1523",
												"roverDomainUrl" : "http://rover.ebay.in",
												"sugDivId" : "v4-0acl",
												"hideLnk" : "v4-16acl",
												"noSugDivId" : "v4-15acl",
												"trkShow" : "/roverclk/0/0/9?trknvp=sid%3Dp4712.l1315",
												"requestId" : "autofill_2",
												"algoVerMap" : {
													"1" : "1278851239",
													"2" : null
												},
												"trkRS" : "p4712.l1312",
												"algorithm" : null,
												"trkHide" : "/roverclk/0/0/9?trknvp=sid%3Dp4712.l1316",
												"trkSuggest" : "p4712.l1311",
												"version" : null,
												"idList" : [ "v4-1acl",
														"v4-2acl", "v4-3acl",
														"v4-4acl", "v4-5acl",
														"v4-6acl", "v4-7acl",
														"v4-8acl", "v4-9acl",
														"v4-10acl", "v4-11acl",
														"v4-12acl", "v4-13acl",
														"v4-14acl" ],
												"prdBaseURL" : "http://catalog.ebay.in",
												"containerId" : "v4-17acl",
												"trkInput" : "p4712.l1313",
												"lastSearch" : null,
												"baseURL" : "http://include.ebaystatic.com"
											});
								</script>
								<form method="get" action="http://shop.ebay.in"
									name="headerSearch" id="headerSearch">
									<input type="hidden" name="_from" value="R40"><input
										type="hidden" name="_trksid" value="m570">
									<div class="gh-sbox">
										<div class="gh-fl">
											<label for="_nkw" class="g-hdn">Enter your search
												keyword</label><input type="text" name="_nkw" id="_nkw" value=""
												maxlength="300" size="60" class="gh-tb"><input
												title="Show Suggestions" readonly="readonly" id="_nkw_acdiv"
												class="ac-ac_div">
											<script>
												vjo.darwin.core.ebayheader.autocomplete.AutoCompleteLazyInit
														.init("_nkw",
																"headerSearch");
											</script>
											<label for="_sacat" class="g-hdn">Select a category
												for search</label><select name="_sacat" id="_sacat" size="1"
												class="gh-sb"><option value="See-All-Categories"
													selected="selected">All Categories</option>
												<option value="11450">Apparel &amp; Accessories</option>
												<option value="267">Books &amp; Magazines</option>
												<option value="625">Cameras &amp; Optics</option>
												<option value="9800">Cars &amp; Bikes</option>
												<option value="116365">Charity</option>
												<option value="11116">Coins &amp; Notes</option>
												<option value="1">Collectibles</option>
												<option value="293">Consumer Electronics</option>
												<option value="13361">Fitness &amp; Sports</option>
												<option value="157606">Fun Stuff</option>
												<option value="26395">Health, Perfume, Personal
													Care</option>
												<option value="11700">Home, Decor &amp; Furnishings</option>
												<option value="281">Jewellery &amp; Diamonds</option>
												<option value="137080">Kitchen &amp; Home
													Appliances</option>
												<option value="160">Laptops &amp; Computer
													Peripherals</option>
												<option value="162260">Memory Cards, Pen Drives
													&amp; HDD</option>
												<option value="14416">Mobile Accessories</option>
												<option value="15032">Mobile Phones</option>
												<option value="11232">Movies &amp; Music</option>
												<option value="619">Musical Instruments</option>
												<option value="95680">Services &amp; Real Estate</option>
												<option value="169977">Stamps</option>
												<option value="631">Tools &amp; Hardware</option>
												<option value="220">Toys, Games &amp; Baby</option>
												<option value="3252">Travel</option>
												<option value="1249">Video &amp; Computer Games</option>
												<option value="14324">Watches</option>
												<option value="99">Everything Else</option></select><a class="gh-ss"><input
												type="submit" value="Search" id="ghSearch" class="gh-btn"></a>
										</div>
										<div class="gh-fl gh-as">
											<a id="AdvSearchId" href="http://shop.ebay.in/ebayadvsearch/"
												rel="nofollow">Advanced search</a>
										</div>
										<div class="gh-clr"></div>
									</div>
								</form>
								<div class="gh-col">
									<b class="gh-c1"></b><b class="gh-c2"></b><b class="gh-c3"></b><b
										class="gh-c4"></b><b class="gh-c5"></b><b class="gh-c6"></b><b
										class="gh-c7"></b>
									<div class="gh-clr"></div>
								</div>
								<div id="headerWrapper" class="gh-hbw">
									<div class="gh-hb">
										<div class="gh-mn">
											<a id="BrowseCategories"
												href="http://shop.ebay.in/allcategories/all-categories">CATEGORIES</a><a
												id="chevron0" href="javascript:;" class="gh-ai"><b>&nbsp;</b></a><a
												id="EbayStores" title="Find more of what you love."
												href="http://stores.ebay.in/">SHOPS</a><a id="v4-gnh_0"
												href="http://cars.ebay.in/">MOTORS</a><a id="v4-gnh_1"
												href="http://pages.ebay.in/photocenter">PHOTO CENTRE</a>
										</div>
									</div>
									<div class="gh-lbh1">
										<div class="gh-rtm">
											<div id="rtm_html_876"></div>
										</div>
									</div>
									<div class="gh-lbh2">
										<div class="gh-rtm">
											<div id="rtm_html_912"></div>
										</div>
									</div>
									<div class="gh-lbh3">
										<div class="gh-rtm">
											<div id="rtm_html_433"></div>
										</div>
									</div>
									<div class="gh-clr"></div>
								</div>
								<div class="gh-ovr" id="gbh_ovl">
									<div class="gh-iovr"></div>
								</div>
							</div>
						</div>
					</div>
					<script type="text/javascript">
						var _GlobalNavHeaderUtf8Encoding = true;
					</script>
					<script type="text/javascript">
						var _oGlobalNavRTMInfo = {};
						_oGlobalNavRTMInfo.aRTMPlacementData = [];
						_oGlobalNavRTMInfo.aRTMPlacementData = [ {
							"ord" : null,
							"maxWidth" : "470",
							"rtmUrl" : "http://srx.in.ebayrtm.com/rtm",
							"htmlId" : "rtm_html_433",
							"userId" : null,
							"isUserSignin" : false,
							"GUid" : null,
							"renderBeforeOnload" : true,
							"maxHeight" : "22",
							"pid" : "433"
						}, {
							"ord" : null,
							"maxWidth" : "160",
							"rtmUrl" : "http://srx.in.ebayrtm.com/rtm",
							"htmlId" : "rtm_html_876",
							"userId" : null,
							"isUserSignin" : false,
							"GUid" : null,
							"renderBeforeOnload" : true,
							"maxHeight" : "22",
							"pid" : "876"
						}, {
							"ord" : null,
							"maxWidth" : "160",
							"rtmUrl" : "http://srx.in.ebayrtm.com/rtm",
							"htmlId" : "rtm_html_912",
							"userId" : null,
							"isUserSignin" : false,
							"GUid" : null,
							"renderBeforeOnload" : true,
							"maxHeight" : "22",
							"pid" : "912"
						} ];
						(function() {
							var _s = vjo.dsf.ServiceEngine, $se = _s.register;
							var _r = vjo.Registry;
							_r
									.put(
											'5',
											new vjo.darwin.core.rtm.RTMInit(
													{
														"contentTypes" : [
																null, null,
																null, null,
																null ],
														"triggerEvent" : [ "0",
																"0", "0", "0",
																"0" ],
														"onload" : false,
														"defaultUrls" : [ "",
																"", "", "", "" ],
														"pids" : [ "524",
																"520", "304",
																"305", "5" ],
														"adSurveyJsUrl" : "http://include.ebaystatic.com/v4js/z/ua/or3b45jl3e5z3nzmpd0gfoxyd.js#GH-ZAM_AdSurvey_e709i_1_12775434_en_IN",
														"expJsUrl" : "http://include.ebaystatic.com/v4js/z/qt/tguu2pfbkeymtgr1d2cpvo3dv.js#GH-ZAM_ExpAd_e709i_1_12775434_en_IN",
														"htmlIds" : [
																"rtm_html_524",
																"rtm_html_520",
																"rtm_html_304",
																"rtm_html_305",
																"rtm_html_5" ],
														"expandDirections" : [
																null, null,
																null, null,
																null ],
														"hasSurvey" : [ null,
																null, null,
																null, null ],
														"quickPids" : [],
														"fetchUrl" : null,
														"mode" : "0",
														"suppressRtmCmd" : false,
														"popupBoxJsUrl" : "http://include.ebaystatic.com/v4js/z/mr/4mgadmxjii5ljiwf0l4dyvum0.js#GH-ZAM_PopupBox_e709i_1_12775434_en_IN",
														"maxExpandWidths" : null,
														"heights" : [ "480",
																"480", "250",
																"480", "300" ],
														"widths" : [ "640",
																"640", "300",
																"640", "275" ],
														"maxExpandHeights" : null,
														"url" : "http://srx.in.ebayrtm.com/rtm?RtmCmd&a=json&p=524:520:304:305:5&ph=0:0:0:0:0&ev=0:0:0:0:0&i=4aDgpUX5lIFx9ZyBefQ%3D%3D&g=94f62aad12e0a0e1e50147f1ff2ff35c&uf=0&c=1H4sIAAAAAAAAAB2OywqCUBRF54L%2FcCGaBMW5L19wB4fuSDiZaZDRpExEg4pCNL8%2Ba7jXgsWe5V3F6PxiEDBQkdaRkoyynAng3HWeMvDN%2FqmbY5supimUNJgiYuZlfbnWiDSQTSGxJDa2GJP2MVB705u85jSmI9kSttgmBz%2F2MogLhLredV5gBTYUvufS%2FqKSm77vV9Xl%2FFk194nwQBrlc%2FGXyizD0HXK5mq4OHUAMB37Ar1STrC4AAAA&ord=1299585343090",
														"reportAdJsUrl" : "http://include.ebaystatic.com/v4js/z/ut/yiudztzgte44dnmbqt212uew5.js#GH-ZAM_RtmDC_e709i_1_12775434_en_IN",
														"merchPrefix" : "ME",
														"onDemandPids" : [],
														"onScrollPids" : [],
														"expandSecurityTokens" : null,
														"th" : {},
														"showPH" : [ "0", "0",
																"0", "0", "0" ],
														"allowExpandOnPageLoad" : null,
														"delayedContent" : [
																null, null,
																null, null,
																null ],
														"dblclkUrls" : [ "",
																"", "", "", "" ]
													}));
							$se(0, 'RTM_CALLBACK_SERVICE', vjo.Registry
									.get('5'));
							$se(2, function(message) {
								if (message.trspType == 'Remote') {
									message.stok = '-805552974'
								}
								;
							});
							$se(2, function(message) {
								if (message.trspType == 'Remote') {
									message.pId = '4712';
								}
							});
							$se(6, 'Remote', function(message) {
								vjo.darwin.tracking.sojourner.TrackingRespHdl
										.handleResponse(message);
							});
						})();
					</script>
					<script type="text/javascript">
						(function() {
							vjo.dsf.ServiceEngine
									.handleRequest(new vjo.dsf.Message(
											'RTM_CALLBACK_SERVICE'));
						})();
					</script>
					<div class="AreaNavigation" id="AreaNavigation"></div>
					<div class="AreaTitle" id="AreaTitle">
						<div>
							<table border="0" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<td><div>
											<div id="v4-18" class="pgHeading pgHeading-eof">
												<table border="0" cellpadding="0" cellspacing="0"
													width="100%">
													<tr>
														<td><b id="mainContent"><h1 class="pgHeading-l">You've
																	signed out. See you again soon!</h1></b></td>
													</tr>
													<tr></tr>
												</table>
											</div>
										</div></td>
								</tr>
							</table>
						</div>
					</div>
					<div class="PageLevelMessageArea" id="PageLevelMessageArea"></div>
					<div class="CentralArea" id="CentralArea">
						<div>
							<div>
								<table border="0" cellpadding="0" cellspacing="0" width="100%">
									<tr>
										<td><div class="spacing_column">
												<div>
													<div class="spacing_module">
														<div class="greyRcp">
															<div>
																<table cellpadding="0" cellspacing="0" class="r3 c s">
																	<thead class="">
																		<tr>
																			<td class="r3_t"><b><i></i></b></td>
																		</tr>
																	</thead>
																	<tr>
																		<td class="r3_c"><div class="r3_cm bp tp">
																				<form name="signInForm" id="signInForm"
																					method="post">
																					<div class="signin_module">
																						<h2 class="return_text">Return to your
																							account</h2>
																						<div class="spacing_module">Ready to do more
																							bidding and buying?</div>
																						<div class="signin_Button">
																							
																								<b id="submit" class="btn-w btn-m btn-p"> <a href="user_sign_in.jsp"><span id="spn_submit" class="btn-b pbn-P">
																								<input id="but_submit" name="" value="Sign in" type="button">
																								<b id="txt_submit">Sign	in</b></span></a></b>
																							
																						</div>
																					</div>
																				</form>
																			</div></td>
																	</tr>
																	<tr>
																		<td class="r3_bl"><b><i></i></b></td>
																	</tr>
																</table>
															</div>
														</div>
													</div>
													<div class="spacing_module" id="rtm_html_304"
														style="height: 250; width: 300"></div>
													<div class="spacing_module" id="rtm_html_305"
														style="height: 480; width: 640"></div>
													<div class="spacing_module" id="rtm_html_5"
														style="height: 300; width: 275"></div>
													<div></div>
												</div>
											</div>
											<div class="lftWidth">
												<div>
													<div class="spacing_module" id="rtm_html_524"
														style="height: 480; width: 640"></div>
													<div id="BackUpforPP" class="continous_shopping">
														<div>
															<div>
																<div id="BackUpforPP">
																	<table cellpadding="0" cellspacing="0"
																		class="r3 c gy-br">
																		<thead id="BackUpforPPh" class="yl">
																			<tr id="BackUpforPP_t">
																				<td class="r3_t"><b><i></i></b></td>
																			</tr>
																			<tr id="BackUpforPP_h">
																				<td class="r3_hm" id="BackUpforPP_hm_0"><h3
																						class="g-m0 g-m">Continue Shopping on eBay</h3></td>
																			</tr>
																		</thead>
																		<tr id="BackUpforPP_c">
																			<td id="BackUpforPPcm" class="r3_c c-sgf"><div
																					class="r3_cm po" id="BackUpforPP_ct">
																					<div>
																						<div class="spacing_module">
																							<div>
																								<div>
																									<div>
																										<div
																											class="ddl2-noStyle ddl2-boldfont ddl2-fstbultd">
																											<div></div>
																										</div>
																										<div class="parent">
																											<div class="base_list">
																												<span class="title_base"><div></div></span>
																												<ul class="outline_list dft_blt bullets">
																													<li class="bullets normal"><span
																														class="listext"><div
																																class="ddl2-content">
																																<a href="http://www.ebay.in/"
																																	class="ddl2-da">eBay Home page</a><span>
																																	- See all that eBay has to offer.</span>
																															</div></span></li>
																													<li class="bullets normal"><span
																														class="listext"><div
																																class="ddl2-content">
																																<a
																																	href="http://my.ebay.in/ws/eBayISAPI.dll?MyEbay"
																																	class="ddl2-da">My eBay</a><span>
																																	- View all your bidding and selling
																																	activities.</span>
																															</div></span></li>
																													<li class="bullets normal"><span
																														class="listext"><div
																																class="ddl2-content">
																																<a href="http://pulse.ebay.in/"
																																	class="ddl2-da">eBay Pulse</a><span>
																																	- See current trends and hot picks.</span>
																															</div></span></li>
																												</ul>
																											</div>
																										</div>
																									</div>
																								</div>
																							</div>
																						</div>
																					</div>
																				</div>
																				<div class="r3_fm r3_s" id="BackUpforPP_f">
																					<div>
																						<div>
																							<img src="http://q.ebaystatic.com/aw/pics/s.gif"
																								width="10px" alt=" ">
																						</div>
																					</div>
																				</div></td>
																		</tr>
																		<tr id="BackUpforPP_b" class="c-sgf">
																			<td class="r3_bl"><b><i></i></b></td>
																		</tr>
																	</table>
																</div>
															</div>
															<br>
														</div>
													</div>
													<div class="spacing_module"></div>
													<div class="spacing_module" id="rtm_html_520"
														style="height: 480; width: 640"></div>
												</div>
											</div></td>
									</tr>
								</table>
							</div>
						</div>
						<!--cacheStatus: false-->
						<span class="ebay"><div class="coreFooterLinks"
								id="glbfooter">
								<table border="0" cellpadding="0" cellspacing="0" width="100%">
									<tr>
										<td class="g-pipe"><img
											src="http://q.ebaystatic.com/aw/pics/s.gif" height="10"
											width="1" alt=""><br> <a
											href="http://pages.ebay.in/aboutebay.html">About eBay</a> | <a
											href="http://www2.ebay.com/aw/marketing-in.shtml">Announcements</a>
											| <a href="http://hub.shop.ebay.in/">Buy Hub</a> | <a
											href="https://scgi.ebay.in/ws/eBayISAPI.dll?RegisterEnterInfo">Register</a>
											| <a href="http://pages.ebay.in/securitycentre/index.html">Security
												&amp; Resolution Centre</a> | <a
											href="http://pages.ebay.in/services/forum/feedback.html">Feedback
												Forum</a> | <a href="http://pages.ebay.in/sitemap.html">Site
												Map</a> | <a href="http://pages.ebay.in/help/index.html">Help</a></td>
									</tr>
									<tr>
										<td height="5"></td>
									</tr>
									<tr>
										<td height="1" bgcolor="#CCCCCC" colspan="2"></td>
									</tr>
									<tr>
										<td height="5"></td>
									</tr>
									<tr class="g-hlp" valign="top">
										<td class="g-nav coreFooterLegalNotice">Copyright ©
											1995-2011 eBay Inc. All Rights Reserved. Designated
											trademarks and brands are the property of their respective
											owners. Use of this Web site constitutes acceptance of the
											eBay <a title=" "
											href="http://pages.ebay.in/help/policies/user-agreement.html"
											target="_blank" rel="nofollow">User Agreement</a> and <a
											title=" "
											href="http://pages.ebay.in/help/policies/privacy-policy.html"
											target="_blank" rel="nofollow">Privacy Policy</a>.<br> <img
											src="http://q.ebaystatic.com/aw/pics/s.gif" height="20"
											alt="">
											<table border="0" cellpadding="0" cellspacing="0"
												width="100%">
												<tr>
													<td class="g-nav" width="100%"><a rel="nofollow"
														href="http://viv.ebay.in/ws/eBayISAPI.dll?EbayTime">eBay
															official time&nbsp;</a></td>
												</tr>
											</table>
										</td>
										<td align="right" nowrap="nowrap"><table border="0"
												cellpadding="0" cellspacing="0" width="100%">
												<tr>
													<td align="center"><a
														onclick="this.href='https://seal.verisign.com/splash?form_file=fdf/splash.fdf&amp;lang=en&amp;dn='+location.host;return true;"
														href="https://seal.verisign.com/splash?form_file=fdf/splash.fdf&amp;dn=SCGI.EBAY.COM&amp;lang=en"
														target="_blank"><img
															src="http://q.ebaystatic.com/aw/pics/logos/logoVeriSign_100x65.gif"
															alt="Verisign Seal" border="0" height="65" width="100"></img></a></td>
												</tr>
												<tr>
													<td align="center" nowrap="nowrap" class="g-nav"><a
														href="http://www.verisign.com/ssl-certificate">About
															SSL Certificates</a></td>
												</tr>
											</table></td>
									</tr>
								</table>
								<div id="cobrandFooter"></div>
							</div></span>
						<script type="text/javascript">var _GlobalNavHeaderStatic=false,_GlobalNavHeaderCookieTracking=true,_GlobalNavHeaderSrcPageId=PageSignOutConfirm2=4712;</script>
						<script type="text/javascript">(function(){var ghmenu =vjo.Registry.get("BrowseCategoriesMenu"); if(typeof(ghmenu)!="undefined") ghmenu.setHandlerSource("http://include.ebaystatic.com/categoryjs/49/en_IN/category_49en_IN0.js") })();</script>
						<script type="text/javascript">var un="undefined";if(typeof(vjo)!=un && typeof(vjo.darwin)!=un && typeof(vjo.darwin.core)!=un && typeof(vjo.darwin.core.ebayheader)!=un && typeof(vjo.darwin.core.ebayheader.rtm)!=un && typeof(vjo.darwin.core.ebayheader.rtm.GlobalHeaderRtmCall)!=un)vjo.darwin.core.ebayheader.rtm.GlobalHeaderRtmCall.submitRTMCall("")</script>
						<script type="text/javascript">var un="undefined";if(typeof(vjo)!=un && typeof(vjo.darwin)!=un && typeof(vjo.darwin.core)!=un && typeof(vjo.darwin.core.ebayheader)!=un && typeof(vjo.darwin.core.ebayheader.rover)!=un && typeof(vjo.darwin.core.ebayheader.rover.FooterRover)!=un)vjo.darwin.core.ebayheader.rover.FooterRover.roverService("https://rover.ebay.in/idmap/0?footer")</script>
						<div></div>
					</div>

					<div class="SupportiveNavigation" id="SupportiveNavigation">
						<div></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--v.rundkoi374,RcmdId SignOutConfirm2,RlogId p4plaijkoiwi%3C%3Ds%7D%2Bpplaijk651-12e95529e72-->
	<script type="text/javascript"
		src="http://include.ebaystatic.com/v4js/z/qz/ym3ioxdbeuymlmtp53sjw1zcb.js#SignInApp_SignOutConfirm_e709i_6_12775434_en_IN"></script>
	<script type="text/javascript">vjo.darwin.tracking.rover.Rover.roverTrack();
(function () {
var _r = vjo.Registry;
_r.put('0',new vjo.darwin.tracking.impression.Manager("AUp5iZjQ*")); _r.put('bta',new vjo.darwin.core.bta.BuyerTransactionAlert("bta", 60, 2, 2, "http://bmsgs.ebay.in/ws/eBayISAPI.dll?GetBuyerTransactionAlerts", "http://q.ebaystatic.com/aw/pics/", "http://cgi.ebay.in/ws/eBayISAPI.dll?ViewItem", "Watched Item ending soon!", "You've been outbid!", "You've received a Second Chance Offer.", "You've received a Transaction Confirmation Request.")); _r.put('submit_js',new vjo.darwin.core.button.Button({"FName":null,"BT":"pbn-P","scope":"btn","LId":"txt_submit","svcId":"BTN_SBMT_SRV_submit","tp":1,"BId":"but_submit","SId":"spn_submit","dis":false})); })();
(function(){
var _d=vjo.dsf.EventDispatcher;
var _r=vjo.Registry;
_d.add('body','load',function(event) { this.onRefresh(); },_r._bta);_d.add('body','load',function(event) { this.ebayExitRecoveryShowBackup(true, "BackUpforPP"); },vjo.com.ebay.darwin.app.signin.SignOutConfirm);_d.add('signInForm','submit',function(event) { return this.onSubmit("BTN_SBMT_SRV_submit", event); },vjo.darwin.core.button.Button);})();
(function(){
var _s=vjo.dsf.ServiceEngine, $se=_s.register;var _r=vjo.Registry;

$se(4,'BTN_SBMT_SRV_submit',function (message) {_r._submit_js.disable(); });
})();
</script>
	<script type="text/javascript">
vjo.ctype("vjo.dsf.FirePageLoad").endType();if(typeof(oGaugeInfo)!="undefined"){oGaugeInfo.iLoadST=(new Date()).getTime();}
vjo.dsf.EventDispatcher.load(document.body);

</script>
	<%-- 	<%@include file="footer.jsp"%> --%>
	
</body>
</html>