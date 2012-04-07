<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Enter Item Details</title>
</head>
<body>

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
						
						
		<s:form action="save_mobile_detail">
        <img src="images/logoebay.gif"/>
        <hr>
        <font size="2">SELL YOUR ITEM   > &nbsp 1.SELECT A CATEGORY  &nbsp <b>2.CREATE YOUR LISTING</b> &nbsp  3.REVIEW YOUR LISTING</font>
        <br>
        <br>

        <h2>ENTER THE MOBILE DETAILS</h2>

            Enter Mobile Name:<input type="text" name="mobilename" required="true"/><br/><br/>

            Enter the brand:<input name="mobilebrand" required="true"/><br/><br/>

             Seller Name:<input type="text" name="mobilesn" required="true"/><br/><br/>

            Enter Sim Option:<input type="text" name="simopt" required="true"/><br/><br/>

            Type:<input type="text" name="mobiletype" required="true"/><br/><br/>

            Network Standard:<input type="text" name="networkstandard" required="true"/><br/><br/>

            Camera <input type="text" name="camera" required="true"/><br/><br/>



            Camera condition:<select name="mobilecondition">
                <option value="new">New</option>
                <option value="old">Old</option>
            </select><br/><br/>

            Mobile quantity :<input type="text" name="mobilequantity" value="1"/><br/><br/>

            Buying Option:<select name="mobilebuying" >
                <option value="buyitnow">Buy It Now</option>
                <option value="aution">Auction</option>
            </select><br/><br/>



            Mobile image:<input type="text" name="mobileimage" required="true"/><br/><br/>
            <s:submit name="submit" value="image" align="left"></s:submit>

            Mobile price:<input type="text" name="mobileprice" required="true"/><br/><br/>


            Shipping Charge:<input type="text" name="mobilesc" required="true"/><br/><br/>

            Mobile Feature:<input type="text" name="feature" /><br/><br/>



            <s:submit name="submit" value="submit" align="left"></s:submit>
        </s:form>
</body>
</html>