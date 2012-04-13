<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>

<link href="css/global.css" rel="stylesheet"/>

<script src="script/jQuery.js" type="text/javascript"></script>
<script src="script/app.js" type="text/javascript"></script>
</head>

<body>

	<%@include file="header.jsp"%> 
	<div class="bgContainer">
		<div class="tabsWrapper">
			<div class="tab">Activity</div>
		</div>
		<div class="wrapper">
			<div class="leftNav">
				<div class="bgShadow"><div class="bgLeft"><div class="mainLink"><a href="EbaySummary.action">Summary</a></div></div></div>
				<div class="bgShadow">
					<div class="bgLeft">
						<div class="mainLink"><a href="BiddingStatus.action" class="arrow active" id="arrow_0">Bidding History</a></div>
						<div class="subSection" id="subSection_0">
							<ul>
								<li><a href="#">Bids/Offers<span>(0)</span></a></li>
								<li><a href="#">Didn't win</a></li>
								<li class="last"><a href="#">Deleted</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="bgShadow">
					<div class="bgLeft">
						<div class="mainLink"><a href="#" class="arrow active" id="arrow_1">List</a></div>
						<div class="subSection" id="subSection_1">
							<ul>
								<li><a href="#">All Lists<span>(0)</span></a></li>
								<li><a href="#">Watch List</a></li>
								<li><a href="#">Wish List</a></li>
								<li class="last"><a href="#">+ Create a new List</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="bgShadow"><div class="bgLeft"><div class="mainLink"><a href="#">Saved Searches</a></div></div></div>
				<div class="bgShadow"><div class="bgLeft"><div class="mainLink"><a href="#">Saved Sellers</a></div></div></div>
				<div class="bgShadow"><div class="bgLeft"><div class="mainLink"><a href="Myebay.action">Purchase History</a></div></div></div>
				<div class="bgShadow">
					<div class="bgLeft">
						<div class="mainLink"><a href="SellHistory.action" class="arrow active">Sell History</a></div>
					</div>
				</div>
			</div>
			<div class="mainContent">
			
				<div class="panel">
					<div class="panelHead">
						<div class="heading">Bidding History</div>
					</div>
					<div class="tabsContainer" id="tabsContainer_1">
						<div class="tabSection">
							<ul id="tabsHead_1" class="tabsHead">
								<li class="active" id="tabsHead_1_0"><span>Winning</span></li>
							
								<li id="tabsHead_1_2"><span>Not Winning</span></li>
							</ul>
						</div>
						<div id="tabsContent_1_0" class="tabsContent">
						<s:iterator value="bidhis">
							<div class="panelHead2">
						<input type="checkbox"  class="left"/>
						<img src="retrieve.jsp?item_id=<s:property value="item_id"/>" width="205" height="156" class="left" />
						<div class="left">
							<div>
								<a href="#"><s:property value="item_name"/></a>
								<span class="grey">123456789</span>
							</div>
							<div>
								<a href="#" class="seperator">Seller: <s:property value="item_seller"/></a>
								<a href="#" class="seperator">124</a>
								<span class="grey">100%</span>
							</div>
							
							
							
						</div>
						<div class="left">
							<div class="green">Rs. <s:property value="item_price"/></div>
							<div class="grey">Free shipping</div>
						</div>
					</div></s:iterator>
						</div>
				
						<div id="tabsContent_1_2" class="tabsContent">
							<div class="bold">You are not bidding on any offers</div>
							<p>To see items you were bidding on that have ended, go to <a href="#">Purchase History</a> or <a href="#">Didn't Win</a>.</p>
						</div>
					</div>
				</div>
				<div class="panel">
					<div class="panelHead">
						<div class="heading"></div>
					
				</div>
			</div>
			</div>
		</div>
	</div>
</body>
</html>
