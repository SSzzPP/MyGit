/**
 * 数据工具js
 */
(function($, owner) {
	//item dynFlightDto/userFlightDto
	/**
	 * 获取状态(此处应该获取中文状态)
	 * @param dynflightdto
	 */
	owner.getState=function(item){
		if(item.externalstate){
			return item.cnexternalstate;
		}else{
			return '';
		}
	}
	/**
	 * 获取状态颜色
	 */
	owner.getStateColor=function(item){
		if(item.externalstate){
			return businessConstants.MAP_F_STATE_COLOR[item.externalstate];
		}else{
			return '';
		}
		
	}
	/**
	 * 始发站
	 */
	owner.getStartStation=function(item){
		return item.cnshortstartstation;
	}
	/**
	 * 始发站起飞时间
	 */
	owner.getStartTakeOffTime=function(item){
		return item.starttakeofftime;
	}
	/**
	 * 目的站到达时间
	 */
	owner.getTerminalLandingTime=function(item){
		return item.terminallandintime;
	}
	/**
	 * 目的站
	 */
	owner.getEndStation=function(item){
		return item.cnshortterminalstation;
	}
	/**
	 * 获取身份
	 * @param item userFlightDto
	 */
	owner.getIdentity=function(item){
		var identity=item.identity;
		if(identity==0){
			return '乘';
		}else if(identity==1){
			return '接';
		}else{
			return '送';
		}
	}
	/**
	 * 获取备注
	 */
	owner.getRemark=function(item){
		if(!item.remark){
			return '';
		}
		return item.remark;
	}
	/**
	 * 根据identity获取中文
	 */
	owner.getIdentityByFlag=function(identity){
		if(!identity){
			return '';
		}
		if(identity==0){
			return '乘';
		}else if(identity==1){
			return '接';
		}else{
			return '送';
		}
	}
	/**
	 * 过滤转意字符和特殊字符
	 */
	owner.clStr=function(s){  
			    // 去掉转义字符    
			    s = s.replace(/[\'\"\\\/\b\f\n\r\t]/g, '');    
			    // 去掉特殊字符    
			    s = s.replace(/[\-\_\,\!\|\~\`\(\)\#\$\%\^\&\*\{\}\:\;\"\L\<\>\?]/g, '');    
			    return s;    
	}

}(mui,window.dataUtil = {}));

