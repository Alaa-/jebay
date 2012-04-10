<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Specify a Category</title>
<link rel="stylesheet" type="text/css"
	href="http://include.ebaystatic.com/css/v/in/legacy/ebay.css">

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
	href="http://include.ebaystatic.com/css/e765/in/tbx/darwin/syi/category_e7651in.css"
	type="text/css">
<script type="text/javascript" language="JavaScript"
	src="http://include.ebaystatic.com/js/e765/in/features/syi3/category_browse_e7656in.js">
	
</script>

</head>
<body>

	<div id="content" class="emlcontent">
		<div class="pagewidth">
			<div class="pageminwidth">
				<div class="pagelayout">
					<div class="pagecontainer">
						<div id="gnheader" class="gh-w">
							<div id="cobrandHeader"></div>
							<a href="#mainContent" rel="nofollow"
								style="display: block; position: absolute; left: -9999px">Skip
								to main content</a>
							<div>
								<div class="gh-eb" style="visibility: hidden; display: none;">
									<div class="gh-emn">&nbsp;</div>
								</div>
								<div class="gh-log">
									<span class="gh-lg"><a href="home.jsp"
										rel="nofollow"> <img
											src="http://p.ebaystatic.com/aw/pics/in/logos/logoEbay_x45.gif"
											alt="eBay" border="0"></img></a></span>
								</div>
								<span></span>
								<div class="gh-cl"></div>
								<div class="gh-col">
									<b class="gh-c1"></b><b class="gh-c2"></b><b class="gh-c3"></b><b
										class="gh-c4"></b><b class="gh-c5"></b><b class="gh-c6"></b><b
										class="gh-c7"></b>
									<div class="gh-clr"></div>
								</div>
								<script type="text/javascript">
									var includeHost = "http://include.ebaystatic.com/";
								</script>
								<script
									src="http://include.ebaystatic.com/js/e723/in/ebaybase_v4_e7231in.js"></script>
								<script
									src="http://include.ebaystatic.com/js/e709/in/ebaysup_e7092in.js"></script>
								<script type="text/javascript">
									if (document.documentMode != 8
											&& document.compatMode != "CSS1Compat")
										ebay.oDocument._getControl(
												"headerCommon")._exec(
												"writeStyleSheet");
								</script>
								<div class="gh-ovr" id="gbh_ovl">
									<div class="gh-iovr"></div>
								</div>
							</div>
						</div>



						<div class="brdcmb" id="brdcmb">
							<div class="level1">SELL YOUR ITEM</div>
							<div class="active">1. TELL US WHAT YOU SELL</div>
							<div class="inactive">2. CREATE YOUR LISTING</div>
							<div class="inactive">3. REVIEW YOUR LISTING</div>
						</div>
						<div class="clr"></div>




						<div class="areaTitleBox" id="areaTitleBox">
							<div class="areaTitle">
								<a name="mainContent"></a>
								<h1></h1>
							</div>
							<div class="areaCtl">
								<div class="headerLnks">
									<a
										href="http://pages.ebay.in/help/sell/contextual/inframe/choosing-category.html"
										id="helpBtnlink" class="hlpimg">Help</a>
								</div>
							</div>
							<div class="clr"></div>
						</div>






						<div>
							<div class="ttlPanel-n">
								<div class="ttlPanel-e">
									<div class="ttlPanel-w"></div>
								</div>
							</div>
							<div class="ttlPanel-head">
								<h2 class="lst">Find a matching category</h2>
								<span class="titleCtl"></span>
							</div>
							<div class="secCnt">
								<div>
									<div>
										<div class="idtHrz">
											<div>
												<div class="verSpc"></div>
												Enter 3-5 words about your item.
											</div>
											<div>
												<div>

													<input type="text" id="keywords" name="keywords" value=""
														class="posRelat" aria-autocomplete="list"
														aria-expanded="false" role="combobox" aria-owns="results"
														autocomplete="off"
														title="Enter 3-5 words about your item. "><input
														type="hidden" id="keywords1" name="keywords1"
														tabindex="-1" value=""><input type="hidden"
														id="acKeywords" name="acKeywords" tabindex="-1" value=""><input
														id="aidZ4" name="aidZ4" type="submit" value="Search"
														title="Search">
												</div>
											</div>
											<div class="idtTopSm help">For example: Levis 501
												women's jeans</div>
										</div>
									</div>
								</div>






								<div>
									<ul class="tab" role="tablist">
										<li role="presentation" class="inactive"><span><a
												href="#" id="searchcatlink" role="tab"> Suggested
													categories </a></span></li>
										<li role="presentation" aria-selected="true" class="active"><span><a
												href="#" id="browsecatlink" role="tab"> Select a
													suitable category </a></span></li>
										<li role="presentation" class="inactive"><span><a
												href="#" id="recentcatlink" role="tab">Recently used
													categories</a></span></li>
									</ul>
									<div class="secTab" role="tabpanel"
										aria-labelledby="browsecatlink">
										<div class="idt">
											<label for="fcat">Categories</label>
											<div id="ariabrowse" class="g-hdn" aria-live="assertive"
												aria-relevant="text" aria-atomic="true"></div>
										</div>
										<div class="idtHrz" id="categories_fldSet">
											<div></div>
											<div id="catboxes_inpGrp" style="height:auto">
												<table cellpadding="0" cellspacing="0" border="0">
													<tr id="catboxes_row_1">
														<td valign="top"><div id="fcat_inp" class="idtRgt">
																
																
																
																
																<s:form name="categoryform" action="getform">
																	<s:doubleselect id="fcat" name="fcat" list="catlist"
																		listKey="category_id" listValue="category_name"	size="13" 
																		cssStyle="float:right" doubleCssClass="idtRgt" doubleCssStyle="top:0px;left:215px;width:215px;position:absolute;float:top"
																		doubleSize="13" doubleName="fsubcat" doubleId="fsubcat" doubleList="subcatlist" 
																		doubleListKey="subcategory_id" doubleListValue="subcategory_name"  />												
															</div></td>
													</tr>
												</table>
											
											</div>
												<s:submit name="submit" value="Continue"/>
																</s:form>
																<script type="text/javascript" >
																	document.getElementById("fcat").selectedIndex=0;
																	document.getElementById("fsubcat").selectedIndex=0;
																</script>
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
	<%@ include file="footer.jsp" %>
</body>
</html>