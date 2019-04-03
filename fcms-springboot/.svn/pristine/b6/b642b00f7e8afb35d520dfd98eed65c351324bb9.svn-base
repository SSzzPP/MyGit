<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>青岛市市北区体育局全民共享健身平台</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <link rel="stylesheet" href="${staticURL}/layuiadmin/layui/css/layui.css" media="all">
  <link rel="stylesheet" href="${staticURL}/layuiadmin/style/admin.css" media="all">
  
</head>
<body class="layui-layout-body">
<style>
#menu-more span.layui-nav-more{
	right: -13px;
}
/* #firstMenuCnt li.layui-nav-item.layui-this {
    background-color: #009688 !important;
} */
</style>
  <div id="LAY_app">
    <div class="layui-layout layui-layout-admin">
      <div class="layui-header">
        <!-- 头部区域 -->
        <ul class="layui-nav layui-layout-left" style="width:60%;" id="firstMenuCnt" lay-filter="component-nav">
          <li class="layui-nav-item layadmin-flexible" lay-unselect>
            <a href="javascript:;" layadmin-event="flexible" title="侧边伸缩">
              <i class="layui-icon layui-icon-shrink-right" id="LAY_app_flexible"></i>
            </a>
          </li>
          <!-- <li class="layui-nav-item layui-hide-xs" lay-unselect>
            <a href="http://www.layui.com/admin/" target="_blank" title="前台">
              <i class="layui-icon layui-icon-website"></i>
            </a>
          </li> -->
          <li class="layui-nav-item" lay-unselect>
            <a href="javascript:;" layadmin-event="refresh" title="刷新">
              <i class="layui-icon layui-icon-refresh-3"></i>
            </a>
          </li>
          <!-- <li class="layui-nav-item"><a href="javascript:;">大数据</a></li>
          <li class="layui-nav-item" lay-unselect>
            <a href="javascript:;" layadmin-event="" title="">产品
            </a>
            <dl class="layui-nav-child">
                  <dd><a href="javascript:;">选项1</a></dd>
                  <dd><a href="javascript:;">选项2</a></dd>
                  <dd><a href="javascript:;">选项3</a></dd>
                </dl>
          </li> -->
          <!-- <li class="layui-nav-item layui-hide-xs" lay-unselect>
            <input style="margin:9px 0" type="text" placeholder="搜索..." autocomplete="off" class="layui-input layui-input-search" layadmin-event="serach" lay-action="template/search.html?keywords="> 
          </li> -->
        </ul>
        <ul class="layui-nav layui-layout-right" lay-filter="layadmin-layout-right">
          
          <!-- <li class="layui-nav-item" lay-unselect>
            <a lay-href="app/message/index.html" layadmin-event="message" lay-text="消息中心">
              <i class="layui-icon layui-icon-notice"></i>  
              
                                   如果有新消息，则显示小圆点
              <span class="layui-badge-dot"></span>
            </a>
          </li> -->
          <li class="layui-nav-item layui-hide-xs" lay-unselect>
            <a href="javascript:;" layadmin-event="theme">
              <i class="layui-icon layui-icon-theme"></i>
            </a>
          </li>
          <!-- <li class="layui-nav-item layui-hide-xs" lay-unselect>
            <a href="javascript:;" layadmin-event="note">
              <i class="layui-icon layui-icon-note"></i>
            </a>
          </li> -->
          <li class="layui-nav-item layui-hide-xs" lay-unselect>
            <a href="javascript:;" layadmin-event="fullscreen">
              <i class="layui-icon layui-icon-screen-full"></i>
            </a>
          </li>
          <li class="layui-nav-item" style="margin-right: 8px;" lay-unselect>
            <a href="javascript:;">
              <cite>${nickName}</cite>
            </a>
            <dl class="layui-nav-child">
              <dd><a lay-href="set/user/info.html">基本资料</a></dd>
              <dd><a onclick="edit()">修改密码</a></dd>
              <hr>
              <dd layadmin-event="logout" style="text-align: center;"><a>退出</a></dd>
            </dl>
          </li>
          
          <!-- <li class="layui-nav-item layui-hide-xs" lay-unselect>
            <a href="javascript:;" layadmin-event="about"><i class="layui-icon layui-icon-more-vertical"></i></a>
          </li>
          <li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm" lay-unselect>
            <a href="javascript:;" layadmin-event="more"><i class="layui-icon layui-icon-more-vertical"></i></a>
          </li> -->
        </ul>
      </div>
      
      <!-- 侧边菜单 -->
      <div class="layui-side layui-side-menu">
        <div class="layui-side-scroll">
          <div class="layui-logo" lay-href="main/homePage">
            <span>全民共享健身平台</span>
          </div>
          
          <ul class="layui-nav layui-nav-tree" lay-shrink="all" id="LAY-system-side-menu" lay-filter="layadmin-system-side-menu">
             
          </ul>
        </div>
      </div>

      <!-- 页面标签 -->
      <div class="layadmin-pagetabs" id="LAY_app_tabs">
        <div class="layui-icon layadmin-tabs-control layui-icon-prev" layadmin-event="leftPage"></div>
        <div class="layui-icon layadmin-tabs-control layui-icon-next" layadmin-event="rightPage"></div>
        <div class="layui-icon layadmin-tabs-control layui-icon-down">
          <ul class="layui-nav layadmin-tabs-select" lay-filter="layadmin-pagetabs-nav">
            <li class="layui-nav-item" lay-unselect>
              <a href="javascript:;"></a>
              <dl class="layui-nav-child layui-anim-fadein">
                <dd layadmin-event="closeThisTabs"><a href="javascript:;">关闭当前标签页</a></dd>
                <dd layadmin-event="closeOtherTabs"><a href="javascript:;">关闭其它标签页</a></dd>
                <dd layadmin-event="closeAllTabs"><a href="javascript:;">关闭全部标签页</a></dd>
              </dl>
            </li>
          </ul>
        </div>
        <div class="layui-tab" lay-unauto lay-allowClose="true" lay-filter="layadmin-layout-tabs">
          <ul class="layui-tab-title" id="LAY_app_tabsheader">
            <li lay-id="main/homePage" lay-attr="main/homePage" class="layui-this"><i class="layui-icon layui-icon-home"></i></li>
          </ul>
        </div>
      </div>
      
      
      <!-- 主体内容 -->
      <div class="layui-body" id="LAY_app_body">
        <div class="layadmin-tabsbody-item layui-show">
          <iframe src="${dynamicURL}/admin/main/homePage" frameborder="0" class="layadmin-iframe"></iframe>
        </div>
      </div>
      
      <!-- 辅助元素，一般用于移动设备下遮罩 -->
      <div class="layadmin-body-shade" layadmin-event="shade"></div>
    </div>
  </div>
  <script>
  	function edit() {
  		var url = "${dynamicURL}/admin/system/user/toPassword";
  		_layer({
    	  	url:url,
    	  	title:"修改密码",
    	  	btn: ['保存', '取消'],
    	  	width : "600px",
    	    height: "400px",
    	},{
    	  	yes: _.debounce(function(index, layero){
    	  		var bObj = layero.find("a.layui-layer-btn0");
	            var frm = $("#layui-layer-iframe" + ixs["修改密码"]).contents().find("form.addForm");
	            
	            var confirmPassword = $('#confirmPassword').val();
	            var newPassword = $("#newPassword").val();
	            
	            if(confirmPassword == newPassword) {
	            	 $.submit({
	 		            url: "${dynamicURL}/admin/system/user/saveNewPassword",
	 		            formTg:frm,
	 		            butObj : bObj,
	 		            success : function(data){
	 		            	if(data.success) {
	 		            		layer.confirm(data.msg,function() {
	 		            			layui.common.logout();
	 		            		});
	 		            	}else {
	 		            		layer.alert(data.msg);
	 		            	}
	 		            },
	 		            error : function(){
	 		            	layer.alert('出错啦！', {icon: 0});
	 		            }
	 	           	});
	            }else {
	            	layer.alert('确认密码与新设密码不一致！');
	            }
    	  	},waitTime,true),btn2: function(index, layero){
    	    //按钮【取消】的回调
    	  	layer.close(parent.parent.ixs["修改密码"]);
    	  	}
	  	});
  	}
  </script>
	<%-- <script src="${staticURL}/js/menu.js"></script>
	<script src="${staticURL}/layuiadmin/layui/layui.js"></script>
	<script>
		menuUtils.loadData(function(){
			layui.config({
				base: '${staticURL}/layuiadmin/' //静态资源所在路径
			}).extend({
				index: 'lib/index' //主入口模块
			}).use('index');
		});
		
	</script> --%>
</body>
</html>


