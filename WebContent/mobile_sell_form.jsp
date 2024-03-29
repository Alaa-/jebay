<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Enter Item Details</title>

<script type="text/javascript">
function checkmode()
{
	var e=document.getElementById("mobilesellmode");
	var strmode=e.options[e.selectedIndex].value;
	if(strmode=="1")
	{
		document.getElementById("pbaseprice").style.display="inline";
		document.getElementById("mobilebaseprice").style.display="inline";
		document.getElementById("mobilebaseprice").value="";
		document.getElementById("mobilequantity").value="1";
		document.getElementById("mobilequantity").disabled=true;
		
	}
	else
	{
		document.getElementById("pbaseprice").style.display="none";	
		document.getElementById("mobilebaseprice").style.display="none";
		document.getElementById("mobilebaseprice").value="0";
		document.getElementById("mobilequantity").disabled=false;
	}
}
</script>
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
										href="#"
										id="helpBtnlink" class="hlpimg">Help</a>
								</div>
							</div>
							<div class="clr"></div>
						</div>
						
						
		<s:form action="save_mobile_detail" method="post" enctype="multipart/form-data">
        <img src="images/logoebay.gif"/>
        <hr>
        <br>
        <br>

        <h2>ENTER THE MOBILE DETAILS</h2>

            Enter Title:<input type="text" name="mobilename" required="true"/><br/><br/>
            <input type="hidden" name="mobilecatid" value="<s:property value="fcat"/>"/>
			<input type="hidden" name="mobilesubcatid" value="<s:property value="fsubcat"/>"/>
			Brand:<s:select label="Brand" name="mobilebrand"  headerKey="1" headerValue="-- Please Select --" list="brands"/><br/><br/>

            Type:<s:select label="Type" name="mobiletype"  headerKey="1" headerValue="-- Please Select --" list="types"/>	<br/><br/>
            
            Operating System:<select name="mobileos">
 				<option value="Android">Android</option>
                <option value="Bada">Bada</option>
                <option value="iOS">iOS</option>
                <option value="Java">Java</option>
                <option value="Symbian">Symbian</option>
				<option value="Windows mobile 7">Windows mobile 7</option>
            </select><br/><br/>

			Camera
           <select name="camera" >
           	<option value="1">1</option>
           	<option value="2">2</option>
           	<option value="3">3</option>
           	<option value="5">5</option>
           	<option value="8">8</option>
           	<option value="12">12</option>
           </select>
			<br/><br/>


            Condition:<select name="mobilecondition">
                <option value="New">New</option>
                <option value="Used">Used</option>
            </select><br/><br/>

			
            Quantity :<input type="text" name="mobilequantity" id="mobilequantity" pattern="\d{1,3}" value="1" pattern="\d{0,3}"/><br/><br/>

            How you would like to sell:<select name="mobilesellmode" id="mobilesellmode" tabindex="-1" onchange="checkmode()">
                <option value="0">Buy It Now</option>
                <option value="1">Auction</option>
            </select><br/><br/>

			<p id="pbaseprice" style="display:none;">Starting Price:<s:textfield label="Base Price" name="mobilebaseprice" id="mobilebaseprice" value="0" pattern="\d{0,9}" required="true"/><br/><br/></p>

			Buy it now Price:<s:textfield label="Price" id="price" name="mobileprice" value="" pattern="\d{0,9}" required="true"/><br/><br/>
			
            Shipping Charge:<input type="text" name="mobilesc" pattern="\d{0,9}" required="true"/><br/><br/>

            Mobile Feature:<input type="text" name="feature" /><br/><br/>
            
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