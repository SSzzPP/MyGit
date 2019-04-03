<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script src="${staticURL}/echarts/echarts.common.min.js"></script>
<script src="${staticURL}/echarts/infographic.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>市北区体育局全民共享健身平台</title>

</head>
<body>
	<div id="chart1" style="width: 720px;height:465px;"></div>
	<div id="chart2" style="width: 720px;height:465px;"></div>
	<div id="chart3" style="width: 720px;height:465px;"></div>
</body>
<script>
    var myChart1 = echarts.init(document.getElementById('chart1'), 'infographic', {renderer: 'svg'});
    var myChart2 = echarts.init(document.getElementById('chart2'), 'infographic', {renderer: 'svg'});
    var myChart3 = echarts.init(document.getElementById('chart3'), 'infographic', {renderer: 'svg'});
    //var myChart = echarts.init(document.getElementById('main'), 'purple-passion');

      
	option1 = {
	    title : {
	        text: '昨日积分来源',
	        x:'center'
	    },
	    tooltip : {
	        trigger: 'item',
	        formatter: "{a}： {b} <br/>数量： {c} ({d}%)"
	    },
	    legend: {
	        type: 'scroll',
	        orient: 'vertical',
	        right: 10,
	        top: 20,
	        bottom: 20,
	        data: ['步数', '短跑', '预定', '评价', '奖池']
	    },
	    series : [
	        {
	            name: '类型',
	            type: 'pie',
	            radius : '55%',
	            center: ['40%', '50%'],
	            data: [
	    	    	{name: '步数', value: 19}, 
	    	    	{name: '短跑', value: 24}, 
	    	    	{name: '预定', value: 20}, 
	    	    	{name: '评价', value: 10},
	    	    	{name: '奖池', value: 20} 
	    	    
	    	    ],
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
	
    myChart1.setOption(option1);  
        
	option2 = {
	    title : {
	        text: '本周运动偏好',
	        x:'center'
	    },
	    tooltip : {
	        trigger: 'item',
	        formatter: "{a}： {b} <br/>次数： {c} ({d}%)"
	    },
	    legend: {
	        type: 'scroll',
	        orient: 'vertical',
	        right: 10,
	        top: 20,
	        bottom: 20,
	        data: ['跑步', '球类', '健步', '游泳', '跳绳']
	    },
	    series : [
	        {
	            name: '类型',
	            type: 'pie',
	            radius : '55%',
	            center: ['40%', '50%'],
	            data: [
	    	    	{name: '球类', value: 3}, 
	    	    	{name: '跑步', value: 4},
	    	    	{name: '健步', value: 1}, 
	    	    	{name: '游泳', value: 2}, 
	    	    	{name: '跳绳', value: 1}
	    	    
	    	    ],
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
	
    myChart2.setOption(option2);
  
    option3 = {
    		title : {
    	        text: '本周运动时长',
    	        x:'center'
    	    },
    	    tooltip: {
    	        trigger: 'axis',
    	        axisPointer: {
    	            type: 'cross',
    	            crossStyle: {
    	                color: '#999'
    	            }
    	        }
    	    },
    	    legend: {
    	    	type: 'scroll',
    	        orient: 'horizontal',
    	        right: 10,
    	        top: 10,
    	        bottom: 20,
    	        data:['跑步','球类','消耗卡路里']
    	    },
    	    xAxis: [
    	        {
    	            type: 'category',
    	            data: ['周一','周二','周三','周四','周五','周六','周日'],
    	            axisPointer: {
    	                type: 'shadow'
    	            }
    	        }
    	    ],
    	    yAxis: [
    	        {
    	            type: 'value',
    	            min: 0,
    	            max: 8,
    	            interval: 5,
    	            axisLabel: {
    	                formatter: '{value} h'
    	            }
    	        },
    	        {
    	            type: 'value',
    	            min: 0,
    	            max: 400,
    	            interval: 50,
    	            axisLabel: {
    	                formatter: '{value} '
    	            }
    	        }
    	    ],
    	    series: [
    	        {
    	            name:'跑步',
    	            type:'bar',
    	            data:[2, 1, 0, 2, 1.5, 1, 1.6]
    	        },
    	        {
    	            name:'球类',
    	            type:'bar',
    	            data:[2, 0, 1, 1, 0, 1, 1.5]
    	        },
    	        {
    	            name:'消耗卡路里',
    	            type:'line',
    	            yAxisIndex: 1,
    	            data:[380, 260, 250, 360, 310, 320, 370]
    	        }
    	    ]
    	};
		
	    myChart3.setOption(option3);
	    
</script>
</html>