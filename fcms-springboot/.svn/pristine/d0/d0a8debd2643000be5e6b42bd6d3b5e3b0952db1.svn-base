<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<div class="easyui-layout layout-custom-resize" data-options="fit:true">
<div data-options="region:'north',split:false,collapsible:false"
		style="width: 100%;margin-left: 20px;margin-top: 10px">
		<div style="color:#000;font-size:24px;font-weight:bold">
         <span>${userEntity.name }</span>&nbsp;>&nbsp;<span>${paperEntity.title }</span>
    	</div>
	</div>
	<div data-options="region:'center',split:false,collapsible:false"
		style="width: 100%;margin-left: 20px;">
		<div class="easyui-layout layout" fit="true">
			<div id="container" class="easyui-layout layout" fit="true" style="overflow: auto">
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(function() {
		$("#container").empty();
		var optionsArray = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
		$.ajax({
			url : '${dynamicURL}/admin/survey/record/search?search_EQ_userEntity.id=${userEntity.id}&search_EQ_surveyPaperEntity.id=${paperEntity.id }',
			dataType : "json",
			async: false,
			success : function(response) {
				var div=document.getElementById('container');
				$.each(response,function(i,p){
					var question=p.surveyQuestionEntity;
					var h3=document.createElement('h3');
					h3.style='font-size: 16px;font-weight: bold;padding-bottom: 10px;padding-top: 10px';
					if(question.questionType==1){
						h3.innerText=(i+1)+'. '+question.title+'(多选)';
					}else{
						h3.innerText=(i+1)+'. '+question.title+'(单选)';
					}
					div.appendChild(h3);
					var div2=document.createElement('div');
					div.appendChild(div2);
					var options = question.options.split(';');
					$.each(options, function(number,option) {
						var div3=document.createElement('div');
						div3.style='padding:3px';
						var label1=document.createElement('label');
						var label2=document.createElement('label');
						label1.innerText=optionsArray[number]+": ";
						label2.innerText=option;
						div3.appendChild(label1);
						div3.appendChild(label2);
						if(p.userAnswer.indexOf(optionsArray[number])!=-1){
							label1.style='color:red';
							label2.style='color:red';
						}
						div2.appendChild(div3);
					});
			    })
			}
		});
	})
</script>

