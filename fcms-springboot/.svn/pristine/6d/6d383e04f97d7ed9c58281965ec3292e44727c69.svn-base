<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div id="container">
	<form class="editInfoFrm" method="post">
    	<input type="hidden" name="id" value="${entity.id}"/>
        <div title="题目信息" style="padding: 20px; height: 680px;">
            <div style="padding: 5px;" class="easyui-panel">
                <div style="padding: 5px; width: 98%; height: auto;" class="easyui-panel" id="no1" title="题目信息">
                    <hr style="width:91%; border:0.5px solid #c6c6c6; float:left;" />
                    <table class="conDetailTable">
                        <tr>
                        	<td class="tr">题目类型：&nbsp;&nbsp;</td>
                        	<td>
                        		<select name="questionType" id="questionTypeFormId" value="${entity.questionType}" style="width: 770px; height: 26px" data-options="required:true"></select>
                        	</td>
                        </tr>
                        <tr>
                            <td class="tr">题目标题：&nbsp;&nbsp;</td>
                            <td>
                            	<textarea id="titleFormId" name="title" class="form-control" style="width: 1000px; height: 400px"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td class="tr">正确答案：&nbsp;&nbsp;</td>
                            <td>
                            	<input class="easyui-textbox" name="answer"  type="text" id="answer"  style="width: 770px; height: 26px" />
	                        </td>
                        </tr>
                        <tr>
                            <td class="tr">选项内容：&nbsp;&nbsp;<span style="color: red">注：选项内容的每一个选项之间用英文分号隔开,每个选项中不要包含英文分号</span></td>
                            <td>
                            	<textarea id="optionsFormId" name="options" class="form-control" style="width: 1000px; height: 400px"></textarea>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="BtnLine">
               	<button class="layui-btn layui-btn submit">保存</button>
                <button class="layui-btn layui-btn" onClick="parent.layui.admin.closeThisTabs();">关闭</button>
		    </div> 
        </div>
    </form>
</div>

<script type="text/javascript">

	//titlt题目标题
	/* CKEDITOR.replace('titleFormId', {
		height : 150,
		width : '60%',
		filebrowserUploadUrl : '${dynamicURL}/admin/survey/question/CKEditorUpload',
		toolbar :
			[
		 		{ name: 'clipboard',   items : [ 'Source','Cut','Copy','Paste','PasteText','-','Undo','Redo' ] },
		    	{ name: 'tools',       items : [ 'Maximize', 'ShowBlocks' ] },
		 		{ name: 'insert',      items : [ 'Image'] }
			]
	});
	
	//options选项内容
	CKEDITOR.replace('optionsFormId', {
		height : 150,
		width : '60%',
		filebrowserUploadUrl : '${dynamicURL}/admin/survey/question/CKEditorUpload',
		toolbar :
			[
		 		{ name: 'clipboard',   items : [ 'Source','Cut','Copy','Paste','PasteText','-','Undo','Redo' ] },
		    	{ name: 'tools',       items : [ 'Maximize', 'ShowBlocks' ] },
		    	{ name: 'insert',      items : [ 'Image'] }
			]
	}); */
	
	
	
	$(function(){
    	// 题目类型
    	$('#questionTypeFormId').combobox({
    		idField : 'value',
    		textField : 'name',
            url: '${dynamicURL}/admin/survey/question/questionType'
     	}); 
    	$('#questionTypeFormId').combobox('setValue', '${entity.questionType}');
    	$.ajax({
            url: "${dynamicURL}/admin/survey/question/detail?id="+"${entity.id}",
            data: {},
            dataType: "json",
            success: function (response) {
            	$("#titleFormId").val(response.obj.title);
            	$("#optionsFormId").val(response.obj.options);
            	/* CKEDITOR.instances.titleFormId.setData(response.obj.title);
            	CKEDITOR.instances.optionsFormId.setData(response.obj.options); */
            }
        });

	});
	
	
	
	//初始化form表单
	$("#container form.editInfoFrm").form({
		onSubmit: function () {
			var isValid = $(this).form('validate');
            if (!isValid) {
                $.messager.progress('close');
            }
            return isValid;
        },
        success: function (data) {
        	if (typeof data == "string") {
                data = JSON.parse(data);
            }
            if(data.success){
            	layer.confirm('保存成功！',function () {
					/*  $('#addUserWindow').dialog('close');
						userDatagrid.datagrid("reload"); */
            		window.parent.parent.reLoad('修改问卷题目');
				 })
            	/* layer.alert("保存成功",'info',function(){
            		window.parent.parent.reLoad('修改问卷题目');
            	}); */
	        }else{
	        	layer.alert(data.msg,'error');
	        }
        }
    });
	
    $("#container .BtnLine .submit").on("click", _.debounce(function() {
    	var id=$("[name=id]").val();
    	var questionType=$("[name=questionType]").val();
    	if (!questionType) {
    		parent.layer.alert('题目类型不能为空！', {
	   	        icon: 0,
	   	        skin: 'layer-ext-moon' 
	   	    });
			return;
    	}
    	var title = $("[name=title]").val();
    	if (!title) {
    		parent.layer.alert('题目标题不能为空！', {
	   	        icon: 0,
	   	        skin: 'layer-ext-moon' 
	   	    });
    		return;
    	}
    	var options = $("[name=options]").val();
    	if (!options) {
    		parent.layer.alert('选项内容不能为空！', {
	   	        icon: 0,
	   	        skin: 'layer-ext-moon' 
	   	    });
    		return;
    	}
    	var answer = $("[name=answer]").val();
    	$.submit({
			url: dynamicURL+'/admin/survey/question/save',
			data: "id="+id+"&title="+title+"&questionType="+questionType+"&options="+options+"&answer="+answer,
			success: function(msg){
				    if(msg.success){
				    	parent.layer.alert('保存成功！', {
				   	        icon: 1,
				   	        skin: 'layer-ext-moon' 
				   	    });
				    	parent.layui.admin.closeThisTabs();
				    	//layui.admin.openT('问卷题库', '${dynamicURL}/admin/survey/question');
				    }else{
				    	parent.layer.alert('保存失败！', {
				   	        icon: 0,
				   	        skin: 'layer-ext-moon' 
				   	    });
				    }
			},
			error:function(){
				parent.layer.alert('保存失败！', {
		   	        icon: 0,
		   	        skin: 'layer-ext-moon' 
		   	    });
			}
		});
			/* $("#container form.editInfoFrm").submit(); */
		},waitTime,true)
	);

</script>


