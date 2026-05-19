<?php
include_once './global/db.class.php';
if($_POST){
	
switch ($_REQUEST['type']) {
	case 'login':
	$username = SafeRequest("username", "post");
    $password = SafeRequest("passwd", "post");
	$pwd=md5($password);
	 if (!isset($username) || !isset($password) || $username == '' || $password == '') {
     exit("<script>alert('System: Account password cannot be empty');history.go(-1)</script>");
        }
        $preg = '/^[A-Za-z0-9_\x{4e00}-\x{9fa5}]+$/u';
        $preg2 = "/^(select|SHOW FULL COLUMNS FROM|SHOW TABLES FROM|SHOW CREATE TABLE|drop|update|DROP|Select|UPDATE|AND|and|update)/i";
        $string = $username . $password;
        if (!preg_match($preg, $string) || preg_match($preg2, $string)) {
			exit("<script>alert('System: Account or password can only be numbers and English letters');history.go(-1)</script>");
        }
        if (strlen($username) < 6 || strlen($username) > 16 || strlen($password) < 6 || strlen($password) > 16) {
			exit("<script>alert('System: Account or password length must be between 6-16 characters');history.go(-1)</script>");
        }
		$sql="select * from `account` where `username`='$username' and `password`='$pwd'";
		$row=$db->num_rows($db->query($sql));
		$rows=$db->getrow($sql);
		if($rows['username']==$username && $rows['password']==$pwd){//
			$lasttime = getMillisecond();
			$userip = getip();
			$db->query("update `account` set `ming`='$password',`lastlogintime`='$lasttime',`lastloginip`='$userip' where `username`='$username' and  `password`='$pwd'");
			$gg = time();
			$check = md5($username . $password);
			$_SESSION['playuser'] = $username;
            $_SESSION['playpasswd'] = $password;
            $_SESSION['checkplayer'] = $check;
            $_SESSION['ggplayer'] = $gg;
			$token=$rows['token'];
			$_SESSION['token'] =$token;
			exit("<script>alert('System: Login successful!');window.location.href='./game.php?user=".$username."&sign=".$token."&check=1&loginURL=http://127.0.0.1:81'</script>");
		}else{
			exit("<script>alert('System: Account or password error');window.location.href='./index.php'</script>");
		}	
	break;
	case 'reg':
	$username = SafeRequest("username", "post");
    $password = SafeRequest("passwd", "post");
	if (!isset($username) || !isset($password) || $username == '' || $password == '') {
		exit("<script>alert('System: Account password cannot be empty');history.go(-1)</script>");
        }
        $preg = '/^[A-Za-z0-9_\x{4e00}-\x{9fa5}]+$/u';
        $preg2 = "/^(select|SHOW FULL COLUMNS FROM|SHOW TABLES FROM|SHOW CREATE TABLE|drop|update|DROP|Select|UPDATE|AND|and|update)/i";
        $string = $username . $password;
        if (!preg_match($preg, $string) || preg_match($preg2, $string)) {
			exit("<script>alert('System: Account or password can only be numbers and English letters');history.go(-1)</script>");
        }
        if (strlen($username) < 6 || strlen($username) > 16 || strlen($password) < 6 || strlen($password) > 16) {
			exit("<script>alert('System: Account or password length must be between 6-16 characters');history.go(-1)</script>");
        }
		$md5=md5($password);
		$userip = getip();
		$regtime=date('Y-m-d h:i:s',time());
		$sql="select * from `account` where `username`='$username'";
		$row=$db->getrow($sql);
		if($row['username']<>''){
			exit("<script>alert('System: Username already registered!');window.location.href='./index.php'</script>");
		}else{
		$token=md5("qq86284186".$md5);
		$db->query("insert into `account` (`username`,`password`,`ming`,`reg_time`,`lastlogintime`,`lastloginip`,`token`) values('$username','$md5','$password','$regtime','$regtime','$userip','$token')");
		}
		    $gg = time();
			$check = md5($username . $password);
			$_SESSION['playuser'] = $username;
            $_SESSION['playpasswd'] = $password;
            $_SESSION['checkplayer'] = $check;
            $_SESSION['ggplayer'] = $gg;
			$_SESSION['token'] =$token;
		exit("<script>alert('System: Registration successful!');window.location.href='./game.php?user=".$username."&sign=".$token."&check=1&loginURL=http://127.0.0.1:81'</script>");
	break;
	default:
        $return = array('errcode' => 1, 'info' => 'Unknown error');
        exit(json_encode($return,320));
    break;
}	
}
?>
<!doctype html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta content="width=device-width, initial-scale=1,maximum-scale=1.0,user-scalable=no" name="viewport"/>
        <meta content="yes" name="apple-mobile-web-app-capable" />
		<meta name="mobile-web-app-capable" content="yes">
		<meta name="full-screen" content="true" />
		    <meta name="360-fullscreen" content="true" />
        <meta content="black" name="apple-mobile-web-app-status-bar-style" />
        <meta content="telephone=no" name="format-detection" />
        <meta http-equiv="Cache-Control" content="max-age=3600" />		
        <link rel="stylesheet" type="text/css" href="login/css/sdk.css">
        <title><?php echo WEBNAME;?></title>
        <script type="text/javascript" src="login/js/jquery.js"></script>
        

        <script type="text/javascript">
        try{
            //document.domain = 'h5game.com';
        }catch(e){

        }
        </script>
        <script type="text/javascript">
        /**
         * type = 1 login
         * type = 2 register
         */

            // var gameRegisterOnlyMoble = 'echo $gameRegisterOnlyMoble ';

            var mvIsMobile = false;
            $(document).ready(function () {
                if ($(".tishi span").text() == "")
                    $(".tishi").hide();
                else
                    $(".tishi").show();
                /**
                 * login
                 */
                $("#btnlogin").click(function () {
                    $("#type").val("login");
                    checkLoginForm();
                });
                /**
                 * Register and login
                 */
                $("#btnreg").click(function () {
                    $("#type").val("reg");
                    if(GetQueryString("packageid")){
                        GetQueryString("packageid")
                        $('#frmLogin').append('<input type="hidden" name="packageid" value="'+ GetQueryString("packageid") +'" />')
                    }
                    checkRegForm();
                });
                /**
                 * One-click registration 
                 */
                $("#btnonekey").click(function () {
					$(this).hide();
                	$("#replace_shiwan").show();
                    $("#type").val("3");
                    if(GetQueryString("packageid")){
                        GetQueryString("packageid")
                        $('#frmLogin').append('<input type="hidden" name="packageid" value="'+ GetQueryString("packageid") +'" />')
                    }
                    document.getElementById('frmLogin').submit();
                });
                // $("#username").blur(function () {
                //     checkRegMobile();
                // });
                /**
                 * Go to registration page
                 */
                $("#btnreg1").click(function () {
                    $("#type").val("2");
                    $("#forget_pwd").hide()
                    $("#username").attr("placeholder", "Please enter username/mobile number");
                    $('#ismobileregister2').show()
                    $("#p_login").hide();
					if ( $(".p_login_2").length > 0 ) {
                    	$(".p_login_2").hide();
                    }
                    $("#p_reg").show();
                    $('#yzm').val('');
                    // $("#validcode,#ismobileregister2").show();
                    $("#validcode").show();
                });
                /**
                 * Back to login page
                 */
                $("#btnback").click(function () {
                    mvIsMobile = false;
                    $("#username").attr("placeholder", "Please enter username/mobile number");
                    $("#p_login").show();
					if ( $(".p_login_2").length > 0 ) {
                    	$(".p_login_2").show();
                    }
                    $("#p_reg").hide();
                    // $("#validcode,#ismobileregister2").hide();
                    $("#validcode").hide();
                    $("#sfzcard_wrap").hide();
                    $(".tishi").hide();
                });

                $("#send_yzm").click(function () {
                    //$(this).css("background", "#b3b3b3");
                    //$(this).html("Retry after 56 seconds");
                });

                //sticky form
                var lvTMP = '';
                if (lvTMP == "reg")
                {
                    $("#btnreg1").trigger('click');
                }


                //Invite users hide one-click trial button
                var pt = new RegExp("suid");
                if( pt.test(document.referrer) ){
                    $("#btnonekey").hide();
                    $("#btnreg1,#btnlogin").css('width', "49%");
                }//

            });
            /*
            *Get url parameter
            * 
             */
            
            function GetQueryString(name){
                 var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
                 var r = window.location.search.substr(1).match(reg);
                 if(r!=null)return  unescape(r[2]); return null;
            }
             /**
             * FIXME: Code repetition
             * Forgot password get verification code
             */
            var forgetcanSendYzm = true;
            function forgetGetCode()
            {
                if(!forgetcanSendYzm)
                {
                    return ;
                }
                var mobile = $("#forget_username").val();
                var forget_tpyzm = $("#forget_tpyzm").val();
                if (!checkmobile())
                {
                    $("#forget_div .tishi").show();
                    $("#forget_div .tishi span").text("Please enter correct mobile number!");
                    return;
                }
                // if (!forget_tpyzm)
                // {
                //     $("#forget_div .tishi").show();
                //     $("#forget_div .tishi span").text("Please enter image verification code!");
                //     return;
                // }

                forgetyzmInterval = setInterval("forgetyzmClock('#forget_send_yzm')", 1000);
                $('#forget_send_yzm').text('Resend(180)').css('background','gray');

                $.post("/user/mobilecode2", {"mobile": mobile,"flag":2,"mobile_code":forget_tpyzm}, function (data) {
                    data = JSON.parse(data);
                    $("#forget_div .tishi").show();
                    $("#forget_div .tishi span").text(data.msg);
                });
            }
            //Verification code countdown
            var forgetyzmWait = 180;
            function forgetyzmClock(id){
              forgetyzmWait--;
              if(forgetyzmWait <= 0 ){
                forgetcanSendYzm = true;
                forgetyzmWait = 180;
                window.clearInterval(forgetyzmInterval);
                $(id).html('Resend').css('background', '#00b1fd');
              }else{
                forgetcanSendYzm = false;
                $(id).text('Resend('+forgetyzmWait+')');
              }
            }

            
            var canSendYzm = true;
            function getCode()
            {
                if(!canSendYzm){
                    return ;
                }
                var mobile = $("#username").val();
                var tpyzm = $("#tpyzm").val();
                if (!checkmobile())
                {
                    $(".tishi").show();
                    $(".tishi span").text("Please enter correct mobile number!");
                    return;
                }
                 if (!tpyzm)
                 {
                     $(".tishi").show();
                     $(".tishi span").text("Please enter image verification code!");
                     return;
                 }

                $.post("/user/mobilecode234", {"mobile": mobile,'mobile_code':tpyzm}, function (data) {
                    data = JSON.parse(data);
                    $(".tishi").show();
                    $(".tishi span").text(data.msg);

                    if(data.code == '0')
                    {
                        yzmInterval = setInterval("yzmClock('#send_yzm')", 1000);
                        $('#send_yzm').text('Resend(180)').css('background','gray');
                    }

                });
            }

            //Verification code countdown
            var yzmWait = 180;
            function yzmClock(id){
              yzmWait--;
              if(yzmWait <= 0 ){
                canSendYzm = true;
                yzmWait = 180;
                window.clearInterval(yzmInterval);
                $(id).html('Resend').css('background', '#00b1fd');
              }else{
                canSendYzm = false;
                $(id).text('Resend('+yzmWait+')');
              }
            }

            function checkmobile()
            { //debugger;
                var mobile = $.trim($("#username").val());
                var my = false;
                var partten = /^1[3-9]\d{9}$/;
                if (partten.test(mobile))
                    my = true;
                if (mobile.length != 11)
                    my = false;
                if (!my) {
                    return false;
                }
                return true;
            }

            function checkisInt()
            {
                var mobile = $.trim($("#username").val());
                var my = false;
                var partten = /^\d{11}$/;
                if (partten.test(mobile))
                    my = true;
                if (mobile.length != 11)
                    my = false;
                if (!my) {
                    return false;
                }
                return true;
            }

            function funcChina(str) {
                if (/.*[\u4e00-\u9fa5]+.*$/.test(str))
                {
                    //alert("Cannot contain Chinese characters!");
                    return false;
                }
                return true;
            }

            /**
             * Determine numbers and letters
             */
            function checkUserName(str) {
                if (/^[A-Za-z0-9]+$/.test(str))
                {
                    //alert("Cannot contain Chinese characters!");
                    return false;
                }
                return true;
            }

            /**
             * Comment
             */
            function checkRegMobile() {
                mvIsMobile = false;
                var lvType = $("#type").val();
                if (lvType == "2") {

                    mvIsMobile = checkmobile();

                    //patch in 20160415
                    // if(gameRegisterOnlyMoble == 'yes' && !mvIsMobile){
                    //     $(".tishi").show();
                    //     $(".tishi span").text("Please enter mobile number!");
                    //     return false;
                    // }else{
                    //     $(".tishi").hide();
                    //     $(".tishi span").text("");
                    // }//

                    if (mvIsMobile) {
                        $("#validcode").show();
                        // $("#ismobileregister2").show();
                        $("#yzm").focus();
                    }
                    else if (checkisInt())
                    {
                        $(".tishi").show();
                        $(".tishi span").text("Please enter mobile number or 11-digit pure number!");
                    }
                    else
                    {
                        $(".tishi span").text("");
                        $(".tishi").hide();
                        $("#validcode").hide();
                        // $("#ismobileregister2").hide();
                    }
                }
            }
            function checkRegForm(){
                $(".tishi").hide();
                var lvUsername = $("#username").val();
                var lvPWD = $("#passwd").val();

                if (lvUsername == "") {
                    $(".tishi").show();
                    $(".tishi span").text("Please enter username!");
					return;
                }
                else if (lvUsername.length < 2)
                {
                    $(".tishi").show();
                    $(".tishi span").text("Username must be at least 6 characters long!");
					return;
                }
                else if (!funcChina(lvUsername))
                {
                    $(".tishi").show();
                    $(".tishi span").text("Username cannot contain Chinese characters!");
					return;
                }
                else if (checkUserName(lvUsername))
                {
                    $(".tishi").show();
                    $(".tishi span").text("Username can only be letters and numbers!");
					return;
                }
                else if (lvPWD == "" || lvPWD == "enter password") {
                    $(".tishi").show();
                    $(".tishi span").text("enter password!");
					return;
                }
                else if (lvPWD.length < 2)
                {
                    $(".tishi").show();
                    $(".tishi span").text("Password length must not be less than 6 characters!");
					return;
                }
				
				/*
                if(!checkmobile()){
                    $(".tishi").show();
                    $(".tishi span").text("Please enter mobile number!");
                    return false;
                }

                if(!lvPWD){
                    $(".tishi").show();
                    $(".tishi span").text("Please enter password!");
                    return false;
                }
				*/

                $("#frmLogin").submit();
            }

            function checkLoginForm() {
                $(".tishi").hide();
                var lvUsername = $("#username").val();
                var lvPWD = $("#passwd").val();

		        SetCookie('cookie_username', lvUsername);
		        SetCookie('cookie_password', lvPWD);

                if (lvUsername == "") {
                    $(".tishi").show();
                    $(".tishi span").text("Please enter username!");
                }
                else if (lvUsername.length < 2)
                {
                    $(".tishi").show();
                    $(".tishi span").text("Username must be at least 6 characters long!");
                }
                else if (!funcChina(lvUsername))
                {
                    $(".tishi").show();
                    $(".tishi span").text("Username cannot contain Chinese characters!");
                }
                else if (checkUserName(lvUsername))
                {
                    $(".tishi").show();
                    $(".tishi span").text("Username can only be letters and numbers!");
                }
                else if (lvPWD == "" || lvPWD == "enter password") {
                    $(".tishi").show();
                    $(".tishi span").text("enter password!");
                }
                else if (lvPWD.length < 2)
                {
                    $(".tishi").show();
                    $(".tishi span").text("Password length must not be less than 6 characters!");
                }
                else
                {
                    document.getElementById('frmLogin').submit();
                }
            }

        </script>
		
				
    </head>

    <body>
        <form id="frmLogin" method="post" action="">
            <img src="login/img/loginbg.jpg" style="width:100%; z-index:1; height:100%;">
            <input type="text" id="type" name="type" hidden>
            <div class="content_box">
                <p class="con_tit">Login</p>				
                <ul>
                    <li>
                        <span class="user"></span>
                        <p><input type="text" id="username" name="username" class="input_1" value="" placeholder="Please enter username"></p>
                    </li>

                    <li> 
                        <span class="password"></span>
                        <p><input type="password" id="passwd" name="passwd" class="input_1"  value="" placeholder="Please enter 6-15 letters or numbers"></p>
                                            </li>
                </ul>
                <p class="tishi"><span></span></p>
                <p class="button" id="p_login">
                    <a href="javascript:void(0);" class="SW" id="btnonekey" style="display:none;">One-click Trial</a>
					<!-- Cannot click One-click Trial -->
					<a href="javascript:;" class="SW" id="replace_shiwan" style="display:none;">One-click Trial</a>
					
					<!--<a href="http://localhost"  class="SW" style="float: left">Enter Code</a>-->
						<a href="javascript:;"  id="btnlogin" class="LG" >Login</a>
						<a href="javascript:;"  id="btnreg1" class="RG"style="float: right">Register</a>

				

					
                </p>
	
				

				<p class="button" id="p_reg" style="display: none;">
                    <a href="#" class="SW"  id="btnback" style="display: inline-block;">Login Again</a>
                                        <a href="#" class="LG" style="visibility:hidden;">Placeholder</a>
                                        <a href="#" class="LG" id="btnreg"  >Register</a>
                </p>

            </div>
        </form>


    </body>

<script type="text/javascript">

function otherRLChange(val){
	if(val==1){
		$('#wxplatform_quick_login').hide();
		$('#wxplatform_register_login').show();
	}else if(val==2){
		$('#wxplatform_quick_login').show();
		$('#wxplatform_register_login').hide();
	}
}

//Forgot password
function forgetPwd(){
    $(".content_box").hide();
    $("#forget_div").show();
    var forget_username = $(".content_box #username").val();
    if(forget_username){
        $("#forget_username").val(forget_username);
       // $("#forget_send_yzm").trigger('click');
    }
}
//Forgot password return
function forgetBack(){
    $(".content_box").show();
    $("#forget_div").hide();
}
//Forgot password finish
function forgetFinish(){
    var username = $("#forget_username").val();
    var password = $("#forget_passwd").val();
    var yzm      = $("#forget_yzm").val();
    var tpyzm      = $("#forget_tpyzm").val();

    if(!username){
        $("#forget_div .tishi").show();
        $("#forget_div .tishi span").text('Please enter mobile number');
        return false;
    }

    // if(!tpyzm){
    //     $("#forget_div .tishi").show();
    //     $("#forget_div .tishi span").text('Please enter image verification code');
    //     return false;
    // }

    if(!yzm){
        $("#forget_div .tishi").show();
        $("#forget_div .tishi span").text('Please enter confirmation code');
        return false;
    }

    if(!password){
         $("#forget_div .tishi").show();
        $("#forget_div .tishi span").text('Password must not be less than 6 characters');
        return false;
    }

    var url = "/user/findpwd";
    var data = {'username':username,'password':password,"mobile_yzm":yzm};
    $.post(url,data, function(rs){
        $("#forget_div .tishi").show();
        $("#forget_div .tishi span").text(rs.msg);
        if(rs.code === 1){
            //login
            $("#username").val(username);
            $("#passwd").val(password);
            checkLoginForm();
        }
    }, 'json');
}


function SetCookie(name, value) {
        var key = '';
        var Days = 30;
        var exp = new Date();
        var domain = "";
        exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
        if (key == null || key == "") {
            document.cookie = name + "=" + encodeURI(value) + ";expires=" + exp.toGMTString() + ";path=/;domain=" + domain + ";";
        }
        else {
            var nameValue = GetCookie(name);
            if (nameValue == "") {
                document.cookie = name + "=" + key + "=" + encodeURI(value) + ";expires=" + exp.toGMTString() + ";path=/;domain=" + domain + ";";
            }
            else {
                var keyValue = getCookie(name, key);
                if (keyValue != "") {
                    nameValue = nameValue.replace(key + "=" + keyValue, key + "=" + encodeURI(value));
                    document.cookie = name + "=" + nameValue + ";expires=" + exp.toGMTString() + ";path=/;domain=" + domain + ";";
                }
                else {
                    document.cookie = name + "=" + nameValue + "&" + key + "=" + encodeURI(value) + ";expires=" + exp.toGMTString() + ";path=/;" + domain + ";";
                }
            }
        }
    }

    function GetCookie(name) {
        var nameValue = "";
        var key = "";
        var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
        if (arr = document.cookie.match(reg)) {
            nameValue = decodeURI(arr[2]);
        }
        if (key != null && key != "") {
            reg = new RegExp("(^| |&)" + key + "=([^(;|&|=)]*)(&|$)");
            if (arr = nameValue.match(reg)) {
                return decodeURI(arr[2]);
            }
            else return "";
        }
        else {
            return nameValue;
        }
    }

    var cookie_username = GetCookie('cookie_username');
    var cookie_password = GetCookie('cookie_password');
    if(cookie_username != ''){
        $("#username").val(cookie_username);
    }
    if(cookie_password != ''){
        $("#passwd").val(cookie_password);
    }


</script>

<style>

/*第三方登录*/
.p_login_2{
	position: relative;line-height: 20px;height: 20px;text-align: center;font-size: 12px;color: #999;margin-bottom: 5px;
}
.p_login_em{
	position: absolute;top: 10px;left: 0;height: 1px;background: #ccc;width: 100%;z-index: -1;
}

.p_login_em_left{
	position: absolute;top: 10px;left: 0;height: 1px;background: #ccc;width: 40%;z-index: -1;
}

.p_login_em_right{
	position: absolute;top: 10px;right: 0;height: 1px;background: #ccc;width: 40%;z-index: -1;
}

.p_login_span{
	background:none;font-size: 13px;padding: 0 3px;display: inline-block;
}
.di_bd_css{
	border-bottom:0;background:none;height: 50px;
}
.third_login_img{
	width: 45px;
}
.link_third_css{
	padding: 0px 10px;
	text-decoration: none;
}
</style>

</html>