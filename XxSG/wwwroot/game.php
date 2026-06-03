<?php
include_once './global/db.class.php';
if (isset($_GET['user']) && isset($_GET['sign'])) {
    $g_user = preg_replace('/[^A-Za-z0-9_]/', '', $_GET['user']);
    $g_sign = preg_replace('/[^A-Za-z0-9]/', '', $_GET['sign']);
    if ($g_user !== '' && $g_sign !== '') {
        $row = $db->safe_query("SELECT `username`,`token` FROM `account` WHERE `username`=? AND `token`=? LIMIT 1", array($g_user, $g_sign))->fetch(PDO::FETCH_ASSOC);
        if ($row) {
            $_SESSION['playuser'] = $row['username'];
            $_SESSION['token'] = $row['token'];
        }
    }
}
?>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <title><?php echo WEBNAME;?></title>
    <!-- 搜狗强制全屏 -->
    <meta name="viewport" content="width=device-width,initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no,minimal-ui"
    />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="mobile-web-app-capable" content="yes">
    <!-- UC强制全屏 -->
    <meta name="full-screen" content="true" />
    <meta name="browsermode" content="application">
    <meta name="screen-orientation" content="portrait" />
    <!-- QQ强制全屏 -->
    <meta name="x5-orientation" content="portrait" />
    <meta name="x5-fullscreen" content="true" />
    <meta name="x5-page-mode" content="app">
    <!-- 360强制全屏 -->
    <meta name="360-fullscreen" content="true" />
    <link rel="stylesheet" type="text/css" href="index.css" />
<script src="layer/layer.js"></script>
	<style>
		#openWebBButton {
			position: fixed;
			top: 20px;
			left: 20px;
			padding: 10px;
			background-color: #f00;
			color: #fff;
			border: none;
			border-radius: 5px;
			cursor: pointer;
		}
	</style>
	<script>
		function openWebB() {
			window.open("http://127.0.0.1:82/", "_blank", "width=600,height=800");
		}
	</script>
</head>

<body>
    <div class="loading g1" id='loadingUi' style='overflow: true; margin: auto;width: 100%;height: 100%;position:absolute;z-index:2;background-color: white;'>
<div class="pic1"></div>
<div id="prossDiv" style="display: block;width: 100%;height: 100%;position:absolute;top:-30%;">
<div class="loading-progress">
    <div class="loading-progress-bar">
        <div class="loading-progress-finish" id='loadingBar'></div>
    </div>
</div>

<div class="t1" style="position:absolute;bottom:8%;">
<p class="006eff">Bước vào <?php echo WEBNAME;?> thế giới trò chơi……</p>
</div>
<div class="loading-into-info">
    <div class="loading-into-info-list">
    </div>
</div>
</div>
</div>
<div id="mainDiv" style="margin: auto;width: 100%;height: 100%;background-color: black;" class="egret-player" data-entry-class="Main" data-orientation="auto" data-scale-mode="showAll" data-frame-rate="60" data-content-width="672"
data-content-height="1120" data-show-paint-rect="false" data-multi-fingered="2" data-show-fps="false" data-show-log="false"
data-show-fps-style="x:0,y:0,size:12,textColor:0xffffff,bgAlpha:0.9">
</div>
<button id="openWebBButton" onclick="openWebB()">Tool GM</button>
<script src="index.js"></script>
<script>		
    /** 游戏url中附带的参数 **/
    var gameURLParams = {};
    window.urlParam = gameURLParams;
	
    window.showpay = function(url, type){
		var index = layer.open({
			title :'支付页面',
			type: 2, 
			maxmin: true,
			content: url+type
		});		 
		layer.full(index);
	};
    var main;
    //解析url中的参数
    var url = location.search; //获取url中"?"符后的字串
    console.info("参数url:" + url);
    //创建mvc框架的根容器对象
    if (url.indexOf("?") != -1) {
        //平台那边过来的需要使用decodeURIComponent。
        url = decodeURIComponent(url);
        console.info("重新解码:", url);
        var str = url.substr(1);
        var strs = str.split("&");
        for (var i = 0; i < strs.length; i++) {
            var params = strs[i].split("=");
            if (params[0] == 'userId' || params[0] == 'time' || params[0] == 'white' || params[0] == 'serverId') {
                gameURLParams[params[0]] = parseInt(params[1]);
            } else {
                gameURLParams[params[0]] = params[1];
            }

        }

        console.info("gameUID:" + gameURLParams["gameUID"]);
        console.info("channelUID:" + gameURLParams["channelUID"]);

    }
    if (!gameURLParams["loginURL"]) {
        gameURLParams["loginURL"] = window.location.origin;
    }

    var loadScript = function (list, callback) {
        var loaded = 0;
        var loadNext = function () {
            loadSingleScript(list[loaded], function () {
                loaded++;
                if (loaded >= list.length) {
                    callback();
                } else {
                    loadNext();
                }
            })
        };
        loadNext();
    };

    var loadSingleScript = function (src, callback) {
        var s = document.createElement('script');
        s.async = false;
        s.src = src;
        s.addEventListener('load', function () {
            s.parentNode.removeChild(s);
            s.removeEventListener('load', arguments.callee, false);
            if (callback)
                callback();
        }, false);
        document.body.appendChild(s);
    };

    var xhr = new XMLHttpRequest();
    xhr.open('GET', './manifest.json?v=' + Math.random(), true);
    xhr.addEventListener("load", function () {
        var manifest = JSON.parse(xhr.response);
        var list = manifest.initial.concat(manifest.game);
        loadScript(list, function () {
            console.log("Tất cả các tập tin được tải");
            egret.runEgret({
                renderMode: "webgl",
                audioType: 2,
                calculateCanvasScaleFactor: function (context) {
                    console.log("egret.Capabilities.isMobile：" + egret.Capabilities.isMobile);
                    if (!egret.Capabilities.isMobile) {
                        return 2;
                    }
                    var backingStore = context.backingStorePixelRatio ||
                        context.webkitBackingStorePixelRatio ||
                        context.mozBackingStorePixelRatio ||
                        context.msBackingStorePixelRatio ||
                        context.oBackingStorePixelRatio ||
                        context.backingStorePixelRatio || 1;
                    return (window.devicePixelRatio || 1) / backingStore;
                }
            });
            main = egret.lifecycle.stage.getChildAt(0);
            main.loginFromBackPlatorm();
            hideLoading()
        });
    });
    xhr.send(null);
</script>
</body>

</html>