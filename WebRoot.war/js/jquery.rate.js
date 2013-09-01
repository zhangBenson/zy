(function ($) {
    $.fn.rate = function (parms) {
		//获取点击对像
		function getTarget(event){
			var evt=event||window.event,target=evt.target||evt.srcElement;
			return {"event":evt,"target":target};
		}
		//初始UI
		function initUI(arg,c,rc,_self){
			arg.rWidth = c.width;
			if(c.selectable){
				var r=[],total=c.amount;
				if(!c.fullStar){
					total = c.amount*2;
					arg.rWidth = c.width/2;
					arg.rv=2;
					c.decimal && (arg.rd=2);
				}
				for(var i=total;i>0;i--){
					r.push('<a href="javascript:void(0);" class="rate-on" style="width:'+(arg.rWidth*i)+'px; z-index:'+(total-i+1)+';"></a>');
				}
				//设置默认值
				setDefaultSelect();
				$(_self).css({"width":c.amount*c.width,"overflow":"hidden"}).html(r.join("")).append(rc);
			}else{
				!c.fullStar && (arg.rWidth/=2);
				setDefaultSelect();
				$(_self).width(c.amount*c.width).append(rc);
			}
			function setDefaultSelect(){
				if(c.fullStar){
					(c.selected>c.amount) && (c.selected=c.amount);
					rc.animate({width:(Math.floor(c.selected)*arg.rWidth)});
				}else if(c.decimal){
					(c.selected>c.amount) && (c.selected=c.amount);
					rc.animate({width:(c.selected*arg.rWidth*2)});
				}else{
					(c.selected>c.amount*2) && (c.selected=c.amount*2);
					rc.animate({width:(Math.floor(c.selected)*arg.rWidth)});
				}
			}
		};
        $(this).each(function () {
			var _self = this;
            _self.CONFIG  = {
                amount: 5,
                selected: 0,
				width:22,
                selectable: true,
				fullStar:true,
                decimal: false,
                once: false,
                revert: true,
				keepState:false,
				initCallBack:null,
				mouseOutCallBack:null,
                selectedCallBack: null,
                clickCallBack: null
            };
			//rv:1-全星,2-半星;rd:1-小数,2-整数; rWidth:用于记录实际计算时的宽度
			var c=_self.CONFIG,arg={rv:1,rd:1,rWidth:0},ro = null, rc=$('<div class="rate-current"></div>');
            _init = function () {
                $.extend(c, parms);
				//初始化UI
				initUI(arg,c,rc,_self);
				//初始化回调
				c.initCallBack && c.initCallBack(c.selected,_self);
				if(c.selectable){
					//绑定事件
					ro = $(".rate-on",_self);
					$(_self).bind("click",function(){
						var e=getTarget(arguments[0]);
						c.selected = c.amount*arg.rv-ro.index(e.target);
						c.revert && _self.setValue(c.selected);
						//选择回调
						c.clickCallBack && c.clickCallBack(c.selected/arg.rd,_self);
						//只可以投一次票
						if(c.once){$(_self).unbind();ro.remove();rc.show();}
					}).bind("mouseover",function(){
						var e=getTarget(arguments[0]);
						!c.keepState && rc.hide();
						//单击回调
						c.selectedCallBack && c.selectedCallBack((c.amount*arg.rv-ro.index(e.target))/arg.rd,_self);
						!c.revert && _self.setValue(c.amount*arg.rv-ro.index(e.target)/arg.rd);
					}).bind("mouseout",function(){
						var e=getTarget(arguments[0]),related =e.event.relatedTarget ||e.event.toElement ;
						if(ro.index(related)===-1){
							//鼠标移出回调
							c.mouseOutCallBack && c.mouseOutCallBack((c.amount*arg.rv-ro.index(e.target))/arg.rd,_self);
							rc.show();
						}
					});
				}
            };
			_self.setValue=function(v){
				rc.width(v*arg.rWidth);
			};
			_self.getValue=function(v){
				return c.selected/arg.rd;
			};
            _init();
        })
    }
})(jQuery);