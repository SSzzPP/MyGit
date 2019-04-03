/** layuiAdmin.std-v1.0.0 LPPL License By http://www.layui.com/admin/ */
;layui.define(function(e) {
    var a = layui.admin;
    var percent = Math.floor(Math.random()*10) + 90;
    var weight = Math.floor(Math.random()*10) + 60;
    var sport = Math.floor(Math.random()*100) + 5000;
    var time = Math.floor(Math.random()*10) ;
    layui.use(["admin", "carousel"], function() {
        var e = layui.$
          , a = (layui.admin,
        layui.carousel)
          , l = layui.element
          , t = layui.device();
        e(".layadmin-carousel").each(function() {
            var l = e(this);
            a.render({
                elem: this,
                width: "100%",
                arrow: "none",
                interval: l.data("interval"),
                autoplay: l.data("autoplay") === !0,
                trigger: t.ios || t.android ? "click" : "hover",
                anim: l.data("anim")
            })
        }),
        l.render("progress")
    }),
    layui.use(["carousel", "echarts"], function() {
        var e = layui.$
          , a = (layui.carousel,
        layui.echarts)
          , l = []
          , t = [{
            tooltip: {
                trigger: "axis"
            },
            calculable: !1,
            legend: {
                data: ["健康指数", "体重"]
            },
            xAxis: [{
                type: "category",
                data: ["9.20", "9.21", "9.21", "9.22", "9.23", "9.24", "9.25", "9.26", "9.27", "9.28"]
            }],
            yAxis: [{
                type: "value",
                name: "健康指数",
                axisLabel: {
                    formatter: "{value}%"
                }
            }, {
                type: "value",
                name: "体重",
                axisLabel: {
                    formatter: "{value}kg"
                }
            }],
            series: [{
                name: "健康指数",
                type: "line",
                data: [percent+5, percent+4, percent-16, percent+3, percent+1, percent, percent, percent+1, percent+1, percent]
            }, {
                name: "体重",
                type: "line",
                yAxisIndex: 1,
                data: [weight, weight, weight+1, weight+2, weight+2, weight, weight+1, weight, weight+2, weight]
            }]
        }]
          , i = e("#LAY-index-pagetwo").children("div")
          , n = function(e) {
            l[e] = a.init(i[e], layui.echartsTheme),
            l[e].setOption(t[e]),
            window.onresize = l[e].resize
        };
        i[0] && n(0)
    }),
    layui.use(["carousel", "echarts"], function() {
        var e = layui.$
        , a = (layui.carousel,
      layui.echarts)
        , l = []
        , t = [{
          tooltip: {
              trigger: "axis"
          },
          calculable: !1,
          legend: {
              data: ["健康指数", "运动时长"]
          },
          xAxis: [{
              type: "category",
              data: ["9.20", "9.21", "9.21", "9.22", "9.23", "9.24", "9.25", "9.26", "9.27", "9.28"]
          }],
          yAxis: [{
              type: "value",
              name: "健康指数",
              axisLabel: {
                  formatter: "{value}%"
              }
          }, {
              type: "value",
              name: "运动时长",
              axisLabel: {
                  formatter: "{value}h"
              }
          }],
          series: [{
              name: "健康指数",
              type: "line",
              data: [80, 96, 95, 87, 86, 94, 76, 84, 86, 94]
          }, {
              name: "运动时长",
              type: "line",
              yAxisIndex: 1,
              data: [45, 25, 30, 35, 15, 30, 24, 30, 35, 15]
          }]
      }]
        , i = e("#LAY-index-pagethree").children("div")
        , n = function(e) {
          l[e] = a.init(i[e], layui.echartsTheme),
          l[e].setOption(t[e]),
          window.onresize = l[e].resize
      };
      i[0] && n(0)
  }),
  layui.use(["carousel", "echarts"], function() {
      var e = layui.$
      , a = (layui.carousel,
    layui.echarts)
      , l = []
      , t = [{
        tooltip: {
            trigger: "axis"
        },
        calculable: !1,
        legend: {
            data: ["步数", "运动时长"]
        },
        xAxis: [{
            type: "category",
            data: ["9.20", "9.21", "9.21", "9.22", "9.23", "9.24", "9.25", "9.26", "9.27", "9.28"]
        }],
        yAxis: [{
            type: "value",
            name: "步数",
            axisLabel: {
                formatter: "{value}步"
            }
        }, {
            type: "value",
            name: "运动时长",
            axisLabel: {
                formatter: "{value}h"
            }
        }],
        series: [{
            name: "步数",
            type: "line",
            data: [sport+500, sport+100, sport+200, sport+300, sport+200, sport, sport, sport+100, sport+1000, sport]
        }, {
            name: "运动时长",
            type: "line",
            yAxisIndex: 1,
            data: [time+1, time+3, time+1, time+1, time+2, time+1, time+1, time+1, time+2, time+3]
        }]
    }]
      , i = e("#LAY-index-pagefour").children("div")
      , n = function(e) {
        l[e] = a.init(i[e], layui.echartsTheme),
        l[e].setOption(t[e]),
        window.onresize = l[e].resize
    };
    i[0] && n(0)
   }),
    e("userCase", {})
});
