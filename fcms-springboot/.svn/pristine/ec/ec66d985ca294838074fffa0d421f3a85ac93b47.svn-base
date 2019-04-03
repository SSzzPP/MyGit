<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
	body{
		background-image: none;
	}
</style>
<div style="width:100%;height: 100%;" class="layer-cnt">
	<div style="padding: 20px;">
		<form class="addForm layui-form" id="addForm"   method="post" enctype ="multipart/form-data">
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">活动类型</label>
					<div class="layui-input-inline">
							<input type="text" name="itemId" value="${itemId}" hidden="true">
 							<input type="text" name="itemName" value="${itemName}" readonly="true" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">活动标题</label>
					<div class="layui-input-inline">
 						<input type="text" name="title" lay-verify="required" placeholder="请输入活动标题" autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
  					<label class="layui-form-label">要求人员</label>
  					<div class="layui-input-inline">
    					<select name="member" lay-filter="aihao">
						    <option value="0" id="man">男女不限</option>
							<option value="1" id="manen">限帅哥</option>
							<option value="2" id="manen">限美女</option>
				        </select>
  					</div>
  				</div>
				<div class="layui-inline">
					<label class="layui-form-label">集合地点</label>
  					<div class="layui-input-inline">
    					<input type="text" name="location" lay-verify="required" placeholder="请输入集合地点" autocomplete="off" class="layui-input">
  					</div>
  				</div>
			 </div>
			<div class="layui-form-item">
				<div class="layui-inline">
  					<label class="layui-form-label">费用类型</label>
  					<div class="layui-input-inline">
    					<select name="costType" lay-filter="aihao">
						    <option value="0" id="man">AA</option>
							<option value="1" id="manen">我请客</option>
							<option value="2" id="manen">求请客</option>
				        </select>
  					</div>
  				</div>
				<div class="layui-inline">
					<label class="layui-form-label">联系方式</label>
					<div class="layui-input-inline">
 						<input type="text" name="tel" lay-verify="required|phone" placeholder="请输入联系方式" autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">活动开始</label>
					<div class="layui-input-inline">
 						<input type="text" name="acvitityTime" id="startDate" lay-verify="startDate" placeholder="yyyy-MM-dd HH:mm" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">要求人数</label>
					<div class="layui-input-inline">
 						<input type="number" min="0" name="peopleNum" lay-verify="required" placeholder="请输入要求人数" autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-form-item">
			<div class="layui-inline">
					<label class="layui-form-label">报名截止</label>
					<div class="layui-input-inline">
 						<input type="text"  name="stopTime" id="endDate" lay-verify="startDate" placeholder="yyyy-MM-dd HH:mm" autocomplete="off" class="layui-input">
					</div>
				</div>
				
				<div class="layui-inline">
					<label class="layui-form-label">邀请说明</label>
					<div class="layui-input-inline">
 						<input type="text" name="instructions" lay-verify="required" placeholder="请输入邀请说明" autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
<script>
	layui.use(['form','laydate'],function(){
		  var form = layui.form,layer = layui.layer,laydate = layui.laydate;
		  //开始时间
		  laydate.render({
			type:'datetime',
			format:'yyyy-MM-dd HH:mm',
		    elem: '#startDate'
		  });
		  //截止时间
		  laydate.render({
			type:'datetime',
			format:'yyyy-MM-dd HH:mm',
		    elem: '#endDate'
		  });
	})
</script>