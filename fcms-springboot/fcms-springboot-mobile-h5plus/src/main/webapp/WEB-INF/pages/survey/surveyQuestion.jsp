<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/style_script.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<title>调查问卷</title>
		<style>
			.title {
				margin: 20px 15px 10px;
				color: #6d6d72;
				font-size: 15px;
			}
		</style>
</head>
<body>
		<header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">调查问卷</h1>
		</header>
		<div class="mui-content">
			<div style="padding:0px 10px; font-weight: bold;margin-top:10px;">
					请一次性答完问卷，若中途退出，将不予记录。</div>
		</div>
		
		<script>
		mui.init({
			swipeBack: false //禁止右滑关闭功能
		});
		var paperId;
		var paperTitle;
		var optionsArray = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
		var status;
		var endDate;
		var now;
		var totalNum=0;
		var isFinish=0;
		mui.ready(function() {
			//var self = plus.webview.currentWebview();
			paperId = '${paperId}';
			endDate='${endDate}';
			paperTitle = '${paperTitle}';
			now='${now}';
			var title = document.querySelector('.mui-title');
			title.innerText = paperTitle;
			status = '${status}';
			var param = {
				paperId: paperId
			}
			topUtil.web_query("/mobile/survey/record/listThis", param, function(data) {
					var div = document.querySelector('.mui-content');
					totalNum=data.rows.length;
					if(status==1){
						isFinish=1;
					}
					mui.each(data.rows, function(number, object) {
						createContent(div, number, object);
					});
					if(status == 1) {
						var submitBtn=document.getElementById('submit');
						if(submitBtn){
							submitBtn.style = 'display:none';
						}
						disableQuestion();
					}else{
						var button=document.createElement('button');
						button.type='button';
						button.className='mui-btn mui-btn-block mui-btn-primary';
						button.innerText='提交';
						button.id='submit';
						button.style='margin-left:10px;width:95%;';
						div.appendChild(button);
					}
					var submitBtn=document.getElementById('submit');
						if(submitBtn){
							document.getElementById('submit').addEventListener('tap', _.debounce(function() {
								$(this).html("提交中...");
								$(this).attr('disabled',true);
						if(!compareDate(endDate)) {
							mui.toast('当前时间超出了问卷结束时间！');
							return false;
						}
						var params = {};
						var canSubmit = 1;
						$(".mui-card").each(function(m, div) {
							var questionId = div.getAttribute('questionId');
							var checkedNum = 0;
							var answer = '';
							$("#" + questionId + " " + "input[questionId=" + questionId + "]").each(function(n, input) {
								if(input.checked) {
									checkedNum = checkedNum + 1;
									answer += input.value;
								}
							});
							$("p").remove(".italic");
							if($('#' + questionId).children().is('.mui-content-padded')) {
								$('#' + questionId + ' ' + '.mui-content-padded').remove();
							}
							$('#h4-question-'+questionId).css('color','black');
							if(checkedNum == 0) {
								$('#h4-question-'+questionId).css('color','red');
								canSubmit = 0;
							} else {
								params['' + questionId] = answer;
							}
						});
						if(canSubmit!=1){
							mui.toast('题目未答完，不可提交!');
							$("#submit").html("提交");
							$("#submit").attr('disabled',false);
						}
						params['paperId'] = paperId;
						if(canSubmit == 1) {
							//var wait = plus.nativeUI.showWaiting('正在提交中...');
							topUtil.web_query("/mobile/survey/record/submitAnswer", params, function(data) {
								//wait.close(); 
								if(data.success) {
									mui.toast('提交成功!');
									$("#submit").remove();
									disableQuestion();
									isFinish=1;
									$("#submit").html("提交");
									$("#submit").attr('disabled',false);
								}
							});
						}
					},waitTime,true));
				}
				
			});
		})

		function createContent(div, number, object) {
			var question = object.surveyQuestionEntity;
			var h4 = document.createElement('h4');
			h4.className = 'mui-content-padded';
			h4.id='h4-question-'+question.id;
			var cardDiv = document.createElement('div');
			cardDiv.className = 'mui-card';
			cardDiv.id = question.id;
			cardDiv.setAttribute('questionId', question.id);
			var form = document.createElement('form');
			form.className = 'mui-input-group';
			var questionType = question.questionType;
			//单选
			var className = '';
			if(questionType == 0) {
				className = 'radio';
				h4.innerText = (number + 1) + '.' + question.title;
			} else {
				className = 'checkbox';
				h4.innerText = (number + 1) + '.' + question.title + '(多选)';
			}
			var options = question.options.split(';');
			mui.each(options, function(n, option) {
				var divInput = document.createElement('div');
				divInput.className = 'mui-input-row mui-' + className + ' mui-left';
				var label = document.createElement('label');
				label.innerText = optionsArray[n] + '.' + option;
				//console.log(isFinish);
				if(isFinish==1&&question.answer&&question.answer!=null){
					if(question.answer.indexOf(optionsArray[n])>-1){
						label.style='color:green;font-weight:bold';
					}
				}
				var input = document.createElement('input');
				input.name = className;
				input.type = className + '';
				input.value = optionsArray[n];
				input.setAttribute('questionId', question.id);
				divInput.appendChild(label);
				divInput.appendChild(input);
				form.appendChild(divInput);
				if(object.userAnswer != null && object.userAnswer.indexOf(optionsArray[n]) != -1) {
					input.checked = true;
					if(isFinish==1&& question.answer.indexOf(object.userAnswer)<0){
						label.style='color:red';
					}
				}
			});
			cardDiv.appendChild(form);
			div.appendChild(h4);
			div.appendChild(cardDiv);
		}

	/* 	function closeme() {
			var previousPage = plus.webview.getWebviewById("surveyList.html");
			mui.fire(previousPage, "reload", {});
			var ws = plus.webview.currentWebview();
			plus.webview.close(ws);
		}
		//退回
		mui.back = function(event) {
			closeme();
			return false;
		}; */
		function compareDate(date) {
			var d1 = new Date(date.replace(/\-/g, "\/"));
			var str = addDate(now,-1).substring(0, 10);
			var today = new Date(str.replace(/-/g, "/"));
			if(d1 > today) {
				return true;
			} else {
				return false;
			}
		}
		function addDate(date, days) {
			var d = new Date(date.replace(/\-/g, "\/"));
			d=new Date(d.getTime()+days*24*60*60*1000);
			var month = d.getMonth() + 1;
			var day = d.getDate();
			if(month < 10) {
				month = "0" + month;
			}
			if(day < 10) {
				day = "0" + day;
			}
			var val = d.getFullYear() + "-" + month + "-" + day;
			return val;
		}
		function disableQuestion(){
			$('input[type=checkbox]').attr('disabled','disabled');
			$('input[type=radio]').attr('disabled','disabled');
		}
	</script>
</body>
</html>