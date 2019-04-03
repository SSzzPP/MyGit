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
			
			.mui-progressbar-success span {
				background-color: #4cd964;
			}
			
			.mui-progressbar-warning span {
				background-color: #f0ad4e;
			}
			
			.mui-progressbar-danger span {
				background-color: #dd524d;
			}
			
			.mui-progressbar-royal span {
				background-color: #8a6de9;
			}
		</style>
</head>
<body>
		<header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">调查问卷</h1>
		</header>
		<div class="mui-content">
		</div>
		
			<script>
		mui.init({
			swipeBack: true //启用右滑关闭功能
		});
		/*mui('.mui-input-group').on('change', 'input', function() {
			var value = this.checked ? "true" : "false";
			this.previousElementSibling.innerText = "checked：" + value;
		});*/
		var paperId;
		var paperTitle;
		var total;
		var actual;
		var optionsArray = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
		var status;
		mui.ready(function() {
			paperId = '${paperId}';
			paperTitle = '${paperTitle}';
			total = '${total}';
			actual = '${actual}';
			var title = document.querySelector('.mui-title');
			title.innerText = '调查问卷(' + paperTitle + ')';
			status = '${status}';
			var param = {
				paperId: paperId
			}
			topUtil.web_query("/mobile/survey/paperQuestion/search", param, function(data) {
				
					var div = document.querySelector('.mui-content');
					mui.each(data, function(number, object) {
						createContent(div, number, object);
					});
					topUtil.web_query("/mobile/survey/record/listForQuestionTotal", param, function(data2) {
						
							mui.each(data2.data, function(number, obj) {
								var optionNums = obj.optionsNums;
								var arr = new Array(optionNums);
								for(var i = 0; i < arr.length; i++) {
									arr[i] = 0;
								}
								mui.each(obj.surveyRecordEntities, function(m, object) {
									if(object.userAnswer != null && object.userAnswer != "") {
										//单选
										if(obj.questionType == 0) {
											arr[optionsArray.indexOf(object.userAnswer)]++;
										} else {
											for(var j = 0; j < object.userAnswer.length; j++) {
												arr[optionsArray.indexOf(object.userAnswer.charAt(j))]++;
											}
										}
									}
								});
								for(var i = 0; i < arr.length; i++) {
									var num = arr[i];
									var percent = accMul(accDiv(num,actual).toFixed(4),100);
									if(actual == 0) {
										percent = 0;
									}
									if(percent <= 25) {
										document.getElementById("p-" + obj.surveyQuestionEntity.id + "-" + i).className = 'mui-progressbar mui-progressbar-success';
									} else if(percent <= 50) {
										document.getElementById("p-" + obj.surveyQuestionEntity.id + "-" + i).className = 'mui-progressbar mui-progressbar-warning';
									} else if(percent <= 75) {
										document.getElementById("p-" + obj.surveyQuestionEntity.id + "-" + i).className = 'mui-progressbar mui-progressbar-danger';
									} else {
										document.getElementById("p-" + obj.surveyQuestionEntity.id + "-" + i).className = 'mui-progressbar mui-progressbar-royal';
									}
									$("#label-" + obj.surveyQuestionEntity.id + "-" + i).text(percent+'% '+ num + '/' + actual);
									mui(mui("#div-" + obj.surveyQuestionEntity.id + "-" + i)).progressbar().setProgress(percent);
								}
							});
						
					});
				
			});
		})

		function createContent(div, number, object) {
			var question = object.surveyQuestionEntity;
			var isExam=object.surveyPaperEntity.isExam;
			var h4 = document.createElement('h4');
			h4.className = 'mui-content-padded';
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
				divInput.className = 'mui-input-row';
				var label = document.createElement('label');
				label.style = 'width:80%';
				label.innerText = optionsArray[n] + '.' + option;
				var label2 = document.createElement('label');
				label2.id = 'label-' + question.id + '-' + n;
				label2.style = 'width:20%';
				divInput.appendChild(label);
				divInput.appendChild(label2);
				form.appendChild(divInput);
				var divProgressbar = document.createElement('div');
				divProgressbar.className = 'mui-text-center';
				divProgressbar.id = 'div-' + question.id + '-' + n;
				var p = document.createElement('p');
				p.className = 'mui-progressbar mui-progressbar-success';
				p.id = 'p-' + question.id + '-' + n;
				var span = document.createElement('span');
				p.appendChild(span);
				divProgressbar.appendChild(p);
				form.appendChild(divProgressbar);
				if(isExam==1&&question.answer&&question.answer!=null){
					if(question.answer.indexOf(optionsArray[n])>-1){
						label.style='color:green;font-weight:bold;';
					}
				}
			});
			cardDiv.appendChild(form);
			div.appendChild(h4);
			div.appendChild(cardDiv);
		}

		function accMul(arg1, arg2) {
			var m = 0,
				s1 = arg1.toString(),
				s2 = arg2.toString();
			try {
				m += s1.split(".")[1].length;
			} catch(e) {}
			try {
				m += s2.split(".")[1].length;
			} catch(e) {}
			return Number(s1.replace(".", "")) * Number(s2.replace(".", "")) / Math.pow(10, m);
		}

		function accDiv(arg1, arg2) {
			var t1 = 0,
				t2 = 0,
				r1, r2;
			try {
				t1 = arg1.toString().split(".")[1].length;
			} catch(e) {}
			try {
				t2 = arg2.toString().split(".")[1].length;
			} catch(e) {}
			with(Math) {
				r1 = Number(arg1.toString().replace(".", ""));
				r2 = Number(arg2.toString().replace(".", ""));
				return(r1 / r2) * pow(10, t2 - t1);
			}
		}
	</script>
</body>
</html>