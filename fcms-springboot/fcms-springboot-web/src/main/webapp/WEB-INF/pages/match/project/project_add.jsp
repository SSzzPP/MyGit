<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div id="container">
	<form class="editInfoFrm" method="post">
    	<input type="hidden" name="id" value="${entity.id}"/>
        <div title="项目信息" style="padding: 20px; height: 680px;">
            <div style="padding: 5px;" class="easyui-panel">
                <div style="padding: 5px; width: 98%; height: auto" class="easyui-panel" id="no1" title="项目信息">
                    <hr style="width:91%; border:0.5px solid #c6c6c6; float:left;" />
                    <table class="conDetailTable">
                        <tr>
                            <td class="tr">比赛项目名称：&nbsp;&nbsp;</td>
                            <td>
                            	<input class="easyui-textbox" name="name"  type="text"  style="width: 770px; height: 26px" />
                            </td>
                        </tr>
                         <tr>
                        	<td class="tr">类型：&nbsp;&nbsp;</td>
                        	<td>
                        		<select id="type" style="width: 770px; height: 26px" >
					            	<option value="0" selected="selected">单人赛</option>
					            	<option value="1" >团队赛</option>
					            </select>
                        	</td>
                        </tr>
                          <tr>
                            <td class="tr">参赛人数：&nbsp;&nbsp;</td>
                            <td>
                            	<input class="easyui-textbox" name="peopleNum"  type="text"  style="width: 770px; height: 26px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="tr">项目事宜：&nbsp;&nbsp;</td>
                            <td>
                            	<textarea name="remark" class="form-control" style="width: 1000px; height: 400px"></textarea>
	                        </td>
                        </tr>
                        <tr>
                            <td class="tr">项目规则：&nbsp;&nbsp;</td>
                            <td>
                            	<textarea name="rule" class="form-control" style="width: 1000px; height: 400px"></textarea>
                            </td>
                        </tr>
                    </table>
                    
                </div>
            </div>
            <div>
              	<button class="layui-btn " onclick="return false"  id="submit11">保存</button>
               <button class="layui-btn layui-btn" onClick="parent.layui.admin.closeThisTabs();">关闭</button>
	    	</div>
        </div>
    </form>
           
</div>

<script>
var matchId = '${matchId}';
$("#submit11").click(function() {
	var id=$("[name=id]").val();
	var title = $("[name=name]").val();
	if (!title) {
		layer.alert('比赛项目名称不能为空！', 'error');
		return;
	}
	var remark = $("[name=remark]").val();
	if (!remark) {
		layer.alert('项目事宜不能为空！', 'error');
		return;
	}
	var rule = $("[name=rule]").val();
	if (!rule) {
		layer.alert('项目规则不能为空！', 'error');
		return;
	}
	var type = $("#type").val();
	if (!type) {
		layer.alert('项目类型不能为空！', 'error');
		return;
	}
	var peopleNum = $("[name=peopleNum]").val();
	if (!peopleNum) {
		layer.alert('参赛人数不能为空！', 'error');
		return;
	}
	$.submit({
		url: dynamicURL+'/admin/match/project/saveProject',
		data: "id="+id+"&name="+title+"&remark="+remark+"&rule="+rule+"&matchId="+matchId+"&type="+type+'&peopleNum='+peopleNum,
		success: function(msg){
			    if(msg.success){
			    	parent.layer.alert('保存成功', {
			   	        icon: 1,
			   	        skin: 'layer-ext-moon' 
			   	    });
			    	parent.layui_top.tabsBody(parent.layui_top.tabsPage.index-1).find('.layadmin-iframe')[0].contentWindow.location.reload(!0)
			    	parent.layui.admin.closeThisTabs();
			    }else{
			    	layer.alert('保存失败！', 'error');
			    }
		},
		error:function(){
			layer.alert('保存失败！', 'error');
		}
	});
});
	

</script>