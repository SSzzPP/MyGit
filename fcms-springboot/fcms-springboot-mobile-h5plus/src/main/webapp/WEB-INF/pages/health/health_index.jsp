<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/style_script.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<title>Insert title here</title>
<style type="text/css">
		.setPadd{
    		padding:11px;
    	}
    	.setdiv{
    		padding:6px;
    	}
    	.setcolor{
    		padding:6px;
    		color:/* #f55b1d */#1799c5;
    		word-wrap:break-word;
			word-break:break-all;
    	}
    	.setgrave{
    		color:#8f8f94;
    		display: inline-block;
    		width:50%;
    	}
    	.setf{
    		font-size:16px;
    	}
    	.borderb{
    		border-bottom:1px solid #ebebeb;
    	}
    	.linechart{
    		height:400px;
    		width:100%;
    	}
    	.setmar{
			margin-top:10px;
		}
		.mui-card .mui-menu-header{
			padding:10px;
			text-align:center;
		}
		</style>
	</head>
	<body>
		<div class="mui-inner-wrap">
		<header class="mui-bar mui-bar-nav transparent">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">运动健康</h1>
		</header>
			
	   	<div class="mui-content">
       		<div class="mui-menu mui-card">
       			<div class="mui-menu-header">
	       			<span class="font-big">近期运动频次</span>
	       		</div>
	       		<div class="mui-row">
			    	<div class="setPadd">
			        	<div class="linechart" id="frequency"></div>
			        </div>
			    </div>
       		</div>
       		<div class="mui-menu mui-card setmar">
       			<div class="mui-menu-header">
	       			<span class="font-big">上周运动类别</span>
	       		</div>
	       		<div class="mui-row">
			    	<div class="setPadd">
			        	<div class="linechart" id="type"></div>
			        </div>
			    </div>
       		</div>
       		<!-- <div class="mui-menu mui-card setmar">
       			<div class="mui-menu-header">
	       			<span class="font-big">上周运动类别</span>
	       		</div>
	       		<div class="mui-row">
			    	<div class="setPadd">
			        	<div class="linechart" id="type"></div>
			        </div>
			    </div>
       		</div>
       		<div class="mui-menu mui-card setmar">
       			<div class="mui-menu-header">
	       			<span class="font-big">运动周期</span>
	       		</div>
	       		<div class="mui-row">
			    	<div class="setPadd">
			        	<div class="linechart" id="cycle"></div>
			        </div>
			    </div>
       		</div> -->
       	</div>
	  </div>
		<%-- <script src="${staticURL}/js/layui/echarts.js"></script>
		<script src="${staticURL}/js/layui/echartsTheme.js"></script> --%>
		<script src="${staticURL}/js/echarts.min.js"></script>
		<script>
		var seriesData = new Array();
		mui.ready(function () {
			frequency();
			sportTypeNum ();
			//sportCycleNum ();
		});
		//频次
		function frequency () {
			topUtil.web_query('mobile/order/findLastOrder',{},function (data) {
				if (typeof data == "string") {
	                data = JSON.parse(data);
	            }
				if (data) {
					mui.each(data,function(index,item) {
						if (item == null) {
							seriesData[index] = 0;
						}
						seriesData[index] = item;
					});
					chart(seriesData);
				}
			})
		}
		
		function chart (seriesData) {
			option = {
				    color: ['rgb(255, 178, 72)'],
			        grid: {
			            borderColor: "#eee",
			            show:true,
			        },
				    tooltip : {
				        trigger: 'axis',
				        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
				            type : 'line',        // 默认为直线，可选为：'line' | 'shadow'
				            color: "#009688"
				        }
				    },
				    grid: {
				        left: '4%',
				        right: '4%',
				        bottom: '3%',
				        top:'3%',
				        containLabel: true
				    },
				    xAxis : [
				        {
				            type : 'category',
				            data : ['前周','上周','本周'],//['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
				            axisTick: {
				                alignWithLabel: true,
				                color: "#009688"
				            },
				        }
				    ],
				    yAxis : [
				        {
				            type : 'value'
				        }
				    ],
				    series : [
				        {
				            name:'共运动次数',
				            type:'bar',
				            barWidth: '60%',
				            data:seriesData//[10, 52, 200, 334, 390, 330, 220]
				        }
				    ]
				};
			var myChart = echarts.init(document.getElementById('frequency'),'chalk');
			myChart.setOption(option);
			//var myChart = document.getElementById('frequency');
			//layui.echarts.init(myChart, layui.echartsTheme).setOption(option);
		}
		
		//类别
		var sportTypeName = new Array();
		var seriesTypeData = new Array();
		 var sportCycleName = new Array();
		 var seriesCycleData = new Array();
		 function sportTypeNum () {
				topUtil.web_query('mobile/order/searchOrderNum',{},function (data) {
					if (typeof data == "string") {
		                data = JSON.parse(data);
		            }
					if (data) {
						var num = 0;
						var seriesNum = 0;
						mui.each(data,function (index,item) {
							var flag = true;
							if (index == 0) {
								var series = {};
								sportTypeName[num] = item.typeName;
								series.name = item.typeName;
								series.value = 1;
								seriesTypeData[seriesNum] = series;
							} else {
								mui.each(sportTypeName,function (ind,ite) {
									if (item.typeName != ite) {
										sportTypeName[++num] = item.typeName;
										return false;
									}
								});
								mui.each(seriesTypeData,function (ind,ite){
									if (item.typeName != ite.name) {
										if (flag) {
											var series = {};
											series.name = item.typeName;
											series.value = 1;
											seriesTypeData[++seriesNum] = series;
											flag = false;
										}
									} else {
										ite.value = ite.value+1;
									}
								});
							}
							
							var time = dateFtt('yyyy-MM-dd',new Date(item.orderTime))
							sportCycleName[index] = time;
							seriesCycleData[index] = item.typeName;
						});
						mui.each(seriesTypeData,function(index,item){
							//seriesTypeData[index] = seriesTypeData[index].value;
						});
						
						sportTypeName = unique(sportTypeName);
						chartType (sportTypeName,seriesTypeData);
						//chartCycle (sportCycleName,seriesCycleData);
					}
				});
			}
		
		 function chartType (sportName,seriesData) {
				//var myChart = document.getElementById('type');
				var myChart = echarts.init(document.getElementById('type'));
				option = {
					    tooltip : {
					        trigger: 'axis',
					        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
					            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
					        }
					    },
					    grid: {
					        left: '3%',
					        right: '4%',
					        bottom: '3%',
					        top:'3%',
					        containLabel: true
					    },
					    xAxis : [
					        {
					            type : 'category',
					            data : sportName,//['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
					            axisTick: {
					                alignWithLabel: true
					            }
					        }
					    ],
					    yAxis : [
					        {
					            type : 'value'
					        }
					    ],
					    series : [
					        {
					            name:'上周各项目参与次数',
					            type:'bar',
					            barWidth: '60%',
					            data:seriesData //[10, 52, 200, 334, 390, 330, 220] 
					        }
					    ]
					};
				option1 = {
						color:['#d7504b','#f3a43b','#fcce10','#f4e001'],
					    tooltip : {
					    	trigger: 'item',
					        formatter: "{a} <br/>{b} : {c} ({d}%)"
					    },
					    legend: {
					        orient: 'horizontal',
					        left: 'left',
					        data:['跑步','篮球','游泳'] //sportName
					    },
					    series : [
					        {
					            name: '访问来源',
					            type: 'pie',
					            radius : '55%',
					            center: ['50%', '60%'],
					            data:[{
					            	value:1,name:'跑步'
					            },{
					            	value:1,name:'篮球'
					            },{
					            	value:1,name:'游泳'
					            }], //seriesData,
					            itemStyle: {
					                emphasis: {
					                    shadowBlur: 10,
					                    shadowOffsetX: 0,
					                    shadowColor: 'rgba(0, 0, 0, 0.5)'
					                }
					            }
					        }
					    ]
					};
				myChart.setOption(option1);
			}
		
		 //周期
		
		function chartCycle (sportName,seriesData) {
				var myChart = echarts.init(document.getElementById('cycle'));
				//var myChart = document.getElementById('cycle');
				option = {
					  color: ['rgb(255, 178, 72)'],
					  grid: {  
					        left: '1%',
					        right: '4%',
					        bottom: '3%',
					        top:'3%',
					        containLabel: true
					    },
					    xAxis: {
					    	boundaryGap: false,
					    	interval: 0,
					        type: 'category',
					        data:sportName//['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
					    },
					    yAxis: {
					        type: 'category'
					    },
					    series: [{
					        data: seriesData,//[820, 932, 901, 934, 1290, 1330, 1320],
					        type: 'line'
					    }]
					};
		
				myChart.setOption(option);
			}
		 
		//去重
			function unique(arr){
				   // 遍历arr，把元素分别放入tmp数组(不存在才放)
				   var tmp = new Array();
				   for(var i in arr){
				  //该元素在tmp内部不存在才允许追加
				  if(tmp.indexOf(arr[i])==-1){
				    tmp.push(arr[i]);
				  }
				 }
				  return tmp;
				}
					
			//格式化时间
			function dateFtt(fmt,date) {
				  var o = {
				    "M+" : date.getMonth()+1,                 //月份   
				    "d+" : date.getDate(),                    //日   
				    "h+" : date.getHours(),                   //小时   
				    "m+" : date.getMinutes(),                 //分   
				    "s+" : date.getSeconds(),                 //秒   
				    "q+" : Math.floor((date.getMonth()+3)/3),   
				    "S"  : date.getMilliseconds()             //毫秒   
				  };   
				  if(/(y+)/.test(fmt))
				    fmt=fmt.replace(RegExp.$1, (date.getFullYear()+"").substr(4 - RegExp.$1.length));   
				  for(var k in o)
				    if(new RegExp("("+ k +")").test(fmt))
				  fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
				  return fmt;
				} 
		</script>
</body>
</html>