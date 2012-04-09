<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
						<div class="mainLink"><a href="#" class="arrow active" id="arrow_0">Buy</a></div>
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
						<div class="mainLink"><a href="#" class="arrow active">Sell</a></div>
					</div>
				</div>
			</div>
			<div class="mainContent">
				<div class="panel">
					<div class="panelHead">
						<div class="heading">Purchases</div>
					</div>
					<div class="panelHead1">
						<label>Show : </label>
						<input type="radio" name="show" id="recent" />
						<label for="recent">Recent</label>
						<input type="radio" name="show" id="archieve" />
						<label for="archieve">Archieve</label>
					</div>
					<div class="panelHead2">
						<div class="left">
							<label>Period: </label>
							<select>
								<option>Last 60 days</option>
							</select>
						</div>
						<div class="right">
						
							<label>Sort By: </label>
							<select>
								<option>Time ended:recent first</option>
							</select>
						</div>
					</div><s:iterator value="pur">
					<s:if test="pur==null">Welcome!&ensp;
                   					<s:a href="user_sign_in.jsp">Sign in</s:a>
                        
                    or
                    <s:a rel="nofollow" href="register.jsp">register</s:a></s:if>
 					 <s:else>
					<div class="panelHead2">	
						<input type="checkbox"  class="left"/>
						<img src="images/icecream.jpg" width="205" height="156" class="left" />
						<div class="left">
					
							<div>
								<a href="#"><s:property value="item_name"/></a>
								<span class="grey">123456789</span>
							</div>
							<div>
								<a href="#" class="seperator">Seller: <s:property value="t_seller"/></a>
								<a href="#" class="seperator">124</a>
								<span class="grey">100%</span>
							</div>
							<div>
								<a href="#">Sale Date: <s:property value="t_timestamp"/></a>
								
							</div>
							
						</div>
						<div class="left">
							<div class="green">Rs. <s:property value="item_price"/></div>
							<div class="grey">Free shipping</div>
						</div>
						
					</div></s:else></s:iterator>
					<div class="panelHead2 Last">
						<div>
							<input type="checkbox" />
							<input type="button"  value="Add Note"/>
							<input type="button" value="Archieve" />
						</div>
						<div class="right">
							<div class="left">
								<label>Items per page : </label>
							</div>
							<div class="left">
								<ul class="list">
									<li><a href="#" class="seperator">10</a></li>
									<li><a href="#" class="seperator">25</a></li>
									<li><a href="#" class="seperator">50</a></li>
									<li><a href="#" class="seperator">100</a></li>
									<li><a href="#">200</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="panelHead2 Last1">
						<label>Page 1 of 1</label>
						<label class="page"><span class="grey">< </span>1<span class="grey"> ></span></label>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div><%@include file="footer.jsp"%></div>
</body>
</html>
