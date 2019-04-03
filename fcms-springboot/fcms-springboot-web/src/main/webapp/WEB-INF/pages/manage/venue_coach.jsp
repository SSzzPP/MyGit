<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 监管信息管理 教练详情页 -->
<style>
.tab-line .layui-tab-title {
	position: absolute;
	white-space: normal;
	height: auto;
	width: 20%;
	border: 0;
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

.padd15 .layui-card {
	box-shadow: none;
}
.noData{
	display: none;
}
.noDataContent{
	font-size:16px;
	color:#999;
	padding-top: 20%;
	padding-left: 28%;
} 

</style>
<div class="padd15">
	<div class="layui-tab layui-tab-brief tab-line"
		lay-filter="docDemoTabBrief">
		<ul class="layui-tab-title" id="nameUl">
			<c:forEach items="${coachs }" var="coach">
				<li data="${coach.id}">${coach.name}</li>
			</c:forEach>
			<!-- <li class="layui-this">张教练</li>
			<li>李教练</li>
			<li>王教练</li>
			<li>赵教练</li>
			<li>石教练</li> -->
		</ul>
		<div class="layui-tab-content" id="contentDiv">
			<c:forEach items="${coachs }" var="coachInfo">
				<div class="layui-tab-item" data="${coachInfo.id}">
					<div class="layui-row">
						<div class="layui-col-md12">
							<div class="layui-card">
								<div class="layui-card-header">基本信息</div>
								<div class="layui-card-body">
									<table class="layui-table static">
										<colgroup>
											<col width="20%">
											<col width="30%">
											<col width="20%">
											<col width="30%">
										</colgroup>

										<tbody>
											<tr>
												<td>姓名</td>
												<td>${coachInfo.name }</td>
												<td>登录名</td>
												<td>${coachInfo.loginName }</td>
											</tr>
											<tr>
												<td>所在场馆</td>
												<td>${coachInfo.venueName }</td>
												<td>性别</td>
												<td>${coachInfo.sex==1?'女':'男' }</td>
											</tr>
											<tr>
												<td>出生日期</td>
												<td>${coachInfo.birthday }</td>
												<td>电话</td>
												<td>${coachInfo.mobile }</td>
											</tr>
											<tr>
												<td>个人经历</td>
												<td colspan='3'>${coachInfo.experience } <!-- 参加过国际拳击锦标赛，并且夺得冠军。 -->
												</td>
											</tr>
											<tr>
												<td>个人履历</td>
												<td colspan='3'><c:forEach
														items="${coachInfo.userRecordEntities}" var="record"
														varStatus="status">
														<p>${status.index+1}.${record.content}</p>
														<br>
													</c:forEach></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>

						</div>
					</div>
				</div>
			</c:forEach>

			<div class="layui-card">
				<div class="layui-card-header">教练课程</div>
				<div class="layui-card-body">
					<table class="layui-table" id="coachCourse">
						<colgroup>
							<col width="20%">
							<col width="30%">
							<col width="20%">
							<col width="30%">
						</colgroup>
					</table>
				</div>
			</div>
			<div class="layui-card">
				<div class="layui-card-header">教练证书</div>
				<div class="layui-card-body">
					<table class="layui-table" id="coachCerificate">
						<colgroup>
							<col width="20%">
							<col width="30%">
							<col width="20%">
							<col width="30%">
						</colgroup>
					</table>
				</div>
			</div>

		</div>
	</div>
</div>
<script>
	$(function() {
		//设置默认显示页
		if($("#nameUl li").length > 0){
			$("#nameUl li:first").attr('class', 'layui-this');
			$("#contentDiv div:first").attr('class', 'layui-tab-item layui-show');
			var id = $("#nameUl li:first").attr('data');
			loadCourseTable(id);
			loadCerficateTable(id);
		}else{
			$(".layui-card").attr('class','noData');
			$("#contentDiv").append('<div class="noDataContent"><p>该场馆暂无教练信息<p></div>');
		}
		var $lis = $("#nameUl li");
		$lis.each(function(i) {
			var coachId = $(this).attr('data');
			$(this).on('click', function() {
				loadCourseTable(coachId);
				loadCerficateTable(coachId);
			});
		});
		//加载证书
		function loadCerficateTable(coachId) {
			var url = '${dynamicURL}/admin/venue/cerificate/layuiTable?search_EQ_userId='
					+ coachId;
			layui.use('table', function() {
				var table = layui.table;
				table.render({
					elem : '#coachCerificate',
					url : url,
					page : false,
					cols : [ [ {
						field : 'name',
						title : '证书名称'
					}, {
						field : 'venueUserName',
						title : '教练名'
					},

					] ],
					response : {
						statusName : 'code',
						statusCode : 200,
						msgName : 'msg',
						countName : 'total',
						dataName : 'rows'
					}

				});
			});

		}
		//加载课程
		function loadCourseTable(coachId) {
			var url = '${dynamicURL}/admin/venue/course/layuiTable?search_EQ_userId='
					+ coachId;
			layui.use('table', function() {
				var table = layui.table;
				table.render({
					elem : '#coachCourse',
					url : url,
					page : false,
					cols : [ [ {
						field : 'name',
						title : '课程名称'
					}, {
						field : 'venueUserName',
						title : '教练名'
					}, {
						field : 'feeScale',
						title : '收费'
					}, {
						field : 'describe',
						title : '描述'
					}

					] ],
					response : {
						statusName : 'code',
						statusCode : 200,
						msgName : 'msg',
						countName : 'total',
						dataName : 'rows'
					}

				});
			});

		}
	})
</script>