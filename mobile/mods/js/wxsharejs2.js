var appid = 'wx701465a6addf2e8f';
wx.config({
    debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
    appId: appid, // 必填，公众号的唯一标识
    timestamp: '1426003726', // 必填，生成签名的时间戳
    nonceStr: 'LK45ynw57ncbw', // 必填，生成签名的随机串
    signature: signature,// 必填，签名，见附录1
    jsApiList: ['checkJsApi',
		  'onMenuShareTimeline',
		  'onMenuShareAppMessage',
		  'onMenuShareQQ',
		  'onMenuShareWeibo',
		  'hideMenuItems',
		  'showMenuItems',
		  'hideAllNonBaseMenuItem',
		  'showAllNonBaseMenuItem',
		  'translateVoice',
		  'startRecord',
		  'stopRecord',
		  'onRecordEnd',
		  'playVoice',
		  'pauseVoice',
		  'stopVoice',
		  'uploadVoice',
		  'downloadVoice',
		  'chooseImage',
		  'previewImage',
		  'uploadImage',
		  'downloadImage',
		  'getNetworkType',
		  'openLocation',
		  'getLocation',
		  'hideOptionMenu',
		  'showOptionMenu',
		  'closeWindow',
		  'scanQRCode',
		  'chooseWXPay',
		  'openProductSpecificView',
		  'addCard',
		  'chooseCard',
		  'openCard'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
});


        function shareFriend() {
            WeixinJSBridge.invoke('sendAppMessage',{
                "appid": appid,
                "img_url": imgUrl,
                "img_width": "200",
                "img_height": "200",
                "link": lineLink,
                "desc": descContent,
                "title": shareTitle
            }, function(res) {
                //_report('send_msg', res.err_msg);
            })
        }
        function shareTimeline() {
            WeixinJSBridge.invoke('shareTimeline',{
                "img_url": imgUrl,
                "img_width": "200",
                "img_height": "200",
                "link": lineLink,
                "desc": descContent,
                "title": shareTitle
            }, function(res) {
                   //_report('timeline', res.err_msg);
            });
        }
        function shareWeibo() {
            WeixinJSBridge.invoke('shareWeibo',{
                "content": descContent,
                "url": lineLink,
            }, function(res) {
                //_report('weibo', res.err_msg);
            });
        }
        // 当微信内置浏览器完成内部初始化后会触发WeixinJSBridgeReady事件。
        document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
            // 发送给好友
            WeixinJSBridge.on('menu:share:appmessage', function(argv){
                shareFriend();
            });
            // 分享到朋友圈
            WeixinJSBridge.on('menu:share:timeline', function(argv){
                shareTimeline();
            });
            // 分享到微博
            WeixinJSBridge.on('menu:share:weibo', function(argv){
                shareWeibo();
            });
        }, false);

function IsWeiXinBrowser() {
	return window.navigator.userAgent.indexOf('MicroMessenger')>=0;
}
function IsAndroid() {
	return window.navigator.userAgent.indexOf('Android')>=0;
}