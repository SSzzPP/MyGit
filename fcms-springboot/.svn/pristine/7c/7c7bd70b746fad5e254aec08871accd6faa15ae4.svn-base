<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/style_script.jsp"%>
<link href="${staticURL}/css/mui.indexedlist.css" rel="stylesheet" />
<script src="${staticURL}/js/mui.indexedlist.js"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<title></title>
<style>
	html,
	body {
		height: 100%;
		overflow: hidden;
	}
	.mui-bar {
		-webkit-box-shadow: none;
		box-shadow: none;
	}
	#done.mui-disabled{
		color: gray;
	}
	.mui-table-view-divider{
		padding:10px;
	}
	.mui-table-view-cell:after{
		height:1px;
	}
	.mui-table-view-cell{
		padding:15px;
	}
	.mui-table-view-cell.mui-checkbox input[type=checkbox], .mui-table-view-cell.mui-radio input[type=radio]{
		top:10px;
	}
</style>
</head>
<body>
	<header class="mui-bar mui-bar-nav">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">创建检查单</h1>
		<!--<a id='done' class="mui-btn mui-btn-link mui-pull-right mui-btn-blue mui-disabled">完成</a>-->
		<button id="done" class="mui-btn mui-btn-blue mui-btn-link mui-pull-right mui-disabled">完成</button>
	</header>
	<div class="mui-content">
		<div id='list' class="mui-indexed-list">
			<div class="mui-indexed-list-search mui-input-row mui-search">
				<input type="search" class="mui-input-clear mui-indexed-list-search-input" placeholder="搜索检查项目">
			</div>
			<!--右侧列表-->
			<div class="mui-indexed-list-bar" style="background-color: white;width: 0px;">
			</div>
			
			<form id="checkListForm" method="post" action="">
				<!--<div id='cityResult' class="mui-indexed-list-others">
					<button id='showCityPicker' class="mui-btn mui-btn-block" type='button' value="未选择">--- 请选择被检查部门  ---</button>
				</div>-->
				<!--<input id="deptId" type="hidden" name="departmentEntity.id">-->
			
				<div class="mui-indexed-list-alert"></div>
				<div class="mui-indexed-list-inner">
					<div class="mui-indexed-list-empty-alert">没有数据</div>
					<ul id="checkList" class="mui-table-view">
						
					</ul>
				</div>
			</form>	
			
			
		</div>
	</div>
	<script>
	mui.init({ 
		wipeBack:true, //启用右滑关闭功能
    }); 
    
	var header = document.querySelector('header.mui-bar');
	var list = document.getElementById('list');
	var done = document.getElementById('done');
	var form = document.getElementById("checkListForm");
//	var showCityPickerButton = document.getElementById("showCityPicker");
//	var billLoadSuccess = false,deptLoadSuccess = false;
    mui.ready(function(){
		// ajax 获取 列表数据
		loadData();
		
		//done event
		initDoneBtnClick();
		
		// 每一行数据的点击
		mui('.mui-indexed-list-inner').on('change', 'input', function() {
			changeDoneBtnStyle();
		});
		
	});
	
	
	window.addEventListener("closeSelf",function(e){
		closeme();
	});
	
	
	function closeme(){
		var ws=plus.webview.currentWebview();
		plus.webview.close(ws);
	}
	
	/**
	 * 右上角完成按钮
	 */
	function initDoneBtnClick(){
		done.addEventListener('tap', function() {
//			var deptName = showCityPickerButton.innerText;
			var checkboxArray = [].slice.call(list.querySelectorAll('input[type="checkbox"]'));
			var checkedValues = [];
			checkboxArray.forEach(function(box) {
				if (box.checked) {
					checkedValues.push(box.parentNode.innerText);
				}
			});
			if (checkedValues.length > 0) { 
				var btnArray = ['否', '是'];
				mui.confirm('你选择了: ' + checkedValues, '确定生成检查单？', btnArray, _.debounce(function(e) {
					if (e.index == 1) {
						$("#done").html('生成中···');
						$("#done").attr("disabled",true);
						// 生成检查单
						var params = topUtil.serializeObject(jQuery("#checkListForm"));
						topUtil.web_query('/mobile/checklistbill/createBill',params,
							function (data){
								//console.log(data);
					            if (typeof data == "string") {
					                data = JSON.parse(data);
					            }
					            if (data.success) {
									mui.openWindow({
									    url: dynamicURL+'mobile/checklist/toWrite?billUuid=' + data.obj.uuid, 
									    id: 'check_list_write', 
									   show:{
									      autoShow:true,//页面loaded事件发生后自动显示，默认为true
									      aniShow:"slide-in-right",
									      duration:'250'
									    },
									     waiting:{
									      autoShow:false,//自动显示等待框，默认为true
						//			      title:'正在加载...'//等待对话框上显示的提示内容
								      	},
								      	extras:  { 
									    	billUuid:data.obj.uuid
									    }
							  		});
									$("#done").html('完成');
									$("#done").attr("disabled",false);
					            } else {
					                mui.toast('生成失败');
					                $("#done").html('完成');
									$("#done").attr("disabled",false);
					            }
							}
						);
					}
				},waitTime,true))
		  		
			} else {
				mui.alert('你没选择检查项！');
			}
		}, false);
	}
	
	// 修改【完成】按钮的状态
	function changeDoneBtnStyle(){
		var count = list.querySelectorAll('input[type="checkbox"]:checked').length;
		var value = count ? "完成(" + count + ")" : "完成";
		done.innerHTML = value;
		if (count) {
			if (done.classList.contains("mui-disabled")) {
				done.classList.remove("mui-disabled");
			}
		} else {
			if (!done.classList.contains("mui-disabled")) {
				done.classList.add("mui-disabled");
			}
		}
	}
	
	// 获取列表数据
	function loadData(){
		var params = {};
		topUtil.web_query('/mobile/checklist/search?search_EQ_parentId=0&sort=sortNumber',params,
			function (data){
				if (typeof data == "string") {
	                data = JSON.parse(data);
	            }
				var str = "";
				mui.each(data,function (index,item) {
					str += "<li data-group='' class='mui-table-view-divider mui-indexed-list-group'>" + item.name + "</li>";
					for(var j in item.children){ 
						var typeTwo=item.children[j];
						str += "<li data-value='" + typeTwo.name + "' data-tags='' class='mui-table-view-cell mui-indexed-list-item mui-checkbox mui-left'>" + typeTwo.name +
							"<input id='" + typeTwo.id + "' name='checklistType' type='checkbox' value='" + typeTwo.id + "'>" + typeTwo.name + "</li>";
					}
				});
				//$('#checkList').append(str);	
				document.getElementById("checkList").innerHTML = str;
				//$(".mui-indexed-list-empty-alert").hide();
				
				//calc hieght
				list.style.height = (document.body.offsetHeight - header.offsetHeight) + 'px';
				// 创建selectIndex
				window.indexedList = new mui.IndexedList(list);
				//console.log(list);
			}
		);
	}
	</script>
</body>
</html>