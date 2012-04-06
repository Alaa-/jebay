<html>
<head>
<title>Start Selling</title>
<%@ taglib prefix="s" uri="/struts-tags"%>

<link rel="stylesheet"
	href="http://include.ebaystatic.com/css/e765/in/tbx/darwin/main_e7651in.css"
	type="text/css">
<link rel="stylesheet"
	href="http://include.ebaystatic.com/css/e765/in/tbx/darwin/syi/ebaystd_e7651in.css"
	type="text/css">
<link rel="stylesheet"
	href="http://include.ebaystatic.com/css/e765/in/tbx/darwin/syi/main_e7651in.css"
	type="text/css">
<!--[if IE]><link rel="stylesheet" href="http://include.ebaystatic.com/css/e765/in/tbx/darwin/syi/mainIEFixes_e7651in.css" type="text/css"/><![endif]-->
<link rel="stylesheet"
	href="http://include.ebaystatic.com/css/e765/in/tbx/common_e7651in.css"
	type="text/css">
<link rel="stylesheet"
	href="http://include.ebaystatic.com/css/e765/in/tbx/darwin/syi/sellhub_e7651in.css"
	type="text/css">
</head>


<body>

	<div id="content" class="emlcontent">
		<iframe name="rtm" id="rtm" height="0" width="0" frameborder="0"
			scrolling="no" title="Real time messaging"> </iframe>
		<div class="pagewidth">
			<div class="pageminwidth">
				<div class="pagelayout">
					<div class="pagecontainer">


						<s:action name='addcompactheader' executeResult='true' />

						<div class="brdcmb_sellhub" id="brdcmb">
							<a href="http://www.ebay.in/">Home</a> &gt; <b>Sell</b>
						</div>
						<div class="clr"></div>
						<div class="areaTitleBox" id="areaTitleBox">
							<div class="areaTitle">
								<a name="mainContent"></a>
								<h1>Welcome Sellers</h1>
							</div>
							<div class="areaCtl"></div>
							<div class="clr"></div>
						</div>
						<div id="page_message"></div>
						<div id="cssError_sec">
							<!--DIV-->
						</div>
						<div>
							<form action="sell_choosecat" method="post" name="SearchCategories">
								<div class="main">
									<div class="mainCnt">
										<div>
											<table style="width: 100%">
												<tr style="padding: 0px; border: 0px; border-spacing: 0px">
													<td valign="top" width="100%"><span class="idtRgt">
															<div class="idtBtm">
																<div id="msg">
																	<div class="info">
																		<div class="cnt">
																			<a href="/Jebay/user_sign_in.jsp">Sign in</a> to see
																			your saved information.
																		</div>
																	</div>
																</div>
															</div>
															<div>Enter 3-5 words about your item.</div>
															<div>
															
																<input type="text" id="keywords" name="keywords"
																	value="" class="posRelat" aria-autocomplete="list"
																	aria-expanded="false" role="combobox"
																	aria-owns="results" autocomplete="off"
																	title="Enter 3-5 words about your item. "> <input
																	type="hidden" id="keywords1" name="keywords1"
																	tabindex="-1" value=""><input type="hidden"
																	id="acKeywords" name="acKeywords" tabindex="-1"
																	value="">
																<button id="aidZ" name="aidZ" type="submit"
																	class="startSellingBtn">
																	<span class="btn" id="aidZ_btnFrm"><span
																		class="btn" id="aidZ_btnLbl">Start selling</span></span>
																</button>
															</div>
															<div class="idtBtm">For example: Amethyst gemstone
																rings</div>
															<div class="idtTop">
																<a href="BrowseCategories" id="aBrowseCategories">Browse
																	categories</a>
															</div>
													</span></td>
													<td valign="top" width="15"><span class="colSpacer"></span></td>
													<td valign="top" width="300"><span
														class="sellerChecklistRTM"> </span></td>
												</tr>
											</table>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>