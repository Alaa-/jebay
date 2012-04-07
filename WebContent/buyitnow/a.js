(function(current) {
    var createBootstrap = function() {

            //code from base.js
            var NJS = {
                emptyFn: function() {},
                _apply: function(to, from, ignore) {
                    var applyProperty = function(prop, to, from, ignore, isIf) {
                            if ((isIf && to.hasOwnProperty(prop)) || ignore.indexOf(prop) > -1) {
                                return;
                            }
                            to[prop] = from[prop];
                        };
                    return (function(to, from, ignore) {
                        if (!from) {
                            return to;
                        }
                        var isIf = this.isIf;
                        ignore = ignore || [];
                        for (var i in from) {
                            if (from.hasOwnProperty(i)) {
                                applyProperty(i, to, from, ignore, isIf);
                            }
                        }
                        if (from.hasOwnProperty("toString")) {
                            applyProperty("toString", to, from, ignore, isIf);
                        }
                        if (from.hasOwnProperty("valueOf")) {
                            applyProperty("valueOf", to, from, ignore, isIf);
                        }
                        return to;
                    });
                }(),
                apply: function(to, from, ignore) {
                    return this._apply.call({
                        isIf: false
                    }, to, from, ignore);
                },
                applyIf: function(to, from, ignore) {
                    return this._apply.call({
                        isIf: true
                    }, to, from, ignore);
                },
                Marker: function(name, properties) {
                    this.name = name;
                },
                define: function(config) {
                    var cons = config.hasOwnProperty("constructor") ? config.constructor : null;
                    var superclass = config.superclass;
                    if (!cons) {
                        if (!superclass) {
                            cons = function() {};
                        } else {
                            cons = function() {
                                superclass.apply(this, arguments);
                            };
                        }
                    }
                    var proto = null;
                    if (superclass) {
                        var fn = function() {};
                        fn.prototype = superclass.prototype;
                        proto = new fn();
                    } else {
                        proto = {};
                        superclass = this.emptyFn;
                    }
                    this.apply(proto, config, ["superclass", "constructor"]);
                    var superclassPrototype = superclass.prototype;
                    if (superclassPrototype.constructor == Object.prototype.constructor) {
                        superclassPrototype.constructor = superclass;
                    }
                    proto.constructor = cons;
                    proto.superclass = superclassPrototype;
                    cons.superclass = superclassPrototype;

                    cons.prototype = proto;
                    return cons;
                },
                unique: function(seed) {
                    this._unique = this._unique || 0;
                    return (seed || "ngrid-unique-") + (++this._unique);
                },
                ns: function(str, scope) {
                    scope = scope || window;
                    var toks = str.split(".");
                    for (var i = 0; i < toks.length; i++) {
                        var t = toks[i];
                        if (scope.hasOwnProperty(t)) {
                            scope = scope[t];
                            continue;
                        }
                        scope = scope[t] = {};
                    }
                },
                createDelegate: function(fn, scope) {
                    return (function() {
                        fn.apply(scope || this, arguments);
                    });
                },
                _mimic: function(obj, as, config, isIf) {
                    var includes = config.includes,
                        i;
                    if (!includes) {
                        includes = [];
                        for (i in as) {
                            if (as.hasOwnProperty(i)) {
                                includes.push(i);
                            }
                        }
                        if (as.hasOwnProperty("toString")) {
                            includes.push("toString");
                        }
                        if (as.hasOwnProperty("valueOf")) {
                            includes.push("valueOf");
                        }
                    }
                    var excludes = config.excludes || [];
                    for (i = 0; i < includes.length; i++) {
                        var p = includes[i];
                        if (excludes.indexOf(p) > -1) {
                            continue;
                        }
                        if (isIf) {
                            if (obj.hasOwnProperty[i]) {
                                continue;
                            }
                            if (!config.overridePrototype && obj[i]) {
                                continue;
                            }
                        }
                        obj.__defineGetter__(p, function(p) {
                            return (function() {
                                var fn = as[p];
                                if (typeof fn != "function") {
                                    return fn;
                                }
                                return NJS.createDelegate(fn, as);
                            });
                        }(p));
                        obj.__defineSetter__(p, function(p) {
                            return (function(val) {
                                as[p] = val;
                            });
                        }(p));
                    }
                },
                mimic: function(obj, as, config) {
                    config = config || {};
                    this._mimic(obj, as, config, false);
                },
                mimicIf: function(obj, as, config) {
                    config = config || {};
                    this._mimic(obj, as, config, true);
                },
                arrayEach: function(array, fn, config) {
                    if (!(array instanceof Array)) {
                        arrayEach.call(this, [array], fn, config);
                        return;
                    }
                    config = config || {};
                    var scope = config.scope || window;
                    var baseArgs = config.args;
                    for (var i = 0; i < array.length; i++) {
                        var z = [array[i]];
                        var args = baseArgs ? z.concat(baseArgs) : z;
                        if (fn.apply(scope, args) === false) {
                            return;
                        }
                    }
                },
                arrayFilter: function(array, fn, config) {
                    var o = [];
                    config = config || {};
                    var scope = config.scope || window;
                    var baseArgs = config.args;
                    var b = config.breakOnFirst;
                    for (var i = 0; i < array.length; i++) {
                        var item = array[i];
                        var z = [item];
                        var args = baseArgs ? z.concat(baseArgs) : z;
                        if (fn.apply(scope, args) === true) {
                            o.push(item);
                            if (b) {
                                return o;
                            }
                        }
                    }
                    return o;
                },
                createBuffered: function(fn, delay, scope) {
                    var newFn = function() {
                            if (newFn.timeoutId) {
                                try {
                                    window.clearTimeout(newFn.timeoutId);
                                } catch (ex) {}
                            }
                            var callee = function(me, args) {
                                    return (function() {
                                        fn.apply(scope || me, args);
                                    });
                                }(this, Array.prototype.slice.call(arguments, 0));
                            newFn.timeoutId = window.setTimeout(callee, delay);
                        };
                    return newFn;
                },
                isNullOrEmpty: function(o) {
                    if (o == null) {
                        return true;
                    }
                    return this.isEmpty(o);
                },
                isEmpty: function(o) {
                    if (o instanceof Array) {
                        return o.length === 0;
                    }
                    if (typeof o == "string") {
                        return this.trim(o) === "";
                    }
                    return false;
                },
                lTrim: function(str) {
                    var re = /\s*((\S+\s*)*)/;
                    return str.replace(re, "$1");
                },
                rTrim: function(str) {
                    var re = /((\s*\S+)*)\s*/;
                    return str.replace(re, "$1");
                },
                trim: function(str) {
                    return this.lTrim(this.rTrim(str));
                },
                removeIndex: function(array, index) {
                    var val = array[index];
                    array.splice(index, 1);
                    return val;
                },
                removeItem: function(array, obj) {
                    var i = array.indexOf(obj);
                    if (i == -1) {
                        return -1;
                    }
                    array.splice(i, 1);
                    return i;
                }
            };

            //code from observable.js
            NJS.Event = NJS.define({
                constructor: function(name) {
                    this.name = name;
                    this._listeners = [];
                },
                on: function(fn, scope) {
                    this._listeners.push({
                        fn: fn,
                        scope: scope
                    });
                },
                un: function(fn) {
                    var ls = this._listeners;
                    var f = -1;
                    for (var i = 0; i < ls.length; i++) {
                        var l = ls[i];
                        if (l.fn == fn) {
                            f = i;
                            break;
                        }
                    }
                    if (f != -1) {
                        ls.splice(f, 1)[0];
                    }
                },
                fire: function() {
                    if (this._suspended) {
                        if (this._queue) {
                            this._queue.push(Array.prototype.splice.call(arguments, 0));
                        }
                        return;
                    }
                    var ls = [].concat(this._listeners);
                    for (var i = 0; i < ls.length; i++) {
                        var l = ls[i];
                        if (l.fn.apply(l.scope || window, arguments) === false) {
                            return;
                        }
                    }
                },
                purgeListeners: function() {
                    this._listeners = [];
                },
                hasListeners: function() {
                    return this._listeners.length > 0;
                },
                suspend: function(queue) {
                    if (this._suspended) {
                        return;
                    }
                    this._suspended = true;
                    if (queue) {
                        this._queue = [];
                    }
                },
                resume: function(disragardQueue) {
                    if (!this._suspended) {
                        return;
                    }
                    this._suspended = false;

                    var q = this._queue;
                    delete this._queue;

                    if (disragardQueue) {
                        return;
                    }
                    if (!q) {
                        return;
                    }
                    for (var i = 0; i < q.length; i++) {
                        this.fire.apply(this, q[i]);
                    }
                }
            });
            NJS.Observable = NJS.define({
                constructor: function(config) {
                    this._events = {};
                    if (this.events) {
                        this.addEvents(this.events);
                    }
                    var listeners = config ? config.listeners : false;
                    if (listeners) {
                        this.on(listeners);
                    }
                },
                addEvents: function(events, suspended) {
                    if (suspended == null) {
                        suspended = this._suspended;
                    }
                    if (typeof events == "string") {
                        events = [events];
                    }
                    for (var i = 0; i < events.length; i++) {
                        var event = events[i];
                        if (this.hasEvent(event)) {
                            continue;
                        }
                        var e = this._events[event] = new NJS.Event(event);
                        if (suspended) {
                            e.suspend();
                        }
                    }
                },
                hasEvent: function(event) {
                    return this._events[event] != null;
                },
                fire: function(event, args) {
                    event = this._events[event];
                    event.fire.apply(event, arguments.length > 1 ? Array.prototype.splice.call(arguments, 1) : []);
                },
                on: function(listeners, fn, scope) {
                    if (listeners instanceof Array) {
                        for (var i = 0; i < listeners.length; i++) {
                            var listener = listeners[i];
                            this.on(listener);
                        }
                        return;
                    }
                    if (typeof listeners != "string") {
                        this.on(listeners.event, listeners.fn, listeners.scope);
                        return;
                    }
                    this._events[listeners].on(fn, scope);
                },
                un: function(event, fn) {
                    this._events[event].un(fn);
                },
                hasListeners: function(events) {
                    if (typeof events == "string") {
                        events = [events];
                    }
                    events = events || this._events;
                    for (var i = 0; i < events.length; i++) {
                        if (events[i].hasListeners()) {
                            return true;
                        }
                    }
                    return false;
                },
                purgeListeners: function(events) {
                    if (typeof events == "string") {
                        events = [events];
                    }
                    events = events || this._events;
                    for (var i = 0; i < events.length; i++) {
                        events[i].purgeListeners();
                    }
                },
                suspendEvent: function(event, queue) {
                    this._events[event].suspend(queue);
                },
                suspendAllEvents: function(queue) {
                    if (this._suspended) {
                        return;
                    }
                    this._suspended = true;
                    var events = this._events;
                    for (var i = 0; i < events.length; i++) {
                        events[i].suspend(queue);
                    }
                },
                resumeEvent: function(event, disragardQueue) {
                    this._events[event].resume(disragardQueue);
                },
                resumeAllEvents: function(disragardQueue) {
                    if (!this._suspended) {
                        return;
                    }
                    this._suspended = false;
                    var events = this._events;
                    for (var i = 0; i < events.length; i++) {
                        events[i].suspend(disragardQueue);
                    }
                },
                mimicMe: function(who) {
                    if (who.events) {
                        this.addEvents(who.events);
                    }
                    NJS.mimicIf(who, this, {
                        includes: ["addEvents", "hasEvent", "fire", "on", "un", "hasListeners", "purgeListeners", "suspendEvent", "suspendAllEvents", "resumeEvent", "resumeAllEvents"]
                    });
                }
            });

            //code from layout.js
            NJS.Layout = function() {
                var scrollSize = -1;
                var calculateScrollSize = function() {
                        if (!isNaN(scrollSize)) {
                            return;
                        }
                        try {
                            var div = document.createElement("div");
                            div.style.cssText = "width: 100px; height: 100px; overflow: auto; position: absolute; top: -100px; left: -100px;";
                            document.body.appendChild(div);
                            var newDiv = document.createElement("div");
                            newDiv.style.cssText = "width:100%; height: 200px;";
                            div.appendChild(newDiv);
                            scrollSize = 100 - div.clientWidth;
                            document.body.removeChild(div);
                        } catch (ex) {}
                    };
                var init = function() {
                        if (window.document.readyState == "complete") {
                            calculateScrollSize();
                            return;
                        }
                        window.addEventListener('DOMContentLoaded', calculateScrollSize, false);
                    };
                init();
                return ({
                    hasXScroll: function() {
                        return document.body.scrollWidth > window.innerWidth;
                    },
                    hasYScroll: function() {
                        return document.body.scrollHeight > window.innerHeight;
                    },
                    getScrollSize: function() {
                        if (!isNaN(scrollSize)) {
                            return scrollSize;
                        }
                        calculateScrollSize();
                        return scrollSize;
                    },
                    confineToViewPort: function(coordinates, boxAttributes) {
                        var top = coordinates.y;
                        var left = coordinates.x;
                        var scrollSize = this.getScrollSize();
                        var scrollSizeX = this.hasYScroll() ? scrollSize : 0;
                        var scrollSizeY = this.hasXScroll() ? scrollSize : 0;
                        var sTop = this.getBodyScrollTop();
                        var sLeft = this.getBodyScrollLeft();
                        var windowWidth = window.innerWidth;
                        var windowHeight = window.innerHeight;
                        if (top <= sTop) {
                            top = sTop;
                        } else {
                            top = (top + boxAttributes.height + scrollSizeY >= sTop + windowHeight) ? (sTop + windowHeight - boxAttributes.height - scrollSizeY) : top;
                        }
                        if (left <= sLeft) {
                            left = sLeft;
                        } else {
                            left = (left + boxAttributes.width + scrollSizeX >= sLeft + windowWidth) ? (sLeft + windowWidth - boxAttributes.width - scrollSizeX) : left;
                        }
                        return {
                            x: left,
                            y: top
                        };
                    },
                    getBodyScrollTop: function() {
                        return Math.max(document.body.scrollTop, document.documentElement.scrollTop);
                    },
                    getBodyScrollLeft: function() {
                        return Math.max(document.body.scrollLeft, document.documentElement.scrollLeft);
                    },
                    boxAttributes: function(node) {
                        var rect = node.getBoundingClientRect();
                        return {
                            left: rect.left + Math.max(document.body.scrollLeft, document.documentElement.scrollLeft),
                            top: rect.top + Math.max(document.body.scrollTop, document.documentElement.scrollTop),
                            width: rect.width,
                            height: rect.height
                        };
                    }
                });
            }();

            //code from job.js
            //State 0: init
            //State 1: running
            //State 2: paused
            //State 3: terminated
            NJS.Job = NJS.define({
                startOnInit: false,
                startPaused: false,
                superclass: NJS.Observable,
                events: ["init", "start", "end", "pause", "resume"],
                constructor: function(config) {
                    NJS.Job.superclass.constructor.call(this, config);
                    if (config) {
                        NJS.applyIf(this, config);
                    }
                    this.id = this.id || NJS.unique("job");
                    this.init();
                },
                init: function() {
                    if (this._state != undefined) {
                        throw "Can not initialize. Job " + this.id + ".";
                    }
                    this._state = 0;
                    this.onInit();
                    this.fire("init", this);
                    if (this.startOnInit || this.startPaused) {
                        this.start();
                        if (this.startPaused) {
                            this.pause();
                        }
                    }
                },
                start: function() {
                    if (this._state != 0) {
                        throw "Can not start. Job " + this.id + " is not in initialized state.";
                    }
                    this._state = 1;
                    this.onStart();
                    this.fire("start", this);
                },
                end: function() {
                    if (this._state == 3 || this._state == 0) {
                        throw "Can not end. Job " + this.id + " already ended or was never started.";
                    }
                    this._state = 3;
                    this.onEnd();
                    this.fire("end", this);
                },
                pause: function() {
                    if (this._state != 1) {
                        throw "Can not pause. Job " + this.id + " is not running.";
                    }
                    this._state = 2;
                    this.onPause();
                    this.fire("pause", this);
                },
                resume: function() {
                    if (this._state != 2) {
                        throw "Can not resume. Job " + this.id + " is not in paused state.";
                    }
                    this._state = 1;
                    this.onResume();
                    this.fire("resume", this);
                },
                getState: function() {
                    return this._state;
                },
                onInit: NJS.emptyFn,
                onStart: NJS.emptyFn,
                onEnd: NJS.emptyFn,
                onPause: NJS.emptyFn,
                onResume: NJS.emptyFn
            });
            NJS.JobQueue = NJS.define({
                superclass: NJS.Job,
                constructor: function(config) {
                    NJS.JobQueue.superclass.constructor.call(this, config);
                },
                maxJobs: Number.MAX_VALUE,
                onInit: function() {
                    this._queue = [];
                    this._runningJobs = [];
                },
                onStart: function() {
                    this._check();
                },
                onPause: function() {
                    for (var i = 0; i < this._runningJobs.length; i++) {
                        this._runningJobs.pause();
                    }
                },
                onResume: function() {
                    for (var i = 0; i < this._runningJobs.length; i++) {
                        this._runningJobs.resume();
                    }
                    this._check();
                },
                onEnd: function() {
                    for (var i = 0; i < this._runningJobs.length; i++) {
                        this._runningJobs.end();
                    }
                },
                queue: function(job) {
                    if (this._state == 3) {
                        throw "Can queue. Job queue " + this.id + " already ended.";
                    }
                    if (job.getState() != 0) {
                        throw "Can queue. Job " + job.id + " is not in init state.";
                    }
                    job.on('end', this._registerFinish, this);
                    this._queue.push(job);
                    if (this._state == 1) {
                        this._check();
                    }
                },
                _check: function() {
                    var runningJobs = this._runningJobs;
                    var queue = this._queue;
                    if (queue.length == 0) {
                        return;
                    }
                    if (runningJobs.length >= this.maxJobs) {
                        return;
                    }
                    var o = NJS.removeIndex(queue, 0);
                    runningJobs.push(o);
                    o.start();
                    this._check();
                },
                _registerFinish: function(job) {
                    if (this._state == 0) {
                        throw "unexpected register finish";
                    }
                    if (this._state == 3) {
                        return;
                    }
                    var i = NJS.removeItem(this._runningJobs, job);
                    if (i == -1) {
                        throw "unknown job ended";
                    }
                    if (this._state == 1) {
                        this._check();
                    }
                }
            });

            var YouTubeUIVersion = NJS.define({
                constructor: function(sizesMap) {
                    this._sizesMap = sizesMap;
                },
                setSize: function(sizeKey) {
                    if(sizeKey == null || sizeKey == "default") {
                        return false;
                    }
                    var size = this._sizesMap[sizeKey];
                    if(!size) {
                        return false;
                    }
                    return this.onSetSize(size);
                },
                onSetSize: function(size) {
                    throw "Must be implemented";
                }
            });

            var YouTubeDummyUIVersion = NJS.define({
                superclass: YouTubeUIVersion,
                setSize: function(sizeKey) {
                    return false;
                }
            });

            var YouTubeUIVersion6 = NJS.define({
                superclass: YouTubeUIVersion,
                constructor: function() {
                    YouTubeUIVersion6.superclass.constructor.call(this, {'small': 'small', 'medium': 'medium', 'large': 'large', 'full': 'full'});
                },
                onSetSize: function(size) {
                    try {
                        yt.www.watch.watch6.setSize(size);
                        return true;
                    } catch(ex) {}
                    return false;
                }
            });

            var YouTubeUIVersion5 = NJS.define({
                superclass: YouTubeUIVersion,
                constructor: function() {
                    YouTubeUIVersion5.superclass.constructor.call(this, {'small': 'small', 'medium': 'wide', 'large': 'wide', 'full': 'wide'});
                },
                onSetSize: function(size) {
                    try {
                        yt.www.watch.watch5.enableWide(size == "wide");
                        return true;
                    } catch(ex) {}
                    return false;
                }
            });

            var MyTubePrefs = function() {
                    var o = {
                        prefs: {
                            autoPlay: false,
                            hidePopup: false,
                            autoBuffer: true,
                            autoPlayOnBuffer: true,
                            autoPlayOnBufferPercentage: 10,
                            autoPlayOnSmartBuffer: false,
                            loop: false,
                            quality: 'default',
                            enable: true,
                            enableFullScreen: true,
                            fshd: true,
                            onlyNotification: false,
                            desktopNotification: true,
                            soundNotification: true,
                            saveBandwidth: false,
                            playerSize: 'default'
                        },
                        bundle: {},
                        getEl: function() {
                            return document.getElementById("myTubeElement");
                        },
                        showGlobalSettings: function() {
                            var el = this.getEl();
                            var evt = el.ownerDocument.createEvent("Events");
                            evt.initEvent("mytubeshowprefswindow", true, false);
                            el.dispatchEvent(evt);
                        },
                        anyNotificationSupported: function() {
                            return this.soundNotificationSupported() || this.desktopNotificationSupported();
                        },
                        soundNotificationSupported: function() {
                            if (this._soundSupported != null) {
                                return this._soundSupported;
                            }
                            this._soundSupported = !! document.createElement("audio").play;
                            return this._soundSupported;
                        },
                        desktopNotificationSupported: function() {
                            return MyTube.extensionType == "chrome" && !!window.webkitNotifications;
                        },
                        init: function() {
                            if (this._initQueued) {
                                return;
                            }
                            if (this._initialized) {
                                MyTubePrefs.fire("preferencesUpdated", MyTubePrefs.prefs);
                                return;
                            }
                            MyTubePrefs.getNotificationPermission = NJS.createDelegate(MyTubePrefs.getNotificationPermission, MyTubePrefs);
                            var el = this._initListenerElement();
                            el.setAttribute("loadBundle", "true");
                            el.addEventListener("mytubeprefsupdated", function(e) {
                                MyTubePrefs.prefs.autoPlay = el.getAttribute("autoPlay") == "true";
                                MyTubePrefs.prefs.hidePopup = el.getAttribute("hidePopup") == "true";
                                MyTubePrefs.prefs.autoPlayOnBuffer = el.getAttribute("autoPlayOnBuffer") == "true";
                                MyTubePrefs.prefs.autoPlayOnBufferPercentage = parseInt(el.getAttribute("autoPlayOnBufferPercentage"));
                                MyTubePrefs.prefs.autoPlayOnSmartBuffer = el.getAttribute("autoPlayOnSmartBuffer") == "true";
                                MyTubePrefs.prefs.loop = el.getAttribute("loop") == "true";
                                MyTubePrefs.prefs.autoBuffer = el.getAttribute("autoBuffer") == "true";
                                MyTubePrefs.prefs.quality = el.getAttribute("quality");
                                MyTubePrefs.prefs.enable = el.getAttribute("enable") == "true";
                                MyTubePrefs.prefs.enableFullScreen = el.getAttribute("enableFullScreen") == "true";
                                MyTubePrefs.prefs.fshd = el.getAttribute("fshd") == "true";
                                MyTubePrefs.prefs.onlyNotification = MyTubePrefs.anyNotificationSupported() && el.getAttribute("onlyNotification") == "true";
                                MyTubePrefs.prefs.desktopNotification = el.getAttribute("desktopNotification") == "true";
                                MyTubePrefs.prefs.soundNotification = el.getAttribute("soundNotification") == "true";
                                MyTubePrefs.prefs.saveBandwidth = el.getAttribute("saveBandwidth") == "true";
                                MyTubePrefs.prefs.playerSize = el.getAttribute("playerSize");

                                if (el.getAttribute("loadBundle") == "true") {
                                    el.removeAttribute("loadBundle");
                                    var bundleElement = el.getElementsByTagName("BUNDLE")[0];
                                    var attrs = bundleElement.attributes;
                                    for (var i = 0; i < attrs.length; i++) {
                                        var attr = attrs[i];
                                        MyTubePrefs.bundle[attr.name] = attr.value;
                                    }
                                }
                                MyTubePrefs._initialized = true;
                                MyTubePrefs._initQueued = false;
                                MyTubePrefs.fire("preferencesUpdated", MyTubePrefs.prefs);
                            }, false, true);
                            var evt = el.ownerDocument.createEvent("Events");
                            evt.initEvent("mytuberelayprefs", true, false);
                            el.dispatchEvent(evt);
                            this._initQueued = true;
                        },
                        _initListenerElement: function() {
                            var myTubeElement = window.document.createElement("MYTUBEELEMENT");
                            myTubeElement.id = "myTubeElement";
                            var bundleElement = window.document.createElement("BUNDLE");
                            myTubeElement.appendChild(bundleElement);
                            var par = window.document.body || window.document.head || window.document.documentElement;
                            par.appendChild(myTubeElement);
                            return myTubeElement;
                        },
                        getNotificationPermission: function() {
                            var p = window.webkitNotifications.checkPermission();
                            if (p == 0 || p == 2) {
                                this.fire("notificationPermissionsChanged");
                                return;
                            }
                            var me = this;
                            window.webkitNotifications.requestPermission(function() {
                                me.fire("notificationPermissionsChanged");
                            });
                        }
                    };

                    var createPageInfo = function() {
                            var pageInfo = {};
                            var href = window.location.href;

                            var regex = /^((http|https):\/\/)?(www\.)?youtube\.com\//i;
                            var youTubeMakka = pageInfo.youTubeMakka = regex.test(href);

                            var regexForYouTubeFrame = /^(?:(?:http|https):\/\/)?(?:www\.)?.*?youtube\.com\/embed\//i;
                            var regexForRedditFrame = /^(?:(?:http|https):\/\/)?(?:www\.)?.*?redditmedia\.com\/mediaembed\//i;
                            pageInfo.youTubeFrame = regexForYouTubeFrame.test(href) || regexForRedditFrame.test(href);

                            regex = /^((http|https):\/\/)?(www\.)?youtube\.com\/user\/./i;
                            pageInfo.channel = regex.test(href);

                            pageInfo.playlist = youTubeMakka && href.indexOf("&list=") > -1;
                            var getUIVersion = function() {
                                if(!youTubeMakka) {
                                    return new YouTubeDummyUIVersion();
                                }
                                try {
                                    if(yt.www.watch.watch6) {
                                        return new YouTubeUIVersion6();
                                    }
                                } catch (ex) { };
                                try {
                                    if(yt.www.watch.watch5) {
                                        return new YouTubeUIVersion5();
                                    }
                                } catch (ex) {}
                                return new YouTubeDummyUIVersion();
                            };
                            pageInfo.uiVersion = function() {
                                if(!this._uiVersion) {
                                    this._uiVersion = getUIVersion();
                                }
                                return this._uiVersion;
                            };
                            return pageInfo;
                        };
                    o.pageInfo = createPageInfo();
                    var observable = new NJS.Observable();
                    observable.addEvents(["preferencesUpdated", "notificationPermissionsChanged"]);
                    observable.mimicMe(o);
                    return o;
                }();
            var EmbedMedia = {
                getVideoStartBytes: function(player) {
                    return player.getVideoStartBytes();
                },
                getVideoBytesLoaded: function(player) {
                    return player.getVideoBytesLoaded();
                },
                getVideoBytesTotal: function(player) {
                    return player.getVideoBytesTotal();
                },
                getPlayerState: function(player) {
                    return player.getPlayerState();
                },
                getDuration: function(player) {
                    return player.getDuration();
                },
                getCurrentTime: function(player) {
                    return player.getCurrentTime();
                },
                playVideo: function(player) {
                    player.playVideo();
                },
                pauseVideo: function(player) {
                    player.pauseVideo();
                },
                getAvailableQualityLevels: function(player) {
                    return player.getAvailableQualityLevels();
                },
                getPlaybackQuality: function(player) {
                    return player.getPlaybackQuality();
                },
                setPlaybackQuality: function(player, quality) {
                    return player.setPlaybackQuality(quality);
                }
            };
            var MyTube = NJS.define({
                mediaType: EmbedMedia,
                tags: ["EMBED", "OBJECT"],
                constructor: function(id, player, uiConstructor, prefs) {
                    this.id = id;
                    MyTube.put(this);
                    NJS.apply(this, prefs);
                    this.init(player, uiConstructor, prefs);
                },
                init: function(player, uiConstructor, prefs) {
                    this.setupPlayerMarkers(player);
                    this.setupUI(uiConstructor, prefs);
                    this.setupPlayer(player);
                },
                setupPlayerMarkers: function(player) {
                    var id = this.id;
                    player.setAttribute("myTubeActiveTubeId", id);
                    if (player.tagName == "EMBED") {
                        //sometime on firefox we dont get parentNode. I don't know why
                        var parentNode = player.parentNode;
                        if (parentNode && parentNode.tagName == "OBJECT") {
                            parentNode.setAttribute("myTubeActiveTubeId", id);
                        }
                    } else if (player.tagName == "OBJECT") {
                        var embed = player.getElementsByTagName("EMBED")[0];
                        if (embed) {
                            embed.setAttribute("myTubeActiveTubeId", id);
                        }
                    }
                },
                showError: function(errorMsg, isFatal) {
                    this.videoInitialized = true;
                    this.showPopup();
                    this._ui.showError(errorMsg, isFatal);
                },
                setupPlayer: function(player) {
                    var id = this.id;
                    try {
                        player.addEventListener("onStateChange", "MyTube.get('" + id + "').onStateChanged");
                    } catch (ex) {
                        this.showError("adblock_interferance_message", true);
                        return;
                    }
                    try {
                        player.addEventListener("onError", "MyTube.get('" + id + "').onError");
                        player.addEventListener("SIZE_CLICKED", "MyTube.get('" + id + "').onSizeClicked");
                        player.addEventListener("onPlaybackQualityChange", "MyTube.get('" + id + "').onPlaybackQualityChange");
                    } catch (e) {
                        //eat up these errors
                    }
                },
                setupUI: function(uiConstructor, prefs) {
                    var ui = this._ui = new uiConstructor(this.id, this, prefs);
                    ui.on("userAction", this.onUserAction, this);
                },
                cleanup: function(doNotCleanupPlayer, player) {
                    this.stopProcessing();
                    MyTube.remove(this);
                    this.cleanupUI();
                    if (!doNotCleanupPlayer) {
                        player = player || this.getPlayer(true);
                        if (player) {
                            this.cleanupPlayer(player);
                            this.cleanupPlayerMarkers(player);
                        }
                    }
                    this.destroyed = true;
                },
                cleanupUI: function() {
                    var ui = this._ui;
                    ui.un("userAction", this.onUserAction);
                    ui.destroy();
                    delete this._ui;
                },
                cleanupPlayer: function(player) {},
                cleanupPlayerMarkers: function(player) {
                    player.removeAttribute("myTubeActiveTubeId");
                    player.removeAttribute("myTubeId");
                    player.removeAttribute("myTubeProcessed");
                    player.removeAttribute("myTubeQualitySet");
                    if (player.tagName == "EMBED") {
                        //sometime on firefox we dont get parentNode. I don't know why
                        var parentNode = player.parentNode;
                        if (parentNode && parentNode.tagName == "OBJECT") {
                            parentNode.removeAttribute("myTubeActiveTubeId");
                        }
                    } else if (player.tagName == "OBJECT") {
                        var embed = player.getElementsByTagName("EMBED")[0];
                        if (embed) {
                            embed.removeAttribute("myTubeActiveTubeId");
                        }
                    }
                },
                getPlayer: function(doNotFireCleanup) {
                    if (this.destroyed) {
                        return null;
                    }
                    //Dont want to keep a reference to the dom and dom's id.
                    var player = MyTube.getDom(this.id, this.tags);
                    if (player == null && !doNotFireCleanup) {
                        this.cleanup(true);
                    }
                    return player;
                },
                userActions: {
                    loop: function(data) {
                        this.loop = data.val;
                    },
                    onlyNotification: function(data) {
                        this.onlyNotification = data.val;
                    },
                    play: function(data) {
                        var b = data.val;
                        var player = this.getPlayer();
                        if (player == null) {
                            return;
                        }
                        this.autoBuffer = b;
                        this.autoPlayOnBuffer = b;
                        if (b) {
                            var s = this.mediaType.getPlayerState(player);
                            if (s == 0) {
                                this.updateEstimated(-2);
                                this.playAfterBuffer();
                                return;
                            }
                            this.updateEstimated(-4);
                            if (this.noFirstRun) {
                                if (s != 3) {
                                    this.play();
                                } else {
                                    this.delayedBufferCheck = true;
                                }
                                return;
                            }
                            this.delayedBufferCheck = true;
                            this.checkForDelayedBuffer();
                        } else if (this.bufferCheckRunning || this.delayedBufferCheck) {
                            this.stopBufferCheck();
                            this.play();
                        }
                    },
                    autoPlayOnSmartBuffer: function(data) {
                        this.autoPlayOnSmartBuffer = data.val;
                    },
                    autoPlayOnBufferPercentage: function(data) {
                        this.autoPlayOnBufferPercentage = data.val;
                    }
                },
                onUserAction: function(action, data) {
                    var fn = this.userActions[action];
                    fn.call(this, data);
                },
                stopProcessing: function() {
                    this.stopBufferCheck();
                },
                interval: 1000,
                showPopup: function() {
                    if (!this.videoInitialized) {
                        return;
                    }
                    var player = this.getPlayer();
                    if (!player) {
                        return;
                    }
                    var playerBoxAttributes = NJS.Layout.boxAttributes(player);
                    playerBoxAttributes = this.fixPlayerBoxAttrubutes(playerBoxAttributes, player);
                    this._ui.showPopup(playerBoxAttributes);
                },
                fixPlayerBoxAttrubutes: function(playerBoxAttributes, player) {
                    if (MyTubePrefs.pageInfo.youTubeMakka && player.tagName == "VIDEO" && (MyTubePrefs.pageInfo.uiVersion() instanceof YouTubeUIVersion5)) {
                        playerBoxAttributes.height += 3;
                    }
                    return playerBoxAttributes;
                },
                hidePopup: function(delay) {
                    this._ui.hidePopup(delay);
                },
                startBufferCheck: function() {
                    if (this.bufferCheckRunning) return;
                    this.bufferCheckRunning = true;
                    this._o = {
                        tube: this
                    };
                    this._bufferCheck.call(this._o);
                },
                stopBufferCheck: function() {
                    this.bufferCheckRunning = false;
                    this.delayedBufferCheck = false;
                    if (this._o) {
                        this._o.stop = true;
                    }
                    delete this._o;
                },
                speedCheck: function(b) {
                    var player = this.getPlayer();
                    if (!player) {
                        return NaN;
                    }
                    var mediaType = this.mediaType;
                    var startBytes = mediaType.getVideoStartBytes(player);
                    var speedObjs = this._speedObjs = this._speedObjs || [];
                    var currSpeedObj = this._currSpeedObj;
                    if (currSpeedObj && startBytes != currSpeedObj.startBytes) {
                        currSpeedObj = null;
                    }
                    var bytesLoaded = mediaType.getVideoBytesLoaded(player);
                    if (!currSpeedObj) {
                        if (bytesLoaded > 0) {
                            currSpeedObj = this._currSpeedObj = {
                                startLoadBytes: (bytesLoaded < 0) ? 0 : bytesLoaded,
                                start: (new Date()).getTime(),
                                startBytes: startBytes
                            };
                        }
                    } else {
                        if (bytesLoaded > 0) {
                            var tB = mediaType.getVideoBytesTotal(player);
                            if (bytesLoaded < tB) {
                                var loaded = mediaType.getVideoBytesLoaded(player) - currSpeedObj.startLoadBytes;
                                if (loaded > 0) {
                                    //If video was loaded from cache
                                    if (!currSpeedObj.firstSetIgnored) {
                                        currSpeedObj.firstSetIgnored = true;
                                    } else {
                                        var elapsed = (new Date()).getTime() - currSpeedObj.start;
                                        var s = [elapsed, loaded];
                                        if (speedObjs.length < 99) {
                                            speedObjs.push(s);
                                        } else {
                                            this._speedObjs = speedObjs = speedObjs.splice(1);
                                            speedObjs.push(s);
                                        }
                                    }
                                }
                                currSpeedObj.startLoadBytes = mediaType.getVideoBytesLoaded(player);
                                currSpeedObj.start = (new Date()).getTime();
                            } else {
                                //this means that the video has been loaded
                                if (!b) {
                                    return NaN;
                                } else {
                                    return -1;
                                }
                            }
                        }
                    }
                    if (!b) {
                        return NaN;
                    }
                    if (speedObjs.length < 5) {
                        return NaN;
                    }
                    var to = el = 0;
                    for (var i = 0; i < speedObjs.length; i++) {
                        var o = speedObjs[i];
                        to += o[1];
                        el += o[0];
                    }
                    var ret = to * 1000 / el;
                    return ret;
                },
                turnOffAutoPlayOnBuffer: function() {
                    this.autoPlayOnBuffer = false;
                    this.stopBufferCheck();
                    this._ui.stop();
                    this.updateEstimated(-5);
                },
                _bufferCheck: function() {
                    var tube = this.tube;
                    var player = tube.getPlayer();
                    if (!player) {
                        return;
                    }
                    var mediaType = tube.mediaType;
                    if (this.stop) {
                        tube.updateEstimated(-3);
                        return;
                    }
                    var s = mediaType.getPlayerState(player);
                    if (s != 2) {
                        tube.turnOffAutoPlayOnBuffer();
                        tube.updateEstimated(-3);
                        return;
                    }
                    var fn = function(tube, scope) {
                            return (function() {
                                tube._bufferCheck.call(scope);
                            });
                        }(tube, this);
                    var loaded = false;
                    var tB = mediaType.getVideoBytesTotal(player);
                    var sB = mediaType.getVideoStartBytes(player);
                    //sometimes we get total bytes as the complete or sometimes we get total bytes for the portion of the video for which new request is sent (seek ahead).
                    var type = tube.getVideoTotalBytesType();
                    if (type == 2) {
                        tB = tB + sB;
                    } else if (type == 1) {} else if (MyTubePrefs.pageInfo.youTubeMakka) {
                        //can't find out. be safe. for embedded, don't add. For flashvars add.
                        tB = tB + sB;
                    }

                    var lB = mediaType.getVideoBytesLoaded(player);
                    if (lB <= 0) {
                        tube.updateEstimated(-1);
                        window.setTimeout(fn, tube.interval);
                        return;
                    }
                    if (tB <= sB + lB) {
                        loaded = true;
                    } else {
                        var d = mediaType.getDuration(player);
                        var c = mediaType.getCurrentTime(player);
                        if (!tube.autoPlayOnSmartBuffer) {
                            var x = (tB * (d - c));
                            x = (x * tube.autoPlayOnBufferPercentage) / 100;
                            var y = (d * (sB + lB) - c * tB);
                            if (y >= x) {
                                loaded = true;
                            } else {
                                var dwnSpeed = tube.speedCheck(true);
                                if (!isNaN(dwnSpeed)) {
                                    estimatedTime = (x - y) / (d * dwnSpeed);
                                } else {
                                    estimatedTime = -1;
                                }
                            }
                        } else {
                            var dwnSpeed = tube.speedCheck(true);
                            if (dwnSpeed == -1) {
                                loaded = true;
                            } else if (!isNaN(dwnSpeed)) {
                                var requiredBytes = ((tB - sB) * 110 / 100) - (dwnSpeed * (d - c));
                                if (lB >= requiredBytes) {
                                    loaded = true;
                                } else {
                                    estimatedTime = (requiredBytes - lB) / dwnSpeed;
                                }
                            } else {
                                estimatedTime = -1;
                            }
                        }
                    }
                    if (loaded) {
                        tube.turnOffAutoPlayOnBuffer();
                        tube.updateEstimated(-2);
                        tube.playAfterBuffer();
                        return;
                    } else {
                        tube.updateEstimated(estimatedTime);
                        window.setTimeout(fn, tube.interval);
                    }
                },
                playAfterBuffer: function() {
                    if (!this.onlyNotification) {
                        this.play();
                        return;
                    }
                    if (MyTubePrefs.soundNotificationSupported() && MyTubePrefs.prefs.soundNotification) {
                        var evt = document.createEvent("Events");
                        evt.initEvent("mytubenotify", true, false);
                        document.documentElement.dispatchEvent(evt);
                    }

                    var title;
                    if (MyTubePrefs.pageInfo.youTubeMakka && window.document.title) {
                        title = window.document.title.replace("YouTube - ", "");
                    }
                    this._ui.notify(title);
                },
                updateEstimated: function(est) {
                    this._ui.changeStatus(est);
                },
                play: function(b) {
                    if (b) {
                        this.suspendStopBuffer = true;
                    }
                    this.pgmAccess = true;
                    var player = this.getPlayer();
                    if (player) {
                        this.mediaType.playVideo(player);
                        //now it seems that for some video calling it twice makes it pause once it has been played. http://www.youtube.com/user/wilwheaton
                        //calling it once seems to work for now.
                        //for channel somehow calling it once does not work sometimes. Dont have time to debug now. http://www.youtube.com/user/andyKamezouV2#p/a/u/0/9UmwMpOeDrQ
                        //if (MyTubePrefs.pageInfo.channel) {
                        //this.mediaType.playVideo(player);
                        //}
                    }
                    if (b) {
                        this.suspendStopBuffer = false;
                    }
                },
                pause: function(b) {
                    if (b) {
                        this.suspendStopBuffer = true;
                    }
                    this.pgmAccess = true;
                    var player = this.getPlayer();
                    if (player) {
                        this.mediaType.pauseVideo(player);
                        //now it seems that for some video calling it twice makes it pause once it has been played. http://www.youtube.com/user/wilwheaton
                        //calling it once seems to work for now.
                        //for channel somehow calling it once does not work sometimes. Dont have time to debug now. http://www.youtube.com/user/andyKamezouV2#p/a/u/0/9UmwMpOeDrQ
                        //if (MyTubePrefs.pageInfo.channel) {
                        //this.mediaType.pauseVideo(player);
                        //}
                    }
                    if (b) {
                        this.suspendStopBuffer = false;
                    }
                },
                checkForDelayedBuffer: function(s) {
                    var delayedBufferCheck = this.delayedBufferCheck;
                    if (!delayedBufferCheck) {
                        return false;
                    }
                    var DOES_NOT_PAUSE_PROPERLY_FLAG = false;
                    if (this._DOES_NOT_PAUSE_PROPERLY_HANDLER) {
                        DOES_NOT_PAUSE_PROPERLY_FLAG = true;
                        this._DOES_NOT_PAUSE_PROPERLY_HANDLER.stop = true;
                        delete this._DOES_NOT_PAUSE_PROPERLY_HANDLER;
                    }
                    delete this.delayedBufferCheck;
                    //remove delayed pause.
                    delete this.delayedPauseCheck;
                    var player = this.getPlayer();
                    if (!player) {
                        return true;
                    }
                    s = s || this.mediaType.getPlayerState(player);
                    if (s == 3) {
                        this.delayedBufferCheck = true;
                        if (this._exceptionType == MyTube.exceptionTypes.DOES_NOT_PAUSE_PROPERLY) {
                            this.play();
                        }
                        return true;
                    } else if (s == 1) {
                        this.delayedBufferCheck = true;
                        this.pause();
                        return true;
                    } else if (s == 2) {
                        if (!DOES_NOT_PAUSE_PROPERLY_FLAG && this._exceptionType == MyTube.exceptionTypes.DOES_NOT_PAUSE_PROPERLY) {
                            var me = this;
                            var o = this._DOES_NOT_PAUSE_PROPERLY_HANDLER = {};
                            var fn = NJS.createDelegate(function() {
                                if (this.stop == true) {
                                    return;
                                }
                                me._ui.play();
                                me.delayedBufferCheck = true;
                                me.checkForDelayedBuffer();
                            }, o);
                            window.setTimeout(fn, 1000);
                        }
                        this.startBufferCheck();
                        return true;
                    }
                    return false;
                },
                checkForDelayedPause: function(s) {
                    var delayedPauseCheck = this.delayedPauseCheck;
                    delete this.delayedPauseCheck;
                    if (!delayedPauseCheck) {
                        return false;
                    }
                    var player = this.getPlayer();
                    if (!player) {
                        return true;
                    }
                    s = s || this.mediaType.getPlayerState(player);
                    if (s == 3) {
                        this.delayedPauseCheck = true;
                        return true;
                    } else if (s == 1) {
                        this.delayedPauseCheck = true;
                        this.pause();
                        return true;
                    }
                    return false;
                },
                onPlaybackQualityChange: function(str) {
                    var fn = this.getAfterFunction("playbackQualityChanged");
                    if (fn != null) {
                        fn.call(this, str != "mytubedummy");
                    }
                },
                getAfterFunction: function(id, dontDelete) {
                    this._afterFns = this._afterFns || {};
                    var o = this._afterFns[id];
                    if (o != null && dontDelete !== true) {
                        delete this._afterFns[id];
                    }
                    return o;
                },
                setAfterFunction: function(id, fn, overrideExisting) {
                    this._afterFns = this._afterFns || {};
                    var o = this._afterFns[id];
                    if (o != null && overrideExisting !== true) {
                        throw "after function for " + id + "already exists";
                    }
                    this._afterFns[id] = fn;
                },
                fixQuality: function(q, availableQs, currentQ) {
                    var defaultQ = 'default';
                    if (q == currentQ || q == defaultQ || q == null) {
                        return defaultQ;
                    }
                    if (availableQs == null) {
                        return defaultQ;
                    }
                    //sometimes we dont get an array back!!! what the hell! where the hell is matt embeded video
                    if (!(availableQs instanceof Array)) {
                        var t = [];
                        for (var i in availableQs) {
                            t.push(availableQs[i]);
                        }
                        availableQs = t;
                    }
                    if (availableQs.length <= 1) {
                        return defaultQ;
                    }
                    if (availableQs.indexOf(q) >= 0) {
                        return q;
                    }
                    var qs = ['highres', 'hd1080', 'hd720', 'large', 'medium', 'small'];
                    var i = qs.indexOf(q);
                    if (i == -1) {
                        return defaultQ;
                    }
                    var diff = 1;
                    q = defaultQ;
                    while (true) {
                        //check for one +
                        var j = i + diff;
                        if (j >= qs.length) {
                            break;
                        }
                        if (j < qs.length) {
                            q = qs[j];
                            if (availableQs.indexOf(q) >= 0) {
                                break;
                            }
                        }
                        diff++;
                    }
                    if (q == currentQ) {
                        return defaultQ;
                    }
                    return q;
                },
                setPlaybackQuality: function(q) {
                    if (q == "default" || q == null) {
                        this.onPlaybackQualityChange("mytubedummy");
                        return;
                    }
                    var player = this.getPlayer();
                    if (player == null) {
                        return;
                    }
                    var mediaType = this.mediaType;
                    q = this.fixQuality(q, mediaType.getAvailableQualityLevels(player), mediaType.getPlaybackQuality(player));
                    if (q == "default") {
                        this.onPlaybackQualityChange("mytubedummy");
                        return;
                    }
                    this.pgmAccess = true;
                    mediaType.setPlaybackQuality(player, q);
                },
                setVideoTotalBytesType: function(player) {
                    var vInfo = this._videoInfo = this._videoInfo || {};
                    if (vInfo.type) {
                        return;
                    }
                    var mediaType = this.mediaType;
                    var quality = mediaType.getPlaybackQuality(player);
                    if (quality == null) {
                        return;
                    }
                    var tB = mediaType.getVideoBytesTotal(player);
                    if (tB <= 0) {
                        return;
                    }
                    var sB = mediaType.getVideoStartBytes(player);
                    var vInfoQ = vInfo[quality];
                    if (vInfoQ == null) {
                        vInfo[quality] = {
                            tB: tB,
                            sB: sB
                        };
                        return;
                    }
                    if (vInfoQ.sB == sB) {
                        return;
                    } else if (vInfoQ.tB == tB) {
                        vInfo.type = 1; //this means that when seek ahead total bytes dont change.
                    } else {
                        vInfo.type = 2; //this means that when seek ahead total bytes change.
                    }
                },
                getVideoTotalBytesType: function() {
                    return this._videoInfo ? this._videoInfo.type : null;
                },
                setPlayerSize: function(player) {
                    return MyTubePrefs.pageInfo.uiVersion().setSize(this.playerSize);
                },
                onStateChanged: function(s) {
                    if (s == 2 && this.lastState == -1) {
                        this._exceptionType = MyTube.exceptionTypes.DOES_NOT_PAUSE_PROPERLY;
                    }
                    this._ui.closeAllNotificationWindows();
                    var player = this.getPlayer();
                    if (!player) {
                        return;
                    }
                    this.setVideoTotalBytesType(player);
                    var pgmAccess = this.pgmAccess;
                    this.pgmAccess = false;

                    var startBytes = this.mediaType.getVideoStartBytes(player);
                    var lastStartBytes = this.lastStartBytes;
                    this.lastStartBytes = startBytes;

                    var lastState = this.lastState;
                    this.lastState = s;

                    this.speedCheck();

                    if (!this.videoInitialized) {
                        this.noFirstRun = true;
                        this.videoInitialized = true;
                        var me = this;
                        var showPopup = function() {
                            me.showPopup();
                            me.hidePopup(3000);
                        };
                        if(this.setPlayerSize() || player.tagName == "VIDEO") {
                            window.setTimeout(showPopup, 1000);
                        } else {
                            showPopup();
                        }
                        if (this.saveBandwidth) {
                            if (this.autoBuffer) {
                                this.updateEstimated(-6);
                            } else if (this.autoPlay) {
                                this.updateEstimated(-7);
                            }
                        } else if (this.autoPlayOnBuffer) {
                            this.updateEstimated(-4);
                        }
                        if (s != 1) {
                            return;
                        }
                    }
                    if (this.checkForDelayedBuffer()) {
                        return;
                    }
                    if (this.checkForDelayedPause()) {
                        return;
                    }
                    //if the video is buffering or whatever and have not yet dont 'on play' things, return
                    if (s != 1 && this.noFirstRun) {
                        return;
                    }
                    if (s == 1 && this.noFirstRun) {
                        this.updateEstimated(-8);
                        delete this.noFirstRun;
                        var q = (player.getAttribute("myTubeQualitySet") == "true") ? "default" : this.quality;
                        var fn = null;
                        if (this.autoBuffer) {
                            if (this.autoPlayOnBuffer) {
                                if (this.saveBandwidth) {
                                    this._ui.play();
                                }
                                this.updateEstimated(-1);
                                this.delayedBufferCheck = true;
                                fn = function(b) {
                                    if (!b) {
                                        this.checkForDelayedBuffer();
                                    }
                                };
                            } else {
                                this.delayedPauseCheck = true;
                                fn = function(b) {
                                    if (!b) {
                                        this.checkForDelayedPause();
                                    }
                                };
                            }
                        }
                        if (q) {
                            this.setAfterFunction('playbackQualityChanged', function(fn) {
                                return (function(b) {
                                    fn && fn.call(this, b);
                                });
                            }(fn));
                            this.setPlaybackQuality(q);
                        } else {
                            fn && fn.call(this, false);
                        }
                        return;
                    }
                    if (s == 0 && this.loop) {
                        var fn = function(tube) {
                                return (function() {
                                    tube.play();
                                });
                            }(this);
                        window.setTimeout(fn, 100);
                    }
                    if (!(s == 2 && s == lastState && startBytes == lastStartBytes)) {
                        this.turnOffAutoPlayOnBuffer();
                    }
                },
                onSizeClicked: function() {
                    this.hidePopup(1);
                },
                onError: NJS.emptyFn
            });
            var MyTubeUI = NJS.define({
                superclass: NJS.Observable,
                events: ["userAction"],
                constructor: function(id, tube, prefs) {
                    MyTubeUI.superclass.constructor.call(this, {});
                    MyTubePrefs.on("preferencesUpdated", this._prefsListener, this);
                    MyTubePrefs.on("notificationPermissionsChanged", this._setNotifcationIcon, this);
                    this.id = id;
                    this._prefs = prefs;
                },
                _getPopupDiv: function() {
                    if (this._destroyed) {
                        return null;
                    }
                    if (this._popup) {
                        return this._popup;
                    }
                    var me = this;
                    var prefs = this._prefs;

                    var div = document.createElement("div");
                    this._popup = div;
                    div.id = this.id + "popup";
                    div.setAttribute("myTubeActiveTubeId", this.id);
                    div.className = "mytube-div";
                    div.style.position = "absolute";
                    div.style.display = "none";
                    div.style.zIndex = "99999";
                    var a = "<table>";
                    var bundle = MyTubePrefs.bundle;
                    a += "<tr class='first-tr'><td class='first-td'><label id='" + this.id + "loop-container' for='" + this.id + "loop' class='mytube-styled-checkbox'><input type='checkbox' id='" + this.id + "loop' class='mytube-icon-checkbox'/></label></td><td class='last-td'><div><label for='" + this.id + "loop'>" + bundle.loop + "</label></div></td></tr>";
                    a += "<tr><td class='first-td' rowspan='3'><label id='" + this.id + "autoPlayOnBuffer-container' for='" + this.id + "autoPlayOnBuffer' class='mytube-styled-checkbox'><input type='checkbox' id='" + this.id + "autoPlayOnBuffer'/></label></td><td class='last-td'><div><label for='" + this.id + "autoPlayOnBuffer'>" + bundle.start_playing_when_buffered + "</label> (<input type='checkbox' id='" + this.id + "onlyNotification'/> <label for='" + this.id + "onlyNotification'>" + bundle.only_notify + "</label> <div class='inline' id='" + this.id + "desktopNotificationIconSpan'></div>) " + bundle.continuation_on_next_line + "</div></td></tr>";
                    a += "<tr><td class='last-td'><div><input type=text style='width:30px;' maxlength='3' id='" + this.id + "autoPlayOnBufferPercentage' />&nbsp;" + bundle.percentage + "&nbsp;&nbsp;&nbsp;<input type=checkbox id='" + this.id + "autoPlayOnSmartBuffer' /> <div class='inline'><label for='" + this.id + "autoPlayOnSmartBuffer'>" + bundle.smart_buffer + "</label></div></div></td></tr>";
                    a += "<tr><td class='last-td'><div><div class='inline'>" + bundle.estimated_time + bundle.label_delimitor + " </div><div class='inline' id='" + this.id + "estimated'>&nbsp;</div></div></td></tr>";
                    a += "<tr class='last-tr'><td class='last-td' colspan='2' style='height:20px;text-align:right'><div><div class='inline settings-span' id='" + this.id + "prefs'>" + bundle.global_preferences + "</div></div></td></tr></table>";
                    div.innerHTML = a;
                    document.body.appendChild(div);

                    var c = document.getElementById(this.id + "prefs");
                    var f = function() {
                            MyTubePrefs.showGlobalSettings();
                        }
                    c.addEventListener("click", f, true);

                    c = document.getElementById(this.id + "loop");
                    c.checked = prefs.loop;
                    var container = document.getElementById(this.id + "loop-container");
                    container.className = "mytube-styled-checkbox " + (c.checked ? "mytube-repeat" : "mytube-no-repeat");
                    f = function(c, container) {
                        return (function() {
                            var b = c.checked;
                            container.className = "mytube-styled-checkbox " + (b ? "mytube-repeat" : "mytube-no-repeat");
                            prefs.loop = b;
                            me.fire("userAction", "loop", {
                                val: b
                            });
                        });
                    }(c, container);
                    c.addEventListener("click", f, true);

                    c = document.getElementById(this.id + "onlyNotification");
                    if (MyTubePrefs.anyNotificationSupported()) {
                        c.checked = prefs.onlyNotification;
                        f = function(c) {
                            return (function() {
                                var b = c.checked;
                                prefs.onlyNotification = b;
                                me.fire("userAction", "onlyNotification", {
                                    val: b
                                });
                            });
                        }(c);
                        c.addEventListener("click", f, true);
                    } else {
                        c.disabled = true;
                        c.title = bundle.no_notification_supported;
                    }

                    c = document.getElementById(this.id + "autoPlayOnBuffer");
                    c.checked = prefs.autoPlayOnBuffer && !prefs.saveBandwidth;
                    container = document.getElementById(this.id + "autoPlayOnBuffer-container");
                    container.className = "mytube-styled-checkbox " + (c.checked ? "mytube-stop" : "mytube-play");
                    f = function(c, container) {
                        return (function() {
                            var b = c.checked;
                            container.className = "mytube-styled-checkbox " + (b ? "mytube-stop" : "mytube-play");
                            me.fire("userAction", "play", {
                                val: b
                            });
                            prefs.autoPlayOnBuffer = b;
                        });
                    }(c, container);
                    c.addEventListener("click", f, true);
                    c = document.getElementById(this.id + "autoPlayOnSmartBuffer");
                    c.checked = prefs.autoPlayOnSmartBuffer;
                    f = function(c) {
                        return (function() {
                            var b = c.checked;
                            prefs.autoPlayOnSmartBuffer = b;
                            document.getElementById(me.id + "autoPlayOnBufferPercentage").disabled = b;
                            me.fire("userAction", "autoPlayOnSmartBuffer", {
                                val: b
                            });
                        });
                    }(c);
                    c.addEventListener("click", f, true);
                    c = document.getElementById(this.id + "autoPlayOnBufferPercentage");
                    c.value = prefs.autoPlayOnBufferPercentage;
                    if (prefs.autoPlayOnSmartBuffer) {
                        c.disabled = true;
                    }
                    f = function(c) {
                        return (function() {
                            var val = parseInt(c.value);
                            if (isNaN(val) || val < 0 || val > 100) {
                                c.value = prefs.autoPlayOnBufferPercentage;
                                c.select();
                                c.focus();
                            } else {
                                c.value = val;
                                if (val != prefs.autoPlayOnBufferPercentage) {
                                    prefs.autoPlayOnBufferPercentage = val;
                                    me.fire("userAction", "autoPlayOnBufferPercentage", {
                                        val: val
                                    });
                                }
                            }
                        });
                    }(c);
                    c.addEventListener("blur", f, true);
                    this._setNotifcationIcon();
                    return this._popup;
                },
                showPopup: function(playerBoxAttributes) {
                    this._stopHide = true;
                    if (this._popupVisible) {
                        return;
                    }
                    var popup = this._getPopupDiv();
                    if (!popup) {
                        return;
                    }
                    if (MyTubePrefs.prefs.hidePopup) {
                        return;
                    }
                    this._popupVisible = true;

                    var t = (playerBoxAttributes.top + playerBoxAttributes.height - 1) + "px";
                    var l = (playerBoxAttributes.left - 1) + "px";
                    var w = (playerBoxAttributes.width - 2) + "px";
                    popup.style.top = t;
                    popup.style.left = l;
                    popup.style.display = "";
                    popup.style.width = w;
                },
                hidePopup: function(delay) {
                    this._stopHide = false;
                    var me = this;
                    var fn = function() {
                        return (function() {
                            me._hidePopup();
                        });
                    }();
                    delay = parseInt(delay);
                    delay = isNaN(delay) ? 800 : (delay < 1 ? 1: delay);
                    window.setTimeout(fn, delay);
                },
                _hidePopup: function() {
                    if (this._stopHide) {
                        return;
                    };
                    if (!this._popupVisible) return;
                    this._popupVisible = false;
                    if (this._popup) {
                        this._popup.style.display = "none";
                    }
                },
                destroy: function() {
                    MyTubePrefs.un("preferencesUpdated", this._prefsListener);
                    MyTubePrefs.un("notificationPermissionsChanged", this._setNotifcationIcon);
                    delete this._prefs;
                    delete this._stopHide;
                    delete this._popupVisible;
                    var div = this._popup;
                    if (div) {
                        div && div.parentNode && div.parentNode.removeChild(div);
                        delete this._popup;
                    }
                    this.purgeListeners();
                    this._destroyed = true;
                },
                _setNotifcationIcon: function() {
                    var bundle = MyTubePrefs.bundle;
                    var iconSpan = document.getElementById(this.id + "desktopNotificationIconSpan");

                    var notificationType = 1;
                    var resultantSoundPermission = false;
                    var title = bundle.sound + bundle.label_delimitor + " ";
                    if (!MyTubePrefs.soundNotificationSupported()) {
                        title += bundle.not_supported;
                        notificationType = 2;
                    } else {
                        if (MyTubePrefs.prefs.soundNotification) {
                            title += bundle.on;
                            resultantSoundPermission = true;
                        } else {
                            title += bundle.off;
                        }
                    }
                    var resultantDesktopNotificationPermission = false;
                    if (MyTube.extensionType == "chrome") {
                        title += bundle.notification_status_delimitor + " " + bundle.desktop_notification + bundle.label_delimitor + " ";
                        if (!MyTubePrefs.desktopNotificationSupported()) {
                            title += bundle.not_supported;
                            notificationType = 2;
                        } else {
                            if (!MyTubePrefs.prefs.desktopNotification) {
                                title += bundle.off;
                            } else {
                                var p = window.webkitNotifications.checkPermission();
                                if (p == 0) {
                                    title += bundle.on;
                                    resultantDesktopNotificationPermission = true;
                                } else if (p == 1) {
                                    var notificationType = 3;
                                    title += bundle.click_to_enable_for_this_site;
                                    resultantDesktopNotificationPermission = true;
                                } else if (p == 2) {
                                    var notificationType = 2;
                                    title += bundle.desktop_notification_denied;
                                }
                            }
                        }
                    }
                    if (!resultantDesktopNotificationPermission && !resultantSoundPermission) {
                        notificationType = 4;
                    }
                    iconSpan.title = title;
                    if (iconSpan.getAttribute("notificationType") == String(notificationType)) {
                        return;
                    }
                    iconSpan.setAttribute("notificationType", String(notificationType));
                    var status = "";
                    if (notificationType == 1) {
                        status = "information";
                    } else if (notificationType == 2 || notificationType == 3) {
                        status = "error";
                    } else if (notificationType == 4) {
                        status = "exclamation";
                    }
                    iconSpan.className = "mytube-notification-status mytube-notification-status-" + status;

                    if (notificationType == 3) {
                        iconSpan.style.cursor = "pointer";
                        iconSpan.addEventListener("click", MyTubePrefs.getNotificationPermission, true);
                    } else {
                        iconSpan.style.cursor = "";
                        iconSpan.removeEventListener("click", MyTubePrefs.getNotificationPermission, true);
                    }
                },
                _prefsListener: function() {
                    this._setNotifcationIcon();
                },
                stop: function() {
                    var checkBox = document.getElementById(this.id + "autoPlayOnBuffer");
                    if (checkBox) {
                        checkBox.checked = false;
                        var container = document.getElementById(this.id + "autoPlayOnBuffer-container");
                        container.className = "mytube-styled-checkbox mytube-play";
                    }
                },
                play: function() {
                    var checkBox = document.getElementById(this.id + "autoPlayOnBuffer");
                    if (checkBox) {
                        checkBox.checked = true;
                        var container = document.getElementById(this.id + "autoPlayOnBuffer-container");
                        container.className = "mytube-styled-checkbox mytube-stop";
                    }
                },
                addNotificationWindowToWatch: function(nWindow) {
                    var notificationWindows = this._notificationWindows = this._notificationWindows || [];
                    notificationWindows.push(nWindow);
                    var me = this;
                    nWindow.addEventListener("close", function(e) {
                        me.removeNotificationWindow(e.target);
                    }, false);
                },
                closeAllNotificationWindows: function() {
                    var notificationWindows = this._notificationWindows;
                    if (NJS.isNullOrEmpty(notificationWindows)) {
                        return;
                    }
                    for (var i = 0; i < notificationWindows.length; i++) {
                        notificationWindows[i].cancel();
                    }
                },
                removeNotificationWindow: function(nWindow) {
                    var notificationWindows = this._notificationWindows;
                    if (NJS.isNullOrEmpty(notificationWindows)) {
                        return;
                    }
                    NJS.removeItem(notificationWindows, nWindow);
                },
                notify: function(title) {
                    if (!MyTubePrefs.desktopNotificationSupported() || !MyTubePrefs.prefs.desktopNotification) {
                        return;
                    }
                    var p = window.webkitNotifications.checkPermission();
                    if (p == 0) {
                        var bundle = MyTubePrefs.bundle;
                        title = title || "SmartVideo " + bundle.hyphen + " " + bundle.video_buffered;
                        this.closeAllNotificationWindows();
                        var nWindow = this._notificationWindow = window.webkitNotifications.createNotification('chrome-extension://' + bundle.extension_id + '/icons/icon-32.png', title, bundle.buffered_message);
                        this.addNotificationWindowToWatch(nWindow);
                        nWindow.show();
                    } else if (p == 1) {
                        try {
                            MyTubePrefs.getNotificationPermission();
                        } catch (ex) {}
                    }
                },
                showError: function(errorMsg, isFatal) {
                    var table = document.getElementById(this.id + "popup").getElementsByTagName("table")[0];
                    if (!table) {
                        return;
                    }
                    var trs = table.rows;

                    var bundle = MyTubePrefs.bundle;
                    var errorStr = bundle.error + bundle.label_delimitor + "&nbsp;" + bundle[errorMsg];

                    var tr = document.createElement("tr");
                    tr.innerHTML = "<td class='last-td' colspan='2'><div><div class='inline error-msg'>" + errorStr + "</div></div></td></tr>";
                    var lastRow = trs[trs.length - 1];
                    lastRow.parentNode.insertBefore(tr, lastRow);

                    if (!isFatal) {
                        return;
                    }
                    while (trs.length > 2) {
                        var tr = trs[0];
                        tr.parentNode.removeChild(tr);
                    }
                },
                changeStatus: function(status) {
                    if (typeof status == "number") {
                        status = this.convertEstimated(status);
                    } else if (status != "") {
                        status = MyTubePrefs.bundle[status];
                    }
                    if (status == null) {
                        return;
                    }
                    var div = document.getElementById(this.id + "estimated");
                    if (!div) {
                        return;
                    }
                    div.innerHTML = "&nbsp;" + status;
                },
                nextProgressMarker: function() {
                    if (this._progressMarker) {
                        this._progressMarker = this._progressMarker.nextMarker;
                    } else {
                        this._progressMarker = ProgressMarker;
                    }
                    return this._progressMarker;
                },
                convertEstimated: function(est) {
                    var lastEst = this.lastEst;
                    this.lastEst = est;
                    if (est == -5) {
                        //only set if we were actually working on some buffering calculation.
                        if (lastEst == null || lastEst == -2 || lastEst == -3 || lastEst == -5 || lastEst == -6 || lastEst == -7 || lastEst == -8) {
                            return null;
                        }
                        est = -3;
                    }
                    if (est == lastEst && est != -1 && est != -4) {
                        return null;
                    }
                    if (est == -2 || est == -3) {
                        delete this._progressMarker;
                    }
                    var bundle = MyTubePrefs.bundle;
                    if (est == -1) {
                        return bundle.calculating + "&nbsp;&nbsp;" + this.nextProgressMarker().str;
                    }
                    if (est == -2) {
                        return bundle.completed + ".";
                    }
                    if (est == -3) {
                        return bundle.stopped + ".";
                    }
                    if (est == -4) {
                        return bundle.waiting + "&nbsp;&nbsp;" + this.nextProgressMarker().str;;
                    }
                    if (est == -6) {
                        return bundle.will_start_buffering_when_initialized + ".";
                    }
                    if (est == -7) {
                        return bundle.will_start_playing_when_initialized + ".";
                    }
                    if (est == -8) {
                        return "";
                    }
                    var str = "";
                    est = est.toFixed(0);
                    var seconds = est % 60;
                    est = (est - seconds) / 60;
                    var minutes = est % 60;
                    var hours = (est - minutes) / 60;
                    if (hours > 0) {
                        str += hours + "&nbsp;" + bundle.hr + "&nbsp;&nbsp;";
                    }
                    if (minutes > 0) {
                        str += minutes + "&nbsp;" + bundle.min + "&nbsp;&nbsp;";
                    }
                    if (seconds > 0) {
                        str += seconds + "&nbsp;" + bundle.sec + "&nbsp;&nbsp;";
                    }
                    str = (str == "") ? bundle.any_moment + "&nbsp;&nbsp;" : str;
                    return str + this.nextProgressMarker().str;
                }
            });
            NJS.apply(MyTube, {
                exceptionTypes: {
                    /*
                    This kind of videos dont pause property. They go from -1 to 2 state direclty and then somehow after 2 they go to state 3. weird.
                    ex: http://www.youtube.com/watch?v=9UE-LcQ5NNg
                    */
                    DOES_NOT_PAUSE_PROPERLY: "DOES_NOT_PAUSE_PROPERLY"
                },
                onMyTubePlayerReady: function(pId) {
                    var dom = this.getDom(pId);
                    if (!dom) {
                        return;
                    }
                    var tube = this.get(pId);
                    if (tube) {
                        tube.cleanup(true);
                    }
                    this.createTubeInstance(pId, dom);
                },
                createTubeInstance: function(pId, dom) {
                    var tagName = dom.tagName;
                    var playerConstructor = MyTube;
                    if (tagName == "VIDEO") {
                        playerConstructor = MyTubeHTML5;
                    }
                    var uiConstructor = this.getUIConstructor(dom);
                    var prefs = NJS.apply({}, MyTubePrefs.prefs, ["hidePopup", "enable", "enableFullScreen", "fshd", "desktopNotification", "soundNotification"]);
                    new playerConstructor(pId, dom, uiConstructor, prefs);
                },
                getUIConstructor: function(dom) {
                    if (window.parent == window || !window.postMessage) {
                        return MyTubeUI;
                    }
                    if (dom.clientHeight - window.innerHeight < 30) {
                        return MyTubeUIAdapterForIFrame;
                    }
                    if (MyTubePrefs.pageInfo.youTubeFrame) {
                        return MyTubeUIAdapterForIFrame;
                    }
                    return MyTubeUI;
                },
                _tubes: {},
                get: function(id) {
                    return this._tubes[id];
                },
                forAllTubes: function(fn) {
                    var tubes = this._tubes;
                    for (var i in tubes) {
                        if (tubes.hasOwnProperty(i)) {
                            fn.call(tubes[i], Array.prototype.slice.call(arguments, 1));
                        }
                    }
                },
                put: function(tube) {
                    if (!tube.id) {
                        var id = this._n = this._n ? (this._n + 1) : 1;
                        tube.id = "tube" + id;
                    }
                    this._tubes[tube.id] = tube;
                    return tube;
                },
                remove: function(tube) {
                    delete this._tubes[tube.id];
                },
                cleanup: function(doNotCleanupPlayer) {
                    var tubes = this._tubes;
                    this.forAllTubes(MyTube.prototype.cleanup, doNotCleanupPlayer);
                },
                init: function() {
                    if (this._initialized) {
                        return;
                    }
                    this._initialized = true;
                    window.MyTube = {
                        get: function(id) {
                            var tube = MyTube.get(id);
                            return ({
                                onStateChanged: function() {
                                    tube.onStateChanged.apply(tube, arguments);
                                },
                                onError: function() {
                                    tube.onError.apply(tube, arguments);
                                },
                                onSizeClicked: function() {
                                    tube.onSizeClicked.apply(tube, arguments);
                                },
                                onPlaybackQualityChange: function() {
                                    tube.onPlaybackQualityChange.apply(tube, arguments);
                                }
                            });
                        }
                    };
                    this.onMouseOver = NJS.createDelegate(this.onMouseOver, this);
                    this.domNodeRemoved = NJS.createDelegate(this.domNodeRemoved, this);
                    window.document.addEventListener("mouseover", this.onMouseOver, false);
                    window.document.addEventListener('DOMNodeRemoved', this.domNodeRemoved, false);
                    window.document.addEventListener('DOMNodeRemovedFromDocument', this.domNodeRemoved, false);
                },
                videoElementRemoved: function(el) {
                    var tubeId = el.getAttribute("myTubeActiveTubeId");
                    if (!tubeId) {
                        return;
                    }
                    var tube = this.get(tubeId);
                    if (!tube) {
                        return;
                    }
                    tube.cleanup(false, el);
                },
                domNodeRemoved: function(e) {
                    var t = e.target;
                    var nodeName = t.nodeName;
                    if (nodeName == 'EMBED' || nodeName == 'OBJECT' || nodeName == "VIDEO" || nodeName == "IFRAME") {
                        this.videoElementRemoved(t);
                    }
                    if (!t.getElementsByTagName) {
                        return;
                    }
                    var fn = function(tagName) {
                            var ts = t.getElementsByTagName(tagName);
                            for (var i = 0; i < ts.length; i++) {
                                this.videoElementRemoved(ts[i]);
                            }
                        };
                    fn.call(this, "EMBED");
                    fn.call(this, "OBJECT");
                    fn.call(this, "VIDEO");
                    fn.call(this, "IFRAME");
                },
                setTubeReadyListener: function() {
                    var readyFnName = MyTubePrefs.pageInfo.channel ? "onChannelPlayerReady" : "onYouTubePlayerReady";
                    MyTube.readyFn = window[readyFnName];
                    var getterFn = function() {
                            return (function(tubeId) {
                                if (tubeId == null || tubeId.indexOf("mytube") == -1) {
                                    window.MyTubeBootstrap.transformAbandoned();
                                    return;
                                }
                                if (MyTube.onMyTubePlayerReady.apply(MyTube, arguments) == false) {
                                    return;
                                }
                                if (MyTube.readyFn) {
                                    MyTube.readyFn.apply(this, arguments);
                                }
                            });
                        };
                    window.__defineGetter__("onMyTubePlayerReady", getterFn);
                    var setterFn = function(fn) {
                            MyTube.readyFn = fn;
                        };
                    MyTube.readyFn = window[readyFnName];
                    delete window[readyFnName];
                    try {
                        window.__defineSetter__(readyFnName, setterFn);
                        window.__defineGetter__(readyFnName, getterFn);
                    } catch (ex) {}
                },
                getDom: function(id, tags) {
                    if (!tags) {
                        return this.getDom(id, ["EMBED", "OBJECT", "VIDEO", "IFRAME"]);
                    }
                    var fn = function(tag) {
                            var els = document.getElementsByTagName(tag);
                            for (var i = 0; i < els.length; i++) {
                                var el = els[i];
                                if (el.getAttribute("myTubeId") == id) {
                                    this.found = el;
                                    return true;
                                }
                            }
                            return false;
                        }
                    var o = {};
                    NJS.arrayFilter(tags, fn, {
                        breakOnFirst: true,
                        scope: o
                    });
                    return o.found;
                },
                onMouseOver: function(e) {
                    try {
                        var to = e.target;
                        while (to && to.getAttribute && to.tagName != "HTML" && to.tagName != "BODY" && !to.getAttribute("myTubeActiveTubeId")) {
                            to = to.parentNode;
                        }
                        var from = e.relatedTarget;
                        while (from && from.getAttribute && from.tagName != "HTML" && from.tagName != "BODY" && !from.getAttribute("myTubeActiveTubeId")) {
                            from = from.parentNode;
                        }
                        var toId = (to && to.getAttribute) ? to.getAttribute("myTubeActiveTubeId") : null;
                        var fromId = (from && from.getAttribute) ? from.getAttribute("myTubeActiveTubeId") : null;
                        if (toId == null && fromId == null) {
                            return;
                        }
                        if (toId == fromId) {
                            return;
                        }
                        var tube;
                        if (toId) {
                            tube = this.get(toId);
                            tube.showPopup();
                        }
                        if (fromId) {
                            tube = this.get(fromId);
                            tube.hidePopup();
                        }
                    } catch (e) {}
                }
            });
            var HTML5Media = {
                getVideoStartBytes: function(player) {
                    try {
                        return player.buffered.start();
                    } catch (ex) {
                        return -1;
                    }
                },
                getVideoBytesLoaded: function(player) {
                    try {
                        var b = player.buffered;
                        return b.end() - b.start();
                    } catch (ex) {
                        return -1;
                    }
                },
                getVideoBytesTotal: function(player) {
                    try {
                        return player.duration;
                    } catch (ex) {
                        return -1;
                    }
                },
                getPlayerState: function(player) {
                    var state = player.getAttribute("myTubeState");
                    if (state == null) {
                        return -1;
                    }
                    return Number(state);
                },
                setPlayerState: function(player, state) {
                    state = state || -1;
                    player.setAttribute("myTubeState", state);
                },
                getDuration: function(player) {
                    try {
                        return player.duration;
                    } catch (ex) {
                        return -1;
                    }
                },
                getCurrentTime: function(player) {
                    try {
                        return player.currentTime;
                    } catch (ex) {
                        return -1;
                    }
                },
                playVideo: function(player) {
                    player.play();
                },
                pauseVideo: function(player) {
                    player.pause();
                },
                getAvailableQualityLevels: function(player) {
                    return [];
                },
                getPlaybackQuality: function(player) {
                    return null;
                },
                setPlaybackQuality: NJS.emptyFn
            };
            var MyTubeHTML5 = NJS.define({
                mediaType: HTML5Media,
                tags: ["VIDEO"],
                constructor: function(id, player, uiConstructor, prefs) {
                    prefs.saveBandwidth = false;
                    prefs.quality = null;
                    MyTubeHTML5.superclass.constructor.call(this, id, player, uiConstructor, prefs);
                    player.parentNode.setAttribute("myTubeActiveTubeId", id);
                },
                superclass: MyTube,
                onFirstTimePlay: function() {},
                setupPlayer: function(player) {
                    //no quality change support as of now for html5 video.
                    this.quality = null;
                    var me = this;
                    var events = [
                        ["playing", 1],
                        ["pause", 2],
                        ["ended", 0],
                        ["waiting", 3],
                        ["loadedMetadata", 5]
                    ];
                    for (var i = 0; i < events.length; i++) {
                        var event = events[i];
                        player.addEventListener(event[0], function(id) {
                            return (function() {
                                me.mediaType.setPlayerState(player, id);
                                me.onStateChanged(id);
                            })
                        }(event[1]), false);
                    }
                },
                getVideoTotalBytesType: function() {
                    return 1;
                },
                setVideoTotalBytesType: NJS.emptyFn,
                cleanupPlayer: function(player) {
                    player.removeAttribute("myTubeState");
                    player.parentNode.removeAttribute("myTubeActiveTubeId");
                }
            });
            var MyTubeTransmitter = function() {
                    var id;
                    var transmitterObjects = [];
                    var jobQueueForMessagesToParent = new NJS.JobQueue({
                        id: "jobQueueForMessagesToParent",
                        startPaused: true
                    });
                    var jobQueueForMessagesToChild = new NJS.JobQueue({
                        id: "jobQueueForMessagesToChild",
                        startPaused: true
                    });
                    var init = function() {
                            jobQueueForMessagesToChild.resume();
                            if (window.parent != window) {
                                transmit("initFrames", "parent");
                            }
                            window.addEventListener("message", receiveMessage, false);
                        };
                    var initFrames = function() {
                            var ifrs = document.getElementsByTagName("IFRAME");
                            for (var i = 0; i < ifrs.length; i++) {
                                var ifr = ifrs[i];
                                var myTubeId = ifr.getAttribute("myTubeId");
                                if (myTubeId == null) {
                                    myTubeId = NJS.unique("mytube");
                                    ifr.setAttribute("myTubeId", myTubeId);
                                }
                                transmit("id", myTubeId, {
                                    id: myTubeId
                                });
                            }
                        };
                    var validateMessage = function(message) {
                            var reg = /^[\sa-z0-9\-\._,"'\:\{\}\[\]]*$/i;
                            if (!reg.test(message)) {
                                throw "Invalid message sent from SmartVideo. Message:" + message;
                            }
                        }
                    var receiveMessage = function(e) {
                            var data = e.data;
                            var toks = data.split("::");
                            if (toks[0] != "mytube") {
                                return;
                            }
                            validateMessage(data);
                            //console.log("recieving: "  + data + "["  + window.location.href + "]");
                            var message = toks[1];
                            var senderId = toks[2];
                            var data = toks[3];
                            if (NJS.isNullOrEmpty(data)) {
                                data = {};
                            } else {
                                data = JSON.parse(data);
                            }
                            if (message == "id") {
                                //has been initialized
                                if (id != null) {
                                    return;
                                }
                                id = data.id;
                                jobQueueForMessagesToParent.resume();
                                return;
                            }
                            if (message == "initFrames") {
                                initFrames();
                                return;
                            }
                            if (message == "createTube") {
                                MyTube.init();
                                var player = MyTube.getDom(senderId, ["IFRAME"]);
                                if (player) {
                                    new MyTubeAdapterForIFrame(senderId, player, MyTubeUI, data.prefs, data.positionHints);
                                }
                                return;
                            }
                            var transmitterId = senderId == "parent" ? "MyTubeUIAdapterForIFrame" : senderId;
                            var t = transmitterObjects[transmitterId];
                            if (t) {
                                t.receive(message, data);
                            }
                        };
                    var transmit = function(message, toId, data) {
                            var senderId = id;
                            data = JSON.stringify(data || {});
                            var senderId = id;
                            var w = window.parent;
                            toId = toId || "";

                            if (toId != "parent") {
                                senderId = "parent";
                                w = MyTube.getDom(toId, ["IFRAME"]).contentWindow;
                            }
                            var d = "mytube::" + message + "::" + senderId + "::" + data;
                            //console.log("transmitting to : " + toId + "::: " + d + "["  + window.location.href + "]");
                            w.postMessage(d, "*");
                        };
                    window.postMessage && init();
                    return ({
                        transmit: function(message, toId, data) {
                            var job = new NJS.Job({
                                onStart: function() {
                                    transmit(message, toId, data);
                                    this.end();
                                }
                            });
                            if (toId == "parent") {
                                jobQueueForMessagesToParent.queue(job);
                            } else {
                                jobQueueForMessagesToChild.queue(job);
                            }
                        },
                        register: function(o) {
                            transmitterObjects[o.id] = o;
                        },
                        deregister: function(o) {
                            delete transmitterObjects[o.id];
                        }
                    });
                }();
            var MyTubeTransmitterObject = NJS.define({
                constructor: function(signals) {
                    if (signals) {
                        this.signals = signals;
                    }
                },
                receive: function(signal, data) {
                    var fn = this.signals[signal];
                    fn.call(this.mimiced || this, data);
                },
                transmit: function(message, toId, data) {
                    MyTubeTransmitter.transmit(message, toId, data);
                },
                mimicMe: function(who) {
                    this.mimiced = who;
                    var signals = who.signals;
                    if (signals) {
                        this.signals = who.signals;
                    }
                    NJS.mimicIf(who, this, {
                        includes: ["receive", "transmit"]
                    });
                }
            });
            var MyTubeAdapterForIFrame = NJS.define({
                tags: ["IFRAME"],
                superclass: MyTube,
                constructor: function(id, player, constructor, prefs, positionHints) {
                    this._positionHints = positionHints;
                    MyTubeAdapterForIFrame.superclass.constructor.apply(this, arguments);
                    (new MyTubeTransmitterObject()).mimicMe(this);
                    MyTubeTransmitter.register(this);
                    this.videoInitialized = true;
                },
                onUserAction: function(action, data) {
                    this.transmit("userAction", this.id, {
                        action: action,
                        data: data
                    });
                },
                signals: {
                    notify: function(data) {
                        this._ui.notify(data.val);
                    },
                    stop: function(data) {
                        this._ui.stop();
                    },
                    play: function(data) {
                        this._ui.play();
                    },
                    hidePopup: function(data) {
                        this._ui.hidePopup(data.delay);
                    },
                    showPopup: function(data) {
                        this.showPopup();
                    },
                    changeStatus: function(data) {
                        this._ui.changeStatus(data.val);
                    },
                    destroy: function(data) {
                        this.cleanup();
                    },
                    closeAllNotificationWindows: function(data) {
                        this._ui.closeAllNotificationWindows();
                    },
                    showError: function(data) {
                        this._ui.showError(data.errorMsg, data.isFatal);
                    }
                },
                stopProcessing: function() {
                    MyTubeTransmitter.deregister(this);
                },
                fixPlayerBoxAttrubutes: function(playerBoxAttributes, player) {
                    var positionHints = this._positionHints;
                    playerBoxAttributes.width = positionHints.width;
                    playerBoxAttributes.left += positionHints.left;
                    return playerBoxAttributes;
                },
                setupPlayer: NJS.emptyFn,
                cleanupPlayer: NJS.emptyFn
            });
            var MyTubeUIAdapterForIFrame = NJS.define({
                superclass: MyTubeTransmitterObject,
                constructor: function(id, tube, prefs) {
                    //since there is gonna be on ui adapter per page
                    this.id = "MyTubeUIAdapterForIFrame";
                    (new MyTubeTransmitterObject()).mimicMe(this);
                    MyTubeTransmitter.register(this);
                    var player = tube.getPlayer();
                    var playerBoxAttributes = NJS.Layout.boxAttributes(player);
                    this.transmit("createTube", "parent", {
                        prefs: prefs,
                        positionHints: playerBoxAttributes
                    });

                    var observable = new NJS.Observable();
                    observable.addEvents(["userAction"]);
                    observable.mimicMe(this);
                },
                signals: {
                    userAction: function(data) {
                        this.fire("userAction", data.action, data.data);
                    }
                },
                notify: function(title) {
                    //make sure that you dont sent title across the frames. It might be caught by message validator. So be sure.
                    this.transmit("notify", "parent");
                },
                stop: function() {
                    this.transmit("stop", "parent");
                },
                play: function() {
                    this.transmit("play", "parent");
                },
                hidePopup: function(delay) {
                    this.transmit("hidePopup", "parent", {
                        delay: delay
                    });
                },
                showPopup: function(playerBoxAttributes) {
                    this.transmit("showPopup", "parent", {
                        playerBoxAttributes: playerBoxAttributes
                    });
                },
                changeStatus: function(s) {
                    this.transmit("changeStatus", "parent", {
                        val: s
                    });
                },
                destroy: function() {
                    MyTubeTransmitter.deregister(this);
                    this.transmit("destroy", "parent");
                },
                closeAllNotificationWindows: function() {
                    this.transmit("closeAllNotificationWindows", "parent");
                },
                showError: function(errorMsg, isFatal) {
                    this.transmit("showError", "parent", {
                        errorMsg: errorMsg,
                        isFatal: isFatal
                    });
                }
            });
            var ProgressMarker = function() {
                    var o1 = {
                        str: "."
                    };
                    var o2 = {
                        str: ".."
                    };
                    var o3 = {
                        str: "..."
                    };
                    var o4 = {
                        str: "...."
                    };
                    var o5 = {
                        str: "....."
                    };
                    o1.nextMarker = o2;
                    o2.nextMarker = o3;
                    o3.nextMarker = o4;
                    o4.nextMarker = o5;
                    o5.nextMarker = o1;
                    return o1;
                }();
            var PlayerTransformer = NJS.define({
                constructor: function(el, reload) {
                    this.el = el;
                    this.reload = reload !== false;
                },
                shouldProcess: function() {
                    var el = this.el;
                    try {
                        if (el.getAttribute("myTubeProcessed") == "Y") {
                            return false;
                        }
                    } catch (e) {
                        return false;
                    }
                    el.setAttribute("myTubeProcessed", "Y");
                    return true;
                },
                checkEl: function() {
                    if (!this.shouldProcess()) {
                        return;
                    }
                    MyTube.init();
                    var tubeId = NJS.unique("mytube");
                    this.el.setAttribute("myTubeId", tubeId);
                    this.onCheckEl(tubeId);
                    if (this.reload) {
                        this.reloadElement();
                    }
                },
                onCheckEl: NJS.emptyFn,
                destroy: function() {
                    delete this.el;
                },
                reloadElement: function() {
                    var el = this.el;
                    var fn = function() {
                            var oldEl = el;
                            el = oldEl.cloneNode(true);
                            var par = oldEl.parentNode;
                            var next = oldEl.nextSibling;
                            par.removeChild(oldEl);
                            if (next) {
                                par.insertBefore(el, next);
                            } else {
                                par.appendChild(el);
                            }
                        };
                    window.setTimeout(fn, 1);
                }
            });
            var HTML5PlayerTransformer = NJS.define({
                superclass: PlayerTransformer,
                constructor: function(el, reload) {
                    var attr = this.attr = "src";
                    this.url = el.getAttribute(attr);
                    HTML5PlayerTransformer.superclass.constructor.call(this, el, false);
                },
                shouldProcess: function() {
                    var url = this.url;
                    if (!url) {
                        return false;
                    }
                    if (!PlayerTransformer.prototype.shouldProcess.call(this)) {
                        return false;
                    }
                    var regex = /^(?:(?:http|https):\/\/)?(?:www\.)?.*?youtube\.com\/videoplayback/i;
                    return regex.test(url);
                },
                onCheckEl: function(tubeId) {
                    MyTube.onMyTubePlayerReady(tubeId);
                }
            });
            var FlashPlayerTransformer = NJS.define({
                superclass: PlayerTransformer,
                constructor: function(el, reload) {
                    this.isEmbed = el.tagName == "EMBED";
                    var attr = this.attr = this.isEmbed ? "src" : "data";
                    this.url = el.getAttribute(attr);
                    FlashPlayerTransformer.superclass.constructor.call(this, el, reload);
                },
                shouldProcess: function() {
                    if (!FlashPlayerTransformer.superclass.shouldProcess.call(this)) {
                        return false;
                    }
                    var match = this.match = this.urlMatch(this.el.getAttribute(this.attr));
                    return match;
                },
                getValue: function(name) {
                    var el = this.el;
                    if (this.isEmbed) {
                        return el.getAttribute(name);
                    }
                    var param;
                    var params = el.getElementsByTagName("PARAM");
                    for (var i = 0; i < params.length; i++) {
                        var p = params[i];
                        var n = p.getAttribute("name");
                        if (n && n.toUpperCase() == name.toUpperCase()) {
                            param = p;
                        }
                    }
                    return param ? param.getAttribute("value") : null;
                },
                setValue: function(name, val) {
                    var el = this.el;
                    if (this.isEmbed) {
                        el.setAttribute(name, val);
                        return;
                    }
                    var found = false;
                    var params = el.getElementsByTagName("PARAM");
                    for (var i = 0; i < params.length; i++) {
                        var p = params[i];
                        var n = p.getAttribute("name");
                        if (n && n.toUpperCase() == name.toUpperCase()) {
                            p.setAttribute("value", val);
                            found = true;
                        }
                    }
                    if (!found) {
                        var p = document.createElement("PARAM");
                        p.setAttribute("name", name);
                        p.setAttribute("value", val);
                        el.appendChild(p);
                    }
                },
                urlMatch: function(url) {
                    if (url == null) {
                        return false;
                    }
                    var regex1 = /^(?:(?:http|https):\/\/)?(?:www\.)?youtube\.com\/v\/./i;
                    var regex2 = /^(?:(?:http|https):\/\/)?s\.ytimg\.com\/yt\/./i;
                    return (regex1.test(url) ? 1 : (regex2.test(url) ? 2 : false));
                },
                fixURL: function(url, config) {
                    var el = this.el;
                    config = config || {};
                    if (!config.isFlashVars && url.indexOf("?") == -1) {
                        url += "?";
                    }

                    //handle basic stuff
                    url = url.replace(/(playerapiid=).*?(&|\?|\#|$)/g, "$2");
                    url = url.replace(/(enablejsapi=).*?(&|\?|\#|$)/g, "$2");
                    url += "&enablejsapi=1&playerapiid=" + config.tubeId;
                    url = url.replace(/(jsapicallback=).*?(&|\?|\#|$)/g, "$2");
                    url += "&jsapicallback=onMyTubePlayerReady";

                    //handle hd on full screen
                    url = url.replace(/(fshd=).*?(&|\?|\#|$)/g, "$2");
                    if (config.fshd) {
                        url += "&fshd=1";
                    } else {
                        url += "&fshd=0"
                    }

                    //handle quality
                    if (config.vq && config.vq != "default" && config.vq != "highres") {
                        url = url.replace(/(vq=).*?(&|\?|\#|$)/g, "$2");
                        url += "&vq=" + config.vq;
                        el.setAttribute("myTubeQualitySet", "true");
                    }

                    //handle for buffer settings
                    if (MyTubePrefs.prefs.autoPlay || MyTubePrefs.prefs.autoBuffer || MyTubePrefs.prefs.saveBandwidth) {
                        url = url.replace(/(autoplay=).*?(&|\?|\#|$)/g, "$2");
                        if (!MyTubePrefs.prefs.saveBandwidth) {
                            url += "&autoplay=1";
                            if (config.isFlashVars) {
                                url = url.replace(/(ad_module=).*?(&|\?|\#|$)/g, "$2");
                            }
                        } else {
                            url += "&autoplay=0";
                        }
                    }

                    //handle loop
                    url = url.replace(/(loop=).*?(&|\?|\#|$)/g, "$2");
                    url += "&loop=0";

                    //handle full screen
                    if (config.enableFullScreen) {
                        url = url.replace(/(fs=).*?(&|\?|\#|$)/g, "$2");
                        url += "&fs=1";
                    }

                    url = url.replace(/[&]+/g, "&");
                    url = url.replace(/(&\?)/, "?");
                    url = url.replace(/(\?&)/, "?");
                    return url;
                },
                onCheckEl: function(tubeId) {
                    var el = this.el;
                    var url = this.url;
                    var match = this.match;
                    if (match == 1) {
                        el.setAttribute(this.attr, this.fixURL(url, {
                            enableFullScreen: MyTubePrefs.prefs.enableFullScreen,
                            fshd: MyTubePrefs.prefs.fshd,
                            tubeId: tubeId
                        }));
                        if (MyTubePrefs.prefs.enableFullScreen) {
                            this.setValue("allowFullScreen", "true");
                        }
                    } else {
                        var flashVars = this.getValue("flashvars");
                        if (flashVars) {
                            this.setValue("flashvars", this.fixURL(flashVars, {
                                isFlashVars: true,
                                fshd: MyTubePrefs.prefs.fshd,
                                vq: MyTubePrefs.prefs.quality,
                                tubeId: tubeId
                            }));
                        }
                    }
                    //FF4 is having serious issues with wmode=transparent. removing it for now.
                    try {
                        if (!MyTubePrefs.pageInfo.youTubeMakka && (MyTube.extensionType == "chrome" || window.navigator.userAgent.toLowerCase().indexOf("firefox/3") > -1)) {
                            this.setValue("wmode", "transparent");
                        } else {
                            this.setValue("wmode", "opaque");
                        }
                    } catch (e) {}

                    this.setValue("allowscriptaccess", "always");
                }
            });
            NJS.apply(PlayerTransformer, {
                constructors: {
                    "EMBED": FlashPlayerTransformer,
                    "OBJECT": FlashPlayerTransformer,
                    "VIDEO": HTML5PlayerTransformer
                },
                transform: function(el) {
                    if (!el) {
                        return;
                    }
                    var tagName = el.tagName;
                    var constructor = this.constructors[tagName];
                    if (!constructor) {
                        return;
                    }
                    var c = new constructor(el, true);
                    try {
                        c.checkEl();
                    } finally {
                        c.destroy();
                    }
                }
            });

            var Bootstrap = function() {
                    var cssInitialized = false;
                    var listenersInitialized = false;

                    var handleAllElements = function() {
                        var fn = function(tagName) {
                            var els = document.documentElement.getElementsByTagName(tagName);
                            for (var i = 0; i < els.length; i++) {
                                var el = els[i];
                                try {
                                    PlayerTransformer.transform(el);
                                } catch (ex) {}
                            }
                        };
                        fn("EMBED");
                        fn("OBJECT");
                        fn("VIDEO");
                    };

                    var initCSS = function() {
                        if(cssInitialized) {
                            return;
                        }
                        cssInitialized = true;
                        if(MyTube.extensionType != "firefox") {
                            return;
                        }
                        var link = document.createElement("link");
                        link.setAttribute("rel", "stylesheet");
                        link.setAttribute("type", "text/css");
                        link.setAttribute("href", "resource://mytube-mytube.css/");
                        var par = document.getElementsByTagName("head")[0] || document.body;
                        par.appendChild(link);
                    };

                    var initListeners = function() {
                        if(listenersInitialized) {
                            return;
                        }
                        listenersInitialized = true;

                        MyTube.setTubeReadyListener();

                        document.addEventListener('DOMNodeInserted', domNodeInserted, false);
                        window.addEventListener('load', function() {
                            handleAllElements();
                        }, false);
                        document.addEventListener('DOMContentLoaded', function() {
                            handleAllElements();
                        }, false);
                    };

                    var domNodeInserted = function(e) {
                        var t = e.target;
                        var nodeName = t.nodeName;
                        if (nodeName == 'EMBED' || nodeName == 'OBJECT' || nodeName == "VIDEO" || nodeName == "IFRAME") {
                            PlayerTransformer.transform(t);
                            return;
                        }
                        if (!t.getElementsByTagName) {
                            return;
                        }
                        var fn = function(tagName) {
                            var ts = t.getElementsByTagName(tagName);
                            for (var i = 0; i < ts.length; i++) {
                                PlayerTransformer.transform(ts[1]);
                            }
                        };
                        fn.call(this, "EMBED");
                        fn.call(this, "OBJECT");
                        fn.call(this, "VIDEO");
                        fn.call(this, "IFRAME");
                    };

                    var afterFn = function() {
                        MyTubePrefs.un("preferencesUpdated", afterFn);
                        if(!MyTubePrefs.prefs.enable) {
                            return;
                        }
                        initCSS();
                        initListeners();
                        handleAllElements();
                    };

                    var initPrefsWithCallback = function(callback) {
                        var fn = function() {
                            MyTubePrefs.un("preferencesUpdated", fn);
                            callback();
                        }
                        MyTubePrefs.on("preferencesUpdated", fn);
                        MyTubePrefs.init();
                    };

                    var run = function() {
                        initPrefsWithCallback(afterFn);
                    };
                    return ({
                        run: function() {
                            run();
                        },
                        transformAbandoned: function() {
                            run();
                        }
                    });
                }();

            MyTube.extensionType = "firefox";
            return Bootstrap;
        };
    window.MyTubeBootstrap = window.MyTubeBootstrap || createBootstrap();

    window.MyTubeBootstrap.run();
})(this);
