<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="proxyTabs" class="easyui-tabs" data-options="tabWidth:125" style="width: 100%;height:100%" fit="true">
 	  <div title="招标公告信息" style="padding:5"  data-url="${dynamicURL}/admin/information/info/toAddPage" ></div>
 	  <div title="代理合同"  style="padding:5" data-url="${dynamicURL}/proxy/signcontract/info?id=${id}" ></div>
 	  <div title="投标人信息"  style="padding:5" data-url="${dynamicURL}/proxy/bagunion/sign?id=${id}" ></div>
 	  <div title="资格预审"  style="padding:5" data-url="${dynamicURL}/proxy/bagunion/qualifications?id=${id}" ></div>
 	  <div title="资格预审答疑及澄清" style="padding:5" data-url="${dynamicURL}/proxy/qua/answer/info?id=${id}"></div>
 	  <div title="资格后审"  style="padding:5" data-url="${dynamicURL}/proxy/bagunion/hs?id=${id}" ></div>
 	  <div title="招标文件答疑及澄清" style="padding:5" data-url="${dynamicURL}/proxy/answer/info?id=${id}"></div>
 	  <div title="开标" style="padding:5" data-url="${dynamicURL}/proxy/openBid/info?id=${id}" ></div>
 	  <div title="中标通知书" style="padding:5" data-url="${dynamicURL}/proxy/win/noticeIndex?id=${id}&booleanFlag=${flag}"></div>
	  <div title="合同" style="padding:5" data-url="${dynamicURL}/proxy/win/contract/index?id=${id}"></div>
	  <div title="招标一览表" style="padding:5"  data-url="${dynamicURL}/proxy/notice/browse?id=${id}" ></div>
</div>
<script type="text/javascript">
	 $('#proxyTabs').tabs({
	    onSelect:function(title,index){
	    	 var tab = $('#proxyTabs').tabs('getSelected');
	    	 var url = tab.attr("data-url");
	         $("#proxyTabs").tabs('update', {
	             tab: tab,
	             options: {
	                 title: title,
	                 content: '<iframe id="secFrm" frameborder="0" src="'+url+'" style="width:100%;height:100%;"scrolling="no"></iframe>'
	             }
	         });
	    }
	}); 
</script>