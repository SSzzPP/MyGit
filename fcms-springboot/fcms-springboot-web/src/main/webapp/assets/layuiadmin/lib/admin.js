/** layuiAdmin.std-v1.0.0 LPPL License By http://www.layui.com/admin/ */
;
layui.define("view",
    function(e) {
        var layui_jquery = layui.jquery,
            layui_laytpl = layui.laytpl,
            layui_element = layui.element,
            layui_setter = layui.setter,
            layui_view = layui.view,
            layui_device = layui.device(),
            layui_window = layui_jquery(window),
            layui_body = layui_jquery("body"),
            layui_container = layui_jquery("#" + layui_setter.container),
            layui_app_body = "#LAY_app_body",// 内容部分整体容器，包含N个iframe容器
            layui_content_item = "layadmin-tabsbody-item",// iframe容器
            layui_content_item_current = "layui-show",// 当前显示的iframe容器
            layui_content_item_hide = "layui-hide",
            layui_side_menu_container = "LAY-system-side-menu",// 菜单容器
            layui_side_menu_this = "layui-this",// 当前Tab菜单项容器
            layui_disabled = "layui-disabled",// css class 禁用样式
            layui_flexible = "LAY_app_flexible",// 是否收起侧边栏按钮
            layui_flexible_right = "layui-icon-shrink-right",
            layui_flexible_left = "layui-icon-spread-left",
            layui_tabs = "layadmin-layout-tabs",
            layui_side_spread_sm = "layadmin-side-spread-sm",// 小屏幕下显示状态 layui.admin.screen() < 2
            layui_side_shrink = "layadmin-side-shrink",
            layui_skin = null;
            layui_top = {
                v: "1.0.0 std",
                req: layui_view.req,
                screen: function() {
                    // 根据屏幕宽度返回0-3
                    var e = layui_window.width();
                    return e >= 1200 ? 3 : e >= 992 ? 2 : e >= 768 ? 1 : 0
                },
                exit: layui_view.exit,// 清理本地缓存
                sideFlexible: function(e) {
                    // 切换侧边栏状态
                    var i = layui_container,
                        t = layui_jquery("#" + layui_flexible),
                        n = layui_top.screen();
                    "spread" === e ? (t.removeClass(layui_flexible_left).addClass(layui_flexible_right), n < 2 ? i.addClass(layui_side_spread_sm) : i.removeClass(layui_side_spread_sm), i.removeClass(layui_side_shrink)) : (t.removeClass(layui_flexible_right).addClass(layui_flexible_left), n < 2 ? i.removeClass(layui_side_shrink) : i.addClass(layui_side_shrink), i.removeClass(layui_side_spread_sm)),
                        layui.event.call(this, layui_setter.MOD_NAME, "side({*})", {
                            status: e
                        })
                },
                escape: function(e) {
                    return String(e || "").replace(/&(?!#?[a-zA-Z0-9]+;)/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/'/g, "&#39;").replace(/"/g, "&quot;")
                },
                on: function(e, a) {
                    return layui.onevent.call(this, layui_setter.MOD_NAME, e, a)
                },
                popup: layui_view.popup,
                popupRight: function(e) {
                    return layui_top.popup.index = layer.open(layui_jquery.extend({
                            type: 1,
                            id: "LAY_adminPopupR",
                            anim: -1,
                            title: !1,
                            closeBtn: !1,
                            offset: "rt",
                            shade: .1,
                            shadeClose: !0,
                            skin: "layui-anim layui-anim-rl layui-layer-adminRight",
                            area: "300px"
                        },
                        e))
                },
                theme: function(e) {
                    var t = (layui_setter.theme, layui.data(layui_setter.tableName)),
                        n = "LAY_layadmin_theme",
                        s = document.createElement("style"),
                        r = layui_laytpl([".layui-tab-brief>.layui-tab-more li.layui-this:after, .layui-tab-brief>.layui-tab-title .layui-this:after","{border-color:{{d.color.selected}} !important;}",".layui-tab-brief>.layui-tab-title .layui-this","{color:{{d.color.selected}} !important;}",".tabs li.tabs-selected a.tabs-inner","{border-color:{{d.color.selected}} !important;color:{{d.color.selected}} !important;}",".layui-btn","{background-color:{{d.color.selected}} !important;}",".datagrid-row-selected","{background-color:{{d.color.selected}} !important;}",".layui-side-menu,", ".layadmin-pagetabs .layui-tab-title li:after,", ".layadmin-pagetabs .layui-tab-title li.layui-this:after,", ".layui-layer-admin .layui-layer-title,", ".layadmin-side-shrink .layui-side-menu .layui-nav>.layui-nav-item>.layui-nav-child", "{background-color:{{d.color.main}} !important;}", ".layui-nav-tree .layui-this,", ".layui-nav-tree .layui-this>a,", ".layui-nav-tree .layui-nav-child dd.layui-this,", ".layui-nav-tree .layui-nav-child dd.layui-this a", "{background-color:{{d.color.selected}} !important;}", ".layui-layout-admin .layui-logo{background-color:{{d.color.logo || d.color.main}} !important;}", "{{# if(d.color.header){ }}", ".layui-layout-admin .layui-header{background-color:{{ d.color.header }};}", ".layui-layout-admin .layui-header a,", ".layui-layout-admin .layui-header a cite{color: #f8f8f8;}", ".layui-layout-admin .layui-header a:hover{color: #fff;}", ".layui-layout-admin .layui-header .layui-nav .layui-nav-more{border-top-color: #fbfbfb;}", ".layui-layout-admin .layui-header .layui-nav .layui-nav-mored{border-color: transparent; border-bottom-color: #fbfbfb;}", ".layui-layout-admin .layui-header .layui-nav .layui-this:after, .layui-layout-admin .layui-header .layui-nav-bar{background-color: #fff; background-color: rgba(255,255,255,.5);}", ".layadmin-pagetabs .layui-tab-title li:after{display: none;}", "{{# } }}"].join("")).render(e = layui_jquery.extend({},t.theme, e)),
                        u = document.getElementById(n);
                    "styleSheet" in s ? (s.setAttribute("type", "text/css"), s.styleSheet.cssText = r) : s.innerHTML = r,
                        s.id = n,
                        u && layui_body[0].removeChild(u),
                        layui_body[0].appendChild(s),
                        layui_body.attr("layadmin-themealias", e.color.alias),
                        t.theme = t.theme || {},
                        layui.each(e,
                            function(e, a) {
                                t.theme[e] = a
                            }),
                        layui.data(layui_setter.tableName, {
                            key: "theme",
                            value: t.theme
                        })
                },
                initTheme: function(e) {
                    // 初始化及切换主题
                    var a = layui_setter.theme;
                    e = e || 0,
                    a.color[e] && (a.color[e].index = e, layui_top.theme({
                        color: a.color[e]
                    }))
                },
                tabsPage: {},
                tabsBody: function(e) {
                    // 根据下标获取iframe容器对象
                    return layui_jquery(layui_app_body).find("." + layui_content_item).eq(e || 0)
                },
                
                tabsBodyChange: function(e, a) {
                    // 新建或切换选中tab
                    a = a || {},
                    layui_top.tabsBody(e).addClass(layui_content_item_current).siblings().removeClass(layui_content_item_current),
                    layui_events.rollPage("auto", e),
                    layui.event.call(this, layui_setter.MOD_NAME, "tabsPage({*})", {
                        url: a.url,
                        text: a.text
                    })
                    
                    var layuiData = layui.data(layui_setter.tableName);
                    layuiData.theme ? layui_top.theme(layuiData.theme) : layui_setter.theme && layui_top.initTheme(layui_setter.theme.initColorIndex);
                },
                resize: function(e) {
                    var a = layui.router(),
                        i = a.path.join("-");
                    layui_window.off("resize", layui_top.resizeFn[i]),
                        e(),
                        layui_top.resizeFn[i] = e,
                        layui_window.on("resize", layui_top.resizeFn[i])
                },
                resizeFn: {},
                runResize: function() {
                    var e = layui.router(),
                        a = e.path.join("-");
                    layui_top.resizeFn[a] && layui_top.resizeFn[a]()
                },
                delResize: function() {
                    var e = layui.router(),
                        a = e.path.join("-");
                    layui_window.off("resize", layui_top.resizeFn[a]),
                        delete layui_top.resizeFn[a]
                },
                closeThisTabs: function() {
                    layui_top.tabsPage.index && layui_jquery(z).eq(layui_top.tabsPage.index).find(".layui-tab-close").trigger("click")
                },
                openT: function(title,url) {
	                layui.router();
	                var l = parent === self ? layui: top.layui;
	                l.index.openTabsPage(url, title);
                }
            },
            layui_events = layui_top.events = {
                flexible: function(e) {
                    // 切换侧边栏状态
                    var a = e.find("#" + layui_flexible),
                        i = a.hasClass(layui_flexible_left);
                    layui_top.sideFlexible(i ? "spread": null)
                },
                refresh: function() {
                    // 刷新当前Tab页显示内容
                    var e = ".layadmin-iframe",
                        i = layui_jquery("." + layui_content_item).length;
                    layui_top.tabsPage.index >= i && (layui_top.tabsPage.index = i - 1);
                    var t = layui_top.tabsBody(layui_top.tabsPage.index).find(e);
                    t[0].contentWindow.location.reload(!0)
                },
                /*serach: function(e) {
                    e.off("keypress").on("keypress",
                        function(a) {
                            if (this.value.replace(/\s/g, "") && 13 === a.keyCode) {
                                var i = e.attr("lay-action"),
                                    t = e.attr("lay-text") || "搜索";
                                layui_laytpl += this.value,
                                    layui_element = t + ' <span style="color: #FF5722;">' + layui_top.escape(this.value) + "</span>",
                                    layui.index.openTabsPage(i, t),
                                layui_events.serach.keys || (layui_events.serach.keys = {}),
                                    layui_events.serach.keys[layui_top.tabsPage.index] = this.value,
                                this.value === layui_events.serach.keys[layui_top.tabsPage.index] && layui_events.refresh(e),
                                    this.value = ""
                            }
                        })
                },
                message: function(e) {
                    e.find(".layui-badge-dot").remove()
                },*/
                theme: function() {
                    layui_top.popupRight({
                        id: "LAY_adminPopupTheme",
                        success: function() {
                            layui_view(this.id).render("system/theme")
                        }
                    })
                },
                /*note: function(e) {
                    var a = layui_top.screen() < 2,
                        i = layui.data(layui_setter.tableName).note;
                    layui_events.note.index = layui_top.popup({
                        title: "便签",
                        shade: 0,
                        offset: ["41px", a ? null: e.offset().left - 250 + "px"],
                        anim: -1,
                        id: "LAY_adminNote",
                        skin: "layadmin-note layui-anim layui-anim-upbit",
                        content: '<textarea placeholder="内容"></textarea>',
                        resize: !1,
                        success: function(e, a) {
                            var t = e.find("textarea"),
                                n = void 0 === i ? "便签中的内容会存储在本地，这样即便你关掉了浏览器，在下次打开时，依然会读取到上一次的记录。是个非常小巧实用的本地备忘录": i;
                            t.val(n).focus().on("keyup",
                                function() {
                                    layui.data(layui_setter.tableName, {
                                        key: "note",
                                        value: this.value
                                    })
                                })
                        }
                    })
                },*/
                fullscreen: function(e) {
                    var a = "layui-icon-screen-full",
                        i = "layui-icon-screen-restore",
                        t = e.children("i");
                    if (t.hasClass(a)) {
                        var l = document.body;
                        l.webkitRequestFullScreen ? l.webkitRequestFullScreen() : l.mozRequestFullScreen ? l.mozRequestFullScreen() : l.requestFullScreen && l.requestFullscreen(),
                            t.addClass(i).removeClass(a)
                    } else {
                        var l = document;
                        l.webkitCancelFullScreen ? l.webkitCancelFullScreen() : l.mozCancelFullScreen ? l.mozCancelFullScreen() : l.cancelFullScreen ? l.cancelFullScreen() : l.exitFullscreen && l.exitFullscreen(),
                            t.addClass(a).removeClass(i)
                    }
                },
                /*about: function() {
                    layui_top.popupRight({
                        id: "LAY_adminPopupAbout",
                        success: function() {
                            layui_view(this.id).render("system/about")
                        }
                    })
                },
                more: function() {
                    layui_top.popupRight({
                        id: "LAY_adminPopupMore",
                        success: function() {
                            layui_view(this.id).render("system/more")
                        }
                    })
                },*/
                back: function() {
                    history.back()
                },
                setTheme: function(e) {
                    var a = e.data("index");
                    e.siblings(".layui-this").data("index");
                    e.hasClass(layui_side_menu_this) || (e.addClass(layui_side_menu_this).siblings(".layui-this").removeClass(layui_side_menu_this), layui_top.initTheme(a));
                    layui_events.refresh();
                },
                rollPage: function(e, i) {
                    // 滚动Tab标签容器
                    var t = layui_jquery("#LAY_app_tabsheader"),
                        l = t.children("li"),
                        n = (t.prop("scrollWidth"), t.outerWidth()),
                        s = parseFloat(t.css("left"));
                    if ("left" === e) {
                        if (!s && s <= 0) return;
                        var r = -s - n;
                        l.each(function(e, i) {
                            var l = layui_jquery(i),
                                n = l.position().left;
                            if (n >= r) return t.css("left", -n),
                                !1
                        })
                    } else "auto" === e ? !
                        function() {
                            var e, r = l.eq(i);
                            if (r[0]) {
                                if (e = r.position().left, e < -s) return t.css("left", -e);
                                if (e + r.outerWidth() >= n - s) {
                                    var o = e + r.outerWidth() - (n - s);
                                    l.each(function(e, i) {
                                        var l = layui_jquery(i),
                                            n = l.position().left;
                                        if (n + s > 0 && n - s > o) return t.css("left", -n),
                                            !1
                                    })
                                }
                            }
                        } () : l.each(function(e, i) {
                        var l = layui_jquery(i),
                            r = l.position().left;
                        if (r + l.outerWidth() >= n - s) return t.css("left", -r),
                            !1
                    })
                },
                leftPage: function() {
                    layui_events.rollPage("left")
                },
                rightPage: function() {
                    layui_events.rollPage()
                },
                closeThisTabs: function() {
                    layui_top.closeThisTabs()
                },
                closeOtherTabs: function(e) {
                    var i = "LAY-system-pagetabs-remove";
                    "all" === e ? (layui_jquery(z + ":gt(0)").remove(), layui_jquery(layui_app_body).find("." + layui_content_item + ":gt(0)").remove(), layui_jquery(z).eq(0).trigger("click")) : (layui_jquery(z).each(function(e, t) {
                        e && e != layui_top.tabsPage.index && (layui_jquery(t).addClass(i), layui_top.tabsBody(e).addClass(i))
                    }), layui_jquery("." + i).remove())
                },
                closeAllTabs: function() {
                    layui_events.closeOtherTabs("all")
                },
                shade: function() {
                    layui_top.sideFlexible()
                }
            }; !
            function() {
                var e = layui.data(layui_setter.tableName);
                e.theme ? layui_top.theme(e.theme) : layui_setter.theme && layui_top.initTheme(layui_setter.theme.initColorIndex),
                "pageTabs" in layui.setter || (layui.setter.pageTabs = !0),
                layui_setter.pageTabs || (layui_jquery("#LAY_app_tabs").addClass(layui_content_item_hide), layui_container.addClass("layadmin-tabspage-none")),
                layui_device.ie && layui_device.ie < 10 && layui_view.error("IE" + layui_device.ie + "下访问可能不佳，推荐使用：Chrome / Firefox / Edge 等高级浏览器", {
                    offset: "auto",
                    id: "LAY_errorIE"
                }),
                layui_skin = layui.data(layui_setter.tableName).theme.color.alias
            } (),
            layui_element.on("tab(" + layui_tabs + ")",
                function(e) {
                    layui_top.tabsPage.index = e.index
                }),
            layui_top.on("tabsPage(setMenustatus)",
                function(e) {
                    var i = e.url,
                        t = function(e) {
                            return {
                                list: e.children(".layui-nav-child"),
                                a: e.children("*[lay-href]")
                            }
                        },
                        l = layui_jquery("#" + layui_side_menu_container),
                        n = "layui-nav-itemed",
                        s = function(e) {
                            e.each(function(e, l) {
                                var s = layui_jquery(l),
                                    r = t(s),
                                    o = r.list.children("dd"),
                                    u = i === r.a.attr("lay-href");
                                if (o.each(function(e, l) {
                                    var s = layui_jquery(l),
                                        r = t(s),
                                        o = r.list.children("dd"),
                                        u = i === r.a.attr("lay-href");
                                    if (o.each(function(e, l) {
                                        var s = layui_jquery(l),
                                            r = t(s),
                                            o = i === r.a.attr("lay-href");
                                        if (o) {
                                            var u = r.list[0] ? n: layui_side_menu_this;
                                            return s.addClass(u).siblings().removeClass(u),
                                                !1
                                        }
                                    }), u) {
                                        var d = r.list[0] ? n: layui_side_menu_this;
                                        return s.addClass(d).siblings().removeClass(d),
                                            !1
                                    }
                                }), u) {
                                    var d = r.list[0] ? n: layui_side_menu_this;
                                    return s.addClass(d).siblings().removeClass(d),
                                        !1
                                }
                            })
                        };
                    l.find("." + layui_side_menu_this).removeClass(layui_side_menu_this),
                    layui_top.screen() < 2 && layui_top.sideFlexible(),
                        s(l.children("li"))
                }),
            layui_element.on("nav(layadmin-system-side-menu)",
                function(e) {
                    e.siblings(".layui-nav-child")[0] && layui_container.hasClass(layui_side_shrink) && (layui_top.sideFlexible("spread"), layer.close(e.data("index"))),
                        layui_top.tabsPage.type = "nav"
                }),
            layui_element.on("nav(layadmin-pagetabs-nav)",
                function(e) {
                    var a = e.parent();
                    a.removeClass(layui_side_menu_this),
                        a.parent().removeClass(layui_content_item_current)
                });
        var A = function(e) {
		    	var skin = layui.data(layui_setter.tableName).theme.color.alias;
		    	if(skin != layui_skin){
		    		layui_events.refresh();
		    		layui_skin = layui.data(layui_setter.tableName).theme.color.alias;
		    	}
                var a = (e.attr("lay-id"), e.attr("lay-attr")),
                    i = e.index();
                layui_top.tabsBodyChange(i, {
                    url: a
                })
            },
            z = "#LAY_app_tabsheader>li";
            layui_body.on("click", z,function() {
                var e = layui_jquery(this),
                    i = e.index();
                layui_top.tabsPage.type = "tab",
                    layui_top.tabsPage.index = i,
                    A(e)
            }),
            layui_element.on("tabDelete(" + layui_tabs + ")",
                function(e) {
                    var i = layui_jquery(z + ".layui-this");
                    e.index && layui_top.tabsBody(e.index).remove(),
                        A(i),
                        layui_top.delResize()
                }),
            layui_body.on("click", "*[lay-href]",
                function() {
                    var e = layui_jquery(this),
                        i = e.attr("lay-href"),
                        t = e.attr("lay-text");
                    layui.router();
                    layui_top.tabsPage.elem = e;
                    var l = parent === self ? layui: top.layui;
                    l.index.openTabsPage(i, t || e.text())
                }),
            layui_body.on("click", "*[layadmin-event]",
                function() {
                    var e = layui_jquery(this),
                        i = e.attr("layadmin-event");
                    layui_events[i] && layui_events[i].call(this, e)
                }),
            layui_body.on("mouseenter", "*[lay-tips]",
                function() {
                    var e = layui_jquery(this);
                    if (!e.parent().hasClass("layui-nav-item") || layui_container.hasClass(layui_side_shrink)) {
                        var i = e.attr("lay-tips"),
                            t = e.attr("lay-offset"),
                            l = e.attr("lay-direction"),
                            n = layer.tips(i, this, {
                                tips: l || 1,
                                time: -1,
                                success: function(e, a) {
                                    t && e.css("margin-left", t + "px")
                                }
                            });
                        e.data("index", n)
                    }
                }).on("mouseleave", "*[lay-tips]",
                function() {
                    layer.close(layui_jquery(this).data("index"))
                });
        var _ = layui.data.resizeSystem = function() {
            layer.closeAll("tips"),
            _.lock || setTimeout(function() {
                    layui_top.sideFlexible(layui_top.screen() < 2 ? "": "spread"),
                        delete _.lock
                },
                100),
                _.lock = !0
        };
        layui_window.on("resize", layui.data.resizeSystem),
            e("admin", layui_top)
    });