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
  	.padding{
  		padding:10px;
  	}
	.layui-table tbody tr:hover, .layui-table thead tr, .layui-table-click,
		.layui-table-header, .layui-table-hover, .layui-table-mend,
		.layui-table-patch, .layui-table-tool, .layui-table[lay-even] tr:nth-child(even){
		background-color: transparent;
	}
	
	.layui-table td:nth-child(odd) {
		background-color: #f9f9f9;
		font-weight: bold;
	}
	.layui-table tbody tr td {
		word-wrap: break-word;
		word-break: break-all
	}
	.layui-table tbody tr td:first-child {
		width: 15%;
	}
	
	.layui-table tbody tr td:last-child {
		width: 85%;
	}
	.userImage{
		display: inline-block;
		width: 26px;
		height: 26px;
		border-radius: 50%
	}
  </style>
</head>
<body>

  <div class="layui-fluid">
    <div class="layui-row layui-col-space15">
          <div class="layui-col-sm12">
        <div class="layui-card">
          <div class="layui-card-header">
            	用户数据
          </div>
          <div class="layui-card-body">
          <table class="layui-table">
				<colgroup>
					<col width="20%">
					<col width="30%">
					<col width="20%">
					<col width="30%">
				</colgroup>

				<tbody id="userInfo">
					
				</tbody>
			</table>
          </div>
        </div>
      </div>
      <div class="layui-col-sm12">
        <div class="layui-card">
          <div class="layui-card-header">健康指数</div>
          <div class="layui-card-body">
            <div class="layui-row">
              <div class="layui-col-sm12">
                  <div class="layui-carousel layadmin-carousel layadmin-dataview" data-anim="fade" lay-filter="LAY-index-pagetwo">
                    <div carousel-item id="LAY-index-pagetwo">
                      <div><i class="layui-icon layui-icon-loading1 layadmin-loading"></i></div>
                    </div>
                  </div>
              </div>
            </div>
          </div>
        </div>
      </div>
       <div class="layui-col-sm12">
        <div class="layui-card">
          <div class="layui-card-header">步数与运动时长</div>
          <div class="layui-card-body">
            <div class="layui-row">
              <div class="layui-col-sm12">
                  <div class="layui-carousel layadmin-carousel layadmin-dataview" data-anim="fade" lay-filter="LAY-index-pagefour">
                    <div carousel-item id="LAY-index-pagefour">
                      <div><i class="layui-icon layui-icon-loading1 layadmin-loading"></i></div>
                    </div>
                  </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      </div>
    </div>
  </div>
  
  <script src="${staticURL}/layuiadmin/layui/layui.js"></script>  
  <script src="${staticURL}/js/echarts.min.js"></script>  
  <script src="${staticURL}/js/echartsTheme.js"></script>  
  <script>
	layui.config({
		base: '${staticURL}/layuiadmin/' //静态资源所在路径
	}).extend({
		index: 'lib/index' //主入口模块
	}).use(['index', 'userCase']);
	var index = "${index}";
	var str1="<tr><td>昵称</td><td>嘴角上扬</td><td>所在辖区</td><td>大港街道</td></tr>"+
			"<tr><td>积分余额</td><td>100</td><td>头像</td><td><img class='userImage' src='${dynamicURL}/admin/information/info/fileCallBack?fileName=/userInfofile/20180929/timgYKT4DBLW.jpg'></td></tr>"+
			"<tr><td>健康指数</td><td>98</td><td>运动频次</td><td>较高</td></tr>"+
			"<tr><td>运动偏好</td><td colspan='3'>慢跑、武术、乒乓球</td></tr>"+
			"<tr><td>常去场馆</td><td colspan='3'><ul class='layadmin-homepage-list-inline'>"+
			"<a href='javascript:;' class='layui-btn layui-btn-primary layui-btn-sm'>中联运动公园</a>"+
			"<a href='javascript:;' class='layui-btn layui-btn-primary layui-btn-sm'>中联羽毛球馆</a></ul></td></tr>";
	var str2="<tr><td>昵称</td><td>水瓶座</td><td>所在辖区</td><td>辽宁路街道</td></tr>"+
			"<tr><td>积分余额</td><td>90</td><td>头像</td><td><img class='userImage' src='${dynamicURL}/admin/information/info/fileCallBack?fileName=/userInfofile/20180929/timgXW3WQGGH.jpg'></td></tr>"+
			"<tr><td>健康指数</td><td>96</td><td>运动频次</td><td>较高</td></tr>"+
			"<tr><td>运动偏好</td><td colspan='3'>羽毛球、游泳、慢跑</td></tr>"+
			"<tr><td>常去场馆</td><td colspan='3'><ul class='layadmin-homepage-list-inline'>"+
			"<a href='javascript:;' class='layui-btn layui-btn-primary layui-btn-sm'>市北区游泳俱乐部</a>"+
			"<a href='javascript:;' class='layui-btn layui-btn-primary layui-btn-sm'>市北区体育活动中心</a></ul></td></tr>";
	var str3="<tr><td>昵称</td><td>CHIU</td><td>所在辖区</td><td>辽宁路街道</td></tr>"+
			"<tr><td>积分余额</td><td>94</td><td>头像</td><td><img class='userImage' src='${dynamicURL}/admin/information/info/fileCallBack?fileName=/userInfofile/20180929/timgYKT4DBLA.png'></td></tr>"+
			"<tr><td>健康指数</td><td>89</td><td>运动频次</td><td>较低</td></tr>"+
			"<tr><td>运动偏好</td><td colspan='3'>羽毛球、健步</td></tr>"+
			"<tr><td>常去场馆</td><td colspan='3'><ul class='layadmin-homepage-list-inline'>"+
			"<a href='javascript:;' class='layui-btn layui-btn-primary layui-btn-sm'>奥林匹克体育公园</a></ul></td></tr>";
	var str4="<tr><td>昵称</td><td>大丸子</td><td>所在辖区</td><td>台东街道</td></tr>"+
			"<tr><td>积分余额</td><td>93</td><td>头像</td><td><img class='userImage' src='${dynamicURL}/admin/information/info/fileCallBack?fileName=/userInfofile/20180929/1533639741855.png'></td></tr>"+
			"<tr><td>健康指数</td><td>97</td><td>运动频次</td><td>较高</td></tr>"+
			"<tr><td>运动偏好</td><td colspan='3'>篮球、慢跑</td></tr>"+
			"<tr><td>常去场馆</td><td colspan='3'><ul class='layadmin-homepage-list-inline'>"+
			"<a href='javascript:;' class='layui-btn layui-btn-primary layui-btn-sm'>丽达笼式篮球场</a>"+
			"<a href='javascript:;' class='layui-btn layui-btn-primary layui-btn-sm'>奥林匹克体育公园</a></ul></td></tr>";
	var str5="<tr><td>昵称</td><td>许上进</td><td>所在辖区</td><td>登州路街道</td></tr>"+
			"<tr><td>积分余额</td><td>96</td><td>头像</td><td><img class='userImage' src='${dynamicURL}/admin/information/info/fileCallBack?fileName=/userInfofile/20180929/1533620526116.jpg'></td></tr>"+
			"<tr><td>健康指数</td><td>77</td><td>运动频次</td><td>低</td></tr>"+
			"<tr><td>运动偏好</td><td colspan='3'>游泳、慢跑</td></tr>"+
			"<tr><td>常去场馆</td><td colspan='3'><ul class='layadmin-homepage-list-inline'>"+
			"<a href='javascript:;' class='layui-btn layui-btn-primary layui-btn-sm'>市北区游泳俱乐部</a>"+
			"<a href='javascript:;' class='layui-btn layui-btn-primary layui-btn-sm'>奥林匹克体育公园</a></ul></td></tr>";
	var str6="<tr><td>昵称</td><td>小蚊子</td><td>所在辖区</td><td>贮水山路10号</td></tr>"+
			"<tr><td>积分余额</td><td>94</td><td>头像</td><td><img class='userImage' src='${dynamicURL}/admin/information/info/fileCallBack?fileName=/userInfofile/20180929/302637.png'></td></tr>"+
			"<tr><td>健康指数</td><td>89</td><td>运动频次</td><td>较低</td></tr>"+
			"<tr><td>运动偏好</td><td colspan='3'>慢跑、健步</td></tr>"+
			"<tr><td>常去场馆</td><td colspan='3'><ul class='layadmin-homepage-list-inline'>"+
			"<a href='javascript:;' class='layui-btn layui-btn-primary layui-btn-sm'>奥林匹克体育公园</a></ul></td></tr>";
	var str7="<tr><td>昵称</td><td>周周</td><td>所在辖区</td><td>四方街道</td></tr>"+
			"<tr><td>积分余额</td><td>95</td><td>头像</td><td><img class='userImage' src='${dynamicURL}/admin/information/info/fileCallBack?fileName=/userInfofile/20180929/1533368404907.jpg'></td></tr>"+
			"<tr><td>健康指数</td><td>90</td><td>运动频次</td><td>较高</td></tr>"+
			"<tr><td>运动偏好</td><td colspan='3'>足球、游泳</td></tr>"+
			"<tr><td>常去场馆</td><td colspan='3'><ul class='layadmin-homepage-list-inline'>"+
			"<a href='javascript:;' class='layui-btn layui-btn-primary layui-btn-sm'>市北区游泳俱乐部</a></ul></td></tr>";
	var str = str1;
	if(index ==2) str = str2
	if(index ==3) str = str3
	if(index ==4) str = str4
	if(index ==5) str = str5
	if(index ==6) str = str6
	if(index ==7) str = str7
	$("#userInfo").append(str);
  </script>
</body>
</html>