$(function(){
	//menuUtils.loadData();
});
/*
菜单绑定事件
*/
function autodivheight(){ //函数：获取尺寸
	//获取浏览器窗口高度
	var winHeight=0;
	if (window.innerHeight)
		winHeight = window.innerHeight;
	else if ((document.body) && (document.body.clientHeight))
		winHeight = document.body.clientHeight;
	//通过深入Document内部对body进行检测，获取浏览器窗口高度
	if (document.documentElement && document.documentElement.clientHeight)
		winHeight = document.documentElement.clientHeight;
	//DIV高度为浏览器窗口的高度
	//document.getElementById("test").style.height= winHeight +"px";
	//DIV高度为浏览器窗口高度的一半
	return winHeight;
}

function autodivwidth(){ //获取宽度
	//获取浏览器窗口宽度
	var winWidth=0;
	if (window.innerWidth)
		winWidth = window.innerWidth;
	else if ((document.body) && (document.body.clientWidth))
		winWidth = document.body.clientWidth;
	//通过深入Document内部对body进行检测，获取浏览器窗口宽度
	if (document.documentElement && document.documentElement.clientWidth)
		winWidth = document.documentElement.clientWidth;
	//DIV高度为浏览器窗口的宽度
	//document.getElementById("test").style.width= winWidth +"px";
	//DIV高度为浏览器窗口宽度的一半
	return winWidth;
}
function refMenus(id,name){
	menuUtils.loadChild($("#LAY-system-side-menu"),id,name);
	//var $a=$("#childMenus").find("a")[1];
	//$a.click();
}
/* 根据一级菜单，加载二级三级菜单 by yty*/
var menuUtils={
	/*加载一级菜单二级菜单数据*/	
	loadData:function(callback){
		/*一级菜单加载*/
		$.ajax({
            url: dynamicURL+"/admin/main/menu/one",
            success: function(data){//alert(JSON.stringify(data))
            	menuUtils.firstMenu=data;
            	menuUtils.loadMenu();
            	/*二级菜单加载*/
            	$.ajax({
                    url: dynamicURL+"/admin/main/menu/two",
                    success: function(data){//alert(JSON.stringify(data))
                    	menuUtils.menus=data;
                    	callback();
                    }
                });           	
            }
        });	
	},
	/*加载一级菜单*/	
	loadMenu:function(){
		var cnt=$("#firstMenuCnt");
		var thenWt=0;
		var cntWt=cnt.width();
		$("#firstMenuCnt span.layui-nav-bar").remove();
		$.each(this.firstMenu,function(i,d){
			var $this=$('<li class="layui-nav-item"><a id="_fm'+this.id+'" href="javascript:refMenus('+this.id+',\''+this.name+'\')" class="layui-icon '+this.icon+'"><cite>'+this.name+'</cite></a></li>').appendTo(cnt);
			thenWt+=$this.width()+40;
			/*判断是否超过容器长度  87表示更多+的长度*/
			if((thenWt+180)>=cntWt){
				var more=$("#menu-more");
				$this.remove();
				var moreMenus='<dd><a id="_fm'+this.id+'" href="javascript:refMenus('+this.id+',\''+this.name+'\')">'+this.name+'</a></dd>';
				if(more.length){
					more.find("dl").append(moreMenus);
				}else{
					$("<li id='menu-more' class='layui-nav-item'> <a href='javascript:;' data-toggle='dropdown' class='dropdown-toggle'><cite>更多</cite></a>\
		                <dl class='layui-nav-child' style='padding:0 20px;'>\
		                </dl>\
	                  </li>").appendTo(cnt).find("dl").append(moreMenus);
				}
			}
		});
		//layui.element.init('nav');
	},
	firstMenu:[
	],
	/**
	 * 根据一级菜单加载二级三级菜单<span class='layui-nav-more'></span>\
	*/
	loadChild:function($cnt,firstId,firstName){
		if(!$cnt || !firstId){alert("错误数据");
			return ;
		}
		$cnt=$($cnt);
		$cnt.empty();
		var menuz=this.menus[firstId];
		var strMenus="";
		if(menuz){
			$.each(menuz,function(i,d){
				var strIcon=d.icon||"";
				var strIn=i==0?"in":"";
				strMenus+="<li data-name='"+d.name+"' class='layui-nav-item'>\
							<a href='javascript:;' lay-tips='"+d.name+"' lay-direction='2'>\
							<i class='layui-icon "+d.icon+"'></i>\
							<cite>"+d.name+"</cite>\
							<span class='layui-nav-more'></span>\
							</a>\
							<dl class='layui-nav-child'>";
							var arrChilds=d.children;
							if(arrChilds){
								$.each(arrChilds,function(a,b){
									var strChildIcon=b.icon||"";
									strMenus+="<dd data-name='console'>\
											<a class='' lay-href='"+b.url+"'><i class='layui-icon "+strChildIcon+"'></i>"+b.name+"</a>\
											</dd>";
								});
							}
							strMenus+="</dl>\
									</li>";
			});
			$cnt.append(strMenus);
			layui.element.init('nav');
			$("ul#LAY-system-side-menu.layui-nav.layui-nav-tree li.layui-nav-item:first-child a:eq(0)").click();
		}
	},
	//菜单
	menus:{
	}
};