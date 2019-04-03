<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/style_script.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<title>问卷搜索</title>
<style>
			.title{
				margin: 20px 15px 10px;
				color: #6d6d72;
				font-size: 15px;
			}
			
			.oa-contact-cell.mui-table .mui-table-cell {
				padding: 11px 0;
				vertical-align: middle;
			}
			
			.oa-contact-cell {
				position: relative;
				margin: -11px 0;
			}
	
			.oa-contact-avatar {
				width: 40px;
			}
			.oa-contact-avatar img {
				/*border-radius: 50%;*/
			}
			.oa-contact-content {
				width: 100%;
			}
			.oa-contact-name {
				margin-right: 20px;
			}
			.oa-contact-name, oa-contact-position {
				float: left;
			}
			.radius{
				border-radius:10rem;
				background-color: red;
			}
			
			.ficon {
				height: 40px;
				float: left;
				margin-right: 8px;
			}
		</style>
</head>
<body>
		<header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<!--<button id="addBtn" class="mui-btn mui-btn-blue mui-btn-link mui-pull-right">新增</button>-->
			<h1 class="mui-title">问卷搜索</h1>
		</header>
		<%--  <script id='content-template' type="text/template">
				<% for(var i in data){ var surveyUserTotalEntity=data[i]; %>
				<li class="mui-table-view-cell mui-media" paperId='<%=(surveyUserTotalEntity.id)%>' paperTitle='<%=(surveyUserTotalEntity.title)%>' total='<%=(surveyUserTotalEntity.total)%>' actual='<%=(surveyUserTotalEntity.actual)%>'>
					<a class="mui-navigate-right">
						<img class="mui-media-object mui-pull-left" src="../../images/pages/success.png" />
						<div class="mui-media-body">
							<%=(surveyUserTotalEntity.title)%>(<%=(surveyUserTotalEntity.actual)%>/<%=(surveyUserTotalEntity.total)%>)
							
							<p class='mui-ellipsis'>
								<%=(surveyUserTotalEntity.createUserName)%>&nbsp;&nbsp;&nbsp;
								结束时间:<%=(surveyUserTotalEntity.endDate.substring(0, 10))%>
							</p>
						</div>
					</a>
				</li>
				<% } %>
			</script> --%>
		<div class="mui-content">
			<div id='list' class="mui-indexed-list">
				<br>
				<div class="mui-input-row mui-search">
					<input id="searchInput" type="search" onkeyup="enterSearch(event)" class="mui-input-clear mui-indexed-list-search-input mui-input-speech" placeholder="搜索问卷标题">
				</div>
				<ul id="surveyUserTotalList" class="mui-table-view mui-table-view-striped mui-table-view-condensed">
					
				</ul>
			</div>
		</div>
		
		<script>
		mui.init({ 
    	}); 
    	
    	var origin = 0;// 0:文件阅读；1：在线学习
    	mui.ready(function() {
            /* var self = plus.webview.currentWebview();  
			origin = self.origin; */
        })
    	
    	var fileData = null;
		function enterSearch(e) {
			var url = '/mobile/survey/userTotal/list';
		    if(e.keyCode == 13) {
		        $("#searchInput").blur();
		        if($("#searchInput").val().length>=1){
		        	//var wait = plus.nativeUI.showWaiting('正在查询...');
			        var param = {
			        	search_EQ_status:1,
						order:'desc',
						search_LIKE_title:$("#searchInput").val()};
			        topUtil.web_query(url,param,function(data){
			        //	wait.close();
			        	if (typeof data == "string") {
							data = JSON.parse(data);
			            }
			        	if(data.rows && data.rows.length>0){
			        		
			        		var str= '';
			        		mui.each(data.rows,function (index,item) {
			        			str += '<li class="mui-table-view-cell mui-media" paperId='+item.id+' paperTitle='+item.title+' total='+item.total+' actual='+item.actual+'>';
			        			str += '<a class="mui-navigate-right"><img class="mui-media-object mui-pull-left" src="${staticURL}/images/pages/success.png" />';
			        			str += '<div class="mui-media-body">'+item.title+'('+item.actual+'/'+item.total+')<p class="mui-ellipsis">'+item.createUserName+'结束时间：'+item.endDate.substring(0,10)+'</p></div></a></li>';
			        		});
			        		$('#surveyUserTotalList').append(str);
			        		addTableCellTapEvent(document.getElementById("surveyUserTotalList"));
			        	}else{
			        		document.getElementById("surveyUserTotalList").innerHTML = "";
			        		plus.nativeUI.toast('未找到相关问卷');
			        	}
					});
		        }
		    }
		}
		function addTableCellTapEvent(table){
				mui(table).on('tap','.mui-table-view-cell',function(){
				   var paperId=this.getAttribute('paperId');
				    var paperTitle=this.getAttribute('paperTitle');
				    var total=this.getAttribute('total');
				    var actual=this.getAttribute('actual');
				   	mui.openWindow({
				   		url: dynamicURL+'mobile/survey/paperQuestion/toSurveyQuestionTotal?paperId='+paperId+'&paperTitle='+paperTitle+'&total='+total+'&actual='+actual,
						id: 'mobile/survey/paperQuestion/toSurveyQuestionTotal',
					   	show:{
					      autoShow:true,//页面loaded事件发生后自动显示，默认为true
					      aniShow:"slide-in-right",
					      duration:'250'
					    },
					    /*  waiting:{
					      autoShow:false,//自动显示等待框，默认为true
		//			      title:'正在加载...'//等待对话框上显示的提示内容
				      	} */
			  		});
				});
			}
		
		/* function closeme(){
			var ws=plus.webview.currentWebview();
			plus.webview.close(ws);
		} */
		//退回
	/* 	mui.back = function(event) {
//			var btnArray = ['否', '是'];
//			mui.confirm('确定离开？',function(e) {
//				if(e.index==1){
//					closeme();
//				}
//			});
			closeme();
			return false;
		}; */
		</script>
</body>
</html>