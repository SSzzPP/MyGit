function graphTrace(pid){
	var params = {pid:pid};
	topUtil.web_query('/mobile/workflow/activitys',params,
		function (data){
			if (typeof data == "string") {
                data = JSON.parse(data);
            }
			var imageUrl = window.constants.getServerPath() + "/mobile/workflow/graph?pid="+pid+"&a="+Math.random(99999999);
			// 生成图片边框和节点自定义信息
			var positionHtml = '';
			var varsArray = new Array();
			var minTop=0;
			var minLeft=0;
			$.each(data, function(i,v) {
				if(i==0){
					minTop=v.y;
					minLeft=v.x;
				}
				if(v.y<minTop){
					minTop=v.y;
				}
				if(v.x<minLeft){
					minLeft=v.x;
				}
			}); 
//			console.log(JSON.stringify(data));
			$.each(data, function(i,v) {
				var $positionDiv = $('<div/>', {
			        'class': 'activity-attr'
			    }).css({
			        position: 'absolute',
			        left: (v.x-minLeft+59),
			        top: (v.y-minTop+112),
			        width: (v.width),
			        height: (v.height),
			        backgroundColor: 'black',
			        opacity: 0,
			        zIndex: 100000000000000
			    });
			    positionHtml += $positionDiv.get(0).outerHTML;
			    varsArray[varsArray.length] = v.vars;
				
			});
			console.log(positionHtml);
			$("#workflow-graphTrace").html("<img id='img-wf' style='margin:100px 0 0 10px;' src="+imageUrl+">"+positionHtml);
			$('#processImageBorder').html(positionHtml);
			/*$('#workflowTraceDialog img').attr('src', imageUrl);
			$('#workflowTraceDialog #processImageBorder').html(positionHtml);
	
			$('#workflowTraceDialog .activity-attr').each(function(i, v) {
			    $(this).data('vars', varsArray[i]);
			});*/
			$('.activity-attr').each(function(i, v) {
			    $(this).data('vars', varsArray[i]);
			});
		    // 此处用于显示每个节点的信息，如果不需要可以删除
//			$('.activity-attr').tooltip({
//				position : 'right',
//				content:'',
//				onShow : function() { 
//				    var tipContent = "<table>";
//					var vars = $(this).data('vars');
//					var i = 0;
//					var style = "";
//		            $.each(vars,function(k, v) {
//		            	if(i % 2 != 1){
//		            		style = "background-color:#F2F2F2;font-size:13px;";
//		            	}
//		                if (v) {
//		                    tipContent += "<tr style=" + style + "><td style='text-align:right;font-weight:bold;'>" + k + "&nbsp;&nbsp;</td><td style='word-wrap:break-word;word-break:break-all;width-min:100px;overflow:hidden;'>" + v + "<td/></tr>";
//		                }
//		                style = "font-size:13px;";
//		                i = i + 1;
//		            });
//		            tipContent += "</table>"; 
//					$(this).tooltip('tip').css({
//						backgroundColor : '#FFFFA3',
//						borderColor : '#F1D031',
//						'z-index': 999999999999999999
//					});
//					$(this).tooltip("update",tipContent);
//				}
//			});
		}
	)
}

function graphTraceInfo(pid){
	$.getJSON(dynamicURL + '/front/workflow/activitys?pid='+pid, function(data) {
		var imageUrl = dynamicURL + "/front/workflow/graph?pid="+pid+"&a="+Math.random(99999999);
		// 生成图片边框和节点自定义信息
		var positionHtml = '';
		var varsArray = new Array();
		var minTop=0;
		var minLeft=0;
		$.each(data, function(i,v) {
			if(i==0){
				minTop=v.y;
				minLeft=v.x;
			}
			if(v.y<minTop){
				minTop=v.y;
			}
			if(v.x<minLeft){
				minLeft=v.x;
			}
		});
		$.each(data, function(i,v) {
			var $positionDiv = $('<div/>', {
		        'class': 'activity-attr'
		    }).css({
		        position: 'absolute',
		        left: (v.x-minLeft+102),
		        top: (v.y-minTop+437),
		        width: (v.width),
		        height: (v.height),
		        backgroundColor: 'black',
		        opacity: 0,
		        zIndex: 100000000000000
		    });
		    positionHtml += $positionDiv.get(0).outerHTML;
		    varsArray[varsArray.length] = v.vars;
			
		});
		$('#graphTraceInfo .wf-img').attr('src', imageUrl);
		$('#graphTraceInfo .task-info').html(positionHtml);
		/*$('#workflowTraceDialog img').attr('src', imageUrl);
		$('#workflowTraceDialog #processImageBorder').html(positionHtml);

		$('#workflowTraceDialog .activity-attr').each(function(i, v) {
		    $(this).data('vars', varsArray[i]);
		});*/
		$('.activity-attr').each(function(i, v) {
		    $(this).data('vars', varsArray[i]);
		});
	    // 此处用于显示每个节点的信息，如果不需要可以删除
		$('.activity-attr').tooltip({
			position : 'right',
			content:'',
			onShow : function() { 
			    var tipContent = "<table>";
				var vars = $(this).data('vars');
				var i = 0;
				var style = "";
	            $.each(vars,function(k, v) {
	            	if(i % 2 != 1){
	            		style = "background-color:#F2F2F2;font-size:13px;";
	            	}
	                if (v) {
	                    tipContent += "<tr style=" + style + "><td style='text-align:right;font-weight:bold;'>" + k + "&nbsp;&nbsp;</td><td style='word-wrap:break-word;word-break:break-all;width-min:100px;overflow:hidden;'>" + v + "<td/></tr>";
	                }
	                style = "font-size:13px;";
	                i = i + 1;
	            });
	            tipContent += "</table>"; 
				$(this).tooltip('tip').css({
					backgroundColor : '#FFFFA3',
					borderColor : '#F1D031',
					'z-index': 999999999999999999
				});
				$(this).tooltip("update",tipContent);
			}
		});
		
	});	
}