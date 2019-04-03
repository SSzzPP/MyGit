<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <!-- meta -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!--为了让 IE 浏览器运行最新的渲染模式，建议将此 meta 标签加入到你页面的 head 中-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- 为了让浏览器运行高速模式下，建议将此 meta 标签加入到你页面的 head 中-->
    <meta name="renderer" content="webkit">
    <!--为了确保适当的绘制和触屏缩放，需要在 之中添加viewport元数据标签-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <style>
    	[class*='icon-']:before{
    		font-family: unset;
    	}
    	.wjContent{
    		background-color:#fff;
    		min-height:400px;
    		padding:30px 10%;
    	}
    	.wjtitle{
    		padding:20px;
    		color: #4C4C4C;
    		font-size: 18px;
    		text-align:center;
    	}
    	.wjhr{
    		width: 100%;
    		height: 3px;
    		background-color: #53a4f4;
    	}
    	.wjques{
    		margin-top: 30px;
    		padding-left: 15px;
    		color: #666666;
		    font-size: 14px;
		    line-height: 1.4;
    	}
    	.title {
		    width: 100%;
		    font-size: 16px;
		   /*  margin-left: -15px; */
		    padding-bottom: 8px;
		    position: relative;
		    padding-left: 5px;
		    font-weight:600;
		}
    	.title .Qnum {
		    top: 0;
		    left: -38px;
		    position: absolute;
		    text-align: right;
		    width: 40px;
		}
		.title .wjTitle>*:last-child:after {
		    content: "*";
		    display: inline;
		    color: #ff6d56;
		    margin-left: 5px;
		}
		.wjAnswer .layui-form-item{
			margin-bottom:4px;
		}
		.wjAnswer .layui-form-label{
			float:left;
		}
		.wjAnswer .layui-input-block{
			position:static;
			float:left;
			margin:0;
		}
		.layui-form-checkbox[lay-skin=primary]{
			height:18px!important;
		}
		.btn-content{
			padding:20px;
		}
		.color-grave{
			background-color: gray;
		}
    </style>
</head>

<body>
    <div class="container">
        <jsp:include page="../header.jsp" /> 
	    <div class="line-big margin-big-top">
	    	<div class='xs12'>
	    		<div class='wjContent'>
	    			<div class='wjtitle'>问卷调查</div>
	    			<div class="wjhr"></div>
	    			<form class="layui-form" action="" lay-filter="example">
	    				<input name="paperId" id="paperId" type="hidden"/>
	    				<div id='question_box'>
		    				<!-- <div class='wjques'>
		    					<div class='title'>
		    						<span class="Qnum">1.</span>
		    						<span>问卷网支持创建哪些项目？</span>
		    					</div>
		    					<div class='wjAnswer'>
		    						<div class="layui-form-item">
									    <div class="layui-input-block">
									      	<input type="radio" name="question1" value="A" title="A、答案一">
									    </div>
									</div>
									<div class="layui-form-item">
									    <div class="layui-input-block">
									     	<input type="radio" name="question1" value="B" title="B、答案二">
									    </div>
									</div>
									<div class="layui-form-item">
									    <div class="layui-input-block">
									     	<input type="radio" name="question1" value="C" title="C、答案三">
									    </div>
									</div>
									<div class="layui-form-item">
									    <div class="layui-input-block">
									     	<input type="radio" name="question1" value="D" title="D、答案四">
									    </div>
									</div>
		    					</div>
		    				</div>
		    				
		    				<div class='wjques'>
		    					<div class='title'>
		    						<span class="Qnum">2.</span>
		    						<span>问卷网支持创建哪些项目？</span>
		    					</div>
		    					<div class='wjAnswer'>
		    						<div class="layui-form-item" pane="">
									    <div class="layui-input-block">
									      	<input type="checkbox" name="question2[answer1]" value="A" lay-skin="primary" title="A、答案一">
									    </div>
									</div>
									<div class="layui-form-item" pane="">
									    <div class="layui-input-block">
									     	<input type="checkbox" name="question2[answer2]" value="B" lay-skin="primary" title="B、答案二">
									    </div>
									</div>
									<div class="layui-form-item" pane="">
									    <div class="layui-input-block">
									     	<input type="checkbox" name="question2[answer3]" value="C" c title="C、答案三">
									    </div>
									</div>
									<div class="layui-form-item" pane="">
									    <div class="layui-input-block">
									     	<input type="checkbox" name="question2[answer4]" value="D" lay-skin="primary" title="D、答案四">
									    </div>
									</div>
									<div class="layui-form-item" pane="">
									    <div class="layui-input-block">
									     	<input type="checkbox" name="question2[answer5]" value="E" lay-skin="primary" title="E、答案四">
									    </div>
									</div>
		    					</div>
		    				</div> --> 
	    				</div>
	    				 <!-- <div class="btn-content" style='text-align:center;'>
						   <button class="layui-btn  layui-btn-normal "  lay-filter="demo">提交</button>
						</div>  -->
	    			</form>
	    			<div class="btn-content" style='text-align:center;'>
						   <button id="submitBtn"class="layui-btn  layui-btn-normal" onclick="submit()">提交</button>
					</div>
	    		</div><!--  --> 
	    	</div>
	    </div>
	</div>
	<jsp:include page="../footer.jsp" />
	<script>
	var paperId="${paperId}";
	var answerOption=new Array("A","B","C","D","E","F","G","H","I","J");
		$(function(){
			/* layui.use('form',function(){
				var form = layui.form;
			}); */
			loadPaper(paperId);
		})
		 function submit(){
			var paperId=$("#paperId").val();
			var params = {};
			params['paperId']=paperId;
			var canSubmit=1;
		  	$(".wjques").each(function(i,v){
			  	var checkedNum = 0;
			  	var answer = '';
			  	var questionId=v.getAttribute("data-id");
			  	$("#" + questionId + " " + "input[questionId=" + questionId + "]").each(function(n, input) {
				  	if(input.checked){
					  	checkedNum = checkedNum + 1;
					  	answer += input.value;
				  	}
			  	});
			  	if(checkedNum==0){
				  	canSubmit=0;
				  	layer.alert("请填写完成问卷之后再提交!");
			  	}else{
				  params['' + questionId] = answer;
			  	}
			});
			if(canSubmit==1){
				$.submit({
					url:dynamicURL+"front/survey/record/submitAnswer",
					data:params,
					success:function(data){
						if(data.success){
							layer.alert("提交成功，感谢您的参与");
							$('#submitBtn').attr('disabled',true);
							$('#submitBtn').addClass("color-grave");
						}
					}
				});
			}  
		} 
		function loadPaper(id){
			$.submit({
				url:dynamicURL+'/front/survey/paperQuestion/questionList?search_EQ_surveyPaperEntity.id='+id,
				success:function(data){
					if(data.total>0){
						$(".wjtitle").html(data.paperName);
						$(".wjtitle").attr('data-total',data.total);
						$("#paperId").val(data.paperId);
						var str = "";
						$.each(data.rows,function(i,v){
							str+='<div class="wjques" id="'+v.id+'" data-id="'+v.id+'">';
							str+='<div class="title">';
							str+='<span class="Qnum">'+(i+1)+'.</span>';
							str+='<span>'+v.title+'</span>';
							str+='</div>';
							str+='<div class="wjAnswer">';
							var questionOptions = v.options.split(";");
							//questionOptions.splice((questionOptions.length-1),questionOptions.length);
							$.each(questionOptions,function(oi,ov){
								str+='<div class="layui-form-item">';
								str+='<div class="layui-input-block">';
								if(v.questionTypeStr=='单选'){
									str+='<input type="radio" questionId="'+v.id+'" name="question'+i+'[]" value="'+answerOption[oi]+'" title="'+answerOption[oi]+'、'+ov+'">';
								}else{
									str+='<input type="checkbox" questionId="'+v.id+'" name="question'+i+'[]" value="'+answerOption[oi]+'"  title="'+answerOption[oi]+'、'+ov+'" lay-skin="primary">';
								}
								str+='</div>';
								str+='</div>';
							});
							str+='</div>';
							str+='</div>';
						});
						$("#question_box").append(str);
						layui.use('form',function(){
							var form = layui.form;
						});
					}
				}		
			});
		}
	</script>	
</body>
</html>