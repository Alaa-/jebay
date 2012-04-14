<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Enter Item Details</title>
<link rel="stylesheet"
	href="css/main_e7671in.css"
	type="text/css">
	<link rel="stylesheet"
	href="css/syi-main_e7671in.css"
	type="text/css">
<script type="text/javascript">
function checkmode()
{
	var e=document.getElementById("itemsellmode");
	var strmode=e.options[e.selectedIndex].value;
	if(strmode=="1")
	{
		document.getElementById("pbaseprice").style.display="inline";
		document.getElementById("pprice").style.display="none";
		document.getElementById("itembaseprice").style.display="inline";
		document.getElementById("itembaseprice").value="";
		document.getElementById("itemquantity").value="1";
		document.getElementById("itemquantity").disabled=true;
		document.getElementById("itemprice").style.display="none";
		document.getElementById("itemprice").value="0";
	}
	else
	{
		document.getElementById("pprice").style.display="inline";
		document.getElementById("pbaseprice").style.display="none";	
		
		document.getElementById("itemprice").style.display="inline";
		document.getElementById("itemprice").value="";
		document.getElementById("itembaseprice").style.display="none";
		document.getElementById("itembaseprice").value="0";
		document.getElementById("itemquantity").disabled=false;
	}
}
</script>
</head>
<body>
<s:action name="addcompactheader" executeResult="true"></s:action>
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
										href="#"
										id="helpBtnlink" class="hlpimg">Help</a>
								</div>
							</div>
							<div class="clr"></div>
						</div>
						
						
		<s:form action="save_item_detail" method="post" enctype="multipart/form-data">
        <hr>
        <br>
        <br>

        <h2>ENTER THE ITEM DETAILS</h2>

            Enter Title:<input type="text" name="itemname" required="true"/><br/><br/>
            <input type="hidden" name="itemcatid" value="<s:property value="fcat"/>"/>
			<input type="hidden" name="itemsubcatid" value="<s:property value="fsubcat"/>"/>

            Condition:<select name="itemcondition">
                <option value="New">New</option>
                <option value="Used">Used</option>
            </select><br/><br/>

			
            Quantity :<input type="text" name="itemquantity" id="itemquantity" pattern="\d{1,3}" value="1" pattern="\d{0,3}"/><br/><br/>

            How you would like to sell:<select name="itemsellmode" id="itemsellmode" tabindex="-1" onchange="checkmode()">
                <option value="0">Buy It Now</option>
                <option value="1">Auction</option>
            </select><br/><br/>

			<p id="pbaseprice" style="display:none;">Starting Price:<s:textfield label="Base Price" name="itembaseprice" id="itembaseprice" value="0" pattern="\d{0,9}" required="true"/><br/><br/></p>

			<p id="pprice" style="display:inline;">Buy it now Price:<s:textfield label="Price" id="itemprice" name="itemprice" value="" pattern="\d{0,9}" required="true"/><br/><br/></p>
			
            Shipping Charge:<s:textfield label="Shipping charge" type="text" name="itemsc" pattern="\d{0,9}" required="true"/><br/><br/>
            
            Listing Duration:<select name="duration">
                <option value="3">3 Days</option>
                <option value="5">5 Days</option>
                <option value="7" selected="selected">7 Days</option>
                <option value="10">10 Days</option>
            </select><br/><br/>

            Upload Image:<s:file name="image" id="image" label="Upload Image" /><br/><br/>
           

            <s:submit name="submit" value="submit" align="left"></s:submit>
        </s:form>
        <%@ include file="footer.jsp" %>
</body>
</html>