<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@taglib prefix="s" uri="/struts-tags"%>
<%@ page import="java.sql.*"%>
<%@ page import="ebay.*"%>
<html>
<head>

<script>
	var pageHasRtmPlacements = true;
</script>
<link href="css/header.css" type="text/css" rel="stylesheet">
<link href="css/header1.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="js/jquery.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>eBay India</title>
<meta name="keywords"
	content="India online shopping, free online auctions, india apparels, accessories, men's apparel, women's apparel, mobiles, computers, cameras, Indian products, books, bollywood movies, music vcd/dvd, clothes, cars, motor bikes, nokia, sony ericsson, laptops, pda, indian jewellery, jewelry, stamps, travel tickets, toys. India online shopping mall.">
<meta name="description"
	content="eBay.in is India's most popular online shopping mall providing free online auctions for products like mobiles/cell phones, cameras, computers, consumer electronics, bollywood movies, music &amp; clothes, Indian art products, books, cars, motor bikes, Indian apparel/clothes, computers, jewellery, stamps, travel tickets &amp; a variety of goods &amp; products in India">
<meta name="google-site-verification"
	content="FhX5RgxqM_mmLAfBKHOUJAIShteGrrwq52kR5wmiLcg">
<meta name="y_key" content="9d67cbc37e38b26c">
<meta name="msvalidate.01" content="966859516F906915699AD6A9F6DF23B6">
<meta property="fb:app_id" content="102628213125203">

</head>
<body id="body" onload="document.getElementById('_nkw').focus()">
	<%-- <script type="text/javascript"
		src="http://ir.ebaystatic.com/v4js/z/qt/5oiu3dmnniy4tculwdphcncts.js#SYS-ZAM_vjo_e767i_1_Ear_en_IN"></script> --%>

	<div></div>
	<div align="center">


		<div class="ContentContainer" id="TopContainer">

			<div>
				<div class="pcontent">
					<!--cacheStatus: true-->
					<script>
						var _GlobalNavHeaderUtf8Encoding = true;
					</script>
					<%-- <script src="js/myebay.js"></script> --%>
					<div id="gnheader" class="gh-w">
						<div id="cobrandHeader"></div>
						<a href="#mainContent" rel="nofollow"
							style="display: block; position: absolute; left: -9999px">Skip
							to main content</a>
						<div>
							<!-- headerType=FULL:CCHP_PAGE-->

							<div></div>
							<div class="gh-eb">
								<div class="gh-emn">
									<div class="gh-hid"></div>
									<div class="gh-mn">
										<span class="gh-fst"><a id="MyEbay"
											href="Myebay.action">My eBay</a></span> <a id="Sell"
											href="/Jebay/Sell.jsp">Sell</a> <a id="Community"
											href="#">Community</a> <a
											id="Help"
											href="#">Customer
											Support</a><span class="gh-nho"><span></span></span>
									</div>
								</div>
							</div>
							<div class="gh-log">
								<span class="gh-lg"><a href="home.jsp" rel="nofollow">
										<img
										src="images/logoEbay_x45.gif"
										alt="eBay" border="0"></img>
								</a> </span> <span class="greeting gh-ui"> <!-- BEGIN: GREETING:SIGNEDOUT -->
									<s:if test="#session['User']==null">Welcome!&ensp;<s:property
											value="#session['User']" />
										<s:a href="user_sign_in.jsp">Sign in</s:a>
                        
                    or
                    <s:a rel="nofollow" href="register.jsp">register</s:a>
									</s:if> <s:else> Welcome!<b><s:property
												value="#session['User']" /></b>
										<s:url id="url1" action="Logout" encode="true"></s:url>
										<s:a id="registerLink" href="%{url1}" rel="nofollow">  logout </s:a>
									</s:else> <!-- END: GREETING:SIGNEDOUT --> <span id="bta"></span></span> <span
									class="coupon"></span><span></span>
							</div>
							<div class="gh-rph">
								<span class="addllinks"><img
									src="http://q.ebaystatic.com/aw/pics/cart.gif" height="15"
									width="15"> <a href="ViewCart.action">My Shopping
										Cart</a><span id="glb_cart"></span>| <a href="getpaisa.action">My
										PaisaPay</a> | <a href="sitemap.jsp">Site Map</a> </span>
							</div>
							<div class="gh-cl"></div>


							<form method="get" action="Search.action" name="headerSearch"
								id="headerSearch">
								<input type="hidden" name="_from" value="R40"><input
									type="hidden" name="_trksid" value="m570">
								<div class="gh-sbox">
									<div class="gh-fl">
										<label for="_nkw" class="g-hdn">Enter your search
											keyword</label><input type="text" name="keyword" required="true" id="_nkw" value=""
											maxlength="300" size="60" class="gh-tb"><input
											title="Show Suggestions" readonly="readonly" id="_nkw_acdiv"
											class="ac-ac_div"> <label for="_sacat" class="g-hdn">Select
											a category for search</label><select name="category" id="_sacat"
											size="1" class="gh-sb"><option
												value="0" selected="selected">All
												Categories</option>
											<%
												{
													Connect c = new Connect();
													ResultSet rs = c.getResult("select * from category_details");
													while (rs.next()) {
											%>

											<option value="<%=rs.getInt("category_id")%>">
												<%
													out.print(rs.getString("category_name"));
												%>
											</option>
											<%
												}
												}
											%></select><a class="gh-ss"><input type="submit" value="Search"
											id="ghSearch" class="gh-btn"></a>
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
										<%-- <s:select name="cat_id" headerKey="-1" headerValue="CATEGORIES" list = "lstCats"/> --%>
										<a id="BrowseCategories" name="BrowseCategories"
											href="allcategories.action">CATEGORIES</a>

										<!-- <a id="chevron0" href="javascript:;" class="gh-ai"><b>&nbsp;</b></a -->
										<a id="EbayStores" title="Find more of what you love."
											href="#">SHOPS</a><a id="v4-gnh_0"
											href="#">MOTORS</a><a id="v4-gnh_1"
											href="#">PHOTO CENTRE</a>
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
					<script type="text/javascript">
						(function() {
							var ghmenu = vjo.Registry
									.get("BrowseCategoriesMenu");
							if (typeof (ghmenu) != "undefined")
								ghmenu.setHandlerSource("js/category.js")
						})();
					</script>
					<!--vo{2d71f+6:nqd2glekm,,RlogId p4kjkbsdabjkrk9%3Fvo%7B2d71f%2B6%3Anqd2glekm-1366923ca15-0x165-->
				</div>
			</div>
</body>
</html>
<!--HomePageInfo:203.5000001196.VISITOR_DEFAULT.1.100.36.5000008121-->
<!--F2PC:Off-->