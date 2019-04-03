(function($) {

	var playFlag = true; 
    var bvd = function(dom,playFlag,callback) {
		var that = this; 
		var dom = arguments[0]?arguments[0]:null;
		var playFlag = arguments[1]?arguments[1]:true;
	    var callback = arguments[2]?arguments[2]:function(){};
		
		$.ready(function() {
			//获取视频元素
			that.video = document.querySelector(dom || 'video');
			//获取视频父元素
			that.vRoom = that.video.parentNode;
			//元素初始化
			that.initEm();
            //计算样式
    		that.initStyle();
			//事件初始化
			that.initEvent();
			//记录信息
			that.initInfo();
			//当前播放模式 false 为 mini播放
			that.isMax = false;
			//回调函数 
			callback(that);
		})

		$.plusReady(function() {
			that.startWatchAcc();
		})
	}

	var pro = bvd.prototype;

	//记录信息
	pro.initInfo = function() {
		var that = this;
		//在onload状态下，offsetHeight才会获取到正确的值
		window.onload = function() {
			that.miniInfo = { //mini状态时的样式
				zIndex: 1,
				width: that.video.offsetWidth + 'px',
				height: that.video.offsetHeight + 'px',
				position: that.vRoom.style.position
			}

			that.maxInfo = { //max状态时的样式
				zIndex: 99,
				width: '100%',
				height: that.sw + 'px',
				position: 'fixed'
			}
		}

	}

	pro.initEm = function() {
		//初始化视频高度宽度
		var info = [
			document.documentElement.clientWidth || document.body.clientWidth,
			document.documentElement.clientHeight || document.body.clientHeigth
		];
		this.sw = info[0]; //屏幕宽
		this.sh = info[1]; //屏幕高
		var vh = (this.sw / 3 * 2); //视频高

		this.vRoom.style.width = (this.vW = this.sw) + 'px';
		this.vRoom.style.height = (this.vH = vh) + 'px';

		//先添加播放按钮
		this.vimg = document.createElement("img");
		this.vimg.src = 'data:image/png;base64,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';
		this.vimg.className = 'vplay';
		this.vRoom.appendChild(this.vimg);

		//添加控制条
		var controlsStr = '<div class="progressBar">';
		
		if(!playFlag){
			controlsStr = '<div class="progressBar" style="display:none;">'
		}
		 
		this.vC = document.createElement("div");
		this.vC.classList.add('controls');
		this.vC.innerHTML = '<div><span class="current">00:00</span></div><div>'+controlsStr
		+'<div class="timeBar"><div class="crr"></div></div></div></div><div><span class="duration">00:00</span></div><div><div class="fill"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAADyklEQVR4Xu2bf07bMBTH30urTZO2JpHK32MngBtQTrByAroTrDvB2AkGJ1g5AeUEwA3gBON/OjkpkyZQmjc5UtaQpInt2o0H6Z/t84/vx8+un/2M8MI/+ML1Qwug9YAcgVkQnAHgUAkM4ae+35solRUsNGPzISCdCZrnzGja97yD7JeFKTALQlKrHICIrrZ8b6BaXqTcHQsuEXFPxLbMpu+5TzRrBQAE533fVfMeQUUzFk4A4VDQvGCmDoDgnACuqxruQu/Y9zFQ7ZxIOcbIi2E+igG8VfbIf0P4rNkDKOhQd9/331ZCEBFh0oYDijC8QMBdzQB4dXZDqBPPFchNAYITAhog4s6Spp0QysQT0Q0CXmangxQAIvjG53UEIV95rYWwSnwX3EEE8zEifE0HUBrAlu8eJQ1YCqFKPF+Q71h4tDYATs9GCHXieb+1AbANgoh47QBsgSAq3giApiHIiDcGoCkIsuKNAtg0BBXxBQBEYd/3nmyhi8EQm48I4hECBh14Nfb9N7dVW9dN/Dsw9mc7woez7PaWb3L4/3xd7MHLLuDxmIA8BGeSD9e1nAiZhMDY790FRhcA+G/kRMWLxBxaAJiaDqbF835rA1ANwf1Q56r50eJetcDwp6mRT9vTCmAVBB5T8C21iEumNvkdnE63z/ZDO4BSCIQHfb83lQNwP0CML5IgXHDBk6nfmAekFS9PbpzrLf/dpUrn7tj9wIF414HeRHYKibZnxANEG7fBrgVgwyg02YfWA5qkb0PbrQfYMApN9qH1gCbp29B26wE2jEKTfWg9wBT9JBhy5odx7NysFQw58Y4T907/q2CocIC5bjgMdN0ld98EBO1ToPz0Vv5A5BcLx4TwPfVQMgRBK4DS+3misAPutuzoJUdiEN4ComsSgjYAq8V3B6pZJcmhKERTQHxvCoIWACbEZ0+W8lfzOqdD6cUIYJxkYXWo+6Vu9EyK1wEhuRjBB76WeEDOae3FSDZPsO40dxPi14WgNT8gu2fYpPh1IBgB0IR4VQjaATQpXgWCVgA2iJeFoA2ATeJlIGgBYKP4KgjZjNa1ASSJkvnc22R7q77D0x2BVuUnRLAYKucJAk+VRdorZma8HtZljugWWVffKghAeAUIH9PyUpmi+UZN3tLWCRT5vRzC05LKAGwXX70mLCGoA0A4dgAqH0M4ce9ENuwVGdn8DjR25qWPIVI7/pgCCcZldSsDEOros34yI0DgeTyaYuE0u2oK6F6abObZ3AiQfkj1a3maUnjUpeVARKkzlhRqAVgyEI1148V7wF9yO/VuKlNkeAAAAABJRU5ErkJggg=="/></div></div>';
		this.vRoom.appendChild(this.vC);

		//添加锁定按钮
		this.vlock = document.createElement("img");
		this.vlock.src = 'data:image/png;base64,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';
		this.vlock.className = 'lock';
		this.vRoom.appendChild(this.vlock);
	}

	pro.initEvent = function() {
		var that = this;
		//给播放按钮图片添加事件
		this.vimg.addEventListener('tap', function() {
			that.video.play();
		})

		//获取到元数据
		this.eve('loadedmetadata', function() {
			that.vDuration = this.duration;
			that.vC.querySelector('.duration').innerHTML = stom(that.vDuration);
		});

		//视频播放事件
		this.eve('play', function() {
			that.vimg.style.display = 'none';
			that.vC.classList.add('vhidden');
			that.vCt = setTimeout(function() {
				that.vC.style.visibility = 'hidden';
			}, 4500);

			//新增Lock图标隐藏动画
			that.vlock.classList.add('lockhidden');
		})

		//视频播放中事件
		this.eve('timeupdate', function() {
			var currentPos = this.currentTime; //获取当前播放的位置
			//更新进度条
			var percentage = 100 * currentPos / that.vDuration;
			that.vC.querySelector('.timeBar').style.width = percentage + '%';
			//更新当前播放时间
			that.vC.querySelector('.current').innerHTML = stom(currentPos);
		});

		//视频点击暂停或播放事件
		this.eve('tap', function() {
			if(this.paused || this.ended) {
				//如果播放完毕，就重头开始播放
				this.ended && (this.currentTime = 0);
				this.play();
//			} else {
//				//播放时点击就暂停
//				this.pause();
			}
//			console.log('tap');
//			that.vimg.style.display = 'block'; 
			that.vC.classList.remove('vhidden');
			that.vC.style.visibility = 'visible';
			that.vCt && clearTimeout(that.vCt);

			//新增Lock图标清除动画
			that.vlock.classList.remove('lockhidden');
		})
		
		// 双击事件：双击暂停	
		this.eve('doubletap', function() {
//			console.log('doubletap');
			this.pause();
		})

		//暂停or停止
		this.eve('pause', function() {
			that.vimg.style.display = 'block';
			that.vC.classList.remove('vhidden');
			that.vC.style.visibility = 'visible';
			that.vCt && clearTimeout(that.vCt);

			//新增Lock图标清除动画
			that.vlock.classList.remove('lockhidden');
		});

		//视频手势右滑动事件
		this.eve('swiperight', function() {
			if(playFlag){
				that.setCurrentTime(5);
			}
		}); 

		//视频手势左滑动事件
		this.eve('swipeleft', function() {
			if(playFlag){
				that.setCurrentTime(-5);
			}
		});

		//视频手势上滑动事件
		this.eve('swipeup', function() {
			//that.setVolume(0.2);
		});

		//视频手势下滑动事件
		this.eve('swipedown', function() {
			//that.setVolume(-0.2);
		});

		//全屏按钮点击事件
		this.vC.querySelector('.fill').addEventListener('tap', function() {
			//that.nativeMax();
			that.switch();
		});

		//全屏 时 锁定点击事件
		this.vlock.addEventListener('tap', function() {
			if(that.isLock) {
				that.unlockScreen();
				return;
			}
			that.lockScreen();
		});
        
        /**
         *2016-9-3 
         * 解决进度条拖动 在全屏和mini时的错位问题
         */
       var crr = this.vC.querySelector('.crr');
    	this.timeBar = that.vC.querySelector('.timeBar');
		crr.addEventListener('touchstart',function(e){
			//暂停播放
			that.video.pause();
		});
		
		crr.addEventListener('touchmove',function(e){
			//计算 手指x坐标 减去 进度条的x坐标
			var cha = e.touches[0].pageX - that.vCstyle.barLX;
			if(cha<0){
				cha = 0;
			}else if(cha>that.vCstyle.barW){
				cha = that.vCstyle.barW;
			}
			//计算移动的x距离百分比
			that.bl = 100 * cha / that.vCstyle.barW;
			that.timeBar.style.width = that.bl + '%';
		});
		
		crr.addEventListener('touchend',function(e){
			//跳转到百分比的视频进度
			that.video.currentTime = that.video.duration * that.bl / 100;
			//继续播放
			that.video.play();
		});
        
        
		this.oback = $.back;
		//监听安卓返回键
		$.back = function(){
			if(that.isMax){
				if(!that.isLock){
					setTimeout(function(){
						that.startWatchAcc();
					},1000);
					that.clearWatchAcc();
					that.switch();
				}
				return;
			}
			that.oback();
		}
	}
    
    pro.initStyle = function(){
    	 
		var	bar = this.vC.querySelector('.progressBar'),
			barW = bar.offsetWidth,
			barLX = bar.offsetLeft,
			barRX = barLX+barW;
		this.vCstyle = {
			barW : barW,
			barLX : barLX,
			barRx : barRX
		}; 
		console.log(JSON.stringify(this.vCstyle))
	}

	pro.setIsMax = function(state) {
		this.isMax = !state;
		this.switch();
	}
	pro.getIsMax = function() {
		return this.isMax;
	}

	//全屏 mini 两种模式切换
	pro.switch = function() {
		var vR = this.vRoom;
		//获取需要转换的样式信息
		var info = this.isMax ? this.miniInfo : this.maxInfo;
		this.isMax = !this.isMax;

		setTimeout(function() {
    		for(var i in info) {
				vR.style[i] = info[i];
			}
			//重新计算视频宽度和进度条的左边距
			this.initStyle();
		}.bind(this), 500);

		/*plus.navigator.setFullscreen(this.isMax);*/
		/*if(this.isMax) {
			//自感应横屏方向状态
			plus.screen.lockOrientation("landscape"); //-primary");
		} else {
			//锁定手机正竖直方向
			plus.screen.lockOrientation("portrait-primary");
		}*/
		
		if(mui.os.android){
			plus.navigator.setFullscreen(this.isMax);
			
			if(this.isMax) {
				//自感应横屏方向状态
				plus.screen.lockOrientation("landscape"); //-primary");
			} else {
				//锁定手机正竖直方向
				plus.screen.lockOrientation("portrait-primary");
			}
			
			// 视频标题切换
			if(this.isMax){
				document.getElementById("title").style.display = 'none';
			}else{
				document.getElementById("title").style.display = 'block';
			}
		}

		//全屏时 显示锁定 图标
		this.vlock.style.visibility = this.isMax ? 'visible' : 'hidden';
	}

	//锁定屏幕
	pro.lockScreen = function() {
		$.toast('锁定屏幕');
		var that = this;
		//更换video点击事件为 显示 lock图标，并保存 video之前的事件 
		this.videoTapFn = this.eve('tap', function() {
			that.lockT = setTimeout(function(){
				that.vlock.classList.add('lockhidden');
			},500);
				//重新开始播放样式
			that.vlock.classList.remove('lockhidden');
			that.vlock.style.visibility = 'visible';
			//that.vlock.classList.add('lockhidden');
		}, true);
		//隐藏控制条
		this.vC.style.visibility = 'hidden';
		//给Lock图标增加 隐藏样式类
		this.vlock.classList.add('lockhidden');
		//锁定屏幕时，不监控重力感应
		this.clearWatchAcc();
		//标识当前更改的Lock状态
		this.isLock = true;

	}

	//解锁屏幕
	pro.unlockScreen = function() {
		$.toast('解锁屏幕');
		//替换回video之前的点击事件
		this.eve('tap', this.videoTapFn, true);
		
		//给Lock图标清楚 隐藏样式类
		this.vlock.classList.remove('lockhidden');
		//不锁定屏幕时，监控重力感应
		this.startWatchAcc();
		//标识当前更改的Lock状态
		this.isLock = false;
	}

	//开启方向感应
	pro.startWatchAcc = function() {
			var that = this;
			this.watchAccFun = plus.accelerometer.watchAcceleration(function(a) {
				if(that.getIsMax()) {
					//当前为全屏状态
					//判断是否满足竖屏Mini状态
					a.yAxis >= 5 && that.setIsMax(false);
				} else {
					//当前为Mini状态
					//判断是否满足全屏Max状态
					Math.abs(a.xAxis) >= 5 && that.setIsMax(true);
				}
			}, function(e) {
				//出错了大不了 不自动旋转呗  让它手动 切换
				console.log("Acceleration error: " + e.message);
				that.clearWatchAcc();
			}, {
				frequency: 1200
			});
		}
		//关闭方向感应
	pro.clearWatchAcc = function() {
		this.watchAccFun && plus.accelerometer.clearWatch(this.watchAccFun);
	}

	//使用原生支持的方式播放
	pro.nativeMax = function() {
		if(!window.plus) {
			//非html5+环境
			return;
		}
		if($.os.ios) {
			console.log('ios')
			this.video.removeAttribute('webkit-playsinline');
		} else if($.os.android) {
			console.log('android');
			var url = this.video.querySelector('source').src;
			var Intent = plus.android.importClass("android.content.Intent");
			var Uri = plus.android.importClass("android.net.Uri");
			var main = plus.android.runtimeMainActivity();
			var intent = new Intent(Intent.ACTION_VIEW);
			var uri = Uri.parse(url);
			intent.setDataAndType(uri, "video/*");
			main.startActivity(intent);
		}
	}

	//跳转视频进度 单位 秒
	pro.setCurrentTime = function(t) {
			this.video.currentTime += t;
		}
	pro.getCurrentTime = function() {
			return this.video.currentTime;
		}
	pro.getDuration = function() {
			return this.video.duration;
		}
	pro.initVideoTime = function(t) {
			this.video.currentTime = t;
		}
		//设置音量大小 单位 百分比 如 0.1
	pro.setVolume = function(v) {
			v = this.video.volume + v;
			if(v < 0) v = 0;
			else if(v > 1) v = 1;
			this.video.volume = v;
		}
		//设置屏幕亮度  单位 百分比 如 0.1
	pro.setBrightness = function(b) {
			b = plus.screen.getBrightness() + v;
			if(b < 0) b = 0;
			else if(b > 1) b = 1;
			plus.screen.setBrightness(b);
		}
		//切换播放地址 
	pro.setUrl = function(nUrl) {
		var v = this.video;
		var source = v.querySelector('source');
		source.src = v.src = nUrl;
		source.type = 'video/' + nUrl.split('.').pop();
		v.play();
	}

	var events = {};

	//增加 或者删除事件    isBack 是否返回  这次添加事件时 被删除 的上一个 事件
	pro.eve = function(ename, callback, isBack) {
		var fn;
		if(callback && typeof(callback) == 'function') {
			isBack && (fn = arguments.callee.call(this, ename));
			events[ename] = callback;
			this.video.addEventListener(ename, events[ename]);
			console.log('添加事件：' + ename);
		} else {
			fn = events[ename];
			fn && this.video.removeEventListener(ename, fn);
			console.log('删除事件：' + ename);
		}

		return fn;
	}

	function stom(t) {
		var m = Math.floor(t / 60);
		m < 10 && (m = '0' + m);
		return m + ":" + (t % 60 / 100).toFixed(2).slice(-2);
	}

	var nv = null;
	$.bvd = function(dom,playFlag,callback) {
		return nv || (nv = new bvd(dom,playFlag,callback));
	}
}(mui))