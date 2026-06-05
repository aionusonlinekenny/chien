<?php
include_once './global/db.class.php';
if (isset($_GET['user']) && isset($_GET['sign'])) {
    $g_user = preg_replace('/[^A-Za-z0-9_]/', '', $_GET['user']);
    $g_sign = preg_replace('/[^A-Za-z0-9]/', '', $_GET['sign']);
    if ($g_user !== '' && $g_sign !== '') {
        $row = $db->safe_query("SELECT `id`,`username`,`token` FROM `account` WHERE `username`=? AND `token`=? LIMIT 1", array($g_user, $g_sign))->fetch(PDO::FETCH_ASSOC);
        if ($row) {
            $_SESSION['playuser'] = $row['username'];
            $_SESSION['token'] = $row['token'];
            $_SESSION['userid'] = $row['id'];
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
<script src="jquery-1.10.1.min.js"></script>
<script src="layer/layer.js"></script>
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
<script src="index.js"></script>
<script>		
    /** 游戏url中附带的参数 **/
    var gameURLParams = {};
    window.urlParam = gameURLParams;
    // Ensure control param is set so payServer resolves correctly
    gameURLParams['control'] = '/server';
    // channelUID must be truthy for reCharge to be called
    gameURLParams['channelUID'] = '1';
    // loginURL from URL params is split on '=' breaking http:// → always use origin
    gameURLParams['loginURL'] = window.location.origin;
    gameURLParams['ip'] = '<?php echo $quarr[10000]["ip"]; ?>';
    gameURLParams['port'] = '<?php echo $quarr[10000]["port"]; ?>';
    gameURLParams['serverId'] = <?php echo $quarr[10000]["quid"]; ?>;
	
    window.showpay = function(url, type){
		var index = layer.open({
			title :'Thanh Toán',
			type: 2,
			maxmin: true,
			shadeClose: false,
			content: url + (type || '')
		});
		layer.full(index);
	};

    // Custom SDK xử lý phản hồi từ charge.php
    window.Sdk = {
        RaStarPay: function(type, info) {
            console.log('[PAY] RaStarPay called type=' + type + ' info=' + JSON.stringify(info));
            if (info && info.payUrl) {
                window.showpay(info.payUrl, '');
            }
        }
    };
    // linlongSDK platform stub — payFunc handled by XHR interceptor below
    window.linlongSDK = {
        loginData: { app_id: '', cch_id: '', access_token: '' },
        payFunc: function(o) { console.log('[PAY] linlongSDK.payFunc:', JSON.stringify(o)); }
    };

    // Intercept XHR: fix payServer URL và xử lý phản hồi
    (function() {
        var _origOpen = XMLHttpRequest.prototype.open;
        var _origSend = XMLHttpRequest.prototype.send;
        XMLHttpRequest.prototype.open = function(method, url) {
            // Rewrite /server/charge (no ext) → /server/charge.php
            if (url && url.indexOf('/server/charge') !== -1 && url.indexOf('.php') === -1) {
                console.log('[PAY] Rewriting URL: ' + url + ' → charge.php');
                url = url.replace('/server/charge', '/server/charge.php');
            }
            this._url = url;
            return _origOpen.apply(this, arguments);
        };
        XMLHttpRequest.prototype.send = function() {
            if (this._url && this._url.indexOf('/server/charge') !== -1) {
                console.log('[PAY] Sending charge request: ' + this._url);
                var xhr = this;
                xhr.addEventListener('load', function() {
                    try {
                        var raw = xhr.response || xhr.responseText;
                        console.log('[PAY] charge.php response: ' + raw);
                        var res = JSON.parse(raw);
                        if (res.code === 0) {
                            layer.msg('✅ ' + (res.msg || 'Nhận Kim Cương thành công!'), {icon: 1, time: 5000});
                        } else if (res.code === 1 && res.payUrl) {
                            window.showpay(res.payUrl, '');
                        } else if (res.code < 0) {
                            layer.msg('❌ ' + (res.msg || 'Có lỗi xảy ra'), {icon: 2, time: 4000});
                        }
                    } catch(e) { console.log('[PAY] parse error: ' + e); }
                }, false);
            }
            return _origSend.apply(this, arguments);
        };
    })();
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