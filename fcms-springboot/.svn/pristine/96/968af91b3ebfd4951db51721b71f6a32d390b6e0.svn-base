<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${staticURL}/ueditor/themes/default/css/ueditor.css" />
<!-- 上传封面图 -->
<script type="text/javascript" charset="utf-8" src="${staticURL}/jquery-easyui-1.4.3/ajaxfileupload.js"></script>

<script type="text/javascript" charset="utf-8" src="${staticURL}/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${staticURL}/ueditor/ueditor.all.js"></script>
<script type="text/javascript" charset="utf-8" src="${staticURL}/ueditor/lang/zh-cn/zh-cn.js"></script>
<%-- <script src="${staticURL }/promotion/js/bootstrap-treeview.js"></script> --%>

<title>编辑活动内容</title>

<style>
	li{
		text-align: left;
		font-size: 16px;
		text-align: center;
	}
	.mould{
		border-bottom: 1px dotted gray;
		padding:5px;
	}
	.mould:hover{
		background-color: #F5F5F5;
	}
	
</style>
</head>
<body>
<div class="easyui-layout" style="width:100%;height:100%;margin:0 auto;">
	<!-- 右侧 -->
	<div data-options="region:'east',iconCls:'icon-reload',split:false,collapsible:false" style="width:35%;position: relative;top:10px;">
		<input class="easyui-textbox" name="title" data-options="prompt:'标题'" value="${infoEntity.title }" style="width:85%;height:32px;">
		<div style="height:10px;"></div>
        <input class="easyui-textbox" name="author" data-options="prompt:'作者'" value="${infoEntity.author }" style="width:85%;height:32px;">
		<div style="height:10px;"></div>
        <input class="easyui-textbox" id="moduleFromId" name="moduleId" data-options="prompt:'分类'" style="width:85%;height:32px;">
		<div style="height:10px;"></div>
		<div id="mycover" style="height: 40%;width: 90%;" class="card-button">
			<input type="file" name="CoverImage" id="CoverImage"  style="float:left"/>
			<div class="layui-btn-container">
				<button id="uploadFile" class="layui-btn layui-btn">上传封面</button>
				<div id="imgDiv" style="margin-top: 10px;width:320px;height:200px;border:1px solid #ccc;"></div>
				<img id="showCover" width="320px" height="200px" style="margin-top: 10px;display:none;border:1px solid #ccc"/>
			</div>
		</div>
		<div class="card-button">
			<div class="layui-btn-container">
				<button  id="saveMsg"  class="layui-btn layui-btn">保存</button>
			</div>
		</div>
	</div>
	<!-- 编辑区 -->
 	<div data-options="region:'center',collapsible:false,split:false" style="padding:5px;">
		<div class="easyui-layout layout-custom-resize" data-options="fit:true" style="height:90%;">
			<div data-options="region:'east',split:false,collapsible:false" style="width: 100%;">
				<div class="easyui-layout layout" fit="true">
					<div id="container" class="easyui-layout layout" fit="true">
						<div id="queryHeader" style="padding: 5px; width: 100%; line-height: 40px;" class="easyui-panel">
							<script id="editor" type="text/plain" style="width:100%; height:80%;"></script>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>  
</div> 
<div id="contents" style="display:none;">${infoEntity.content }</div>
<div id="coverImgPath" style="display:none;">${infoEntity.headImage }</div>
<div>
	<input type="hidden" name="id" value="${infoEntity.id }"/>
</div>
<script type="text/javascript">
var coverImgPath="";
//上传封面预览
$("#uploadFile").click(function(){
	 $.ajaxFileUpload({
             url: dynamicURL+'admin/information/info/saveCoverImage',
             secureuri: false,
             fileElementId: 'CoverImage',
             dataType: 'json',
             success: function (data, status){
                if(data.success){
                	coverImgPath=data.imgPath;
                	var path=encodeURIComponent(data.imgPath);
                	$("#showCover").attr("src",dynamicURL+"admin/information/info/coverImgCallBack?coverImgPath="+path);
                	$("#imgDiv").hide();
                	$("#showCover").show();
                	layer.alert('保存成功！', {icon: 1});
                }else{
                	layer.alert(data.msg, {icon: 0});
                }
             },
             error: function (data, status, e){
            	 layer.alert("网络故障,请稍候再试", {icon: 0});
             }
     });
});

</script>
<script type="text/javascript">
//实例化编辑器
//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
window.UEDITOR_CONFIG.maximumWords=1500;
window.UEDITOR_CONFIG.enableAutoSave=false;
window.UEDITOR_CONFIG.elementPathEnabled=false;
window.UEDITOR_CONFIG.wordOverFlowMsg='<span stylt="color:red;">您输入超过'+window.UEDITOR_CONFIG.maximumWords+'个字符</span>';
//活动内容editor	
var ue = UE.getEditor('editor',{
	toolbars:[['fullscreen', '|', 'undo', 'redo', '|',
		'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', '|',
		'rowspacingtop', 'rowspacingbottom', 'lineheight', '|',
		'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',
		'directionalityltr', 'directionalityrtl', 'indent', '|',
		'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
		'link', 'unlink', 'anchor', '|', 'imagenone', 'imageleft', 'imageright', 'imagecenter', '|',
		'simpleupload', 'insertimage', 'emotion', 'scrawl', 'insertvideo', 'map', 'webapp', 'pagebreak', 'template', 'background', '|',
		'horizontal', 'date', 'time', 'spechars', '|',
		'preview', 'searchreplace', 'drafts', 'help', 'source']],
	autoClearinitialContent:true,
	wordCount:true,
	elementPathEnabled:false
	//initialFrameHeight:400
});
ue.addListener('wordcountoverflow',function(){
	alert("字数已经超过最大允许值,系统将自动删除超过的字符");
	var chars=ue.getContentTxt();
	var schars=chars.substring(0,window.UEDITOR_CONFIG.maximumWords);
	ue.setContent(schars);
});
//修改时预先填写原内容
function putContents(){
	var contents=$("#contents").html();
	ue.setContent(contents);
	coverImgPath=$("#coverImgPath").html();
	if(coverImgPath!=""){
		$("#imgDiv").hide();
		var path=encodeURIComponent(coverImgPath);
		$("#showCover").attr("src",dynamicURL+"admin/information/info/coverImgCallBack?coverImgPath="+path);
		$("#showCover").show();
	}
}
setTimeout("putContents()",5000);
</script>
<script type="text/javascript">
$(function() {
	$('#moduleFromId').combobox({
		valueField : 'id',
		textField : 'name',
		url : '${dynamicURL}/admin/system/dict/combobox?type=INFO_MODULE',
		onLoadSuccess:function(data){
			if("${infoEntity.moduleId }"){
				$("#moduleFromId").combobox('select', "${infoEntity.moduleId }");
			}else{
				var data = $('#moduleFromId').combobox('getData');
	            if (data.length > 0) {
	                $("#moduleFromId").combobox('select', data[0].id);
	            }
			}
		}
	});
	//点击保存按钮
	$("#saveMsg").click(function() {
		var id=$("[name=id]").val();
		//标题
		var title=$("[name=title]").val();
		if(!title){
			layer.alert('标题不能为空！', {icon: 0});
			return;
		}
		//作者				
		var author=$("[name=author]").val();
		if(!author){
			layer.alert('作者名不能为空！', {icon: 0});
			return;
		}
		//分类				
		var moduleId=$("[name=moduleId]").val();
		//内容
		var contents=ue.getContent();
		if(!contents){
			layer.alert('活动内容不能为空！', {icon: 0});
			return;
		}
		//封面
		var cover=$("#showCover").attr("src");
		if(cover==null||cover==""){
			layer.alert('必须上传一张封面图！', {icon: 0});
			return;
		}
		//内容图片路径截取
		var imgurl = [];
		var imgurlStr = "";
		var images = $(contents).children("img");
		images.each(function(index, obj) {
			//获取内容图片路径
			var path=obj.src;
			imgurl.push(path);
		});
		title=encodeURIComponent(title);
		author=encodeURIComponent(author);
		contents=encodeURIComponent(contents);
		coverImgPath=encodeURIComponent(coverImgPath); 
		//layui.admin.closeThisTabs();
		//传值,保存或修改
		$.submit({
			url: dynamicURL+"/admin/information/info/saveInformation",
			data: "id="+id+"&title="+title+"&author="+author+"&moduleId="+moduleId+"&content="+contents
				  +"&imgurlStr="+imgurlStr+"&coverImagePath="+coverImgPath,
			success: function(msg){
				    if(msg.success){
				    	layer.alert('保存成功！', {icon: 1});
				    	parent.layui.admin.closeThisTabs();
				    }else{
				    	layer.alert('保存失败！', {icon: 0});
				    }
				    
			},
			error:function(){
				layer.alert('保存失败！', {icon: 0});
			}
		});
	})
});
</script>
</body>
</html>