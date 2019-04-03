<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>layuiAdmin 主页示例模板二</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<link rel="stylesheet" href="${staticURL}/layuiadmin/layui/css/layui.css" media="all">
	<link rel="stylesheet" href="${staticURL}/layuiadmin/style/admin.css" media="all">
	<style>
		a.layui-btn{
			background-color:transparent!important;
		}
		.userImage{
			display: inline-block;
			width: 26px;
			height: 26px;
			border-radius: 50%
		}
		.paddtb{
			padding:10px 0;
		}
		.layui-progress{
			margin-top:10px;
		}
		.wjContent .layui-card-header{
			height:61px;
			line-height: 30px;
    		padding-bottom: 10px;
		}
	</style>
</head>
<body>
<div class="layui-fluid">
	<div class="layui-row layui-col-space15">
		<div class="layui-col-sm6 layui-col-md3">
			<div class="layui-card">
				<div class="layui-card-header">
					 昨日指数
					<span class="layui-badge layui-bg-green layuiadmin-badge">日</span>
				</div>
				<div class="layui-card-body layuiadmin-card-list">
					<p class="layuiadmin-big-font">5,911</p>
					<p>
						 总健康指数
						<span class="layuiadmin-span-color">1,135,394 <i class="layui-inline layui-icon layui-icon-dollar"></i></span>
					</p>
				</div>
			</div>
		</div>
		<div class="layui-col-sm6 layui-col-md3">
			<div class="layui-card">
				<div class="layui-card-header">
					访问量
					<span class="layui-badge layui-bg-blue layuiadmin-badge">周</span>
				</div>
				<div class="layui-card-body layuiadmin-card-list">
					<p class="layuiadmin-big-font">7,996</p>
					<p>
						总计访问量 
						<span class="layuiadmin-span-color">18万 <i class="layui-inline layui-icon layui-icon-flag"></i></span>
					</p>
				</div>
			</div>
		</div>
		<div class="layui-col-sm6 layui-col-md3">
			<div class="layui-card">
				<div class="layui-card-header">
					下载
					<span class="layui-badge layui-bg-orange layuiadmin-badge">月</span>
				</div>
				<div class="layui-card-body layuiadmin-card-list">
					<p class="layuiadmin-big-font">13,565</p>
					<p>
						新下载 
						<span class="layuiadmin-span-color">13% <i class="layui-inline layui-icon layui-icon-face-smile-b"></i></span>
					</p>
				</div>
			</div>
		</div>
		<div class="layui-col-sm6 layui-col-md3">
			<div class="layui-card">
				<div class="layui-card-header">
					活跃用户
					<span class="layui-badge layui-bg-red layuiadmin-badge">月</span>
				</div>
				<div class="layui-card-body layuiadmin-card-list">
					<p class="layuiadmin-big-font">市北区</p>
					<p>
						近一个月增长 
						<span class="layuiadmin-span-color">15% <i class="layui-inline layui-icon layui-icon-user"></i></span>
					</p>
				</div>
			</div>
		</div>
		<div class="layui-col-sm12">
			<div class="layui-card">
				<div class="layui-card-header">
					用户分布
					<div class="layui-btn-group layuiadmin-btn-group">
						<a href="javascript:;" onclick="changeData(1)" class="layui-btn layui-btn-primary layui-btn-xs">日</a>
						<a href="javascript:;" onclick="changeData(2)" class="layui-btn layui-btn-primary layui-btn-xs">周</a>
						<a href="javascript:;" onclick="changeData(3)" class="layui-btn layui-btn-primary layui-btn-xs">月</a>
					</div>
				</div>
				<div class="layui-card-body" style="height:400px;">
					<div class="layui-row layui-col-space15">
						<div class="layui-col-sm8">
							<div class="layui-carousel layadmin-carousel">
								<div id="LAY-index-pagethree" style="height:400px!important;"></div>
							</div>
						</div>
						<div class="layui-col-sm4">
							<!-- <table class="layui-table layuiadmin-page-table" lay-skin="line">
								<thead>
									<tr>
										<th>排名</th>
										<th>地区</th>
										<th>人数</th>
									</tr> 
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>浙江</td>
										<td>62310</td>
									</tr>
									<tr>
										<td>2</td>
										<td>上海</td>
										<td>59190</td>
									</tr>
									<tr>
										<td>3</td>
										<td>广东</td>
										<td>55891</td>
									</tr>
									<tr>
										<td>4</td>
										<td>北京</td>
										<td>51919</td>
									</tr>  
									<tr>
										<td>5</td>
										<td>山东</td>
										<td>39231</td>
									</tr>
									<tr>
										<td>6</td>
										<td>湖北</td>
										<td>37109</td>
									</tr>
								</tbody>
							</table> -->
							<table class="layui-table static layuiadmin-page-table" id="loadData" lay-skin="line">
								<colgroup>
									<col width="25%">
									<col width="25%">
									<col width="25%">
									<col width="25%">
								</colgroup>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div> 
		<div class="layui-col-sm12">
			<div class="layui-card">
				<div class="layui-card-header">
					 访问量
					<!-- <div class="layui-btn-group layuiadmin-btn-group">
						<a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs">上月</a>
						<a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs">本月</a>
					</div> -->
				</div>
				<div class="layui-card-body">
					<div class="layui-row">
						<div class="layui-col-sm8">
						    <div class="layui-carousel layadmin-carousel">
						      <div id="LAY-index-pagetwo" style="height:332px;">
						        <!-- <div><i class="layui-icon layui-icon-loading1 layadmin-loading"></i></div> -->
						      </div>
						    </div>
						</div>
						<div class="layui-col-sm4">
							<div class="layuiadmin-card-list">
								<p class="layuiadmin-normal-font">月访问数</p>
								<span>同上期增长</span>
								<div class="layui-progress layui-progress-big" lay-showPercent="yes">
									<div class="layui-progress-bar layui-bg-red" lay-percent="43%"></div>
								</div>
							</div>
							<div class="layuiadmin-card-list">
								<p class="layuiadmin-normal-font">月下载数</p>
								<span>同上期增长</span>
								<div class="layui-progress layui-progress-big" lay-showPercent="yes">
									<div class="layui-progress-bar layui-bg-orange" lay-percent="29%"></div>
								</div>
							</div>
							<div class="layuiadmin-card-list">
								<p class="layuiadmin-normal-font">健康指数</p>
								<span>同上期增长</span>
								<div class="layui-progress layui-progress-big" lay-showPercent="yes">
									<div class="layui-progress-bar" lay-percent="21%"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="layui-col-sm12">
			<div class="layui-card">
				<div class="layui-card-header">
					 健身人群年龄段分布统计
				</div>
				<div class="layui-card-body">
					<div id="LAY-index-pagefour" style='height:400px;'></div>
				</div>
			</div>
		</div>
		<div class="layui-col-sm12">
			<div class="layui-card">
				<div class="layui-card-header">
					 调查问卷统计
				</div>
				<div class="layui-card-body layui-row layui-col-space15 wjContent" id="surveyTotal">
					<!-- <div class="layui-col-sm6 layui-col-md3">
						<div class="layui-card">
							<div class="layui-card-header">
								问题一
							</div>
							<div class="layui-card-body layuiadmin-card-list">
								<div class='wjAnswer'>
									<div class='paddtb'>A、答案一</div>
									<div class="layui-progress" lay-showpercent="true">
									    <div class="layui-progress-bar" lay-percent="70%"></div>
									</div>
								</div>
								<div class='wjAnswer'>
									<div class='paddtb'>B、答案二</div>
									<div class="layui-progress" lay-showpercent="true">
									    <div class="layui-progress-bar" lay-percent="70%"></div>
									</div>
								</div>
								<div class='wjAnswer'>
									<div class='paddtb'>C、答案三</div>
									<div class="layui-progress" lay-showpercent="true">
									    <div class="layui-progress-bar" lay-percent="70%"></div>
									</div>
								</div>
								<div class='wjAnswer'>
									<div class='paddtb'>D、答案四</div>
									<div class="layui-progress" lay-showpercent="true">
									    <div class="layui-progress-bar" lay-percent="70%"></div>
									</div>
								</div>
							</div>
						</div> 
					</div>-->
				</div>
			</div>
		</div>
		<div class="layui-col-sm7">
			<div class="layui-card">
				<div class="layui-card-header">用户评价</div>
				<div class="layui-card-body">
					<ul class="layuiadmin-card-status layuiadmin-home2-usernote" id="vealuate">
						<!-- <li>
							<h3>贤心</h3>
							<p>作为 layui 官方推出的后台模板，从初版的饱受争议，到后续的埋头丰富，逐步占据了国内后台系统应用的主要市场。</p>
							<span>5月30日 00:00</span>
							<a href="javascript:;" layadmin-event="replyNote" data-id="7" class="layui-btn layui-btn-xs layuiadmin-reply">回复</a>
						</li>
						<li>
							<h3>诸葛亮</h3>
							<p>皓首匹夫！苍髯老贼！你枉活九十有六，一生未立寸功，只会摇唇鼓舌！助曹为虐！一条断脊之犬，还敢在我军阵前狺狺狂吠，我从未见过有如此厚颜无耻之人！</p>
							<span>5月02日 00:00</span>
							<a href="javascript:;" layadmin-event="replyNote" data-id="5" class="layui-btn layui-btn-xs layuiadmin-reply">回复</a>
						</li>
						<li>
							<h3>胡歌</h3>
							<p>你以为只要长得漂亮就有男生喜欢？你以为只要有了钱漂亮妹子就自己贴上来了？你以为学霸就能找到好工作？我告诉你吧，这些都是真的！</p>
							<span>5月11日 00:00</span>
							<a href="javascript:;" layadmin-event="replyNote" data-id="6" class="layui-btn layui-btn-xs layuiadmin-reply">回复</a>
						</li>
						<li>
							<h3>杜甫</h3>
							<p>人才虽高，不务学问，不能致圣。刘向十日画一水，五日画一石。</p>
							<span>4月11日 00:00</span>
							<a href="javascript:;" layadmin-event="replyNote" data-id="2" class="layui-btn layui-btn-xs layuiadmin-reply">回复</a>
						</li>
						<li>
							<h3>鲁迅</h3>
							<p>路本是无所谓有和无的，走的人多了，就没路了。。</p>
							<span>4月28日 00:00</span>
							<a href="javascript:;" layadmin-event="replyNote" data-id="4" class="layui-btn layui-btn-xs layuiadmin-reply">回复</a>
						</li>
						<li>
							<h3>张爱玲</h3>
							<p>于千万人之中遇到你所要遇到的人，于千万年之中，时间的无涯的荒野中，没有早一步，也没有晚一步，刚巧赶上了，那也没有别的话好说，唯有轻轻的问一声：“噢，原来你也在这里？”</p>
							<span>4月11日 00:00</span>
							<a href="javascript:;" layadmin-event="replyNote" data-id="1" class="layui-btn layui-btn-xs layuiadmin-reply">回复</a>
						</li> -->
					</ul>
				</div>
			</div>
		</div>
		<div class="layui-col-sm5">
			<div class="layui-row layui-col-space15">
				<div class="layui-col-sm12">
					<div class="layui-card">
						<div class="layui-card-header">本周活跃用户列表</div>
						<div class="layui-card-body">
							<table class="layui-table layuiadmin-page-table" lay-skin="line">
							    <thead>
							        <tr>
							            <th>用户</th>
							            <th>运动爱好</th>
							            <th>常去场馆</th>
							            <th>获得赞</th></tr>
							    </thead>
							    <tbody>
							    	<tr>
							            <td>
							                <div class="layui-table-cell laytable-cell-1-0-1" style="padding:0">
							                    <img class="userImage" src="${dynamicURL}/admin/information/info/fileCallBack?fileName=/userInfofile/20180929/timgYKT4DBLW.jpg">
								                <span class="first">&nbsp;&nbsp;<a class="" lay-href="bigData/toUserCase?index=1">嘴角上扬</a></span>
							                </div>
							            </td>
							            <td>
							                <span>慢跑、武术、乒乓球</span></td>
							            <td>
							                <span>市北区体育活动中心</span>
							            </td>
							            <td>98
							                <i class="layui-icon layui-icon-praise"></i></td>
							        </tr>
							        <tr>
							            <td>
							                <div class="layui-table-cell laytable-cell-1-0-1" style="padding:0">
							                    <img class="userImage" src="${dynamicURL}/admin/information/info/fileCallBack?fileName=/userInfofile/20180929/timgXW3WQGGH.jpg">
								                <span class="second">&nbsp;&nbsp;<a class="" lay-href="bigData/toUserCase?index=2">水瓶座</a></span>
							                </div>
							            </td>
							            <td>
							                <span>羽毛球、游泳、慢跑</span></td>
							            <td>
							                <span>市北区游泳俱乐部、市北区体育活动中心</span></td>
							            <td>21
							                <i class="layui-icon layui-icon-praise"></i></td>
							        </tr>
							        <tr>
							            <td>
							                <div class="layui-table-cell laytable-cell-1-0-1" style="padding:0">
							                    <img class="userImage" src="${dynamicURL}/admin/information/info/fileCallBack?fileName=/userInfofile/20180929/timgYKT4DBLA.png">
								                <span class="third">&nbsp;&nbsp;<a class="" lay-href="bigData/toUserCase?index=3">CHIU</a></span>
							                </div>
							            </td>
							            <td>
							                <span>羽毛球、健步</span></td>
							            <td>
							                <span>奥林匹克体育公园</span>
							            </td>
							            <td>66
							                <i class="layui-icon layui-icon-praise"></i></td>
							        </tr>
							        <tr>
							            <td>
							                <div class="layui-table-cell laytable-cell-1-0-1" style="padding:0">
							                    <img class="userImage" src="${dynamicURL}/admin/information/info/fileCallBack?fileName=/userInfofile/20180929/1533639741855.png">
								                <span >&nbsp;&nbsp;<a class="" lay-href="bigData/toUserCase?index=4">大丸子</a></span>
							                </div>
							            </td>
							            <td>
							                <span>篮球、慢跑</span></td>
							            <td>
							                <span>奥林匹克体育公园、丽达笼式篮球场</span></td>
							            <td>22
							                <i class="layui-icon layui-icon-praise"></i></td>
							        </tr>
							        <tr>
							            <td>
							                <div class="layui-table-cell laytable-cell-1-0-1" style="padding:0">
							                    <img class="userImage" src="${dynamicURL}/admin/information/info/fileCallBack?fileName=/userInfofile/20180929/1533620526116.jpg">
								                <span>&nbsp;&nbsp;<a class="" lay-href="bigData/toUserCase?index=5">许上进</a></span>
							                </div>
							            </td>
							            <td>
							                <span>游泳、慢跑</span></td>
							            <td>
							                <span>市北区游泳俱乐部、奥林匹克体育公园</span></td>
							            <td>21
							                <i class="layui-icon layui-icon-praise"></i></td>
							        </tr>
							        <tr>
							            <td>
							                <div class="layui-table-cell laytable-cell-1-0-1" style="padding:0">
							                    <img class="userImage" src="${dynamicURL}/admin/information/info/fileCallBack?fileName=/userInfofile/20180929/302637.png">
								                <span>&nbsp;&nbsp;<a class="" lay-href="bigData/toUserCase?index=6">小蚊子</a></span>
							                </div>
							            </td>
							            <td>
							                <span>健步、慢跑</span></td>
							            <td>
							                <span>奥林匹克体育公园</span>
							            </td>
							            <td>45
							                <i class="layui-icon layui-icon-praise"></i></td>
							        </tr>
							        <tr>
							            <td>
							                <div class="layui-table-cell laytable-cell-1-0-1" style="padding:0">
							                    <img class="userImage" src="${dynamicURL}/admin/information/info/fileCallBack?fileName=/userInfofile/20180929/1533368404907.jpg">
								                <span>&nbsp;&nbsp;<a class="" lay-href="bigData/toUserCase?index=7">周周</a></span>
							                </div>
							            </td>
							            <td>
							                <span>足球、游泳</span></td>
							            <td>
							                <span>市北区游泳俱乐部</span></td>
							            <td>21
							                <i class="layui-icon layui-icon-praise"></i></td>
							        </tr>
							    </tbody>
							</table>
						</div>
					</div>
				</div>
				<!-- <div class="layui-col-sm6">
					<div class="layui-card">
						<div class="layui-card-header">项目进展</div>
						<div class="layui-card-body">
							<div class="layui-tab-content">
								<div class="layui-tab-item layui-show">
									<table id="LAY-index-prograss"></table>
								</div>
							</div>
						</div>
					</div>
				</div> -->
				<!-- <div class="layui-col-sm12">
					<div class="layui-card">
						<div class="layui-card-header">用户全国分布</div>
							<div class="layui-card-body">
								<div class="layui-row layui-col-space15">
									<div class="layui-col-sm4">
										<table class="layui-table layuiadmin-page-table" lay-skin="line">
											<thead>
												<tr>
													<th>排名</th>
													<th>地区</th>
													<th>人数</th>
												</tr> 
											</thead>
											<tbody>
												<tr>
													<td>1</td>
													<td>浙江</td>
													<td>62310</td>
												</tr>
												<tr>
													<td>2</td>
													<td>上海</td>
													<td>59190</td>
												</tr>
												<tr>
													<td>3</td>
													<td>广东</td>
													<td>55891</td>
												</tr>
												<tr>
													<td>4</td>
													<td>北京</td>
													<td>51919</td>
												</tr>  
												<tr>
													<td>5</td>
													<td>山东</td>
													<td>39231</td>
												</tr>
												<tr>
													<td>6</td>
													<td>湖北</td>
													<td>37109</td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="layui-col-sm8">
									</div>
								</div>
							</div>
						</div>
					</div> -->
				</div>
			</div>
		</div>
	</div>
</div>
  
<script src="${staticURL}/js/echarts.min.js"></script>  
<script src="${staticURL}/js/echartsTheme.js"></script>  
<script>
	var dateData = [
		{sortNumber: '1',name: '市北区',value: 457},
		{sortNumber: '2',name: '市南区',value: 377},
		{sortNumber: '3',name: '崂山区',value: 301},
		{sortNumber: '4',name: '城阳区',value: 289},
		{sortNumber: '5',name: '李沧区',value: 245},
		{sortNumber: '6',name: '四方区',value: 192},
	];
	var weekData = [
		{sortNumber: '1',name: '市北区',value: 1757},
		{sortNumber: '2',name: '崂山区',value: 1138},
		{sortNumber: '3',name: '市南区',value: 1656},
		{sortNumber: '4',name: '李沧区',value: 1049},
		{sortNumber: '5',name: '城阳区',value: 956},
		{sortNumber: '6',name: '四方区',value: 612}
	];
	var monthData = [
		{sortNumber: '1',name: '市北区',value: 6037},
		{sortNumber: '2',name: '市南区',value: 5477},
		{sortNumber: '3',name: '崂山区',value: 5121},
		{sortNumber: '4',name: '李沧区',value: 4075},
		{sortNumber: '5',name: '城阳区',value: 3982},
		{sortNumber: '6',name: '四方区',value: 2811}
	];
	var data = dateData;
	$(function() {
	    initMap();
	    changeData(1);
	    loadVealuate();
	    initVisitMap();
	    initAgeMap();
	    initSurveyTotal();
	});
	var mainMap = $("#LAY-index-pagethree")[0];
	var myChart = echarts.init(mainMap, 'echartsTheme');
	function initMap() {
	    $.get(staticURL + 'geoJson/QD_geo.json',
	    function(geoJson) {

	        echarts.registerMap('QD', geoJson);

	        myChart.setOption(option = {
	            title: {
	                text: '青岛健身大数据',
	                subtext: '数据展示',
	                textStyle: {
	                    color: '#666'
	                }
	            },
	            tooltip: {
	                trigger: "item",
	                formatter: '{b}<br/>{c}'
	            },
	            visualMap: {
	                min: 100,
	                max: 7000,
	                text: ['高', '低'],
	                realtime: false,
	                calculable: true,
	                /* inRange: {
	                    color: ['lightskyblue','yellow', 'orangered']
	                } */

	            },
	            series: [{
	                name: '青岛健身大数据',
	                type: 'map',
	                mapType: 'QD',
	                // 自定义扩展图表类型
	                roam: true,
	                itemStyle: {
	                    normal: {
	                        borderColor: 'rgba(100,149,237,1)',
	                        borderWidth: 0,
	                        itemStyle: {
	                            areaColor: "#004981"
	                        },
	                        label: {
	                            show: true,
	                            //是否显示区域名称
	                            textStyle: {
	                                color: "#d87a80"
	                            }
	                        }
	                    },
	                    emphasis: {
	                        label: {
	                            show: false
	                        },
	                        itemStyle: {
	                            areaColor: "#fe994e"
	                        }
	                    }
	                },
	                data: data
	            }]
	        });
	    });
	}
	//访问量
	var visitMap = $("#LAY-index-pagetwo")[0];
	var visitChart = echarts.init(visitMap, 'echartsTheme');
	function initVisitMap(){
		$.ajax({
			type : "POST",
			url : "${dynamicURL}/admin/bigData/findListOfVisit",
			dataType:"json",
			async:false,
			success : function(result) {
				if(result.length){
					var xAxisData = new Array();
					var webData = [];
					var mobileData = [];
					var avgData = [];
					$.each(result,function(index,value){
						xAxisData[index] = value.nowday + '日';
						webData.push(value.webNum);
						mobileData.push(value.mobileNum);
						avgData.push(value.avgNum);
					});
					visitChart.setOption(option = {
						tooltip: {
							trigger: "axis"
						},
						calculable: !0,
						legend: {
							data: ["web端访问量", "手机端访问量", "平均访问量"]
						},
						xAxis: [{
							type: "category",
							data: xAxisData,
						}],
						yAxis: [{
							type: "value",
							name: "web端访问量",
							axisLabel: {
								formatter: "{value}"
							}
						}, {
							type: "value",
							name: "手机端访问量",
							axisLabel: {
								formatter: "{value}"
							}
						}],
						series: [{
							name: "web端访问量",
							type: "line",
							data: webData
						}, {
							name: "手机端访问量",
							type: "line",
							yAxisIndex: 1,
							data: mobileData
						}, {
							name: "平均访问量",
							type: "line",
							data: avgData
						}]
						});
				}
			},
			error : function() {
			}
		});
	}
	//健身人群年龄段分布统计
	var ageMap = $("#LAY-index-pagefour")[0];
	var myAgeChart = echarts.init(ageMap, 'echartsTheme');
	function initAgeMap(){
		$.ajax({
			type : "POST",
			url : "${dynamicURL}/admin/bigData/findListOfAge",
			dataType:"json",
			async:false,
			success : function(result) {
				if(result.length){
					var legendData = new Array();
					var mainData = [];
					$.each(result,function(index,value){
						legendData[index] = value.type;
						if(value.total == 0){
							mainData.push({value:value.total,name: value.type});
						}else{
							mainData.push({
								value:value.total,
								name: value.type,
								label: {
									normal: {
										formatter: [
											'{title|{b}}{abg|}',
											'  {weatherHead|性别}{valueHead|人数}{rateHead|占比}',
											'{hr|}',
											'  {Sunny|男}{value|'+value.total0 +'}{rate|'+value.ratio0 +'}',
											'  {Cloudy|女}{value|'+value.total1 +'}{rate|'+value.ratio1 +'}'
										].join('\n'),
										backgroundColor: '#eee',
										borderColor: '#777',
										borderWidth: 1,
										borderRadius: 4,
										rich: {
											title: {
												color: '#eee',
												align: 'center'
											},
											abg: {
												backgroundColor: '#333',
												width: '100%',
												align: 'right',
												height: 25,
												borderRadius: [4, 4, 0, 0]
											},
											Sunny: {
												height: 30,
												align: 'left'
											},
											Cloudy: {
												height: 30,
												align: 'left'
											},
											Showers: {
												height: 30,
												align: 'left'
											},
											weatherHead: {
												color: '#333',
												height: 24,
												align: 'left'
											},
											hr: {
												borderColor: '#777',
												width: '100%',
												borderWidth: 0.5,
												height: 0
											},
											value: {
												width: 20,
												padding: [0, 20, 0, 40],
												align: 'left'
											},
											valueHead: {
												color: '#333',
												width: 20,
												padding: [0, 20, 0, 30],
												align: 'center'
											},
											rate: {
												width: 40,
												align: 'right',
												padding: [0, 10, 0, 0]
											},
											rateHead: {
												color: '#333',
												width: 40,
												align: 'center',
												padding: [0, 10, 0, 0]
											}
										}
									}
								}
							});
						}
					});
					myAgeChart.setOption(option = {
					title: {
						//text: '健身人群年龄段分布统计',
						//subtext: '虚构数据',
						left: 'center'
					},
					tooltip : {
						trigger: 'item',
						formatter: "{a} <br/>{b} : {c} ({d}%)"
					},
					legend: {
						orient: 'vertical',
						top:  30,
						left: 30,
						data: legendData
					},
					series : [
						{
							type: 'pie',
							name:'健身人群年龄段分布',
							radius : '65%',
							center: ['50%', '50%'],
							selectedMode: 'single',
							data:mainData,
							itemStyle: {
								emphasis: {
									shadowBlur: 10,
									shadowOffsetX: 0,
									shadowColor: 'rgba(0, 0, 0, 0.5)'
								}
							}
						}
					]
				});
				}
			},
			error : function() {
			}
		});
	}
	//问卷调查
	function initSurveyTotal(){
		$.ajax({
			type : "POST",
			url : "${dynamicURL}/admin/survey/paperQuestion/list?search_EQ_surveyPaperEntity.id=8&rows=8",
			dataType:"json",
			async:false,
			success : function(result) {
				if(result){
					var str = '';
					$.each(result.rows,function(index,value){
					str += '<div class="layui-col-sm6 layui-col-md3">'+
								'<div class="layui-card">'+
									'<div class="layui-card-header">'+
										value.surveyQuestionEntity.title+
									'</div>'+
									'<div class="layui-card-body layuiadmin-card-list">';
					var options = value.surveyQuestionEntity.options.split(';');
					var letters = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N'];
					$.each(options,function(i,v){
						//查每种选项被选择的比例
						var ratioStr = "";
						$.ajax({
							type : "POST",
							url : "${dynamicURL}/admin/survey/record/getRatio?search_EQ_surveyPaperEntity.id=8&search_EQ_surveyQuestionEntity.id=" + value.surveyQuestionEntity.id + "&search_LIKE_userAnswer=" + letters[i],
							dataType:"json",
							async:false,
							success : function(data) {
								ratioStr = data;
							}
						});
						str += 			'<div class="wjAnswer">'+
											'<div class="paddtb">' + letters[i] + '、' + v + '</div>'+
											'<div class="layui-progress" lay-showpercent="true">'+
												'<div class="layui-progress-bar" lay-percent="'+ ratioStr +'%"></div>'+
											'</div>'+
										'</div>';
					});
					str += 			'</div>'+
								'</div>'+
							'</div>';
					});
					$("#surveyTotal").append(str);
				}
			},
			error : function() {
			}
		});
	}
	/* 点击日周月同时改变表格数据及左侧热力图 */
	function changeData(index) {
	    if (index == 1) 
	    	data = dateData;
	    else if (index == 2) 
	    	data = weekData;
	    else 
	    	data = monthData;
	    layui.config({
	        base: '${staticURL}/layuiadmin/' //静态资源所在路径
	    }).use('table',function() {
	        var table = layui.table;
	        table.render({
	            elem: '#loadData',
	            page: false,
	            cols: [[{
	                field: 'sortNumber',
	                title: '排名'
	            },
	            {
	                field: 'name',
	                title: '地区'
	            },
	            {
	                field: 'value',
	                title: '人数'
	            }]],
	            data: data
	        });
	    });
	    myChart.setOption(option = {
    		series: [{
                name: '青岛健身大数据',
                type: 'map',
                mapType: 'QD',
                // 自定义扩展图表类型
                roam: true,
                itemStyle: {
                    normal: {
                        borderColor: 'rgba(100,149,237,1)',
                        borderWidth: 0,
                        itemStyle: {
                            areaColor: "#004981"
                        },
                        label: {
                            show: true,
                            //是否显示区域名称
                            textStyle: {
                                color: "#d87a80"
                            }
                        }
                    },
                    emphasis: {
                        label: {
                            show: false
                        },
                        itemStyle: {
                            areaColor: "#fe994e"
                        }
                    }
                },
                data: data
            }]
	    })

	}
	/* 加载评论 */
	function loadVealuate(){
		var url = "${dynamicURL}/admin/venue/vealuate/list?page=1&rows=7&sort=gmtCreate&order=desc";
		$.ajax({
			url:url,
			type:"post",
			dataType:"json",
			success:function(result){
				if(result==null){
					return;
				}
				if(result.rows.length==0){
					$("#vealuate").append('<p>暂无用户评价<p>');
					return;
				}
				var rows = result.rows;
				$.each(rows,function(index){
					var item = rows[index];
					$("#vealuate").append(
							'<li>'+
								'<img style="float: left;" class="userImage" src="${dynamicURL}/admin/venue/user/userHeadImg?uuid='+ item.uuid + '" />'+ 
								'<h3>&nbsp;&nbsp;&nbsp;' + item.userName + '</h3>'+
								'<p>' + item.content + '</p>'+
								'<span>' + item.timeWrapper + '</span><span>&nbsp;&nbsp;&nbsp;'+ item.venueName +'</span>'+
							'</li>'
						);	
				})
			},
			error:function(error){
				$("#vealuate").append('<p>暂无用户评价<p>');
			}
		});
	}
</script>
</body>
</html>