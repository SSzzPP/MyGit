/**
 * Created by dell on 2017/3/21.
 */
(function($){
    $.fn.myScroll = function(options){
        //默认配置
        var defaults = {
            speed:40,  //滚动速度,值越大速度越慢
            rowHeight:24 //每行的高度
        };
        var opts = $.extend({}, defaults, options),intId = [];
        function marquee(obj, step){
            obj.find("ul").animate({
                marginLeft: '-=1'
            },0,function(){
                var s = Math.abs(parseInt($(this).css("margin-left")));
                if(s >= step){
                    $(this).find("li").slice(0, 1).appendTo($(this));
                    $(this).css("margin-left", 0);
                }
            });
        }

        this.each(function(i){
            var sh = opts["rowHeight"],speed = opts["speed"],_this = $(this);
            console.log(_this.find("ul").width());
            console.log(_this.width());
            console.log(666666)
            intId[i] = setInterval(function(){
                if(_this.find("ul").width()<=_this.width()){
                    clearInterval(intId[i]);
                }else{
                    marquee(_this, sh);
                }
            }, speed);

            _this.hover(function(){
                clearInterval(intId[i]);
            },function(){
                intId[i] = setInterval(function(){
                    if(_this.find("ul").width()<=_this.width()){
                        clearInterval(intId[i]);
                    }else{
                        marquee(_this, sh);
                    }
                }, speed);
            });

        });
    }
})(jQuery);
function initSlide(){
    var sliderElement = $('.slider-carousel');
    	sliderElement.slidesjs({
            play: {
                auto: true,
                effect: 'fade'
            },
            navigation: {
                effect: "fade"
            },
            pagination: {
                effect: "fade"
            },
            effect: {
                slide: {
                    speed: 400
                }
            }
        });
    
    var slidernav = sliderElement.find('.slidesjs-navigation');
    sliderElement.hover(function() {
        slidernav.stop().show()
    },function() {
        slidernav.stop().hide()
    });
    slidernav.hover(function(){
        $(this).show();
    }),function(){
        $(this).show();
    };
    $(".flexslider").each(function(){
        $(this).hover(function(){
            $(this).find(".flex-direction-nav").fadeIn("slow")
        },function(){
            $(this).find(".flex-direction-nav").hide()
        })
    })
}