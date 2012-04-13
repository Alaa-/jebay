vjo.ctype("vjo.darwin.core.globalheader.utils.SGuid").needs(
		"vjo.dsf.cookie.VjCookieJar").props({
	writeSessionGuid : function(id) {
		if (id && id.length > 0)
			vjo.dsf.cookie.VjCookieJar.writeCookieEx("cssg", id, 1)
	}
}).endType();
vjo.ctype("vjo.darwin.core.globalheader.shoppingcart.ShoppingCart").needs(
		"vjo.dsf.Element").needs("vjo.dsf.cookie.VjCookieJar").props({
	Refresh : function(_1, _2) {
		var E = vjo.dsf.Element;
		if (this.IsShowCart()) {
			var C = this.GetCountNum() > 0 ? E.get(_1) : E.get(_2);
			if (C)
				C.style.display = "inline-block"
		}
	},
	IsShowCart : function() {
		var _5 = vjo.dsf.cookie.VjCookieJar.readCookie("dp1", "pbf");
		if (_5)
			return vjo.dsf.cookie.VjCookieJar.getBitFlag(_5, 47) == 1
	},
	GetCountNum : function() {
		var _6;
		var _7;
		var _8;
		var _9 = 0;
		_8 = vjo.dsf.cookie.VjCookieJar.readCookie("dp1", "exc");
		if (_8 && _8.length > 0) {
			_6 = _8.indexOf(":");
			if (_6 > 0) {
				_7 = _8.substring(0, _6);
				if (/^\d+$/.test(_7))
					_9 = _7
			}
		}
		return _9
	}
}).endType();
vjo.ctype("vjo.darwin.tracking.sojourner.SojData").props({
	sojD : null
}).endType();
vjo.ctype("vjo.darwin.tracking.sojourner.CalData").props({
	setData : function(_1, _2) {
		if (!_1 || !_2)
			return;
		this.cal[_1] = _2
	},
	getData : function(_3) {
		if (_3)
			return this.cal[_3]
	}
}).inits(function() {
	this.cal = {}
}).endType();
vjo.ctype("vjo.darwin.tracking.sojourner.TrackingRespHdl").needs(
		[ "vjo.darwin.tracking.sojourner.SojData",
				"vjo.darwin.tracking.sojourner.CalData" ]).props({
	handleResponse : function(_1) {
		if (_1.errors && _1.errors.length > 0)
			this.vj$.SojData.sojD = "";
		if (_1.response && _1.response.dataMap && _1.response.dataMap.SOJDATA)
			this.vj$.SojData.sojD = _1.response.dataMap.SOJDATA;
		if (_1.response && _1.response.dataMap && _1.response.dataMap.TDATA)
			this.vj$.CalData.setData(_1.svcId, _1.response.dataMap.TDATA)
	}
}).endType();
vjo.ctype("vjo.darwin.tracking.enabler.TrackingEnablerUtil").needs(
		"vjo.dsf.EventDispatcher").needs("vjo.dsf.utils.URL").needs(
		"vjo.dsf.cookie.VjCookieJar").props(
		{
			seekParent : function(_1, _2) {
				if (!_1 || !_1.tagName)
					return "";
				if (_1.tagName.toLowerCase() == "a"
						|| _1.tagName.toLowerCase() == "area")
					return _1;
				if (_1.tagName.toUpperCase() == "INPUT"
						&& _1.getAttribute("type")
						&& _1.getAttribute("type").toUpperCase() == "SUBMIT")
					return _1;
				if (_2 > 0)
					return this.seekParent(_1.parentNode, _2 - 1);
				else
					return ""
			},
			splitParm : function(_3) {
				var v = [ -1, -1, -1, -1 ];
				var f = _3.split(".");
				for ( var i = 0; i < f.length; i++) {
					var s = f[i].substr(0, 1);
					if (s == "p")
						v[0] = f[i].substr(1);
					if (s == "c")
						v[1] = f[i].substr(1);
					if (s == "m")
						v[2] = f[i].substr(1);
					if (s == "l")
						v[3] = f[i].substr(1)
				}
				return v
			},
			enc : function(i) {
				var A = [ "0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
						"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K",
						"L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V",
						"W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", "g",
						"h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r",
						"s", "t", "u", "v", "w", "x", "y", "-", "_", "!" ];
				var P = "z";
				var _b = "";
				var B = A.length;
				var _d;
				if (i == -1)
					return P;
				for (; i >= B;) {
					_d = i % B;
					_b = A[_d] + _b;
					i = i / B | 0
				}
				_b = A[i] + _b;
				return _b
			},
			checkSiteDomain : function(_e) {
				var dd = document.domain;
				var i = dd.indexOf(".ebay.");
				if (i != -1)
					dd = dd.substr(i + 1);
				if (_e && _e.length > 0) {
					if (_e.charAt(0) == "/")
						return true;
					else if (_e.indexOf(dd) == -1
							&& _e.indexOf(".ebayclassifieds.com") == -1)
						return false;
					return true
				}
				return dd
			},
			getLinkId : function(url) {
				var _11 = "_lk=";
				if (url && url.indexOf(_11) != -1) {
					var p = url.substr(url.indexOf(_11) + _11.length)
							.split("&");
					if (p[0] && p[0].length > 0)
						return p[0]
				}
				return -1
			}
		}).endType();
vjo
		.ctype("vjo.darwin.tracking.enabler.TrackingEnabler")
		.needs("vjo.dsf.utils.URL")
		.needs("vjo.dsf.cookie.VjCookieJar")
		.needs("vjo.darwin.tracking.enabler.TrackingEnablerUtil")
		.props(
				{
					rewriteURLs : function(_1, _2, _3, _4, _5) {
						if (_1.nativeEvent === null
								|| _1.nativeEvent === undefined)
							return;
						var _6 = _1.nativeEvent.srcElement
								|| _1.nativeEvent.target;
						if (_6 === null || _6 === undefined)
							return;
						if (_6.tagName.toLowerCase() == "img"
								|| _6.tagName.toLowerCase() == "span")
							_6 = _6.parentNode;
						var _7 = _6.getAttribute(_4);
						if (_7 === null)
							return;
						_7 = _7.split(_5);
						if (_7[0]) {
							var _8 = _6.href;
							if (_8
									&& vjo.darwin.tracking.enabler.TrackingEnablerUtil
											.checkSiteDomain(_8)) {
								_8 = vjo.dsf.utils.URL.addArg(_8, _2, _7[0]);
								if (_7[1])
									_8 = vjo.dsf.utils.URL
											.addArg(_8, _3, _7[1]);
								_6.href = " " + _8
							}
						}
					},
					copySIDToCookie : function(_9, _a, _b, _c) {
						var _d = ";";
						var vj = vjo.dsf.cookie.VjCookieJar;
						var u = vjo.darwin.tracking.enabler.TrackingEnablerUtil;
						var x = "undefined";
						if (typeof _GlobalNavHeaderCookieTracking == x
								|| !_GlobalNavHeaderCookieTracking)
							return this.rewriteURLs(_9, _a, _c, _b, _d);
						if (typeof _GlobalNavHeaderStatic != x
								&& _GlobalNavHeaderStatic) {
							vj.writeCookielet("ds2", "sotr");
							return
						}
						var pid = _GlobalNavHeaderSrcPageId;
						var V = "b";
						var P = "zzzz";
						var _14 = _9.nativeEvent.srcElement
								|| _9.nativeEvent.target;
						if (!_14)
							return;
						_14 = u.seekParent(_14, 3);
						if (!_14)
							return;
						var url = _14.href;
						var isF = false;
						var _17 = _14.getAttribute(_b);
						if (_14.tagName == "INPUT"
								&& _14.getAttribute("type").toUpperCase() == "SUBMIT") {
							var _18 = document.getElementsByName(_a);
							url = _14.form.action;
							for ( var i = 0; i < _18.length; i++)
								if (_18[i].tagName == "INPUT"
										&& _18[i].getAttribute("type")
										&& _18[i].getAttribute("type")
												.toUpperCase() == "HIDDEN"
										&& _18[i].form == _14.form) {
									isF = true;
									_17 = _18[i].value
								}
						}
						if (!u.checkSiteDomain(url))
							return;
						var v = [ -1, -1, -1, -1 ];
						var _1b = [ -1, -1, -1, -1 ];
						var oc = vj.readCookie("ds2", "sotr");
						if (oc && oc.length == 12 && oc.substr(0, 1) == V) {
							var _1d = oc.substr(1, 4);
							if (_1d != "zzzz")
								_1b[0] = _1d;
							_1d = oc.substr(5, 1);
							if (_1d != "z")
								_1b[1] = _1d;
							_1d = oc.substr(6, 3);
							if (_1d != "zzz")
								_1b[2] = _1d;
							_1d = oc.substr(9, 3);
							if (_1d != "zzz")
								_1b[3] = _1d
						}
						var b = false;
						if (_17) {
							_17 = _17.split(_d);
							var _1f;
							if (url && _17[0]) {
								_1f = _17[0];
								if (_17[1])
									try {
										url = vjo.dsf.utils.URL.addArg(url, _c,
												_17[1]);
										_14.href = " " + url
									} catch (e) {
									}
								v = u.splitParm(_1f);
								b = true
							}
						}
						if (!b) {
							var _20 = _a + "=";
							if (url && url.indexOf(_20) != -1)
								try {
									var p = url.substr(
											url.indexOf(_20) + _20.length)
											.split("&");
									_1f = p[0];
									v = u.splitParm(_1f);
									b = true
								} catch (e$$0) {
								}
						}
						if (!b && v[0] == -1)
							if (!pid || !_9.nativeEvent)
								return;
							else {
								v[0] = pid;
								b = true
							}
						if (v[0] == -1 && pid)
							v[0] = pid;
						if (isF && v[0] == 0 && pid)
							v[0] = pid;
						if (b) {
							var cv = V;
							if (v[0] == -1 && _1b[0] != -1)
								cv += _1b[0];
							else
								cv += (u.enc(v[0]) + P).substr(0, 4);
							if (v[1] == -1 && _1b[1] != -1)
								cv += _1b[1];
							else
								cv += u.enc(v[1]);
							if (v[2] == -1 && _1b[2] != -1)
								cv += _1b[2];
							else
								cv += (u.enc(v[2]) + P).substr(0, 3);
							if (v[3] == -1 && !isF)
								v[3] = u.getLinkId(url);
							if (v[3] == -1 && _1b[3] != -1)
								cv += _1b[3];
							else
								cv += (u.enc(v[3]) + P).substr(0, 3);
							vj.writeCookielet("ds2", "sotr", cv)
						}
					}
				}).endType();
vjo.ctype("vjo.dsf.typeextensions.string.Comparison").endType();
String.prototype.has = function(_1) {
	return this.indexOf(_1) != -1
};
String.prototype.hasArg = function(_2) {
	var a = _2;
	var rv = false;
	if (typeof a == "string")
		rv = this.has(a);
	else {
		var aL = a.length;
		for ( var j = 0; j < aL && !rv; j++)
			rv = this.has(a[j])
	}
	return rv
};
String.prototype.hasAny = function() {
	var a = arguments;
	var l = a.length;
	var rv = false;
	for ( var i = 0; i < l && !rv; i++)
		rv = this.hasArg(a[i]);
	return rv
};
String.prototype.hasAll = function() {
	var a = arguments;
	var l = a.length;
	for ( var i = 0; i < l; i++)
		if (!this.hasArg(a[i]))
			return false;
	return true
};
String.prototype.is = function(s) {
	return this == s
};
String.prototype.isAny = function() {
	var a = arguments;
	var l = a.length;
	var rv = false;
	var aL;
	for ( var i = 0; i < l && !rv; i++)
		if (typeof a[i] == "string")
			rv = this == a[i];
		else {
			aL = a[i].length;
			for ( var j = 0; j < aL && !rv; j++)
				rv = this == a[i][j]
		}
	return rv
};
vjo.itype("vjo.dsf.common.IJsHandler").protos({
	handle : function(_1) {
	}
}).endType();
vjo
		.ctype("vjo.darwin.tracking.enabler.TrackingModuleEnabler")
		.needs("vjo.dsf.utils.URL")
		.needs("vjo.dsf.typeextensions.string.Comparison")
		.needs("vjo.dsf.cookie.VjCookieJar")
		.needs("vjo.darwin.tracking.enabler.TrackingEnablerUtil")
		.satisfies("vjo.dsf.common.IJsHandler")
		.protos(
				{
					constructs : function(_1, _2, _3, _4) {
						this.sCid = _1;
						this.sParms = _2;
						this.sCidParms = _3;
						this.sDelim = _4;
						this.oCJ = vjo.dsf.cookie.VjCookieJar;
						this.oU = vjo.darwin.tracking.enabler.TrackingEnablerUtil
					},
					logModuleId : function(_5) {
						var V = "b";
						var P = "zzzz";
						if (!_5.nativeEvent || _5.nativeEvent === null
								|| _5.nativeEvent === undefined)
							return;
						var sc = false;
						if (typeof _GlobalNavHeaderCookieTracking != "undefined"
								&& _GlobalNavHeaderCookieTracking)
							sc = true;
						var _9 = _5.nativeEvent.srcElement
								|| _5.nativeEvent.target;
						if (!_9 || _9 === null || _9 === undefined)
							return;
						_9 = this.oU.seekParent(_9, 3);
						if (!_9)
							return;
						var _a = this.sCidParms.split(this.sDelim);
						if (_a[0] && _9 && _9.href
								&& !_9.href.has("javascript:"))
							if (sc) {
								var v = [ -1, -1, -1, -1 ];
								v = this.oU.splitParm(_a[0]);
								var _c = V;
								_c += (this.oU.enc(v[0]) + P).substr(0, 4);
								_c += this.oU.enc(v[1]);
								_c += (this.oU.enc(v[2]) + P).substr(0, 3);
								_c += (this.oU.enc(v[3]) + P).substr(0, 3);
								this.oCJ.writeCookielet("ds2", "sotr", _c)
							} else {
								var _d = vjo.dsf.utils.URL.addArg(_9.href,
										this.sCid, _a[0]);
								if (_a[1])
									_d = vjo.dsf.utils.URL.addArg(_d,
											this.sParms, _a[1]);
								_9.href = " " + _d
							}
					},
					getAnchor : function(_e) {
						var e = _e;
						if (e && e.tagName) {
							if (!e.tagName.is("A") && !e.tagName.is("INPUT")
									&& e.tagName.is("INPUT")
									&& e.getAttribute("type") != "SUBMIT")
								e = this.getAnchor(e.parentNode);
							return e
						}
					},
					handle : function(_10) {
						this.logModuleId(_10)
					}
				}).endType();
vjo.ctype("vjo.darwin.core.ebayheader.rover.FooterRover").needs(
		"vjo.dsf.cookie.VjCookieJar").needs(
		"vjo.dsf.assembly.VjClientAssemblerRequest").props(
		{
			VA : vjo.dsf.assembly.VjClientAssembler,
			command : null,
			roverService : function(_1) {
				if (document.location.protocol.has("https:"))
					return;
				this.command = _1;
				if (!_1)
					return;
				if (!this.isCookieValid())
					return;
				vjo.dsf.EventDispatcher.addEventListener(window, "load",
						this.sendRequest, this)
			},
			sendRequest : function() {
				var _2 = new vjo.dsf.assembly.VjClientAssemblerRequest(
						this.command, this.handleResponse, this, "cb", false);
				this.VA.load(_2)
			},
			isCookieValid : function() {
				var _3 = vjo.dsf.cookie.VjCookieJar.readCookie("dp1", "idm");
				if (!_3)
					return true;
				else
					return false
			},
			handleResponse : function(_4) {
				if (_4 && _4.length > 1) {
					var _5 = _4.length - 1;
					for ( var i = 0; i < _5; i++)
						this.createImage(_4[i]);
					this.setCookieExpiration(_4[_5])
				}
			},
			createImage : function(_7) {
				if (_7 && _7.length > 1) {
					var _8 = document.createElement("IMG");
					_8.width = "1";
					_8.height = "1";
					_8.src = _7;
					_8.alt = "";
					document.body.appendChild(_8)
				}
			},
			setCookieExpiration : function(_9) {
				if (typeof _9 == "number" && _9 > 0)
					vjo.dsf.cookie.VjCookieJar.writeCookielet("dp1", "idm",
							"1", _9 / 86400, "")
			}
		}).endType();
vjo.ctype("vjo.darwin.core.dynamicmenu.ReplaceHandler").props({
	replace : function(_1, _2, _3) {
		var dm = vjo.Registry.get(_1);
		if (null != dm)
			dm.replaceJSONDataHandler(_2, _3)
	}
}).endType();
vjo.ctype("vjo.darwin.core.ebaytoolbar.VjEbayToolbarDetect").needs(
		[ "vjo.dsf.client.ActiveX", "vjo.dsf.utils.Bit",
				"vjo.dsf.cookie.VjCookieJar" ]).props({
	isEnabled : function() {
		return false
	},
	rw : function(_1, _2) {
		return
	}
}).endType();
vjo
		.ctype("vjo.darwin.core.bta.BuyerTransactionAlert")
		.needs(
				[ "vjo.dsf.cookie.VjCookieJar",
						"vjo.dsf.typeextensions.string.Comparison",
						"vjo.dsf.client.Browser", "vjo.dsf.Element",
						"vjo.dsf.utils.Object",
						"vjo.darwin.core.ebaytoolbar.VjEbayToolbarDetect" ])
		.protos(
				{
					sId : null,
					oL : null,
					iPollingInterval : 0,
					iMaxHits : 0,
					iHitTimeout : 0,
					iServerHits : 0,
					sLastCookieletValue : "",
					sServerUrl : null,
					sImgServer : null,
					sViewItemUrl : null,
					aAlertInfo : [],
					constructs : function(_1, _2, _3, _4, _5, _6, _7, _8, _9,
							_a, _b) {
						this.sId = _1;
						this.iPollingInterval = _2;
						this.iMaxHits = _3;
						this.iHitTimeout = _4;
						this.iServerHits = 0;
						this.sLastCookieletValue = "";
						this.sServerUrl = _5;
						if (document.location.protocol.has("https"))
							_6 = _6.replace("http://pics.",
									"https://securepics.");
						this.sImgServer = _6;
						this.sViewItemUrl = _7;
						this.aAlertInfo = [
								[ "h:h:alt:2", _9, "icon/iconOutbid_16x16.gif" ],
								[ "h:h:alt:3", _8, "icon/iconWatchB_16x16.gif" ],
								[ "h:h:alt:4", _9, "icon/iconOutbid_16x16.gif" ],
								[ "h:h:alt:5", _a,
										"icon/iconchanceBlu_16x16.gif" ],
								[ "h:h:alt:tcr", _b,
										"icon/iconMailBlue_16x16.gif" ] ];
						var c;
						var oC = vjo.dsf.client.Browser;
						var oCJ = vjo.dsf.cookie.VjCookieJar;
						if (oC.bNav && oC.iVer < 7 || oC.bOpera
								&& oC.iVer + oC.fMinorVer < 0.5 || oC.bIE
								&& oC.iVer < 5)
							return;
						c = oCJ.readCookie("ebaysignin");
						if (!c || !c.is("in"))
							return;
						c = oCJ.readCookie("dp1", "a1p");
						if (c && c.length > 0 && parseInt(c) > 0)
							return;
						if (vjo.darwin.core.ebaytoolbar.VjEbayToolbarDetect
								.isEnabled())
							return
					},
					isEnabled : function() {
						var V1 = "eBayToolbar.Helper";
						var V2 = "eBayToolbarCommLib.IWebEvent.1";
						with (this) {
							var _f = vj$.ActiveX;
							return _f.isLibLoaded(V1) || _f.isLibLoaded(V2)
						}
					},
					setValue : function(_10, _11) {
						var oL = this.oL;
						if (oL) {
							if (_10.is("") && !oL.ctrld)
								return;
							if (_11)
								if (vjo.dsf.client.Browser.bFirefox)
									oL.textContent = _10;
								else
									oL.innerText = _10;
							else
								oL.innerHTML = _10;
							oL.ctrld = 1
						}
					},
					onRefreshHdl : function() {
						var t = this;
						return function() {
							t.onRefresh()
						}
					},
					onRefresh : function() {
						var E = vjo.dsf.Element;
						if (!this.oL)
							this.oL = E.get(this.sId);
						if (!this.oL)
							return;
						var c = vjo.dsf.cookie.VjCookieJar.readCookie("npii",
								"mri");
						if (c)
							return;
						c = vjo.dsf.cookie.VjCookieJar
								.readCookie("ebay", "a2p");
						if (!c) {
							this.onCookieExpire();
							return
						}
						var at = parseInt(c.charAt(8));
						if (isNaN(at))
							return;
						if (at === 0) {
							this.setValue("");
							return
						}
						var nrt = parseInt(c.substring(0, 8), 16) * 1E3;
						if (isNaN(nrt))
							return;
						var ct = new Date;
						ct = ct.getTime();
						if (at == 6 || at == 9) {
							if (!c.is(this.sLastCookieletValue))
								this.iServerHits = 0;
							this.setValue("");
							this.sLastCookieletValue = c;
							var t = nrt > ct ? parseInt((nrt - ct) / 1E3)
									: this.iPollingInterval;
							window.setTimeout(vjo.dsf.utils.Object.hitch(this,
									this.onCookieExpire), t * 1E3);
							return
						}
						if (ct >= nrt) {
							this.onCookieExpire();
							return
						}
						this.iServerHits = 0;
						var cfg = this.aAlertInfo;
						if (at < 0 && at >= cfg.length)
							return;
						var ii = c.substring(9, c.lastIndexOf("."));
						if (!c.is(this.sLastCookieletValue)) {
							var _1c = cfg[at - 1];
							var imgSrv = this.sImgServer;
							var _1d = imgSrv + "s.gif";
							var _1e = '<img src="'
									+ _1d
									+ '" alt="" width="10" height="16" style="vertical-align:middle">|<img src="'
									+ _1d
									+ '" alt="" width="10" height="16" style="vertical-align:middle">';
							_1e += '<img src="'
									+ imgSrv
									+ _1c[2]
									+ '?t" alt="" style="vertical-align:middle"><img src="'
									+ _1d
									+ '" alt="" width="5" height="16" style="vertical-align:middle">';
							var url = this.sViewItemUrl + "&item=" + ii;
							_1e += '<a href="' + url + "&ssPageName=" + _1c[0]
									+ '">' + _1c[1] + "</a>";
							this.setValue(_1e);
							this.sLastCookieletValue = c
						}
						this.fireRefreshEvent()
					},
					fireRefreshEvent : function(_20) {
						if (!_20)
							_20 = this.iPollingInterval;
						window.setTimeout(vjo.dsf.utils.Object.hitch(this,
								this.onRefresh), _20 * 1E3)
					},
					onCookieExpire : function() {
						var oCJ = vjo.dsf.cookie.VjCookieJar;
						var signin = oCJ.readCookie("ebaysignin");
						if (!signin.has("in"))
							return;
						if (document.location.href.has("https:"))
							return;
						if (this.iServerHits < this.iMaxHits) {
							this.iServerHits++;
							var ct = new Date;
							ct = ct.getTime();
							this
									.setValue('<img height="1" width="1" src="'
											+ this.sServerUrl
											+ "&clientTime="
											+ ct
											+ '" style="visibility:hidden;vertical-align:middle" alt="">');
							this.fireRefreshEvent(this.iHitTimeout)
						} else {
							this.setValue("");
							oCJ.writeCookielet("ebay", "a2p",
									"1111111101111111111.")
						}
					}
				}).endType();
vjo.ctype("vjo.darwin.core.ebayheader.timezone.TimeZone").needs(
		[ "vjo.dsf.cookie.VjCookieJar", "vjo.dsf.utils.DecimalToHex" ]).props(
		{
			init : function() {
				this.vj$.VjCookieJar.writeCookielet("dp1", "tzo",
						this.vj$.DecimalToHex.dec2Hex((new Date)
								.getTimezoneOffset()))
			}
		}).inits(function() {
	vjo.darwin.core.ebayheader.timezone.TimeZone.init()
}).endType();
vjo.ctype("vjo.darwin.core.ebayheader.rebate.RebateBox").needs(
		"vjo.dsf.Element").needs("vjo.dsf.cookie.VjCookieJar").props({
	Refresh : function(_1, _2, _3) {
		var E = vjo.dsf.Element;
		var _5 = E.get(_1);
		if (_5)
			if (this.IsShowMagicRebate(_5, _2))
				_5.style.display = "inline-block";
			else if (this.IsShowVibrantCoupon()) {
				_5.innerHTML = _3;
				var _6 = _5.getElementsByTagName("a")[0];
				if (_6)
					_6.style.paddingTop = "6px";
				_5.style.display = "inline-block"
			}
	},
	IsShowVibrantCoupon : function() {
		var _7 = vjo.dsf.cookie.VjCookieJar.readCookie("ebay", "sbf");
		if (_7)
			return vjo.dsf.cookie.VjCookieJar.getBitFlag(_7, 29) == 1
	},
	IsShowMagicRebate : function(_8, _9) {
		var _a = _8.getElementsByTagName("img")[0];
		var rate = vjo.dsf.cookie.VjCookieJar.readCookie("npii", "mri");
		var perc;
		if (this.IsExpired())
			return false;
		if (!rate)
			return false;
		perc = this.GetRate(rate);
		if (perc)
			perc = this.IsValidRate(perc);
		if (perc !== null && _a) {
			if (perc != _9)
				_a.src = _a.src.replaceToken(_a.src, _9, perc);
			return true
		} else
			return false
	},
	IsExpired : function() {
		var _b = (new Date).getTime();
		var _c = this.getClientOffset(_b);
		var _d = vjo.dsf.cookie.VjCookieJar.readCookieObj("npii", "mri");
		if (_d !== null) {
			var _e = parseInt(_d.maxage, 16) * 1E3;
			if (_e > 0) {
				var _f = _e - _b + _c;
				if (_f < 0)
					return true
			}
		}
		return false
	},
	getClientOffset : function(_10) {
		var _11;
		var _12 = vjo.dsf.cookie.VjCookieJar.readCookie("ebay", "cos");
		if (_12 !== null && _12.length > 0)
			_11 = parseInt(_12, 16) * 1E3;
		else
			_11 = 36E5;
		return _11
	},
	IsValidRate : function(_13) {
		var R = parseInt(_13, 10);
		return R > 0 && R < 100 ? R : null
	},
	GetRate : function(cv) {
		var ar = cv.split(":");
		return ar.length > 3 ? ar[2] : null
	}
}).endType();
vjo.needs("vjo.dsf.typeextensions.string.Comparison");
vjo.ctype("vjo.dsf.typeextensions.string.TokenReplacement").endType();
String.prototype.replaceToken = function(_1, _2, _3) {
	if (_2 == _3)
		return _1;
	for ( var rv = _1; rv.has(_2);)
		rv = rv.replace(_2, _3);
	return rv
};
String.prototype.replaceTokensEx = function(_5) {
	var rv = this;
	var re;
	var tkn;
	var a = arguments;
	var l = a.length;
	for ( var i = 1; i < l + 1; i++)
		rv = this.replaceToken(rv, _5.replace("n", i), a[i]);
	return rv
};
String.prototype.replaceTokens = function() {
	var rv = this;
	var re;
	var tkn;
	var a = arguments;
	var l = a.length;
	for ( var i = 0; i < l; i++)
		rv = this.replaceToken(rv, "<#" + (i + 1) + "#>", a[i]);
	return rv
};
vjo.ctype("vjo.dsf.window.utils.VjWindow").props({
	open : function(_1, _2, _3, _4, _5, _6, _7) {
		if (_5) {
			var _8 = (window.screen.width - _6) / 2;
			var _9 = (window.screen.height - _7) / 2;
			_3 += ",left=" + _8 + ",top=" + _9
		}
		return window.open(_1, _2, _3, _4)
	},
	location : function(_a) {
		document.location.href = _a
	},
	alert : function(_b) {
		window.alert(_b)
	},
	confirm : function(_c) {
		return window.confirm(_c)
	}
}).endType();
vjo
		.ctype("vjo.dsf.window.utils.VjWindowUtils")
		.props(
				{
					getBrowserWindowHeight : function() {
						var s = self;
						var d = document;
						var de = d.documentElement;
						if (s.innerHeight)
							return s.innerHeight;
						else if (de && de.clientHeight)
							return de.clientHeight;
						return d.body.clientHeight
					},
					getBrowserWindowWidth : function() {
						var s = self;
						var d = document;
						var de = d.documentElement;
						if (s.innerWidth)
							return s.innerWidth;
						else if (de && de.clientWidth)
							return de.clientWidth;
						return d.body.clientWidth
					},
					getScrollXY : function() {
						var _7 = 0;
						var scrOfY = 0;
						if (typeof window.pageYOffset == "number") {
							scrOfY = window.pageYOffset;
							_7 = window.pageXOffset
						} else if (document.body
								&& (document.body.scrollLeft || document.body.scrollTop)) {
							scrOfY = document.body.scrollTop;
							_7 = document.body.scrollLeft
						} else if (document.documentElement
								&& (document.documentElement.scrollLeft || document.documentElement.scrollTop)) {
							scrOfY = document.documentElement.scrollTop;
							_7 = document.documentElement.scrollLeft
						}
						return [ _7, scrOfY ]
					},
					toPixels : function(_8) {
						return _8 + "px"
					},
					scrollTop : function() {
						if (window.pageYOffset != null)
							return window.pageYOffset;
						if (document.documentElement)
							return Math.max(document.documentElement.scrollTop,
									document.body.scrollTop);
						else
							return document.body.scrollTop
					},
					scrollLeft : function() {
						if (window.pageXOffset != null)
							return window.pageXOffset;
						if (document.documentElement)
							return Math.max(
									document.documentElement.scrollLeft,
									document.body.scrollLeft);
						else
							return document.body.scrollLeft
					},
					scrollWidth : function() {
						if (document.documentElement)
							return document.documentElement.scrollWidth;
						else
							return Math.max(document.body.scrollWidth,
									document.body.offsetWidth)
					},
					scrollHeight : function() {
						if (document.documentElement)
							return document.documentElement.scrollHeight;
						else
							return Math.max(document.body.scrollHeight,
									document.body.offsetHeight)
					},
					clientTop : function() {
						if (document.documentElement)
							return document.documentElement.clientTop;
						else
							return document.body.clientTop
					},
					clientLeft : function() {
						if (document.documentElement)
							return document.documentElement.clientLeft;
						else
							return document.body.clientLeft
					},
					clientWidth : function() {
						var _9 = document.documentElement;
						if (_9 && window.innerWidth)
							return Math.min(_9.clientWidth, window.innerWidth);
						else if (_9 && _9.clientWidth)
							return _9.clientWidth;
						else if (window.innerWidth)
							return window.innerWidth;
						else if (document.body.clientWidth)
							return document.body.clientWidth;
						else
							return document.body.offsetWidth
					},
					clientHeight : function() {
						var _a = document.documentElement;
						if (_a && window.innerHeight)
							return Math
									.min(_a.clientHeight, window.innerHeight);
						else if (_a && _a.clientHeight)
							return _a.clientHeight;
						else if (window.innerHeight)
							return window.innerHeight;
						else if (document.body.clientHeight)
							return document.body.clientHeight;
						else
							return document.body.offsetHeight
					},
					browserTop : function() {
						return window.innerHeight ? window.screenY
								+ (window.outerHeight - window.innerHeight)
								: window.screenTop
					},
					browserLeft : function() {
						return window.innerWidth ? window.screenX
								+ (window.outerWidth - window.innerWidth)
								: window.screenLeft
					},
					eventTop : function(_b) {
						if (_b.pageY != null)
							return _b.pageY;
						if (document.documentElement)
							return _b.clientY
									+ Math.max(
											document.documentElement.scrollTop,
											document.body.scrollTop);
						else
							return _b.clientY + document.body.scrollTop
					},
					eventLeft : function(_c) {
						if (_c.pageX != null)
							return _c.pageX;
						if (document.documentElement)
							return _c.clientX
									+ Math
											.max(
													document.documentElement.scrollLeft,
													document.body.scrollLeft);
						else
							return _c.clientX + document.body.scrollLeft
					},
					offsetTop : function(_d) {
						var _e = document.documentElement
								&& document.documentElement.clientTop ? document.documentElement.clientTop
								: 0;
						for ( var _f = 0; _d != null; _d = _d.offsetParent)
							_f += _d.offsetTop;
						return _f + _e
					},
					offsetLeft : function(_10) {
						var _11 = document.documentElement
								&& document.documentElement.clientLeft ? document.documentElement.clientLeft
								: 0;
						for ( var _12 = 0; _10 != null; _10 = _10.offsetParent)
							_12 += _10.offsetLeft;
						return _12 + _11
					},
					openWindow : function(url, _14, _15) {
						var _16 = new Array;
						var _17 = vjo.dsf.window.utils.VjWindowUtils;
						_15.top = _17.browserTop()
								+ Math
										.round((_17.clientHeight() - _15.height) / 2)
								+ 25;
						_15.left = _17.browserLeft()
								+ Math
										.round((_17.clientWidth() - _15.width) / 2);
						for ( var key in _15)
							_16.push(key.concat("=", _15[key]));
						return window.open(url, _14, _16.join(","), true)
					}
				}).endType();
vjo
		.ctype("vjo.darwin.core.ebayheader.autocomplete.AutoCompleteLazyInit")
		.props(
				{
					_ready : false,
					_inited : false,
					_inputId : null,
					_formId : null,
					init : function(_1, _2) {
						var t = this;
						var ac = vjo.darwin.core.ebayheader.autocomplete.AutoComplete;
						t._inputId = _1;
						t._formId = _2;
						t._ready = true;
						if (ac && !t._inited) {
							ac.init(_1, _2);
							t._inited = true
						}
					},
					callback : function() {
						var t = this;
						if (t._ready && !t._inited) {
							vjo.darwin.core.ebayheader.autocomplete.AutoComplete
									.init(t._inputId, t._formId);
							t._inited = true
						}
					}
				}).endType();
vjo
		.ctype("vjo.darwin.core.ebayheader.autocomplete.AutoComplete")
		.needs(
				[ "vjo.dsf.Message", "vjo.dsf.Element",
						"vjo.dsf.EventDispatcher", "vjo.dsf.utils.Handlers",
						"vjo.dsf.ServiceEngine",
						"vjo.dsf.window.utils.VjWindowUtils",
						"vjo.darwin.core.ebayheader.autocomplete.AutoCompleteLazyInit" ])
		.protos(
				{
					H : vjo.dsf.utils.Handlers,
					constructs : function(_1, _2) {
						var t = this;
						var E = vjo.dsf.Element;
						var ED = vjo.dsf.EventDispatcher;
						t.sFormId = _2;
						t.sAcDivId = _1 + "_acdiv";
						t.acdivWidth = 0;
						t.sShowImg = false;
						t.activated = true;
						t.sReskin = true;
						t.H.attachSvcReqt("activateAutoComplete",
								t.activateAutoComplete, t);
						t.input = E.get(_1);
						t.input.setAttribute("AUTOCOMPLETE", "OFF");
						if (t.input.className.has("xpborder"))
							t.sReskin = false;
						t.acdiv = E.get(t.sAcDivId);
						var _4 = document.forms;
						ED.add(_1, "keyup", function(e) {
							if (!t.activated)
								return;
							var _6 = e.nativeEvent.keyCode;
							var _7 = new vjo.dsf.Message("SVC_GH_OUT");
							_7.clientContext = {
								type : "kw_keyup",
								src : e.src,
								value : t.input.value,
								keyCode : _6
							};
							return _7
						});
						ED.add(_1, "keydown", function(e) {
							if (!t.activated)
								return;
							var _9 = e.nativeEvent.keyCode;
							var _a = new vjo.dsf.Message("SVC_GH_OUT");
							_a.clientContext = {
								type : "kw_keydown",
								src : e.src,
								value : t.input.value,
								keyCode : _9
							};
							return _a
						});
						ED.add(_1, "mouseover", function(e) {
							if (!t.activated)
								return;
							var _c = e.nativeEvent.keyCode;
							var _d = new vjo.dsf.Message("SVC_GH_OUT");
							_d.clientContext = {
								type : "kw_mouseover",
								src : e.src
							};
							return _d
						});
						ED.add(_1, "blur", function(e) {
							if (!t.activated)
								return;
							var _f = e.nativeEvent.keyCode;
							var _10 = new vjo.dsf.Message("SVC_GH_OUT");
							_10.clientContext = {
								type : "kw_blur",
								src : e.src
							};
							return _10
						});
						ED.add(this.sAcDivId, "click", function(e) {
							if (!t.activated)
								return;
							var _12 = new vjo.dsf.Message("SVC_GH_OUT");
							_12.clientContext = {
								type : "show_click"
							};
							return _12
						});
						vjo.dsf.ServiceEngine
								.registerSvcHdl(
										"SVC_GH_IN",
										function(_13) {
											if (!t.activated)
												return;
											var _14 = _13.clientContext.type;
											if (_14 == "kw_updvalue")
												t.input.value = _13.clientContext.value;
											else if (_14 == "kw_autocomplete") {
												if (_13.clientContext.bOn
														&& !_13.clientContext.bSkipFocus)
													t.input.blur();
												t.input
														.setAttribute(
																"AUTOCOMPLETE",
																_13.clientContext.bOn ? "ON"
																		: "OFF");
												if (_13.clientContext.bOn
														&& !_13.clientContext.bSkipFocus) {
													t.input.blur();
													t.input.focus()
												}
											} else if (_14 == "search_updtrk")
												for (i = 0; i < _4.length; i++) {
													if (_4[i].name == _2)
														for ( var j = 0; j < _4[i].length; j++)
															if (_4[i].elements[j].name == "_trksid") {
																var _16 = _4[i].elements[j].value;
																var _17 = "";
																var _18 = [
																		"p",
																		"m",
																		"l" ];
																for ( var _19 in _18) {
																	var _1a = new RegExp(
																			_18[_19]
																					+ "[0-9]+(?=.|$)");
																	var _1b = _16
																			.match(_1a);
																	var _1c = _13.clientContext.lnkStr
																			.match(_1a);
																	var _1d = _1c ? _1c[0]
																			: _1b ? _1b[0]
																					: null;
																	var _1e = _17.length > 0 ? "."
																			: "";
																	if (_1d)
																		_17 += _1e
																				+ _1d
																}
																_4[i].elements[j].value = _17;
																return
															}
												}
											else if (_14 == "search_submit")
												for (i = 0; i < _4.length; i++) {
													if (_4[i].name == _2) {
														_4[i].submit();
														return
													}
												}
											else if (_14 == "sug_icon_show")
												if (_13.clientContext.bShow)
													t.showImage();
												else
													t.hideImage();
											else if (_14 == "kw_focus") {
												t.input.focus();
												t.input.value = t.input.value
														+ ""
											}
										})
					},
					activateAutoComplete : function(msg) {
						var t = this;
						if (msg.activated)
							t.activated = true;
						else {
							t.hideImage();
							t.activated = false
						}
					},
					showImage : function() {
						var t = this;
						if (t.sShowImg)
							return;
						if (t.acdivWidth === 0) {
							t.acdiv.style.display = "inline";
							t.acdivWidth = t.acdiv.offsetWidth
						}
						var wd = t.sReskin ? 1 : -3;
						var _23 = t.acdivWidth - wd;
						if ("BackCompat" == document.compatMode)
							if (t.sReskin)
								_23 = _23 - 1;
							else
								_23 = _23 - 5;
						t.input.style.width = t.input.clientWidth - _23 + "px";
						t.input.style.borderRightWidth = "0px";
						t.acdiv.style.display = "inline";
						t.sShowImg = true
					},
					hideImage : function() {
						var t = this;
						if (!t.sShowImg)
							return;
						var wd = t.sReskin ? 1 : 5;
						var _26 = t.acdiv.offsetWidth - wd;
						if ("BackCompat" == document.compatMode)
							if (t.sReskin)
								_26 = _26 + 2;
							else
								_26 = _26 + 6;
						t.input.style.width = t.input.clientWidth + _26 + "px";
						t.input.style.borderRightWidth = "1px";
						t.acdiv.style.display = "none";
						t.sShowImg = false
					}
				})
		.props(
				{
					init : function(_27, _28) {
						new vjo.darwin.core.ebayheader.autocomplete.AutoComplete(
								_27, _28)
					}
				}).inits(function() {
			this.vj$.AutoCompleteLazyInit.callback()
		}).endType();
vjo.ctype("vjo.darwin.core.ebayheader.autocomplete.layer.AutoCompleteEncoder")
		.protos(
				{
					aCharList : [ [ new RegExp("[%]", "g"), "_" ],
							[ new RegExp("[.]", "g"), "_2e" ],
							[ new RegExp("[+]", "g"), "_2b" ],
							[ new RegExp("[']", "g"), "_27" ] ],
					pseudoDiv : null,
					constructs : function() {
						this.pseudoDiv = document.createElement("div")
					},
					encode : function(_1) {
						var _2 = encodeURIComponent(_1);
						var t = this;
						for ( var j = 0; j < t.aCharList.length; j++) {
							var _4 = t.aCharList[j];
							_2 = _2.replace(_4[0], _4[1])
						}
						return _2
					},
					decodeCookie : function(_5) {
						var _6 = _5 || "";
						_6 = _6.replace(new RegExp("[+]", "g"), " ");
						_6 = decodeURIComponent(_6);
						return _6
					},
					encodeHTML : function(_7) {
						var e = this.pseudoDiv;
						if (typeof e.textContent != "undefined")
							e.textContent = _7;
						else
							e.innerText = _7;
						return e.innerHTML
					}
				}).endType();
vjo
		.ctype(
				"vjo.darwin.core.ebayheader.autocomplete.layer.AutoCompleteCache")
		.needs(
				"vjo.darwin.core.ebayheader.autocomplete.layer.AutoCompleteEncoder")
		.protos(
				{
					oCache : {},
					oIdx : {},
					oRef : {},
					oLeaf : {},
					oEncoder : null,
					UN : "undefined",
					TFU : "function",
					TNU : "number",
					constructs : function() {
						this.oEncoder = new vjo.darwin.core.ebayheader.autocomplete.layer.AutoCompleteEncoder
					},
					add : function(_1) {
						try {
							var t = this;
							var cacheItem = t.oCache[kw];
							var kw;
							var kwL;
							var laL;
							var prdL;
							var tdL;
							var _3 = false;
							if (_1[0].version) {
								kw = _1[1];
								kwL = _1[2].sug ? _1[2].sug : _1[2];
								laL = _1[3];
								prdL = _1[2].prd;
								tdL = _1[2].td;
								_3 = true
							} else {
								kw = _1[0];
								kwL = _1[1];
								laL = _1[2]
							}
							if (_3)
								if (_1.length >= 4)
									t.addItem(kw, kw, "k", kwL, prdL, tdL);
								else
									laL = _1[2];
							else if (_1.length >= 3)
								t.addItem(kw, kw, "k", kwL, null, null);
							else
								try {
									if (typeof kwL[0] == "string") {
										laL = null;
										t.addItem(kw, kw, "k", kwL, null, null)
									} else if (typeof kwL[0] == "object"
											&& kwL[0] instanceof Array)
										laL = _1[1]
								} catch (err) {
									laL = null
								}
							if (laL !== null)
								for ( var i = 0; i < laL.length; i++) {
									var _5 = laL[i];
									var _6 = kw + _5[0];
									var _7 = _5[1];
									var _8;
									var _9;
									var _a;
									if (_3) {
										if (_5[2].sug)
											_8 = _5[2].sug;
										else
											_8 = _5[2];
										_9 = _5[2].prd;
										_a = _5[2].td
									} else
										_8 = _5[2];
									if (typeof _8 == t.UN || _8 === null) {
										_7 = "fd";
										_8 = _5[0]
									}
									t.addItem(_6, kw, _7, _8, _9, _a)
								}
							else
								t.addItem(kw, kw, "null", null)
						} catch (e) {
						}
					},
					addItem : function(_b, _c, _d, _e, _f, _10) {
						var t = this;
						_b = _b.toLowerCase();
						_c = _c.toLowerCase();
						if (_d == "k") {
							t.oCache[_b] = t.buildItem("k",
									typeof _e == t.TNU ? "" + _e : _e, _f, _10,
									_c);
							return t.oCache[_b]
						} else if (_d == "f") {
							t.oIdx[_b] = t.buildItem("f",
									typeof _e == t.TNU ? "" + _e : _e, _f, _10,
									_c);
							return t.oIdx[_b]
						} else if (_d == "fd") {
							t.oRef[_b] = t.buildItem("fd", _e, _f, _10, _c);
							return t.oRef[_b]
						} else if (_d == "null") {
							t.oLeaf[_b] = t
									.buildItem("null", null, _f, _10, _c);
							return t.oLeaf[_b]
						}
					},
					buildItem : function(_12, _13, _14, pTd, _16) {
						var _17 = {
							type : _12,
							shortPrefix : _16
						};
						if (_13 !== null)
							_17.keyword = _13;
						if (_14 !== null)
							_17.prd = _14;
						if (pTd !== null)
							_17.td = pTd;
						return _17
					},
					get : function(_18, _19) {
						_18 = _18.toLowerCase();
						_19 = _19.toLowerCase();
						var t = this;
						var cacheItem = t.oCache[_18];
						var indexItem = t.oIdx[_18];
						var referenceItem = t.oRef[_18];
						if (typeof cacheItem != t.UN
								&& typeof cacheItem != t.TFU)
							return cacheItem;
						if (typeof indexItem != t.UN
								&& typeof indexItem != t.TFU)
							return indexItem;
						if (typeof referenceItem != t.UN
								&& typeof referenceItem != t.TFU)
							return referenceItem;
						if (_19) {
							var _1b = t.oLeaf[_19];
							if (typeof _1b != t.UN && typeof _1b != t.TFU)
								return _1b;
							var _1c = [];
							for ( var _1d in t.oIdx) {
								var _1e = t.oIdx[_1d];
								if (_1e.shortPrefix == _19)
									_1c.push(_1d)
							}
							_1c.sort();
							if (_1c.length === 0)
								return null;
							var _1f = _1c.length - 1;
							for ( var i = 0; i < _1c.length; i++)
								if (_18 < _1c[i]) {
									_1f = i - 1;
									break
								}
							if (_1f < 0)
								_1f = 0;
							return t.oIdx[_1c[_1f]]
						}
						return null
					}
				}).endType();
vjo
		.ctype(
				"vjo.darwin.core.ebayheader.autocomplete.layer.AutoCompleteConfig")
		.needs(
				"vjo.darwin.core.ebayheader.autocomplete.layer.AutoCompleteEncoder")
		.protos(
				{
					oModel : {
						rootDir : "autofill",
						listSize : 10,
						delayTime : 100,
						dirDepth : 3,
						noSugShowTime : 1500,
						svcIn : "SVC_GH_IN",
						svcOut : "SVC_GH_OUT"
					},
					defaultAlgo : "1",
					algoMap : {
						"1" : "f",
						"2" : "a"
					},
					widthDef : {
						unit : 9,
						min : {
							px : 235,
							"char" : 26
						},
						max : {
							px : 400,
							"char" : 40
						}
					},
					oEncoder : null,
					constructs : function(_1) {
						if (_1.version === null && _1.algorithm === null
								&& _1.algoVerMap == null)
							return;
						this.oEncoder = new vjo.darwin.core.ebayheader.autocomplete.layer.AutoCompleteEncoder;
						this.loadConfig(_1)
					},
					loadConfig : function(_2) {
						var t = this;
						var tM = t.oModel;
						if (_2.version === null || _2.algorithm === null) {
							tM.version = _2.algoVerMap[t.defaultAlgo];
							tM.algorithm = t.algoMap[t.defaultAlgo]
						} else {
							tM.version = _2.version;
							tM.algorithm = t.algoMap[_2.algorithm]
						}
						tM.trkSuggest = _2.trkSuggest;
						tM.trkProduct = _2.trkProduct;
						tM.trkBrandedLogo = _2.trkBrandedLogo;
						tM.trkRS = _2.trkRS;
						tM.trkInput = _2.trkInput;
						tM.trkShow = _2.trkShow;
						tM.trkHide = _2.trkHide;
						tM.roverDomainUrl = _2.roverDomainUrl;
						tM.containerId = _2.containerId;
						tM.idList = _2.idList;
						tM.sugDivId = _2.sugDivId;
						tM.noSugDivId = _2.noSugDivId;
						tM.hideLnk = _2.hideLnk;
						tM.baseURL = _2.baseURL;
						tM.prdURL = _2.prdBaseURL;
						tM.siteId = _2.siteId;
						tM.lastSearch = t.oEncoder.decodeCookie(_2.lastSearch)
					},
					updateWidthDef : function(_4) {
						var t = this;
						var inputWidth = parseInt(_4.offsetWidth, 10);
						t.widthDef.max = {
							px : inputWidth,
							"char" : Math.floor(inputWidth / t.widthDef.unit) - 1
						}
					},
					getHideLnk : function() {
						return this.oModel.hideLnk
					},
					getWidthUnit : function() {
						return this.widthDef.unit
					},
					getWidthMin : function() {
						return this.widthDef.min
					},
					getWidthMax : function() {
						return this.widthDef.max
					},
					getRootDir : function() {
						return this.oModel.rootDir
					},
					getListSize : function() {
						return this.oModel.listSize
					},
					getDelayTime : function() {
						return this.oModel.delayTime
					},
					getDirDepth : function() {
						return this.oModel.dirDepth
					},
					getAlgorithm : function() {
						return this.oModel.algorithm
					},
					getVersion : function() {
						return this.oModel.version
					},
					getTrkSuggest : function() {
						return this.oModel.trkSuggest
					},
					getTrkProduct : function() {
						return this.oModel.trkProduct
					},
					getTrkBrandedLogo : function() {
						return this.oModel.trkBrandedLogo
					},
					getTrkRS : function() {
						return this.oModel.trkRS
					},
					getTrkInput : function() {
						return this.oModel.trkInput
					},
					getRoverDomainUrl : function() {
						return this.oModel.roverDomainUrl
					},
					getTrkShow : function() {
						return this.oModel.trkShow
					},
					getTrkHide : function() {
						return this.oModel.trkHide
					},
					getContainerId : function() {
						return this.oModel.containerId
					},
					getIdList : function() {
						return this.oModel.idList
					},
					getKeyUpSvc : function() {
						return this.oModel.keyUpSvc
					},
					getKeyDownSvc : function() {
						return this.oModel.keyDownSvc
					},
					getInputOverSvc : function() {
						return this.oModel.inputOverSvc
					},
					getUpdInputSvc : function() {
						return this.oModel.updInputSvc
					},
					getFillContentSvc : function() {
						return this.oModel.fillContentSvc
					},
					getInSvc : function() {
						return this.oModel.svcIn
					},
					getOutSvc : function() {
						return this.oModel.svcOut
					},
					getBaseURL : function() {
						return this.oModel.baseURL
					},
					getPrdURL : function() {
						return this.oModel.prdURL
					},
					getSiteId : function() {
						return this.oModel.siteId
					},
					getSugDivId : function() {
						return this.oModel.sugDivId
					},
					getNoSugDivId : function() {
						return this.oModel.noSugDivId
					},
					getNoSugShowTime : function() {
						return this.oModel.noSugShowTime
					},
					getLastSearch : function() {
						return this.oModel.lastSearch
					}
				}).endType();
vjo.ctype("vjo.dsf.document.Shim").needs("vjo.dsf.client.Browser").props({
	add : function(_1, _2, _3) {
		var f;
		var p = "px";
		var w;
		var h;
		var s;
		if (this.check()) {
			w = _1.offsetWidth;
			h = _1.offsetHeight;
			w += _2 ? _2 : 0;
			h += _3 ? _3 : 0;
			f = document.createElement("IFRAME");
			s = f.style;
			s.width = w + p;
			s.height = h + p;
			s.filter = "chroma(color='white')";
			f.frameBorder = 0;
			s.position = "absolute";
			s.left = "0" + p;
			s.top = "0" + p;
			s.zIndex = "-1";
			s.filter = 'Alpha(Opacity="0")';
			if (document.location.protocol == "https:")
				f.src = "https://securepics.ebaystatic.com/aw/pics/s.gif";
			_1.appendChild(f);
			return f
		}
		return null
	},
	remove : function(_6, _7) {
		if (this.check())
			if (_7 && _7.parentNode)
				_7.parentNode.removeChild(_7)
	},
	check : function() {
		var B = vjo.dsf.client.Browser;
		return B.bIE || B.bFirefox
	}
}).endType();
vjo.ctype("vjo.dsf.utils.Timer").protos({
	timer : null,
	isRunning : false,
	interval : null,
	onTick : function() {
	},
	onStart : null,
	onStop : null,
	constructs : function(_1) {
		this.interval = _1
	},
	setInterval : function(ms) {
		var t = this;
		if (t.isRunning)
			window.clearInterval(t.timer);
		t.interval = ms;
		if (t.isRunning)
			t.setInt()
	},
	start : function() {
		var t = this;
		if (typeof t.onStart == "function")
			t.onStart();
		t.isRunning = true;
		t.setInt()
	},
	stop : function() {
		var t = this;
		if (typeof t.onStop == "function")
			t.onStop();
		t.isRunning = false;
		window.clearInterval(t.timer)
	},
	setInt : function() {
		var t = this;
		t.timer = window.setInterval(vjo.hitch(t, t.onTick), t.interval)
	}
}).endType();
vjo
		.ctype(
				"vjo.darwin.core.ebayheader.autocomplete.layer.AutoCompleteRequest")
		.needs(
				[
						"vjo.dsf.XDomainRequest",
						"vjo.dsf.utils.Timer",
						"vjo.dsf.Element",
						"vjo.dsf.ServiceEngine",
						"vjo.dsf.Message",
						"vjo.darwin.core.ebayheader.autocomplete.layer.AutoCompleteCache",
						"vjo.darwin.core.ebayheader.autocomplete.layer.AutoCompleteEncoder" ])
		.props(
				{
					aReqList : [],
					sRespSvc : "autofill_response",
					inProcess : false,
					bInit : false,
					vX : vjo.dsf.XDomainRequest,
					uN : "undefined",
					init : function(_1) {
						var t = this;
						if (t.bInit)
							return;
						t.oConfig = {
							baseURL : _1.baseURL,
							dirDepth : _1.dirDepth,
							rootDir : _1.rootDir,
							algorithm : _1.algorithm,
							version : _1.version,
							siteId : _1.siteId
						};
						t.oCache = new vjo.darwin.core.ebayheader.autocomplete.layer.AutoCompleteCache;
						t.oEncoder = new vjo.darwin.core.ebayheader.autocomplete.layer.AutoCompleteEncoder;
						t.oProcessTimer = new vjo.dsf.utils.Timer;
						t.oProcessTimer.setInterval(20);
						t.oProcessTimer.onTick = function() {
							if (t.inProcess)
								return;
							t.inProcess = true;
							try {
								t.processQue();
								t.cleanQue()
							} catch (e) {
							}
							t.inProcess = false
						};
						t.oProcessTimer.start();
						t.bInit = true
					},
					processQue : function() {
						var t = this;
						if (t.aReqList.length === 0)
							return;
						var _4 = t.aReqList[0];
						if (_4 && _4.state == "wait") {
							t.aReqList[0].state = "process";
							var _5 = t.vX.bUseIframe;
							try {
								t.vX.bUseIframe = false;
								t.aReqList[0].scriptId = t.vX.send(_4.url,
										false)
							} catch (e) {
							}
							t.vX.bUseIframe = _5
						}
					},
					cleanQue : function() {
						var t = this;
						var _7 = [];
						var i;
						for (i = 0; i < t.aReqList.length; i++) {
							var _8 = t.aReqList[i];
							if (_8.state == "wait")
								_7.push(_8);
							else if (_8.state == "process") {
								var _9 = new Date;
								var time = _9.getTime() - _8.timestamp;
								if (time >= 1E3) {
									t.removeScriptTag(_8.scriptId);
									t.sendRespService(true, _8.requester,
											_8.prefix, null, null,
											_8.shortPrefix)
								} else
									_7.push(_8)
							}
						}
						t.aReqList = _7
					},
					removeScriptTag : function(_a) {
						try {
							if (window.XMLHttpRequest != undefined
									|| ActiveXObject == undefined)
								this.vX.getReqDiv().removeChild(
										vjo.dsf.Element.get(_a))
						} catch (e) {
						}
					},
					getRespSvc : function() {
						return this.sRespSvc
					},
					getShortPrefix : function(_b) {
						return _b.substr(0, this.oConfig.dirDepth + 1)
					},
					buildPath : function(_c, _d) {
						var t = this;
						var pd = _d ? 1E4 : t.oConfig.dirDepth;
						var _f = _c.length > pd ? _c.substr(0, pd) : _c.substr(
								0, _c.length - 1);
						var _10 = _c.length > pd ? _c.substr(pd, 1) : _c
								.substr(_c.length - 1, 1);
						var _11 = "";
						var _12 = _f.toLowerCase();
						var _13 = _10.toLowerCase();
						for ( var i = 0; i < _12.length; i++)
							_11 += t.oEncoder.encode(_12.charAt(i)) + "/";
						return [ _11, t.oEncoder.encode(_13), _f + _10 ]
					},
					buildURL : function() {
						var t = this;
						var tO = t.oConfig;
						var url = tO.baseURL;
						var href = document.location + "";
						if (href.search(/^https/g) != -1) {
							url = url.replace(/http:\/\/include/g,
									"https://secureinclude");
							url = url.replace(/com:80/g, "com")
						}
						if (typeof tO.version == t.uN || tO.version === null)
							return null;
						if (url.lastIndexOf("/") < url.length - 1)
							url += "/";
						url += tO.rootDir + "/";
						url += tO.algorithm + "/";
						url += tO.siteId + "/";
						url += tO.version + "/";
						return url
					},
					addRequest : function(_16, _17, _18, _19) {
						var t = this;
						var url = t.buildURL();
						var _1c = t.buildPath(_17, _18 == "fd");
						if (url === null)
							return;
						if (url.lastIndexOf("/") < url.length - 1)
							url += "/";
						url += _1c[0] + _1c[1];
						if (_18 == "f" && typeof _19 != t.uN && _19.length > 0)
							url += _19;
						url += ".js";
						var _1d = new Date;
						t.aReqList.push({
							requester : _16,
							prefix : _17,
							shortPrefix : t.getShortPrefix(_17),
							url : url,
							state : "wait",
							timestamp : _1d.getTime(),
							type : _18
						})
					},
					send : function(_1e, _1f) {
						var t = this;
						if (!t.bInit)
							return;
						var _21 = t.getShortPrefix(_1f);
						var _22 = t.oCache.get(_1f, _21);
						if (_22 === null)
							t.addRequest(_1e, _1f, "k");
						else if (_22.type == "f" || _22.type == "fd")
							t.addRequest(_1e, _1f, _22.type, _22.keyword);
						else if (_22.type == "null")
							t.sendRespService(true, _1e, _1f, [], [], _21, []);
						else
							t.sendRespService(false, _1e, _1f, _22.keyword, [],
									_21, _22.prd, _22.td)
					},
					sendRespService : function(_23, _24, _25, _26, _27, _28,
							_29, _2a) {
						var m = new vjo.dsf.Message(this.sRespSvc);
						if (_23)
							m.clientContext = {
								timeout : true,
								prefix : _25,
								shortPrefix : _28,
								requestId : _24
							};
						else
							m.clientContext = {
								timeout : false,
								prefix : _25,
								shortPrefix : _28,
								requestId : _24,
								kwList : _26,
								laList : _27,
								prdList : _29,
								tdList : _2a
							};
						vjo.dsf.ServiceEngine.handleRequest(m)
					},
					handleResponse : function(_2c) {
						var t = this;
						var i;
						var kw;
						var pKwList;
						var pLaList;
						var pPrdList;
						var pTdList;
						if (_2c[0].version) {
							kw = _2c[1];
							pKwList = _2c[2].sug;
							pLaList = _2c[3];
							pPrdList = _2c[2].prd;
							pTdList = _2c[2].td
						} else {
							kw = _2c[0];
							pKwList = _2c[1];
							pLaList = _2c[2]
						}
						if (!t.bInit)
							return;
						t.oCache.add(_2c);
						var _2e = [];
						for (i = 0; i < t.aReqList.length; i++) {
							var _2f = t.aReqList[i];
							if (_2f.state != "process")
								continue;
							if (_2f.prefix.toLowerCase() == _2f.shortPrefix
									.toLowerCase()) {
								if (_2f.prefix.toLowerCase() == kw
										.toLowerCase()) {
									_2f.state = "done";
									t.removeScriptTag(_2f.scriptId);
									t.sendRespService(false, _2f.requester, kw,
											pKwList, pLaList, _2f.shortPrefix,
											pPrdList, pTdList)
								}
							} else if (_2f.shortPrefix.toLowerCase() == kw
									.toLowerCase()) {
								var _30 = t.oCache.get(_2f.prefix,
										_2f.shortPrefix);
								_2f.state = "done";
								t.removeScriptTag(_2f.scriptId);
								if (_2f.type == "f" && _30.type != "k" || !_30)
									t.sendRespService(true, _2f.requester,
											_2f.prefix, null, null,
											_2f.shortPrefix, pPrdList, pTdList);
								else
									_2e.push(_2f)
							}
						}
						for (i = 0; i < _2e.length; i++) {
							var _31 = _2e[i];
							t.send(_31.requester, _31.prefix)
						}
					}
				}).inits(function() {
		}).endType();
vjo
		.ctype(
				"vjo.darwin.core.ebayheader.autocomplete.layer.AutoCompleteLayer")
		.needs(
				[ "vjo.dsf.Element", "vjo.dsf.utils.Object",
						"vjo.dsf.document.Shim", "vjo.dsf.EventDispatcher",
						"vjo.dsf.Message", "vjo.dsf.ServiceEngine",
						"vjo.dsf.cookie.VjCookieJar",
						"vjo.dsf.window.utils.VjWindowUtils",
						"vjo.darwin.core.ebayheader.autocomplete.layer.AutoCompleteEncoder" ])
		.needs(
				"vjo.darwin.core.ebayheader.autocomplete.layer.AutoCompleteRequest",
				"R")
		.props(
				{
					_do : function(_1) {
						vjo.darwin.core.ebayheader.autocomplete.layer.AutoCompleteRequest
								.handleResponse(_1)
					}
				})
		.protos(
				{
					cKw : "",
					lKw : "",
					cSel : -1,
					cKwL : [],
					cTdL : [],
					bInSugDiv : false,
					oRequest : null,
					blQryEpt : false,
					oEncoder : null,
					VE : vjo.dsf.Element,
					VED : vjo.dsf.EventDispatcher,
					VS : vjo.dsf.ServiceEngine,
					reqId : null,
					oConfig : null,
					prdDiv : null,
					prdItms : null,
					tdDivWraper : null,
					tdDiv : null,
					tdItms : null,
					constructs : function(_2, _3) {
						var t = this;
						var _5 = t.VED;
						var vS = t.VS;
						t.oRequest = t.vj$.R;
						t.oEncoder = new vjo.darwin.core.ebayheader.autocomplete.layer.AutoCompleteEncoder;
						t.reqId = _3;
						t.oConfig = _2;
						vS.registerSvcHdl(t.oRequest.getRespSvc(), vjo.hitch(t,
								this.handleResp));
						_5.add(_2.getContainerId(), "mouseover", function() {
							t.bInSugDiv = true
						});
						_5.add(_2.getContainerId(), "mouseout", function() {
							t.bInSugDiv = false
						});
						_5.addEventListener(window, "resize", t.onWindowResize,
								t);
						var _7 = t.VE.get("_nkw_id") ? "_nkw_id" : "_nkw";
						_5.addEventListener(_7, "keydown", t.onEntSbmt, t);
						try {
							t.VE.promoteToBody(_2.getContainerId())
						} catch (e) {
						}
						_5.add(_2.getHideLnk(), "click", function(_8) {
							t.setHideSuggestion(true);
							t.selectSug(null);
							t.showSugDiv(false);
							t.setAutoComplete(true);
							t.showIcon(true);
							var _9 = function() {
								t.createTrackingImg(t.oConfig
										.getRoverDomainUrl()
										+ t.oConfig.getTrkHide())
							};
							window.setTimeout(_9, 500);
							return false
						});
						vS.registerSvcHdl(_2.getOutSvc(), function(_a) {
							var _b = _a.clientContext;
							t.setInput(_b.src);
							switch (_b.type) {
							case "kw_keyup":
								t.kw_keyup(_b);
								break;
							case "kw_blur":
								t.kw_blur(_b);
								break;
							case "kw_keydown":
								t.kw_keydown(_b);
								break;
							case "kw_mouseover":
								t.kw_mouseover(_b);
								break;
							case "show_click":
								t.show_click(_b);
								break
							}
						});
						t.prdDiv = t.VE.get("prdDivWrp");
						t.prdItms = [];
						var _c = t.prdDiv.getElementsByTagName("tr");
						for ( var i = 0; i < _c.length; i++) {
							var _e = {};
							_e.tr = _c[i];
							var _f = _c[i].getElementsByTagName("td");
							_e.imgTd = _f[0];
							_e.titleTd = _f[1];
							t.prdItms.push(_e)
						}
						t.tdDivWraper = t.VE.get("tdDivWrp");
						t.tdDiv = t.VE.get("tdDiv");
						t.tdItms = [];
						_f = t.tdDiv.getElementsByTagName("div");
						for (i = 0; i < _f.length; i++)
							t.tdItms.push(_f[i]);
						t.updTrk(_2.getTrkInput());
						t.setAutoComplete(t.isHideSuggestion(), true)
					},
					handleResp : function(_10) {
						var t = this;
						var cfg = t.oConfig;
						var ctx = _10.clientContext;
						var _12 = cfg.getIdList();
						var id;
						for ( var i = 0; i < _12.length; i++) {
							id = _12[i];
							t.VED.unregister(id, "mouseover")
						}
						var _14 = ctx.kwList || [];
						var _15 = ctx.laList || [];
						var _16 = ctx.prdList || [];
						var _17 = ctx.tdList || [];
						if (t.reqId != ctx.requestId
								|| ctx.prefix.toLowerCase() != t
										.getInputValue().toLowerCase())
							return;
						var _18 = t.getRecentSearch();
						if (_18 && _18.length > 0) {
							var _19 = _18.toLowerCase();
							var _1a = _19.indexOf(t.cKw.toLowerCase());
							var _1b = false;
							var _1c = _19;
							for ( var _1d = 0; _1a >= 0;) {
								if (t.isWordStart(_19, _1a + _1d)) {
									_1b = true;
									break
								}
								_1d = _1a + 1;
								_1c = _1c.substr(_1a + 1);
								_1a = _1c.indexOf(t.cKw.toLowerCase())
							}
							if (_1b) {
								var _1e = [];
								_1e.push(_18);
								for (i = 0; i < _14.length; i++)
									if (_14[i].toLowerCase() != _19)
										_1e.push(_14[i]);
								if (_1e.length > cfg.getListSize())
									_1e.pop();
								_14 = _1e
							}
						}
						if (ctx.timeout && ctx.prefix == t.cKw
								&& _14.length < 1) {
							if (!t.blQryEpt) {
								t.showNoSugMessage(true);
								t.showSugDiv(true, cfg.getWidthMin().px)
							} else
								t.showSugDiv(false);
							t.blQryEpt = true;
							return
						}
						t.blQryEpt = false;
						t.showNoSugMessage(false);
						t.cSel = -1;
						t.cKwL = [];
						_12 = cfg.getIdList();
						var _1f = _12.length;
						if (_1f > cfg.getListSize())
							_1f = cfg.getListSize();
						if (t.oInput)
							cfg.updateWidthDef(t.oInput);
						var _20 = t.getMaxKwLength(_14, _1f)
								* cfg.getWidthUnit();
						if (_20 < cfg.getWidthMin().px)
							_20 = cfg.getWidthMin().px;
						else if (_20 > cfg.getWidthMax().px)
							_20 = cfg.getWidthMax().px;
						for (i = 0; i < _1f; i++) {
							var en = _12[i];
							var e = t.VE.get(en);
							if (e === null)
								continue;
							e.className = "unsel";
							if (i < _14.length) {
								e.innerHTML = t.genKwHTML(_14[i], t.cKw, cfg
										.getWidthMax()["char"]);
								t.VE.toggleHideShow(en, true);
								var trk = _14[i] == _18 ? cfg.getTrkRS() : cfg
										.getTrkSuggest();
								t.cKwL[i] = {
									divId : en,
									sugKw : _14[i],
									trk : trk,
									type : "kw"
								}
							} else
								t.VE.toggleHideShow(en, false)
						}
						var _23 = _16.length;
						if (_23 > 0
								&& ("" + document.location).search(/https:/g) == -1) {
							t.prdDiv.style.display = "block";
							for (i = 0; i < t.prdItms.length; i++) {
								var _24 = t.prdItms[i];
								if (_16[i]) {
									_24.tr.style.display = "block";
									_24.tr.className = "unsel";
									_24.imgTd.innerHTML = _16[i][2] ? "<img width='32px' src='"
											+ _16[i][2] + "' />"
											: "";
									_24.titleTd.innerHTML = t.genPrdHtml(
											_16[i][1], t.cKw,
											cfg.getWidthMax()["char"]);
									t.cKwL.push({
										divId : _24.tr.id,
										sugKw : t.getInputValue(),
										trk : cfg.getTrkProduct(),
										type : "prd",
										pid : _16[i][0]
									})
								} else
									_24.tr.style.display = "none"
							}
						} else
							t.prdDiv.style.display = "none";
						var _25 = _17.length;
						if (_25 > 0
								&& ("" + document.location).search(/https:/g) == -1) {
							t.tdDivWraper.style.display = "block";
							for (i = 0; i < t.tdItms.length; i++) {
								var _26 = t.tdItms[i];
								if (_17[i]) {
									_26.style.display = "block";
									_26.innerHTML = "<img src='" + _17[i][1]
											+ "' />";
									_26.className = "unsel";
									t.cKwL.push({
										divId : _26.id,
										sugKw : t.getInputValue(),
										trk : cfg.getTrkBrandedLogo(),
										type : "td",
										url : _17[i][2]
									});
									if (_17[i][1] != t.cTdL[i]) {
										t.cTdL[i] = _17[i][1];
										var _27 = t.oConfig.getRoverDomainUrl()
												+ "/roverimp/0/0/9/?imp=5276&trknvp=kw%3D"
												+ t.getInputValue()
												+ "%26rpg%3D"
												+ _GlobalNavHeaderSrcPageId
												+ "%26td%3D" + _17[i][0];
										t.createTrackingImg(_27)
									}
								} else {
									_26.style.display = "none";
									t.cTdL[i] = null
								}
							}
						} else {
							t.tdDivWraper.style.display = "none";
							t.cTdL = []
						}
						t.showSugDiv(true, _20)
					},
					getInputValue : function() {
						var t = this;
						return t.oInput ? t.oInput.value : ""
					},
					isHideSuggestion : function() {
						var vC = vjo.dsf.cookie.VjCookieJar;
						var pbf = vC.readCookie("dp1", "pbf");
						var bit = vC.getBitFlag(pbf, 29);
						return bit == 1
					},
					setHideSuggestion : function(_2a) {
						var vC = vjo.dsf.cookie.VjCookieJar;
						var pbf = vC.readCookie("dp1", "pbf");
						vC.writeCookielet("dp1", "pbf", vC.setBitFlag(pbf, 29,
								_2a ? 1 : 0))
					},
					getRecentSearch : function() {
						var lss = this.oConfig.getLastSearch();
						if (lss !== null && lss.length > 0) {
							lss = lss.substring(lss.indexOf(".") + 1);
							return lss
						}
						return ""
					},
					getMaxKwLength : function(_2d, _2e) {
						if (!_2d)
							return 0;
						var max = 0;
						var _30 = _2d.length;
						if (_30 > _2e)
							_30 = _2e;
						for ( var i = 0; i < _30; i++) {
							var len = _2d[i].length;
							if (len > max)
								max = len
						}
						return max
					},
					isWordStart : function(pKw, _34) {
						if (_34 <= 0 || _34 > pKw.length - 1)
							return true;
						var _35 = new RegExp("[\\s \\.,]");
						return pKw.substr(_34 - 1, 1).search(_35) >= 0
					},
					genKwHTML : function(pKw, _37, _38) {
						var _39 = _37.length;
						var out = pKw;
						var t = this;
						var _3b = t.oEncoder;
						var part;
						var _3c = -1;
						for ( var i = 0; i < pKw.length; i++) {
							part = pKw.substr(i, _39);
							if (part.length != _39)
								break;
							if (part.toLowerCase() == _37.toLowerCase()
									&& t.isWordStart(pKw, i)) {
								_3c = i;
								break
							}
						}
						var _3e = pKw.substring(0, _3c);
						var _3f = pKw.substr(_3c + _39);
						var _40;
						if (_3c >= 0)
							if (pKw.length > _38)
								if (_3e.length > _38) {
									out = _3b.encodeHTML(out.substr(0, _38));
									out += "..."
								} else if (_3e.length + part.length > _38) {
									_40 = _38 - _3e.length;
									part = "<span class='hl'>"
											+ _3b.encodeHTML(part
													.substr(0, _40))
											+ "...</span>";
									out = _3b.encodeHTML(_3e) + part
								} else {
									_40 = _38 - _3e.length - part.length;
									out = _3b.encodeHTML(_3e)
											+ "<span class='hl'>"
											+ _3b.encodeHTML(part)
											+ "</span>"
											+ _3b
													.encodeHTML(_3f.substr(0,
															_40)) + "..."
								}
							else
								out = _3b.encodeHTML(_3e) + "<span class='hl'>"
										+ _3b.encodeHTML(part) + "</span>"
										+ _3b.encodeHTML(_3f);
						else if (pKw.length > _38) {
							out = _3b.encodeHTML(out.substr(0, _38));
							out += "..."
						}
						return out
					},
					genPrdHtml : function(_41, _42, _43) {
						var kws = _42.split(/\s/);
						var out = _41.length > 75 ? _41.substr(0, 75) + "..."
								: _41;
						for ( var i = 0; i < kws.length; i++)
							if (kws[i] != "") {
								var reg = new RegExp(kws[i], "i");
								out = out.replace(reg, "<-"
										+ _41.substr(_41.search(reg),
												kws[i].length) + "->")
							}
						out = out.replace(/<-/g, "<span class='hl'>");
						out = out.replace(/->/g, "</span>");
						return out
					},
					startKeyTimer : function(_48) {
						var t = this;
						t.stopKeyTimer();
						var _4a = function() {
							var _4b = t.getInputValue();
							if (_48 != _4b || _4b.length < 1)
								return;
							t.oRequest.send(t.reqId, _48)
						};
						t.oKeyTimer = window.setTimeout(_4a, t.oConfig
								.getDelayTime())
					},
					stopKeyTimer : function() {
						var t = this;
						if (t.oKeyTimer) {
							window.clearTimeout(t.oKeyTimer);
							t.oKeyTimer = null
						}
					},
					getKwSelect : function() {
						var t = this;
						if (t.cSel < 0)
							return t.cKw;
						return t.cKwL[t.cSel].sugKw
					},
					selectSug : function(_4e, _4f, _50) {
						var t = this;
						var kw = t.cKw;
						if (t.cSel >= 0)
							t.unselectSug(t.cKwL[t.cSel].divId);
						if (_4e !== null) {
							var e = t.VE.get(_4e);
							for ( var i = 0; i < t.cKwL.length; i++) {
								var _54 = t.cKwL[i];
								if (_54.divId == _4e) {
									t.cSel = i;
									kw = _54.sugKw;
									break
								}
							}
							if (e)
								e.className = "sel"
						} else
							t.cSel = -1;
						if (!_50)
							t.updateInput(kw);
						if (!_4f)
							t.focusInput()
					},
					unselectSug : function(_55) {
						var t = this;
						var e = t.VE.get(_55);
						if (e)
							e.className = "unsel"
					},
					createTrackingImg : function(_57) {
						var _58 = new Date;
						var r = _58.getTime();
						var _59 = _57;
						if (_59.indexOf("?") > 0)
							_59 += "&" + r;
						else
							_59 += "?" + r;
						var img = new Image;
						document.getElementsByTagName("body")[0]
								.appendChild(img);
						img.setAttribute("src", _59);
						img.setAttribute("width", "1");
						img.setAttribute("height", "1");
						img.setAttribute("border", "0")
					},
					sendInSvc : function(_5b) {
						var m = new vjo.dsf.Message(this.oConfig.getInSvc());
						m.clientContext = _5b;
						this.VS.handleRequest(m)
					},
					isCtrlKey : function(_5d) {
						var _5e = [ 38, 39, 40, 27 ];
						for ( var i = 0; i < _5e.length; i++)
							if (_5e[i] == _5d)
								return true;
						return false
					},
					isIgnorKey : function(_60) {
						var _61 = [ 16, 17, 18 ];
						for ( var i = 0; i < _61.length; i++)
							if (_60 == _61[i])
								return true;
						return false
					},
					isSugShown : function() {
						var t = this;
						var _64 = t.VE.get(t.oConfig.getContainerId());
						var disp = _64.currentStyle ? _64.currentStyle.display
								: window.getComputedStyle(_64, null)
										.getPropertyValue("display");
						return disp != "none"
					},
					isNoSugMsgShow : function() {
						var t = this;
						var _66 = t.VE.get(t.oConfig.getNoSugDivId());
						var disp = _66.currentStyle ? _66.currentStyle.display
								: window.getComputedStyle(_66, null)
										.getPropertyValue("display");
						return disp != "none"
					},
					showNoSugMessage : function(_67) {
						var t = this;
						t.VE.toggleHideShow(t.oConfig.getSugDivId(), !_67);
						t.VE.toggleHideShow("prdDivWrp", !_67);
						t.VE.toggleHideShow("tdDivWrp", !_67);
						t.VE.toggleHideShow(t.oConfig.getNoSugDivId(), _67);
						if (_67) {
							var _69 = function() {
								if (t.isNoSugMsgShow())
									t.showSugDiv(false)
							};
							window
									.setTimeout(_69, t.oConfig
											.getNoSugShowTime())
						}
					},
					showSugDiv : function(_6a, _6b) {
						var t = this;
						if (t.isHideSuggestion() && _6a) {
							t.showIcon(true);
							return
						}
						var vS = vjo.dsf.document.Shim;
						var _6e = t.oConfig.getContainerId();
						var _6f = t.VE.get(_6e);
						if (_6a) {
							t.posLayer(_6b);
							t.VE.toggleHideShow(_6e, true);
							if (t.oIframeShim)
								vS.remove(_6f, t.oIframeShim);
							t.oIframeShim = vS.add(_6f);
							var _70 = function() {
								t.regOverEvent(true)
							};
							window.setTimeout(_70, 100)
						} else {
							t.VE.toggleHideShow(_6e, false);
							if (t.oIframeShim) {
								vS.remove(_6f, t.oIframeShim);
								t.oIframeShim = null
							}
							t.regOverEvent(false)
						}
					},
					onEntSbmt : function(e) {
						var t = this;
						var idx = t.cSel;
						if (e.keyCode == 13 && idx > -1) {
							var _73 = t.cKwL[idx].type;
							var trk = t.cKwL[idx].trk;
							var pid = t.cKwL[idx].pid;
							var url = t.cKwL[idx].url;
							if (url) {
								var _74 = trk ? (url.indexOf("?") >= 0 ? "&"
										: "?")
										+ "_trksid=" + trk : "";
								document.location.href = url + _74;
								return false
							} else if (pid) {
								_74 = trk ? "&_trksid=" + trk : "";
								t.VED.stopEvent(e);
								document.location.href = t.oConfig.getPrdURL()
										+ "/?_pid=" + pid + _74;
								return false
							}
						}
					},
					regOverEvent : function(_75) {
						var t = this;
						var _77 = t.oConfig.getIdList();
						var id;
						for ( var i = 0; i < _77.length; i++) {
							id = _77[i];
							t.VED.unregister(id, "mouseover");
							t.VED.detachHandlers(id, "mouseover");
							t.VED.unregister(id, "click");
							t.VED.detachHandlers(id, "click");
							if (_75) {
								t.VED.add(id, "mouseover", function(_79) {
									t.bInSugDiv = true;
									t.selectSug(_79.src.id, false, false)
								});
								t.VED
										.add(
												id,
												"click",
												function(_7a) {
													var _7b = _7a.src.attributes;
													var type;
													var trk;
													var pid;
													var url;
													for ( var j = 0; j < t.cKwL.length; j++)
														if (t.cKwL[j].divId == _7a.src.id) {
															type = t.cKwL[j].type;
															trk = t.cKwL[j].trk;
															pid = t.cKwL[j].pid;
															url = t.cKwL[j].url;
															break
														}
													if (type == "prd") {
														if (pid) {
															var _7d = trk ? "&_trksid="
																	+ trk
																	: "";
															document.location.href = t.oConfig
																	.getPrdURL()
																	+ "/?_pid="
																	+ pid + _7d
														}
													} else if (type == "td") {
														_7d = trk ? (url
																.indexOf("?") >= 0 ? "&"
																: "?")
																+ "_trksid="
																+ trk
																: "";
														document.location.href = url
																+ _7d
													} else {
														t.selectSug(_7a.src.id);
														t.submitForm();
														t.showSugDiv(false)
													}
												})
							}
						}
					},
					posLayer : function(_7e) {
						var t = this;
						var gap;
						var _80 = t.getAbsPos(t.oInput);
						if (_80 === null)
							return false;
						var e = t.VE.get(t.oConfig.getContainerId());
						if (e === null)
							return false;
						gap = vjo.dsf.client.Browser.bIE ? 2 : 0;
						e.style.left = _80.left - gap + "px";
						e.style.top = _80.top + _80.height - gap + "px";
						if (typeof _7e != "undefined" && _7e !== null)
							e.style.width = parseInt(_7e, 10) + "px";
						return true
					},
					getAbsPos : function(_82) {
						var vW = vjo.dsf.window.utils.VjWindowUtils;
						var t = this;
						if (_82 === null)
							return null;
						return {
							left : parseInt(vW.offsetLeft(_82), 10),
							top : parseInt(vW.offsetTop(_82), 10),
							height : parseInt(_82.offsetHeight, 10),
							width : parseInt(_82.offsetWidth, 10)
						}
					},
					updateInput : function(pKw) {
						var t = this;
						if (t.isSugShown()) {
							t.lKw = pKw;
							t.sendInSvc({
								type : "kw_updvalue",
								value : pKw
							})
						}
					},
					updTrk : function(_86) {
						this.sendInSvc({
							type : "search_updtrk",
							lnkStr : _86
						})
					},
					submitForm : function() {
						var t = this;
						if (t.cSel >= 0) {
							var trk = t.cKwL[t.cSel].trk;
							t.updTrk(trk)
						}
						this.sendInSvc({
							type : "search_submit"
						})
					},
					showIcon : function(_89) {
						this.sendInSvc({
							type : "sug_icon_show",
							bShow : _89
						})
					},
					focusInput : function() {
						this.sendInSvc({
							type : "kw_focus"
						})
					},
					setAutoComplete : function(bOn, _8b) {
						this.sendInSvc({
							type : "kw_autocomplete",
							bOn : bOn,
							bSkipFocus : _8b
						})
					},
					setInput : function(_8c) {
						if (!_8c)
							return;
						var t = this;
						if (!t.oInput)
							t.oInput = _8c;
						t.oConfig.updateWidthDef(_8c)
					},
					show_click : function(_8e) {
						var t = this;
						t.showIcon(false);
						t.setHideSuggestion(false);
						t.blQryEpt = false;
						t.oRequest.send(t.reqId, t.getInputValue());
						var _90 = function() {
							t.createTrackingImg(t.oConfig.getRoverDomainUrl()
									+ t.oConfig.getTrkShow())
						};
						window.setTimeout(_90, 500);
						t.setAutoComplete(false)
					},
					kw_blur : function(_91) {
						var t = this;
						if (t.isSugShown() && !t.isNoSugMsgShow())
							if (!t.bInSugDiv) {
								var _93 = t.cSel >= 0 ? t.cKwL[t.cSel].divId
										: null;
								t.showSugDiv(false);
								t.unselectSug(_93)
							} else
								t.focusInput()
					},
					kw_mouseover : function(_94) {
						var t = this;
						if (t.isSugShown() && !t.isNoSugMsgShow())
							t.selectSug(null)
					},
					kw_keydown : function(_96) {
						var t = this;
						var kc = _96.keyCode;
						if ((kc == 13 || kc == 9) && t.isSugShown()
								&& !t.isNoSugMsgShow()) {
							if (t.cSel >= 0)
								t.updTrk(t.cKwL[t.cSel].trk);
							t.showSugDiv(false)
						}
					},
					kw_keyup : function(_98) {
						var t = this;
						var kc = _98.keyCode;
						var cv = _98.value;
						if (t.isIgnorKey(kc))
							return;
						if (t.isSugShown() && !t.isNoSugMsgShow())
							if (t.isCtrlKey(kc)) {
								var e;
								var _9b;
								var _9c;
								switch (kc) {
								case 38:
									_9b = t.cSel - 1;
									if (_9b < -1)
										_9b = t.cKwL.length - 1;
									_9c = _9b >= 0 ? t.cKwL[_9b].divId : null;
									t.selectSug(_9c);
									t.cSel = _9b;
									break;
								case 40:
									_9b = t.cSel + 1;
									if (_9b >= t.cKwL.length)
										_9b = -1;
									_9c = _9b >= 0 ? t.cKwL[_9b].divId : null;
									t.selectSug(_9c);
									break;
								case 39:
									if (cv.length !== 0) {
										t.cKw = cv;
										t.startKeyTimer(cv);
										t.lKw = cv
									}
									break;
								case 27:
									t.selectSug(null);
									t.showSugDiv(false);
									break
								}
							} else if (cv.length !== 0) {
								if (t.lKw != cv) {
									t.cKw = cv;
									t.startKeyTimer(cv);
									t.lKw = cv
								}
							} else {
								t.showSugDiv(false);
								t.showIcon(false);
								t.cKw = cv;
								t.lKw = cv;
								t.blQryEpt = false
							}
						else if (cv.length !== 0) {
							if (t.lKw != cv) {
								t.cKw = cv;
								t.startKeyTimer(cv);
								t.lKw = cv
							}
						} else {
							t.cKw = cv;
							if (t.isHideSuggestion())
								t.showIcon(false);
							t.lKw = cv;
							t.blQryEpt = false
						}
					},
					onWindowResize : function(_9d) {
						if (this.isSugShown())
							this.showSugDiv(true)
					}
				}).endType();
vjo
		.ctype(
				"vjo.darwin.core.ebayheader.autocomplete.layer.AutoCompleteLayerLazyInit")
		.props(
				{
					_ready : false,
					_inited : false,
					_model : null,
					init : function(_1) {
						var t = this;
						var acl = vjo.darwin.core.ebayheader.autocomplete.layer.AutoCompleteLayerInit;
						t._model = _1;
						t._ready = true;
						if (acl && !t._inited) {
							acl.init(_1);
							t._inited = true
						}
					},
					callback : function() {
						var t = this;
						if (t._ready && !t._inited) {
							vjo.darwin.core.ebayheader.autocomplete.layer.AutoCompleteLayerInit
									.init(t._model);
							t._inited = true
						}
					}
				}).endType();
vjo
		.ctype(
				"vjo.darwin.core.ebayheader.autocomplete.layer.AutoCompleteLayerInit")
		.needs(
				[
						"vjo.dsf.ServiceEngine",
						"vjo.dsf.EventDispatcher",
						"vjo.darwin.core.ebayheader.autocomplete.layer.AutoCompleteConfig",
						"vjo.darwin.core.ebayheader.autocomplete.layer.AutoCompleteLayer",
						"vjo.darwin.core.ebayheader.autocomplete.layer.AutoCompleteRequest",
						"vjo.darwin.core.ebayheader.autocomplete.layer.AutoCompleteLayerLazyInit" ])
		.protos(
				{
					oModel : null,
					constructs : function(_1) {
						this.oModel = _1;
						var t = this;
						var _3 = function() {
							var _4 = new vjo.darwin.core.ebayheader.autocomplete.layer.AutoCompleteConfig(
									t.oModel);
							var _5 = {
								baseURL : _4.getBaseURL(),
								dirDepth : _4.getDirDepth(),
								rootDir : _4.getRootDir(),
								algorithm : _4.getAlgorithm(),
								version : _4.getVersion(),
								siteId : _4.getSiteId()
							};
							vjo.darwin.core.ebayheader.autocomplete.layer.AutoCompleteRequest
									.init(_5);
							new vjo.darwin.core.ebayheader.autocomplete.layer.AutoCompleteLayer(
									_4, t.oModel.requestId)
						};
						vjo.dsf.EventDispatcher.addEventListener(window,
								"load", _3, window);
						vjo
								.ctype(
										"vjo.darwin.domain.finding.autofill.AutoFill")
								.props(
										{
											_do : function(_6) {
												vjo.darwin.core.ebayheader.autocomplete.layer.AutoCompleteLayer
														._do(_6)
											}
										})
					}
				})
		.props(
				{
					init : function(_7) {
						new vjo.darwin.core.ebayheader.autocomplete.layer.AutoCompleteLayerInit(
								_7)
					}
				}).inits(function() {
			this.vj$.AutoCompleteLayerLazyInit.callback()
		}).endType();
vjo.ctype("vjo.darwin.core.utils.ElementUtils").needs("vjo.dsf.Element", "E")
		.needs("vjo.dsf.EventDispatcher").props({
			oLst : [],
			get : function(_1, _2) {
				var _3 = [];
				if (typeof _1 == "object") {
					for ( var i in _1) {
						var _5 = _1[i];
						_3[i] = this.get(_5, _2)
					}
					return _3
				}
				var t = this;
				var elem = t.oLst[_1];
				if (!elem || !elem.parentNode || _2)
					t.oLst[_1] = this.vj$.E.get(_1);
				return t.oLst[_1]
			}
		}).inits(
				function() {
					vjo.dsf.EventDispatcher.addEventListener(window, "unload",
							function() {
								vjo.darwin.core.utils.ElementUtils.oLst = null
							})
				}).endType();
vjo.ctype("vjo.darwin.core.globalheader.overlay.Overlay").needs(
		"vjo.darwin.core.utils.ElementUtils", "EU").needs(
		"vjo.darwin.core.utils.WindowDimension", "W").needs(
		"vjo.dsf.EventDispatcher", "ED").props({
	timer : null,
	currObj : [],
	contentObjRef : null,
	id : null,
	keepOpen : false,
	iOpen : false,
	init : function(_1, _2) {
		var t = this;
		t.id = _1;
		t.callFnOnClose = [];
		t.callFnOnOpen = [];
		var _4 = function() {
			var _5 = vjo.dsf.Element.get(_1);
			if (_5) {
				document.body.appendChild(_5);
				var E = t.vj$.ED;
				E.addEventListener(_5, "mouseout", function() {
					t.closeOverlay(t.closeDelay)
				}, t);
				E.addEventListener(_5, "mouseover", t.cancelOpen, t)
			}
		};
		if (!window["overlayinit"]) {
			t.vj$.ED.add("body", "load", _4, t);
			window["overlayinit"] = true
		}
	},
	openOverlay : function(_7, _8, _9) {
		var t = this;
		clearTimeout(t.timer);
		var f = function() {
			if (t.callFnOnOpen[_7[0]])
				t.callFnOnOpen[_7[0]]();
			t.open(_7)
		};
		if (_7[0] && !t.callFnOnOpen[_7[0]] && _9)
			t.callFnOnOpen[_7[0]] = _9;
		if (t.iOpen)
			if (t.currObj[0] != _7[0])
				if (t.callFnOnClose[t.currObj[0]])
					t.callFnOnClose[t.currObj[0]]();
		if (_8 && !t.iOpen)
			t.openTimer = setTimeout(f, _8);
		else
			f(_7)
	},
	open : function(_c) {
		var t = this;
		var CHV = /chevron[0-9]+/;
		var l = t.vj$;
		var E = l.EU;
		var W = l.W;
		t.closeDelay = _c[8];
		if (_c[0] && !CHV.test(_c[0]) && E.get(_c[0])) {
			var a1 = E.get(_c[0]);
			var a2 = E.get("BrowseCategories");
			var hb = E.get("headerWrapper");
			if (hb)
				hb.className = hb.className.replace(" gh-zidx", "");
			if (CHV.test(_c[0]))
				a1.className = "gh-ai";
			if (a2) {
				a2.className = a2.className.replace(" gh-hbdr", "");
				a2.className = a2.className.replace(" gh-hs", "")
			}
		}
		if (_c)
			t.keepOpen = _c[6];
		_c = _c || t.currObj;
		var tE = E.get(_c[7]) || E.get(_c[0]);
		var bD = W.getBrowserDimension();
		var ovrly = E.get(t.id);
		var cO = typeof _c[1] == "object" ? _c[1] : E.get(_c[1]);
		t.currObj = _c;
		var _10 = _c[2] || "";
		if (_10.indexOf("gh-vsmn") == -1)
			ovrly.style.width = "";
		if (!ovrly || !tE)
			return;
		var _11 = ovrly.childNodes;
		var _12 = _11[0].innerHTML == undefined ? _11[1] : _11[0];
		clearTimeout(t.timer);
		var _13 = _12.offsetWidth > ovrly.offsetWidth;
		ovrly.className = "gh-ovr " + _c[2];
		_12.className = "gh-iovr ";
		var obj = _13 ? _12 : ovrly;
		var c = _12.childNodes;
		if (t.contentObjRef && c.length > 0)
			t.contentObjRef.appendChild(c[0]);
		_c[4] = _c[4] ? _c[4] : 0;
		_c[5] = _c[5] ? _c[5] : 0;
		var _15;
		var _16 = tE.offsetWidth - 2 - _c[5];
		if (c[0] && c[0].id == cO.id)
			;
		else {
			_12.innerHTML = "";
			t.contentObjRef = cO.parentNode;
			_15 = document.createElement("div");
			var _17 = document.createElement("div");
			_17.appendChild(_15);
			_17.appendChild(cO);
			_12.appendChild(_17);
			_15.className = "gh-ext";
			_15.style.width = _16 + "px"
		}
		var wid = obj.offsetWidth;
		var ltz = W.getOffsetPosition(tE, bD);
		var _19 = ltz[0] + ltz[4] - wid;
		var _1a = bD[0] - (ltz[0] + wid);
		var _1b = !_c[3] && (_1a > 10 || _1a > _19);
		var tp = ltz[1] + ltz[3] + _c[4] + "px";
		var lt = _1b ? ltz[0] + _c[5] + "px" : _19 + _c[5] + "px";
		if (_15 && !_1b) {
			var fw = ovrly.offsetWidth;
			_15.style.marginLeft = fw - _16 - 2 + "px"
		}
		t.applyStyle(ovrly, lt, tp);
		t.iOpen = true
	},
	applyStyle : function(obj, _1f, top) {
		if (obj) {
			var s = obj.style;
			s.left = _1f;
			s.top = top
		}
	},
	cancelOpen : function() {
		var t = this;
		clearTimeout(t.timer)
	},
	closeOverlay : function(_23, _24) {
		var t = this;
		clearTimeout(t.openTimer);
		if (t.keepOpen)
			return;
		if (t.currObj[0] && !t.callFnOnClose[t.currObj[0]] && _24)
			t.callFnOnClose[t.currObj[0]] = _24;
		var f = function() {
			t.close();
			t.iOpen = false
		};
		_23 = typeof _23 == "number" ? _23 : t.closeDelay;
		t.timer = setTimeout(f, _23)
	},
	close : function(e) {
		var t = this;
		var elm = e ? e.nativeEvent.srcElement || e.nativeEvent.target : null;
		if (elm && t.currObj[0] == elm.id)
			return;
		t.callFn();
		t.applyStyle(t.vj$.EU.get(t.id), "-1000px", "-1000px");
		t.currObj = [];
		t.keepOpen = null;
		t.iOpen = false
	},
	callFn : function() {
		var t = this;
		if (t.callFnOnClose[t.currObj[0]])
			t.callFnOnClose[t.currObj[0]]()
	}
}).endType();
vjo.ctype("vjo.darwin.core.globalheader.utils.HeaderMenu").needs(
		"vjo.dsf.utils.JsLoader", "JSL").needs("vjo.dsf.Element", "E").protos(
		{
			jsonObj : null,
			menuObj : [],
			constructs : function(_1) {
				var t = this;
				t.m = _1;
				t.jsUrl = null;
				t.domain = null
			},
			replaceJSONDataHandler : function(_3, _4) {
				if (_3 != null)
					this.handler = _3;
				if (_4 != null)
					this.domain = _4
			},
			setHandlerSource : function(_5) {
				if (_5)
					this.jsUrl = _5
			},
			clearHS : function() {
				this.jsUrl = null
			},
			getHandlerSource : function() {
				return this.jsUrl
			},
			getHandler : function() {
				return this.handler
			},
			setHandler : function(h) {
				this.m.handler = h
			},
			loadJs : function(_7) {
				var t = this;
				var url = t.jsUrl;
				if (url && !t.jsonObj) {
					var _9 = function() {
						t.getMenuHtml(_7)
					};
					t.vj$.JSL.load(url, _9, t)
				} else
					t.getMenuHtml(_7)
			},
			getMenuHtml : function(_a) {
				var t = this;
				var m = t.m;
				t.jsonObj = true;
				var _c;
				var _d = t.m.domain;
				var _e = t.menuObj[t.m.handler];
				var _f = document.getElementById(t.m.parentTriggerId);
				var _10 = _f ? -_f.offsetWidth : 0;
				var arr = [ t.m.triggerId, _e, t.m.cssClzName, t.m.isRtAlign,
						t.m.topMargin, _10, _a, undefined, m.cDelay,
						t.m.parentTriggerId ];
				var _12 = vjo.darwin.core.globalheader.overlay.Overlay;
				if (_e) {
					_12.openOverlay(arr, m.oDelay);
					return
				}
				var _13;
				var i;
				var j;
				var k;
				var c;
				var h;
				var ipc;
				var u;
				var ff;
				var ll;
				var E = t.vj$.Element;
				var lh = window.location.href;
				var dPrvdr = window[t.m.handler];
				var data = dPrvdr ? dPrvdr() : null;
				var items = data ? data.items : [];
				var l = items.length;
				var qaUrls = [ ".paradise.qa.ebay.com",
						".no-pool-name.qa.ebay.com", ".qa.ebay.com" ];
				if (l <= 0)
					return;
				if (lh.indexOf("ebay.com/") >= 0)
					for (i = 0; i < l; i++)
						if (items[i].value.has("eBay Motors")) {
							items[i].value = "Cars, Boats, Vehicles & Parts";
							items[i].url = "http://www.motors.ebay.com";
							items.sort(t.sortByValue);
							break
						}
				var _1e = t.m.noOfColumns || 1;
				ipc = Math.ceil(l / _1e);
				h = "<table border='0' cellpadding='0' cellspacing='0'>";
				for (i = 0; i < ipc; i++) {
					h += "<tr>";
					for (j = 0; j < _1e; j++) {
						h += "<td nowrap>";
						c = items[j * ipc + i];
						if (c)
							if (c.url) {
								u = c.url;
								if (_d)
									for (k = 0; k < qaUrls.length; k++) {
										var _1f = qaUrls[k];
										if (c.url.indexOf(_1f) >= 0) {
											u = c.url.replace(_1f, _d);
											break
										}
									}
								u = t.cobrandUrl(u);
								h += "<a href='" + u + "'>";
								h += c.value;
								h += "</a>"
							} else {
								u = c.value;
								ff = u.indexOf('href="');
								if (ff == -1)
									h += u;
								else {
									ff += 'href="'.length;
									ll = u.lastIndexOf('"');
									u = u.substr(ff, ll - ff);
									h += c.value.substr(0, ff)
											+ t.cobrandUrl(u)
											+ c.value.substr(ll)
								}
							}
						else
							h += "&nbsp;";
						h += "</td>"
					}
					h += "</tr>"
				}
				h += "</table>";
				_13 = _c ? _c.replace("##1##", h) : h;
				var _20 = document.createElement("spanWrap");
				var sp = document.createElement("span");
				_20.style.display = "none";
				sp.id = t.m.triggerId + "cat";
				sp.className = "gh-smn";
				sp.innerHTML = _13;
				_20.appendChild(sp);
				document.body.appendChild(_20);
				arr[1] = sp;
				t.menuObj[t.m.handler] = sp;
				_12.openOverlay(arr, m.oDelay);
				return _13
			},
			sortByValue : function(_21, _22) {
				if (_21.value.has("Everything"))
					return 1;
				else if (_22.value.has("Everything"))
					return -1;
				else
					return _21.value < _22.value ? -1
							: _21.value > _22.value ? 1 : 0
			},
			cobrandUrl : function(_23) {
				var lh = window.location.href;
				if (!lh.indexOf("sandbox.") >= 0)
					return _23;
				var u = "undefined";
				var cc;
				var cf;
				if (this.oCobrand == null && typeof ebay != u
						&& typeof ebay.oDocument != u) {
					cc = ebay.oDocument._getControl("cobrandCollection");
					if (cc) {
						cf = cc._getControl("cobrandFunctions");
						this.oCobrand = cf
					}
				} else
					cf = this.oCobrand;
				if (typeof cf.cobrandURL != u)
					return cf.cobrandURL(_23 + lc);
				else if (typeof vjo.darwin.core.cobrand != u
						&& typeof vjo.darwin.core.cobrand.EbaySandbox != u)
					return vjo.darwin.core.cobrand.EbaySandbox.cobrandURL(_23);
				return _23
			}
		}).endType();
vjo.ctype("vjo.darwin.core.globalheader.utils.HeaderMenuObj").protos({
	constructs : function(_1, _2, _3, _4, _5, _6, _7, _8, _9) {
		var t = this;
		t.noOfColumns = _5 || 1;
		t.handler = _6;
		t.triggerId = _1;
		t.cssClzName = _2;
		t.isRtAlign = _4;
		t.parentTriggerId = _3;
		t.topMargin = _7;
		t.oDelay = _8;
		t.cDelay = _9
	}
}).endType();
vjo
		.ctype("vjo.darwin.core.globalheader.utils.VNLMenu")
		.needs("vjo.dsf.utils.JsLoader", "JSL")
		.needs("vjo.dsf.Element", "E")
		.needs("vjo.dsf.EventDispatcher", "ED")
		.props(
				{
					urlLoaded : false,
					menuObj : [],
					loadJs : function(_1, _2) {
						var t = this;
						var url = _1[3];
						if (url && !t.urlLoaded) {
							t.m = _1;
							t.urlLoaded = true;
							url += "&cb=vjo.darwin.core.globalheader.utils.VNLMenu.callFn";
							t.vj$.JSL.load(url, function() {
							}, t)
						} else
							t.getMenuHtml(_1, _2)
					},
					callFn : function(_4) {
						var t = this;
						t.menuObj = _4;
						t.getMenuHtml(t.m)
					},
					getMenuHtml : function(_6, _7) {
						var t = this;
						var isClick = false;
						var m = _6;
						var triggerId = m[0];
						var associateId = m[1];
						var cssClzName = m[2];
						var url = m[3];
						var oDelay = m[4];
						var cDelay = m[5];
						var _9 = t.menuObj[triggerId];
						var _a = [ triggerId, _9, cssClzName, false, 0, 0,
								isClick, associateId, cDelay ];
						var _b = vjo.darwin.core.globalheader.overlay.Overlay;
						var _c = t.menuObj[triggerId];
						var sp = document.createElement("DIV");
						sp.id = triggerId + "_sub";
						sp.className = "gh-smn";
						sp.innerHTML = _c;
						_a[1] = sp;
						if (_9) {
							var _e = t.vj$.E.get(_b.id);
							var aO = t.vj$.E.get(associateId);
							if (_e && aO)
								_e.style.width = aO.offsetWidth + "px";
							_b.openOverlay(_a, oDelay, _7);
							return
						}
						return _c
					},
					popup : function(id) {
						var t = this;
						var fn = function(evt) {
							var obj = evt.nativeEvent.target
									|| evt.nativeEvent.srcElement;
							var href = obj.href;
							var width = 1030;
							var height = 800;
							var top = Math.round((screen.height - height) / 2);
							var left = Math.round((screen.width - width) / 2);
							var params = [ "location=no", "menubar=no",
									"status=no", "resizable=yes",
									"scrollbars=yes", "top=" + top,
									"left=" + left, "width=" + width,
									"height=" + height ];
							window.open(href, "", params.join(","));
							return false
						};
						t.vj$.ED.add(id, "click", fn, t)
					}
				}).endType();
vjo.ctype("vjo.dsf.utils.Css").needs("vjo.dsf.Element").props({
	apply : function(_1, _2) {
		var e = vjo.dsf.Element.get(_1);
		var c;
		if (e && _2) {
			c = this.createStyle(_2);
			if (c)
				e.appendChild(c)
		}
		return c
	},
	createStyle : function(_4) {
		var c = document.createElement("style");
		var t;
		c.type = "text/css";
		if (_4)
			if (c.styleSheet)
				c.styleSheet.cssText = _4;
			else {
				t = document.createTextNode(_4);
				c.appendChild(t)
			}
		return c
	}
}).endType();
vjo
		.ctype("vjo.darwin.core.globalheader.utils.EventReg")
		.needs("vjo.dsf.EventDispatcher", "ED")
		.needs("vjo.darwin.core.utils.ElementUtils", "E")
		.needs("vjo.darwin.core.utils.WindowDimension", "W")
		.needs("vjo.darwin.core.globalheader.overlay.Overlay", "O")
		.needs("vjo.darwin.core.globalheader.utils.HeaderMenu", "HM")
		.needs("vjo.darwin.core.globalheader.utils.HeaderMenuObj", "HMO")
		.needs("vjo.darwin.core.globalheader.utils.VNLMenu", "VM")
		.needs("vjo.dsf.client.Browser", "BR")
		.needs("vjo.dsf.utils.Css", "CS")
		.needs("vjo.Registry", "R")
		.props(
				{
					fn4Array : [],
					fn4Aggregated : function(_1) {
						var t = this;
						var fnArr = t.fn4Array;
						var len = fnArr.length;
						if (t.vj$.O.iOpen)
							for (; len--;)
								fnArr[len].apply(null, [ _1 ])
					},
					languageSwitch : function(_3, _4) {
						var t = this;
						var ED = t.vj$.ED;
						var R = vjo.Registry;
						ED.add(_3, "click", R.get(_4))
					},
					browseCategories : function(id, _7) {
						var mn = this.vj$.R.get(id);
						if (mn)
							mn.setHandlerSource(_7)
					},
					searchBarResize : function() {
						var t = this;
						var l = t.vj$;
						var fn = function(_a) {
							var _b = l.E.get("headerSearch");
							if (!_b)
								return;
							var _c = _b.offsetWidth;
							var o = l.E.get("_nkw");
							var _e = 864;
							var _f = 400;
							var _10 = 759;
							if (!o || _c < _10)
								return;
							o.style.width = _c < _e ? _f - (_e - _c) + "px"
									: _f + "px"
						};
						l.ED.addEventListener(window, "resize", fn, window);
						setTimeout(fn, 100)
					},
					registerMouseEvent : function(_11, _12, _13, _14, _15, _16,
							_17, _18, _19, _1a, url) {
						var t = this;
						var _1d = function() {
							l = t.vj$, E = l.E, ED = l.ED, O = l.O;
							_13 = _13 || "mouseover";
							_14 = _14 || "mouseout";
							for ( var _1e in _11) {
								var _1f = _11[_1e][0];
								var _20 = _1f || _1e;
								var _21 = _1e;
								var _22 = _11[_1e][1];
								var _23 = false;
								for ( var i in _15)
									if (_15[i] == _1e) {
										_23 = true;
										break
									}
								if (_18 == "HEADER_MENU") {
									var _25 = new t.vj$.HMO(_21, _12, null,
											_23, 1, _22, _16, _17[0], _17[1]);
									var obj = new l.HM(_25);
									ED.add(_21, _13, t.open(obj))
								} else if (_18 == "VNL_MENU") {
									var arr = [ _21, _1f, _12, url, _17[0],
											_17[1] ];
									ED.add(_21, _13, t.openVNL(arr), t)
								} else
									ED.add(_21, _13, t.openOvl(_20, _22, _12,
											_23, _16, _19));
								if (_14)
									ED.add(_21, _14, t.closeMenu(_21))
							}
						};
						if (_1a)
							_1d();
						else
							t.vj$.ED.add("body", "load", _1d, t)
					},
					closeMenu : function(_28) {
						var t = this;
						return function(_2a) {
							t.vj$.O.closeOverlay(500, function() {
								t.trCss(_28, true)
							});
							if (!t.vj$.O.iOpen)
								t.trCss(_28, true);
							else
								t.trCss(_28)
						}
					},
					trCss : function(_2b, _2c) {
						var t = this;
						var s = "gh-hso";
						var o = t.vj$.E.get(_2b);
						var c = o ? o.className || "" : "";
						if (!_2c && c.indexOf(s) > -1)
							return;
						if (o)
							o.className = _2c ? c.replace(/gh-hso/g, "") : c
									+ " " + s
					},
					openVNL : function(arr) {
						var t = this;
						return function() {
							vjo.darwin.core.globalheader.utils.VNLMenu.loadJs(
									arr, function() {
										t.trCss(arr[0])
									})
						}
					},
					openOvl : function(id, _31, css, _33, _34, _35) {
						var t = this;
						return function() {
							t.vj$.O
									.openOverlay([ id, _31, css, _33, _34, _35 ])
						}
					},
					registerVerisign : function(id, _38, _39, _3a) {
						var t = this;
						var l = t.vj$;
						var _3d = function() {
							var _3e = l.E.get(id);
							var _3f = l.W.getOffsetPosition(_3e);
							var _40 = l.E.get(_39);
							var ovr = l.W.getOffsetPosition(_40);
							var _42 = _3f[4];
							var _43 = ovr[3];
							var arr = [ id, _40, _38, false, -_43, -_42, true ];
							l.O.openOverlay(arr)
						};
						var _45 = function() {
							l.O.close()
						};
						var hdl = function() {
							l.ED.add(id, "click", _3d, t);
							l.ED.add(_3a, "click", _45, t)
						};
						l.ED.add("body", "load", hdl)
					},
					changeBtStyle : function(id) {
						var t = this;
						var ED = t.vj$.ED;
						ED.add("body", "load", function() {
							var o = t.vj$.E.get(id);
							if (o) {
								ED.add(id, "mousedown", function() {
									o.className = "gh-btn gh-bc"
								}, t);
								ED.add(id, "mouseup", function() {
									o.className = "gh-btn"
								}, t)
							}
						}, t)
					},
					registerAndCreateHeaderButtons : function(_4a, _4b, _4c,
							_4d, _4e, _4f, _50, _51, _52, _53) {
						var t = this;
						var len = _4e ? _4e.length : 0;
						var ED = t.vj$.ED;
						for ( var R = vjo.Registry; len--;) {
							var _55 = {
								triggerId : _50[len],
								cssClzName : _4d,
								parentTriggerId : _4f[len],
								isRtAlign : false,
								noOfColumns : _4b[len],
								handler : _4e[len],
								domain : _4c,
								topMargin : _4a,
								oDelay : _53,
								cDelay : _53
							};
							var hm = new t.vj$.HM(_55);
							R.put(_52[len], hm);
							ED.add("body", "load", function(i) {
								return function(evt) {
									t.changeHover(_4f[i], _50[i], _51, _52[i],
											_53)
								}
							}(len))
						}
					},
					changeHover : function(_58, _59, _5a, _5b, _5c) {
						var t = this;
						var E = t.vj$.E;
						var ED = t.vj$.ED;
						var a1 = E.get(_58);
						var a2 = E.get(_59);
						var fn1 = function() {
							if (a1 && !a1.className.match(_5a))
								a1.className += " " + _5a
						};
						var fn2 = function() {
							if (a1
									&& (!t.vj$.O.iOpen || t.vj$.O.bound
											&& a1 != t.vj$.O.bound.baseElm))
								a1.className = a1.className.replace(_5a, "")
						};
						var fn3 = function() {
							t.vj$.O.bound = {
								baseElm : a1,
								link : a2
							};
							t.setBdr(a1, a2);
							if (a2)
								a2.className += " " + _5a;
							var _5f = vjo.Registry.get(_5b);
							if (_5f)
								_5f.loadJs(false, _5c);
							return false
						};
						var fn4 = function(_60) {
							t.vj$.O.closeOverlay(500, function() {
								t.setBdr(a1, a2, true)
							});
							if (!t.vj$.O.iOpen)
								chCss()
						};
						var chCss = function() {
							var _61 = t.vj$.O.bound;
							if (_61 && _61.link && a2 != _61.link) {
								if (_61.link)
									_61.link.className = "gh-ai";
								t.setBdr(_61.baseElm, _61.link, true);
								fn3()
							} else {
								if (a2)
									a2.className = "gh-ai";
								t.setBdr(a1, a2, true)
							}
						};
						if (_58 != "" && _59 != "") {
							ED.add(_59, "mouseover", fn3);
							ED.add(_59, "mouseout", fn4);
							ED.add(_58, "mouseover", fn3);
							ED.add(_58, "mouseout", fn4);
							t.fn4Array[t.fn4Array.length] = fn4
						}
					},
					setBdr : function(a1, a2, _64) {
						var t = this;
						var hObj = t.vj$.E.get("headerWrapper");
						var c3 = " gh-zidx";
						if (hObj) {
							var c = hObj.className || "";
							hObj.className = _64 ? c.replace(/gh-zidx/g, "")
									: c + c3
						}
						if (a1)
							a1.className = _64 ? "" : "gh-hbdr";
						if (a2)
							a2.className = _64 ? "gh-ai" : "gh-ai gh-hbdp"
					},
					registerClickEvent : function(_67, _68, _69, _6a, _6b) {
						var t = this;
						var l = t.vj$;
						var _6d = [ _67, _68, _69, _6a, _6b ];
						var fun = function() {
							l.C.loadJs(_6d)
						};
						l.ED.add(_68, "click", fun, this.vj$.C)
					},
					open : function(obj) {
						var t = this;
						return function() {
							var _71 = t.vj$.O.bound;
							if (_71 && _71.link) {
								if (_71.link)
									_71.link.className = "gh-ai";
								t.setBdr(_71.baseElm, _71.link, true)
							}
							obj.getMenuHtml()
						}
					},
					doctypeFix : function() {
						var t = this;
						var d = document;
						var b = t.vj$.BR;
						var _73 = d.childNodes[0].nodeValue;
						var _74 = _73 ? _73.toLowerCase() : null;
						if (b.bIE
								&& b.iVer > 7
								&& (!_73 || _74.indexOf("doctype") < 0 || _74
										.indexOf(".dtd") < 0)) {
							var s = t.vj$.CS
									.createStyle(".gh-w {font-size: x-small}");
							if (s)
								d.getElementsByTagName("head")[0]
										.appendChild(s);
							return true
						}
						return false
					},
					regFooterEvent : function(_76, _77, _78) {
						var t = this;
						var o = t.vj$.E.get(_78);
						var ED = t.vj$.ED;
						ED.add(_76, "click", function() {
							if (o) {
								o.style.display = "block";
								var h = o.offsetHeight;
								if (h > 0) {
									o.style.height = h - 22 + "px";
									o.style.marginTop = -(h + 15) + "px"
								}
							}
						});
						var _7b = function(e) {
							var el = e.nativeEvent.srcElement
									|| e.nativeEvent.target;
							if ((vjo.dsf.Element.containsElement(o, el) || el.id == _76)
									&& !vjo.dsf.Element.containsElement(
											vjo.dsf.Element.get(_77), el))
								return;
							if (o)
								o.style.display = "none"
						};
						ED.add(_77, "click", _7b);
						ED.add("body", "click", _7b)
					}
				}).endType();
(function() {
	var hasDocType = vjo.darwin.core.globalheader.utils.EventReg.doctypeFix();
	var styles = [];
	styles['ie6'] = ".gh-go, .gh-sbox input.gh-btn {overflow:visible; width:0; padding:4px 19px}";
	styles['ie7'] = ".gh-go {padding:2px 6px}input.gh-go {padding:0 3px; border:0 solid #ccc}.gh-log {max-width:80%}.coreFooterLinks a {font-size:xx-small !important}";
	styles['ie8'] = (hasDocType) ? styles['ie7'] : null;
	var b = vjo.dsf.client.Browser;
	if (b.bIE && styles['ie' + b.iVer]) {
		var s = vjo.dsf.utils.Css.createStyle(styles['ie' + b.iVer]);
		if (s)
			document.getElementsByTagName('head')[0].appendChild(s);
	}
})();
vjo.darwin.core.globalheader.overlay.Overlay.init("gbh_ovl",
		"http://p.ebaystatic.com/aw/pics/homepage/imgMenuBg.png");
vjo.darwin.core.globalheader.utils.EventReg.changeBtStyle("ghSearch");
vjo
		.ctype("vjo.darwin.core.globalheader.searchbox.SearchBox")
		.needs(
				[ "vjo.dsf.client.Browser",
						"vjo.dsf.typeextensions.string.Trim" ])
		.props(
				{
					Focus : function(_1) {
						var _2 = vjo.dsf.Element.get(_1);
						var B = vjo.dsf.client.Browser.bIE;
						if (typeof _2 != "undefined" && _2)
							if (B.bIE && B.iVer == 6)
								setTimeout(function() {
									_2.focus()
								}, 0);
							else
								_2.focus()
					},
					IeOptionDisabler : function(_3) {
						if (vjo.dsf.client.Browser.bIE) {
							var sl = vjo.dsf.Element.get(_3);
							var idx;
							if (sl) {
								sl.onchange = function() {
									idx = this.selectedIndex = this.options[this.selectedIndex].disabled ? idx
											: this.selectedIndex
								};
								sl.onfocus = function() {
									idx = this.selectedIndex
								};
								this.greydisabledoption(sl)
							}
						}
					},
					greydisabledoption : function(e) {
						var i;
						var op;
						for (i = 0; i < e.options.length; i++) {
							op = e.options[i];
							if (op.disabled)
								op.style.color = "graytext"
						}
					}
				}).endType();
vjo.ctype("vjo.darwin.tracking.impression.Manager").needs(
		[ "vjo.dsf.cookie.VjCookieJar", "vjo.dsf.EventDispatcher" ]).protos({
	constructs : function(_1) {
		if (!_1)
			return;
		var R = vjo.Registry;
		var id = "_pim";
		var t = R.get(id);
		if (!t) {
			t = this;
			t.vj$.EventDispatcher.add("body", "mousedown", t.onMouseDown, t);
			R.put(id, t)
		}
		t.sID = _1
	},
	onMouseDown : function() {
		this.vj$.VjCookieJar.writeCookielet("ebay", "psi", this.sID)
	}
}).endType();
vjo.ctype("vjo.darwin.tracking.rover.Rover")
		.needs("vjo.dsf.cookie.VjCookieJar").props(
				{
					roverTrack : function() {
						var _1 = (new Date).getTime();
						var _2 = vjo.darwin.tracking.rover.Rover
								.getClientOffset(_1);
						var _3 = vjo.dsf.cookie.VjCookieJar.readCookieObj(
								"npii", "tpim");
						if (_3 == null || _3.value == "")
							return;
						var _4 = parseInt(_3.maxage, 16) * 1E3;
						if (_4 > 0) {
							var _5 = _4 - _1 + _2;
							var _6 = 15552E6;
							if ((_5 > _6 || _5 < 0)
									&& typeof RoverSyncDropped == "undefined"
									&& typeof RoverNsCapable == "undefined")
								vjo.darwin.tracking.rover.Rover
										.dropRoverSyncImage()
						}
					},
					dropRoverSyncImage : function() {
						if (typeof RoverDomainBaseUrl !== "undefined"
								&& RoverDomainBaseUrl.length > 0) {
							var im = document.createElement("img");
							im.width = "1";
							im.height = "1";
							im.src = RoverDomainBaseUrl
									+ "/roversync/?rtpim=1&mpt="
									+ (new Date).getTime();
							document.body.appendChild(im)
						}
					},
					getClientOffset : function(_8) {
						var _9;
						var _a = vjo.dsf.cookie.VjCookieJar.readCookie("ebay",
								"cos");
						if (_a !== null && _a.length > 0)
							_9 = parseInt(_a, 16) * 1E3;
						else if (typeof svrGMT !== "undefined") {
							_9 = _8 - svrGMT;
							var _b = Math.round(_9 / 1E3);
							if (!isNaN(_b))
								vjo.dsf.cookie.VjCookieJar.writeCookielet(
										"ebay", "cos", _b.toString(16))
						}
						if (isNaN(_9))
							_9 = 18E5;
						return _9
					}
				}).endType();
vjo.ctype("vjo.darwin.core.ebayheader.rtm.GlobalHeaderRtmDec").endType();
if (typeof _oGlobalNavRTMInfo == "undefined") {
	_oGlobalNavRTMInfo = {};
	_oGlobalNavRTMInfo.aRTMPlacementData = []
};
vjo.ctype("vjo.dsf.typeextensions.string.Decode").endType();
String.prototype.decodeBase64 = function() {
	var rv = this;
	var len = rv.length;
	var ret = "";
	var i = 0;
	if (len === 0)
		return ret;
	var _2;
	var _3;
	var _4 = "";
	var _5;
	var _6;
	var _7;
	var _8 = "";
	var _9 = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" + "abcdefghijklmnopqrstuvwxyz"
			+ "0123456789+/=*";
	var _a = new RegExp("[^A-Za-z0-9+/=*]");
	if (_a.exec(rv))
		return;
	do {
		_5 = _9.indexOf(rv.charAt(i++));
		_6 = _9.indexOf(rv.charAt(i++));
		_7 = _9.indexOf(rv.charAt(i++));
		_8 = _9.indexOf(rv.charAt(i++));
		_2 = _5 << 2 | _6 >> 4;
		_3 = (_6 & 15) << 4 | _7 >> 2;
		_4 = (_7 & 3) << 6 | _8;
		ret += String.fromCharCode(_2);
		if (!(_7 >= 64))
			ret += String.fromCharCode(_3);
		if (!(_8 >= 64))
			ret += String.fromCharCode(_4);
		_2 = _3 = _4 = _5 = _6 = _7 = _8 = ""
	} while (i < len);
	return ret
};
String.prototype.decodeUTF8 = function() {
	var s = this;
	var len = s.length;
	var rs = "";
	var i = 0;
	var c = 0;
	var c1 = 0;
	for ( var c2 = 0; i < len;) {
		c = s.charCodeAt(i);
		if (c < 128) {
			rs += String.fromCharCode(c);
			i++
		} else if (c > 191 && c < 224) {
			c2 = s.charCodeAt(i + 1);
			rs += String.fromCharCode((c & 31) << 6 | c2 & 63);
			i += 2
		} else {
			c2 = s.charCodeAt(i + 1);
			c3 = s.charCodeAt(i + 2);
			rs += String
					.fromCharCode((c & 15) << 12 | (c2 & 63) << 6 | c3 & 63);
			i += 3
		}
	}
	return rs
};
vjo
		.ctype("vjo.darwin.core.ebayheader.rtm.GlobalHeaderRtmCall")
		.needs(
				[ "vjo.dsf.typeextensions.string.Decode",
						"vjo.dsf.cookie.VjCookieJar", "vjo.dsf.utils.Object" ])
		.props(
				{
					iTimer : null,
					submitRTMCall : function(_1) {
						var un = "undefined";
						var lh = window.location.href;
						if (typeof pageHasRtmPlacements != "undefined")
							return;
						if (!lh.hasAny("catalog.")
								&& (lh.hasAny("offer.") || !(typeof ebay != un
										&& typeof ebay.oDocument != un && ebay.oDocument
										._getControl("rtm")))
								&& !(typeof vjo != un
										&& typeof vjo.dsf != un
										&& typeof vjo.dsf.ServiceEngine != un
										&& typeof vjo.dsf.ServiceEngine.inProcHdl != un
										&& typeof vjo.dsf.ServiceEngine.inProcHdl.svcHdls != un && typeof vjo.dsf.ServiceEngine.inProcHdl.svcHdls.RTM_CALLBACK_SERVICE != un)
								&& typeof _oGlobalNavRTMInfo !== un
								&& !(typeof rtm != un)) {
							if (_oGlobalNavRTMInfo.aRTMPlacementData.length > 0)
								if (!lh.hasAny("my.")
										&& !lh.hasAny("k2b-bulk."))
									this.iTimer = window
											.setInterval(this.vj$.Object.hitch(
													this, "init"), 1)
						} else if (_oGlobalNavRTMInfo.aRTMPlacementData.length > 0)
							if (lh.hasAny("shop.", "icatalog.", "catalog.")
									&& !lh.hasAny("hub."))
								this.init()
					},
					getUid : function() {
						var _3 = this.vj$.VjCookieJar.readCookie("dp1", "u1p");
						var u1pDecoded = "";
						if (_3)
							u1pDecoded = _3.decodeBase64().decodeUTF8();
						return u1pDecoded
					},
					getGuid : function() {
						return this.vj$.VjCookieJar.readCookie("npii", "tguid")
					},
					hasUid : function(_4) {
						if (_4)
							return true;
						if (this.getUid() && this.getUid().has("@@__@@__@@"))
							return false;
						return true
					},
					getTime : function() {
						var _5 = new Date;
						return _5.getTime()
					},
					init : function() {
						if (typeof vjo.darwin.core.rtm == "undefined")
							return;
						if (this.iTimer != null)
							window.clearInterval(this.iTimer);
						var _6 = _oGlobalNavRTMInfo.aRTMPlacementData;
						var data;
						var widths = [];
						var htmlIds = [];
						var heights = [];
						var pids = [];
						var dblclkUrls = [];
						var defaultUrls = [];
						var url;
						for ( var i = 0; i < _6.length; i++) {
							data = _6[i];
							widths[i] = data.maxWidth;
							htmlIds[i] = data.htmlId;
							heights[i] = data.maxHeight;
							pids[i] = data.pid;
							dblclkUrls[i] = "";
							defaultUrls[i] = "";
							url = data.rtmUrl
									+ "?RtmCmd&a=json"
									+ (this.hasUid(data.userId) ? "&l="
											+ (data.userId ? data.userId : this
													.getUid()) : "") + "&g="
									+ (data.gUid ? data.gUid : this.getGuid())
									+ "&ord=" + this.getTime()
									+ (data.oid ? "&i=" + data.oid : "")
						}
						url += "&p=" + pids.join(":");
						_oGlobalNavRTMInfo.sRTMUrl = url;
						if (_6.length > 0) {
							var _8 = new vjo.darwin.core.rtm.RTMInit({
								url : url,
								widths : widths,
								htmlIds : htmlIds,
								heights : heights,
								pids : pids,
								dblclkUrls : dblclkUrls,
								defaultUrls : defaultUrls
							});
							_8.invoke({})
						}
					}
				}).endType();
vjo.ctype("vjo.darwin.core.greetings.VjGreetingsServer").needs(
		[ "vjo.dsf.utils.URL" ]).props(
		{
			handleClick : function(_1, _2) {
				var _3 = _2.srcElement || _2.target;
				if (_3)
					_3.href = vjo.dsf.utils.URL.addArg(_1, "ru",
							encodeURIComponent(document.location.href))
			}
		}).endType();
function get_MyEbay_menu() {
	return {
		"items" : [
				{
					"value" : "<a href=\"#\" rel=\"nofollow\">Summary</a>"
				},
				{
					"value" : "<a href=\"http://my.ebay.in/ws/eBayISAPI.dll?MyEbay&amp;gbh=1&amp;CurrentPage=MyeBayBidding&amp;ssPageName=STRK:ME:LNLK:MEBIDX\" rel=\"nofollow\">Bids/Offers</a>"
				},
				{
					"value" : "<a href=\"http://my.ebay.in/ws/eBayISAPI.dll?MyEbay&amp;gbh=1&amp;CurrentPage=MyeBayWon&amp;ssPageName=STRK:ME:LNLK:MEWNX\" rel=\"nofollow\">Purchase History</a>"
				} ]
	};
}
function get_Sell_menu() {
	return {
		"items" : [
				{
					"value" : "<a href=\"#\">How to Sell</a>"
				} ]
	};
}
function get_Community_menu() {
	return {
		"items" : [
				]
	};
}
function get_Help_menu() {
	return {
		"items" : [
				 ]
	};
}
vjo.darwin.core.globalheader.utils.EventReg.registerMouseEvent({
	"MyEbay" : [ "MyEbay", "get_MyEbay_menu" ],
	"Help" : [ "Help", "get_Help_menu" ],
	"Sell" : [ "Sell", "get_Sell_menu" ],
	"Community" : [ "Community", "get_Community_menu" ]
}, "gh-esmn", null, null, new Array('Help'), -1, [ 0, 250 ], "HEADER_MENU");
vjo.darwin.core.globalheader.utils.EventReg.registerAndCreateHeaderButtons(-1,
		[ 3 ], ".ebay.com", "gh-hsmn", new Array('getBrowseCatsDAPData'),
		new Array('BrowseCategories'), new Array('chevron0'), null, new Array(
				'BrowseCategoriesMenu'), 500);
(function() {
	var _r = vjo.Registry;
	_r.put('ReskinFooterTrackingCompSpecGenerator_0',
			new vjo.darwin.tracking.enabler.TrackingModuleEnabler("_trksid",
					"_trkparms", "m571;", ";"));
})();
function FooterTrk() {
	return {
		handle : function(event) {
			(function() {
				var _d = vjo.dsf.EventDispatcher;
				var _r = vjo.Registry;
				_d.add('glbfooter', 'click', function(event) {
					this.handle(event);
				}, _r._ReskinFooterTrackingCompSpecGenerator_0);
			})();
		}
	};
};
vjo.dsf.EventDispatcher.add('body', 'load', new FooterTrk());
(function() {
	var _r = vjo.Registry;
	function $o0() {
		return new vjo.darwin.tracking.enabler.TrackingModuleEnabler("_trksid",
				"_trkparms", "m570;", ";");
	}
	;
	_r.put('ReskinHeaderTrackingCompSpecGenerator_0', $o0());
	_r.put('ReskinHeaderTrackingCompSpecGenerator_1', $o0());
	_r.put('ReskinHeaderTrackingCompSpecGenerator_2', $o0());
})();
function ReskinHeaderTrk() {
	return {
		handle : function(event) {
			(function() {
				var _d = vjo.dsf.EventDispatcher;
				var _r = vjo.Registry;
				function $0() {
					return function(event) {
						return this.handle(event);
					};
				}
				;
				_d.add('BrowseCategories-menu', 'click', $0(),
						_r._ReskinHeaderTrackingCompSpecGenerator_0);
				_d.add('gnheader', 'click', $0(),
						_r._ReskinHeaderTrackingCompSpecGenerator_1);
				_d.add('gbh_ovl', 'click', $0(),
						_r._ReskinHeaderTrackingCompSpecGenerator_2);
				_d.add('body', 'click', function(event) {
					vjo.darwin.tracking.enabler.TrackingEnabler
							.copySIDToCookie(event, "_trksid", "_sp",
									"_trkparms");
				});
			})();
		}
	};
};
vjo.dsf.EventDispatcher.add('body', 'load', new ReskinHeaderTrk());