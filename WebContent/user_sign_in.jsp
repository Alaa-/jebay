<%--
    Document   : user_sign_in
    Created on : 12 Feb, 2011, 3:42:41 PM
    Author     : samrat
--%>

<%@page contentType="text/html; charset=UTF-8"%>

<%@taglib prefix="s" uri="/struts-tags"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Sign In</title>
<link href="css/css1.css" type="text/css" rel="stylesheet">
<link href="css/css2.css" type="text/css" rel="stylesheet">
</head>
<body>
	<div>
		<br />
	</div>


	<table>
		<tr>
			<td width="190"></td>
			<td width="940">
				<div>
					<a rel="nofollow" href="ebay_main.jsp"> <img border="0"
						alt="From collectables to cars, buy and sell all kinds of items on eBay"
						src="images/logoEbay_x45.gif"> </a>
				</div>
				<div class="gh-cl"></div>
				<div class="gh-col">
					<b class="gh-c1"></b> <b class="gh-c2"></b> <b class="gh-c3"></b> <b
						class="gh-c4"></b> <b class="gh-c5"></b> <b class="gh-c6"></b> <b
						class="gh-c7"></b>
					<div class="gh-clr"></div>
				</div>
				<div id="AreaTitle" class="AreaTitle">
					<div class="title">
						<b id="mainContent">
							<h1 class="sgnPh g-dft gtMsg">Welcome to eBay&nbsp;-&nbsp;Sign in</h1> </b><br />
----------------------------------------------------------------------------------------------------------------------------<br>
					</div>
				</div></td>
			<td width="190"></td>
		</tr>
		<tr>
			<td width="190"></td>
			<td width="940">
				<div>
					<table class="sgnInTab" width="100%" cellspacing="0"
						cellpadding="0" border="0">
						<tbody>
							<tr>
								<td>
									<div>
										<div class="l1SgnWid">
											<div class="sgnPnl">
												<div>
													<div class="gySgRp">
														<div>
															<div class="r3 c s">
																<div class="">
																	<div class="r3_t">
																		<b> <i></i> </b>
																	</div>
																</div>
																<div class="r3_c">
																	<div class="r3_cm bp tp">
																		<div>
																			<h2 class="pnlTit">Sign in to your account</h2>
																			<s:form id="SignInForm" action="Login" method="post"
																				name="SignInForm">
																				<input type="hidden" value="SignInWelcome"
																					name="MfcISAPICommand">
																				<input id="bhid" type="hidden"
																					value="a1%3Dna~a2%3Dna~a3%3Dna~a4%3DMozilla~a5%3DNetscape~a6%3D5.0%20(Windows)~a7%3D20100101~a8%3Dna~a9%3Dtrue~a10%3DWindows%20NT%206.1%3B%20WOW64~a11%3Dtrue~a12%3DWin32~a13%3Dna~a14%3DMozilla%2F5.0%20(Windows%20NT%206.1%3B%20WOW64%3B%20rv%3A2.0b10)%20Gecko%2F20100101%20Firefox%2F4.0b10~a15%3Dtrue~a16%3Den-US~a17%3Dna~a18%3Dsignin.ebay.in~a19%3Dna~a20%3Dna~a21%3Dna~a22%3Dna~a23%3D1366~a24%3D768~a25%3D24~a26%3D728~a27%3Dna~a28%3DSat%20Feb%2012%202011%2015%3A41%3A49%20GMT%2B0530%20(India%20Standard%20Time)~a29%3D5.5~a30%3Dswf%7Cpdf%7C~a31%3Dyes~a32%3Dna~a33%3Dna~a34%3Dno~a35%3Dno~a36%3Dyes~a37%3Dno~a38%3Donline~a39%3Dno~a40%3DWindows%20NT%206.1%3B%20WOW64~a41%3Dno~a42%3Dno~"
																					name="bhid">
																				<input type="hidden" value="1" name="UsingSSL">
																				<input id="inputversion" type="hidden" value="2"
																					name="inputversion">
																				<input id="lse" type="hidden" value="false"
																					name="lse">
																				<input id="lsv" type="hidden" value="" name="lsv">
																				<input id="mid" type="hidden"
																					value="AQAAAS3zHjIjAAUxMmUxOTVhZDYyMi5hMDZjMjE0LjRhMzAuZmZmYWUyYjkXdI/sNBQYSuZT2Y60MIwQo/DXpA**"
																					name="mid">
																				<input id="kgver" type="hidden" value="1"
																					name="kgver">
																				<input id="kgupg" type="hidden" value="1"
																					name="kgupg">
																				<input id="kgstate" type="hidden" value=""
																					name="kgstate">
																				<input id="omid" type="hidden" value="" name="omid">
																				<input id="hmid" type="hidden"
																					value="AQAAAS3zHjIjAAUxNjI3ZDA2MjEyZTBhMDZjMjIwNDA5ZjRmZmFjODY2MCwwLC0xRZSgwDtm8a/ndEw29WrLfUnnjDM*"
																					name="hmid">
																				<input type="hidden" value="203" name="siteid">
																				<input type="hidden" value="2" name="co_partnerId">
																				<input id="ru" type="hidden"
																					value="http://www.ebay.in/" name="ru">
																				<input id="pp" type="hidden" value="" name="pp">
																				<input type="hidden" value="" name="pa1">
																				<input type="hidden" value="" name="pa2">
																				<input type="hidden" value="" name="pa3">
																				<input type="hidden" value="-1" name="i1">
																				<input type="hidden" value="-1" name="pageType">
																				<input type="hidden"
																					value="A01=ABQA9E0nOAAAAAAAA2XkYjFgDzgEBAR;M01=g4FvAewgA;TC01=QBAmMUlhLBAAAEQPB9pDAAAAAAAgJ+vIxE/YB4C4hZQCMBARgA;PS=T.0"
																					name="rtmData">
																				<input id="kgct" type="hidden"
																					value="AQAAAS3zHjIjAAVqNk9FQ3A2ODhtMExRaWx2cW5uclhjVEd3azVCOWd4OU1XQUZqRVFuL2pVPSGKviowIta%2Bm4oSgGxHJ5uAaMya"
																					name="kgct">
																				<div>
																					<div class="disInf">Back for more
																						fun?&nbsp;Sign in now to buy, bid and sell, or to
																						manage your account.</div>
																					<div class="snTxSp">
																						<div class="bltns">
																							<span> <span class="errYkn"> <s:actionerror />
																							</span> </span>
																						</div>
																						<div class="bltns"></div>
																						<div class="sbtb">
																							<span class="unl"
																								style="display: -moz-inline-stack"> <label
																								for="userid"><font size="2">User
																										ID&nbsp;&nbsp;</font>
																							</label> </span> <span> <input id="userid" class="txtBxF"
																								name="uid" value="" maxlength="64" size="27">
																							</span>
																						</div>
																						<div>
																							<span class="unl"
																								style="display: -moz-inline-stack"> <label
																								for="pass"><font size="2">Password&nbsp;&nbsp;</font>
																							</label> </span> <span> <input id="pass" class="txtBxF"
																								type="password" name="password" value=""
																								maxlength="64" size="27"> </span>
																							<div class="bltns">
																								<span class="smalVerF"> I forgot my <a
																									href="forgot_userid.jsp">user ID</a> or <a
																									href="forgot_password.jsp">password</a> </span>
																							</div>
																						</div>
																					</div>
																				</div>
																				<div class="kpMeWth">
																					<div class="snTxSp">
																						<b class="pcs"> <input id="signed_in"
																							type="checkbox" value="1"
																							name="keepMeSignInOption"> </b> <span
																							class="pcsm"> <label for="signed_in"><font
																								size="2"> <b>Keep me signed in for
																										today.</b> Don't check this box if you're at a
																									public or shared computer.</font> </label> </span>
																					</div>
																				</div>
																				<div>
																					<div class="sgnBtn">
																						<b id="sgnBt" class="btn-w btn-m btn-p"> <i>Sign
																								in</i> <span id="spn_sgnBt"
																							class="btn-b moz btn-b pbn-P"> <input
																								id="but_sgnBt" type="submit" value="Sign in"
																								name="sgnBt"> <b id="txt_sgnBt">Sign
																									in</b> </span> </b>
																						
																					</div>
																					Not an eBay member?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																					<div class="sgnBtn">
																					<b id="regSub" class="btn-w btn-m btn-p"> <i>Register</i>
																			<a href="register.jsp"><span id="spn_regSub" class="btn-b moz btn-b sbn-S">
																				<input id="but_regSub" type="button"
																				value="Register" name="regSub"> </span></a> </b>
																					
																					</div>
																					
																				</div>
																			</s:form>
																		</div>
																	</div>
																</div>
																<div>
																	<div class="r3_bl">
																		<b> <i></i> </b>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											
										</div>
										<div class="lftPlTd" style="float:right;">
											<div>
												<div>
													<div class="r3 c gy-br">
														<div class="">
															<div class="r3_t">
																<b> <i></i> </b>
															</div>
														</div>
														<div class="r3_c">
															<div class="r3_cm bp tp">
																<div class="regPnl">
																	<img alt="baby" src="images/baby.jpg"/>
																</div>
															</div>
														</div>
														<div>
															<div class="r3_bl">
																<b> <i></i> </b>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div></td>
							</tr>
						</tbody>
					</table>
					<hr class="hrCol" size="1" noshade="noshade">
				</div></td>
			<td width="190"></td>
		</tr>
		<tr>
			<td width="190"></td>
			<td><%@include file="footer.jsp"%></td>
			<td width="190"></td>
		</tr>
	</table>
</body>
</html>
