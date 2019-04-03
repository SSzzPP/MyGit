<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
	body{
		background-image: none;
	}
	.layui-form-label{
		width:100px;
	}
	[class*='icon-']:before{
   		font-family: unset;
   	}
   	.layui-form-checkbox i{
   		height:30px;
   	}
   	.layui-form-item .layui-form-checkbox{
   		margin-top:10px;
   		margin-right:10px;
   	}
   	.layui-form-checkbox[lay-skin=primary]{
		height:18px!important;
	}
</style>
<div style="width:100%;height: 100%;" class="layer-cnt">
	<div style="padding: 20px;">
		<form class="addForm layui-form" id="addForm"   method="post" enctype ="multipart/form-data">
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">选择头像</label>
					<div class="layui-input-inline">
						<input type="file" class="layui-input" name="headImg" id="uploadHeadImg" >
					</div>
				</div>
				<div class="layui-inline">
  					<label class="layui-form-label">登录名</label>
  					<div class="layui-input-inline">
    					<input id="loginName" class="layui-input" name="loginName" type="text" placeholder="登录名" autocomplete="off" >
  					</div>
  				</div>
			</div>
			<div class="layui-form-item">
				
  				<div class="layui-inline">
					<label class="layui-form-label">用户昵称</label>
  					<div class="layui-input-inline">
    					<input type="text" name="name" lay-verify="required" placeholder="昵称" autocomplete="off" class="layui-input"  >
  					</div>
  				</div>
  				<div class="layui-inline">
					<label class="layui-form-label">出生日期</label>
					<div class="layui-input-inline">
 						<input id="birthday" name="birthday" type="text" placeholder="出生日期"  lay-verify="startDate"  autocomplete="off" class="layui-input" >
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				
				<div class="layui-inline">
					<label class="layui-form-label">性别</label>
					<div class="layui-input-inline">
 						<select name="sex" lay-filter="aihao"  >
						    <option value="0" id="man">男</option>
							<option value="1" id="woman">女</option>
				        </select>
					</div>
				</div>
				<div class="layui-inline">
  					<label class="layui-form-label">账号密码</label>
  					<div class="layui-input-inline">
    					<input id="pwd" type="password" class="layui-input" name="password"  placeholder="密码" autocomplete="new-password" >
  					</div>
  				</div>
			</div>
			<div class="layui-form-item">
				
  				<div class="layui-inline">
					<label class="layui-form-label">手机号码</label>
					<div class="layui-input-inline">
 						<input id="mobile" name="mobile" class="layui-input" type="text" lay-verify="required|phone" placeholder="手机号码"  >
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">电子邮箱</label>
					<div class="layui-input-inline">
 						<input id="email" name="email" class="layui-input" lay-verify="required|email" type="text" placeholder="邮箱" >
					</div>
				</div>
  			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">运动爱好</label>
					<div class="layui-input-inline" id="userLike" style="width:80%">
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">个性签名</label>
					<div class="layui-input-inline">
 						<textarea class="form-control"  class="layui-input" type="text" name="experience" style="width: 265%; height: 52px;"></textarea>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
<script>
	
	$(function () {
		var data= {type:"SPORT_TYPE"};
		$.submit({
            url: "${dynamicURL}/front/dict/findByType",
            data : data,
            butObj : null,
            success : function(data){
            	var userLikeStr = '';
            	$.each(data,function(index,item){
            		userLikeStr += '<input type="checkbox" name="userLikes" lay-skin="primary" value="'+ item.id +'" title="'+ item.name +'">';
            		//console.log(index + "==="+ item.name);
            		var form;
            		layui.use(['form','laydate'],function(){
            			  form = layui.form,layer = layui.layer,laydate = layui.laydate;
            			  //开始时间
            			  laydate.render({
            				type:'date',
            				format:'yyyy-MM-dd',
            			    elem: '#birthday'
            			  });
            		});
            	});
           		$("#userLike").append(userLikeStr);
           		//console.log(userLikeStr);
            },
            error : function(){
            	layer.alert('出错啦！', {icon: 0});
            }
       	});
		
	})
</script>