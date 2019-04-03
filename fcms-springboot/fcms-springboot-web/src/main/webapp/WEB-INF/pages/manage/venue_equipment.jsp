<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
.tab-line .layui-tab-title {
	position: absolute;
	white-space: normal;
	height: auto;
	width: 20%;
	border:0;
}

.tab-line .layui-tab-title li {
	display: block;
}

.tab-line .layui-tab-content {
	position: absolute;
	right: 0;
	top: 0;
	width: 78%;
}

.tab-line .layui-tab-title .layui-this:after {
	width: 40%;
	left: 50%;
	margin-left: -20%;
}

.layui-table tbody tr:hover, .layui-table thead tr, .layui-table-click,
	.layui-table-header, .layui-table-hover, .layui-table-mend,
	.layui-table-patch, .layui-table-tool, .layui-table[lay-even] tr:nth-child(even)
	{
	background-color: transparent;
}

.layui-table.static tbody td:nth-child(odd), .layui-table thead th {
	background-color: #f9f9f9;
	font-weight: bold;
}
.padd15 .layui-card{
	box-shadow:none;
}
</style>
<div class="padd15">
	<div class="layui-tab layui-tab-brief tab-line"
		lay-filter="docDemoTabBrief">
		<ul id="nameUl" class="layui-tab-title">
			<c:forEach items="${equipments}" var="equipment">
				<li>${equipment.name}</li>			
			</c:forEach>
		<!-- 	<li class="layui-this">乒乓球馆</li> -->
			
		</ul>
		<div class="layui-tab-content" id="contentDiv">
			<c:forEach items="${equipments}" var="equipmentInfo">
				<div class="layui-tab-item">
				<div class="layui-row">
					<div class="layui-col-md12">
						<div class="layui-card">
							<div class="layui-card-header">基本信息</div>
							<div class="layui-card-body">
								<table class="layui-table static" name="test">
									<colgroup>
										<col width="20%">
										<col width="30%">
										<col width="20%">
										<col width="30%">
									</colgroup>

									<tbody>
										<tr>
											<td>名称</td>
											<td>
												${equipmentInfo.name }
											</td>
											<td>分类</td>
											<td>${equipmentInfo.typeName }</td>
										</tr>
										<tr>
											<td>运营模式</td>
											<td>${equipmentInfo.modeName }</td>
											<td>营业时间</td>
											<td>${equipmentInfo.businessHours }</td>
										</tr>
										<tr>
											<td>数量</td>
											<td>${equipmentInfo.num }</td>
											<td>地板</td>
											<td>${equipmentInfo.floor }</td>
										</tr>
										<tr>
											<td>灯光</td>
											<td>
												${equipmentInfo.lighting }
											</td>
											<td>休息区</td>
											<td>
												${equipmentInfo.restingArea }
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>	
			</c:forEach>
			
			
		</div>
	</div>
</div>
<script>
	$(function(){
		 /* layui.use('element',function(){
			var element=layui.element;
			element.on('tab(docDemoTabBrief)',function(data){
				alert(data.index);
			});
		}); */
		$("#nameUl li:first").attr('class','layui-this');
		$("#contentDiv div:first").attr('class','layui-tab-item layui-show');
	})
</script>