<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript" language="javascript" src="${staticURL}/scripts/jquery.lineProgressbar.js"></script>
<style>
.border {
	border: 1px solid #bbdba9;
	background-color: #e5f1db;
}


table.dataTable.display tbody td {
	border-right: 1px solid #ddd;
	text-align: left;
}

table.dataTable.display tbody td:last-child {
	border-right: 0px solid #ddd;
}

table.dataTable thead th {
	border-right: 1px solid #ddd;
	text-align: left;
	background: #f5f5f5;
}

table.dataTable thead th:last-child {
	border-right: 0px solid #ddd;
	text-align: left;
}

.input-group {
	width: 60%;
}

input:focus {
	border-color: #f83600 !important;
}

.panel-body {
	min-height: 100px;
}
a.l-btn span.l-btn-left{
	min-height: 25px;
	max-height: 25px;
	height:25px;
}
.BtnLine{
	text-align: center;	
}
.button{
	border-top-left-radius: 0px;
    border-top-right-radius: 4px;
    border-bottom-right-radius: 4px;
    border-bottom-left-radius: 0px;
}
.input{
	border-radius:0px;
}
.progressbar{
	background-color: #fff; border-radius: 10px;height:10px;
}
</style>
<div class="easyui-layout layout-custom-resize" data-options="fit:true">
<div data-options="region:'north',split:false,collapsible:false"
		style="width: 100%;margin-left: 20px;margin-top: 10px">
		<div style="color:#000;font-size:24px;font-weight:bold">
         <span>${paperEntity.title }</span><br>
         <span>应该参与人数：${total }人</span>&nbsp;&nbsp;<span>实际参与人数：${actual }人</span>
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
var surveyPaperQuestionTotalDatagrid;
$(function() {
	$("#container").empty();
	var optionsArray = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
	$.ajax({
		url : '${dynamicURL}/admin/survey/paperQuestion/search?search_EQ_surveyPaperEntity.id=${paperEntity.id }',
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
				var table=document.createElement('table');
				table.style="width:100%";
				$.each(options, function(number,option) {
					var tr=document.createElement('tr');
					var td1=document.createElement('td');
					td1.innerText=optionsArray[number]+": ";
					var td2=document.createElement('td');
					td2.innerText=option;
					var td3=document.createElement('td');
					var progressDiv=document.createElement('div');
					progressDiv.id="progressbar-"+question.id+"-"+number;
					progressDiv.style="width:200px;float:right;margin-right:40px";
					td3.appendChild(progressDiv);
					var td4=document.createElement('td');
					td4.id="td-"+question.id+"-"+number;
					var td5=document.createElement('td');
					td5.id="td2-"+question.id+"-"+number;
					//td4.innerText='20% 1/2';
					table.appendChild(tr);
					tr.appendChild(td1);
					tr.appendChild(td2);
					tr.appendChild(td3);
					tr.appendChild(td4);
					tr.appendChild(td5);
					div2.appendChild(table);
					/* $("#progressbar-"+question.id+"-"+number).LineProgressbar({
						percentage: 20,height: '10px',radius: '10px',fillBackgroundColor: '#1abc9c'
					}); */
				});
		    })
		},complete : function() {
			var actual=${actual};
			$.ajax({
				url:"${dynamicURL}/admin/survey/record/listForQuestionTotal?paperId=${paperEntity.id}",
				type:"POST",
				dataType : 'json',
				success:function(data){
					if (typeof data == "string") {
						data = JSON.parse(data);
					}
					$.each(data.data,function(number,obj){
						var optionNums=obj.optionsNums;
						var arr=new Array(optionNums);
						for(var i=0;i<arr.length;i++){
				            arr[i] = 0;
				        }
						$.each(obj.surveyRecordEntities,function(m,object){
							if(object.userAnswer!=null&&object.userAnswer!=""){
								//单选
								if(obj.questionType==0){
									arr[optionsArray.indexOf(object.userAnswer)]++;
								}else{
									for(var j=0;j<object.userAnswer.length;j++){
										arr[optionsArray.indexOf(object.userAnswer.charAt(j))]++;
							        }
								}
							}
							
						});
						for(var i=0;i<arr.length;i++){
							var num=arr[i];
							var percent=accMul(accDiv(num,actual).toFixed(4),100);
							if(actual==0){
								percent=0;
							}
				            $("#td-"+obj.surveyQuestionEntity.id+"-"+i).text(percent+'%  ');
				            $("#td2-"+obj.surveyQuestionEntity.id+"-"+i).text(num+'/'+actual);
				            var backGround='';
				            if(percent<=5){
				            	backGround='rgb(136, 187, 200)';
				            }else if(percent<=25){
				            	backGround='rgb(147, 147, 147)';
				            }else if(percent<=50){
				            	backGround='rgb(58, 137, 201)';
				            }else if(percent<=75){
				            	backGround='rgb(234, 128, 92)';
				            }else{
				            	backGround='rgb(214, 71, 71)';
				            }
				            $("#progressbar-"+obj.surveyQuestionEntity.id+"-"+i).LineProgressbar({
								percentage: percent,height: '10px',radius: '10px',fillBackgroundColor: backGround
							});
				        }
					});
				},
				error:function(){
					$.messager.progress('close');
				}
			}); 
		}
	});
})
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

