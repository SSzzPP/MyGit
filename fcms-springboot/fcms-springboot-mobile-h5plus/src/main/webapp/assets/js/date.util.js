/**
 * 时间操作工具类
 * @author stone
 */
(function($, owner) {
	owner.weekArray=new Array("日", "一", "二", "三", "四", "五", "六");
	/**
	 * 获得时分
	 * @param dateStr 2017-10-20 09:08
	 */
	owner.getHHmmByDateStr=function(dateStr){
		if(!dateStr||dateStr==''){
			return '';
		}
		return dateStr.substring(11,16);
	}
	/**
	 * 相对于当前日期的+-变化
	 * @param addDayCount -1,-2,..
	 * -1 2017-10-20 return 2017-10-19
	 */
	owner.addDays=function(addDayCount){
		if(!addDayCount){
			addDayCount=0;
		}
		var today=new Date();
		today.setDate(today.getDate()+addDayCount);
		var y=today.getFullYear();
		var m=today.getMonth()+1;
		var d=today.getDate();
		return y+'-'+m+'-'+d;
	}
	/**
	 * 在date上加addCount分钟
	 */
	owner.addMinutes=function(date,addCount){
		if(!addCount){
			addCount=0;
		}
		return new Date(date.getTime()+addCount*1000*60);
	}
	/**
	 * 日期转字符串
	 * @param date 日期
	 * @param format 转化成的样式
	 */
	owner.date2Str=function(date,format){
		var d={
			"M+": date.getMonth() + 1,
			"d+": date.getDate(),
			"h+": date.getHours(),
			"m+": date.getMinutes(),
			"s+": date.getSeconds(),
			"q+": Math.floor((date.getMonth() + 3) / 3),
			"S+": date.getMilliseconds()	
		}
		if (/(y+)/i.test(format)) {
		       format = format.replace(RegExp.$1, (date.getFullYear() + '').substr(4 - RegExp.$1.length));
		    }
		    for (var k in d) {
		       if (new RegExp("(" + k + ")").test(format)) {
		           format = format.replace(RegExp.$1, RegExp.$1.length == 1
		              ? d[k] : ("00" + d[k]).substr(("" + d[k]).length));
		       }
		    }
		    return format;
	}
	owner.str2HHmm=function(date){
		return date.substring(11,16);
	}
	/**
	 * 根据今天获取是哪一天，例如 -1 昨天
	 * @param date 日期(2017-10-21)
	 * @param week date.getDay()
	 */
	owner.getDateStrByToday=function(date,week){
		if(date==owner.addDays(0)){
			return '今天';
		}else if(date==owner.addDays(1)){
			return '明天';
		}else if(date==owner.addDays(2)){
			return '后天';
		}else if(date==owner.addDays(-1)){
			return '昨天';
		}else if(date==owner.addDays(-2)){
			return '前天';
		}
		else{
			return '星期'+owner.weekArray[week];
		}
	}
	/**
	 * 获取日期
	 * @param date 日期(2017-10-21)
	 */
	owner.getWeekStrByToday=function(date){
		var week=new Date(date).getDay();
		return owner.getDateStrByToday(date,week);
	}
	/**
	 * 判断是否是今天
	 * @param year 年
	 * @param month 月
	 * @param date 日
	 */
	owner.isToday=function(year,month,date){
		if(!year||!month||!date){
			return false;
		}
		var myDate=new Date();
		if(year==myDate.getFullYear()&&month==(myDate.getMonth()+1)&&date==myDate.getDate()){
			return true;
		}
		return false;
	}
	/**获取两个日期相差的天数(date1相对于date2)
	 * @param date1
	 * @param date2
	 * example:2017-10-25 2017-10-24 return 1;
	 */
	owner.getIntervalDays=function(date1,date2){
		if(!date1||!date2){
			return '0';
		}
		return Math.ceil((date1-date2)/1000/60/60/24);
	}
	/**
	 * 获取两个日期相差的分钟数（date1相对于date2）
	 * @param date1
	 * @param date2
	 */
	owner.getIntervalMinutes=function(date1,date2){
		if(!date1||!date2){
			return '0';
		}
		return Math.ceil((date1-date2)/1000/60);
	}
	/**
	 * 获得两个时间的时间差(XX小时XX分钟)
	 */
	owner.getStrIntervalDateTime=function(date1,date2){
		var intervalMinutes=owner.getIntervalMinutes(date1,date2);
		var intervalHoursByBow=Math.floor(intervalMinutes/60);
		if(intervalHoursByBow>0){
			intervalMinutes=intervalMinutes-intervalHoursByBow*60;
			str=intervalHoursByBow+'小时'+intervalMinutes+'分钟';
		}else{
			str=intervalMinutes+'分钟';
		}
		return str;
	}
	/**
	 * 将CST格式的日期转换成GMT
	 */
	owner.cstToGmt=function(strDate){
		 if(null==strDate || ""==strDate){  
		        return "";  
		    }  
		    var dateStr=strDate.trim().split(" ");  
		    var strGMT = dateStr[0]+" "+dateStr[1]+" "+dateStr[2]+" "+dateStr[5]+" "+dateStr[3]+" GMT+0800";  
		    var date = new Date(Date.parse(strGMT));  
		    var y = date.getFullYear();  
		    var m = date.getMonth() + 1;    
		    m = m < 10 ? ('0' + m) : m;  
		    var d = date.getDate();    
		    d = d < 10 ? ('0' + d) : d;  
		    var h = date.getHours();  
		    var minute = date.getMinutes();    
		    minute = minute < 10 ? ('0' + minute) : minute;  
		    var second = date.getSeconds();  
		    second = second < 10 ? ('0' + second) : second;  
		      
		    return new Date(y+"-"+m+"-"+d+" "+h+":"+minute+":"+second);  
	}
	//两个时间比较早晚    第一个时间早返回true 
	owner.checkdate = function(dataStr1,dataStr2) {
	   var sDate = new Date(dataStr1.replace("//-/g", "//"));
	   var eDate = new Date(dataStr2.replace("//-/g", "//"));
	   if(sDate > eDate){
	     return false;
	   }
	    return true;
	   }
}(mui, window.dateUtil = {}));