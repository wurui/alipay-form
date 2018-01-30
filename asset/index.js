define(['oxjs'],function(OXJS){
  return {
    init:function($mod){
    	var env=OXJS.getENV();
    	if(env=='local' || env=='demo'){
    		return
    	}
    	
    	 if(/QQ/.test(navigator.userAgent)){

            var isIOS=/iphone|ipad|ios/i.test(navigator.userAgent)
            
            $('.J_tip',$mod).html('请点击上方菜单选择用'+(isIOS?'Safari':'浏览器')+'打开完成付款<big style="display:inline-block;transform:rotate(-90deg)">&#8627;</big>&#160;&#160;&#160;&#160;').show();
            $('.J_bottomtip',$mod).html('付款完成后请回到本页面<br/>')
        }else{
            document.forms.payform && document.forms.payform.submit();
        }

    }
  }
})
