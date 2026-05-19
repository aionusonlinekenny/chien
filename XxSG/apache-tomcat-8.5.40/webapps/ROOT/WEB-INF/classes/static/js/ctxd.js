$(document).ready(function () {

    var homeUrl = "";

    getToken();

    function setToken(token, userName) {
        sessionStorage.setItem("token", token);
        sessionStorage.setItem("userName", userName);
    }

    function getToken() {
        var token = sessionStorage.getItem("token");
        if(token == null && (window.location.pathname == homeUrl + '/login' || window.location.pathname == homeUrl+ '/register')) {
            return;
        }
        if (token == null && window.location.pathname != homeUrl + '/login') {
            window.location.href = homeUrl + "/login";
        }
        if (token != null && window.location.pathname == homeUrl + '/login') {
            window.location.href = homeUrl + "/index";
        }
        // set header title
        setHeaderTitle();
    }

    function setHeaderTitle() {
        $.ajax({
            url: homeUrl + "/api/user/profile",
            type: "GET",
            dataType: 'json', headers: {
                'Authorization': sessionStorage.getItem("token"),
            },
            contentType: "application/json",
            success: function (response) {
                $(".header-name").html("Xin chào: " + response.data.fullName + " - Hiện còn: " + response.data.point + " VNĐ");
            }
        });
    }

    $("#register").click(function () {
        registerAPI();
    });

    // login function !!!
    function registerAPI() {
        var userName = $("#username").val();
        var password = $("#password").val();
        var email = $("#email").val();
        if(userName == null || password == null || email == null) {
            alert("Các thông tin bắt buộc !!!");
            return;
        }
        if(userName.trim().length < 5) {
            alert("Tài khoản > 6 kí tự !!!");
            return;
        }

        if(password.trim().length < 5) {
            alert("Mật khẩu  > 6 kí tự !!!");
            return;
        }
        var dataReg = {username : userName, password : password, fullName : fullName, email : email};

        $.ajax({
            url: homeUrl + "/api/user/register",
            type: "POST",
            dataType: 'json',
            contentType: "application/json",
            data: JSON.stringify(dataReg) ,
            success: function (response) {
                alert(response.msg);
                // setToken(response.data.token, response.data.userName);
                window.location.href = homeUrl + "/login";
            },
            error: function(jqXHR) {
                alert("Có lỗi xảy ra: "+ jqXHR.responseJSON.msg);
            }
        });
    }

    $("#login").click(function () {
        loginAPI();
    });

    // login function !!!
    function loginAPI() {
        var userName = $("#username").val();
        var password = $("#password").val();
        if(userName == null || password == null) {
            alert("Tài khoản hoặc mật khẩu không được để trống !!!");
            return;
        }
        if(userName.trim().length < 5) {
            alert("Tài khoản > 6 kí tự !!!");
            return;
        }

        if(password.trim().length < 5) {
            alert("Mật khẩu  > 6 kí tự !!!");
            return;
        }
        var dataLogin = {username : userName, password : password};

        $.ajax({
            url: homeUrl + "/api/login",
            type: "POST",
            dataType: 'json',
            contentType: "application/json",
            data: JSON.stringify(dataLogin) ,
            success: function (response) {
                alert(response.msg);
                setToken(response.data.token, response.data.userName);
                window.location.href = homeUrl + "/index";
            },
            error: function(jqXHR) {
                alert("Có lỗi xảy ra: "+ jqXHR.responseJSON.msg);
            }
        });
    }

    $("#buyPackage").click(function () {
        buyPackage();
    });

    function buyPackage() {
        var playerName      = $("#playerName").val();
        var serverId        = $("#serverId").val();
        var packageCharge   = $("#packageCharge").val();
        if(playerName == null || playerName.trim() == "") {
            alert("Vui lòng nhập tên nhân vật!");
            return;
        }
        if(serverId == 0) {
            alert("Chọn server trước!");
            return;
        }
        if (packageCharge == 0) {
            alert("Chọn gói nạp trước!");
            return;
        }
        var dataCharge = {playerName : playerName, packageId : packageCharge, serverId, serverId};
        $.ajax({
            url: homeUrl + "/api/package-charge/buy",
            type: "POST",
            dataType: 'json', headers: {
                'Authorization': sessionStorage.getItem("token"),
            },
            contentType: "application/json",
            data: JSON.stringify(dataCharge) ,
            success: function (response) {
                alert(response.msg);
                window.location.href = homeUrl + "/buy-package";
            },
            error: function(jqXHR) {
                alert("Có lỗi xảy ra: "+ jqXHR.responseJSON.msg);
            }
        });
    }

    // gift code
    $("#getCode").click(function () {
        getCode();
    });

    function getCode() {
        var playerName      = $("#playerName").val();
        var serverId        = $("#serverId").val();
        var giftCode   = $("#giftCode").val();
        if(playerName == null || playerName.trim() == "") {
            alert("Vui lòng nhập tên nhân vật!");
            return;
        }
        if(serverId == 0) {
            alert("Chọn server trước!");
            return;
        }
        if (giftCode == null || giftCode.trim() == "") {
            alert("Nhập Gift code!");
            return;
        }
        var dataCharge = {playerName : playerName, giftCode : giftCode, serverId : serverId};
        $.ajax({
            url: homeUrl+ "/api/gift-code/use",
            type: "POST",
            dataType: 'json', headers: {
                'Authorization': sessionStorage.getItem("token"),
            },
            contentType: "application/json",
            data: JSON.stringify(dataCharge) ,
            success: function (response) {
                alert(response.msg);
                window.location.href = homeUrl + "/gift-code";
            },
            error: function(jqXHR) {
                alert("Có lỗi xảy ra: "+ jqXHR.responseJSON.msg);
            }
        });
    }

    $.ajax({
        url: homeUrl + "/api/gift-code/all",
        type: "GET",
        dataType: 'json',
        contentType: "application/json",
        success: function (response) {
            var html = "";
            $.each(response.data, function (index, value) {
                html += "<tr>\n" +
                    "            <td>" + (index + 1) + "</td>\n" +
                    "            <td>" + value.name + "</td>\n" +
                    "            <td>" + value.description + "</td>\n" +
                    "            <td>" + value.status + "</td>\n" +
                    "        </tr>";
            });
            $("#table-code").html(html);

        }
    });

    $.ajax({
        url: homeUrl + "/api/package-charge/my-history",
        type: "GET",
        dataType: 'json', headers: {
            'Authorization': sessionStorage.getItem("token"),
        },
        contentType: "application/json",
        success: function (response) {
            var html = "";
            $.each(response.data, function (index, value) {
                html += "        <tr>\n" +
                    "            <td>" + (index + 1) + "</td>\n" +
                    "            <td>" + value.playerName + "</td>\n" +
                    "            <td>" + value.serverName + "</td>\n" +
                    "            <td>" + value.packageChargeName + "</td>\n" +
                    "            <td>" + value.price + "</td>\n" +
                    "            <td>" + value.createdOn + "</td>\n" +
                    "        </tr>";
            });
            $("#list-charge").html(html);

        }
    });

    $(document).ready(function () {
        $.ajax({
            url: homeUrl + "/api/wallet/userCharge",
            type: "GET",
            dataType: 'json', headers: {
                'Authorization': sessionStorage.getItem("token"),
            },
            contentType: "application/json",
            success: function (response) {
                $("#total-charge").html(" Đã nạp vào hệ thống: " + response.data.totalCharge + " VNĐ");
                $("#amount").html(" Số dư khả dụng: " + response.data.amount + " VNĐ");
            }
        });
    });

    $.ajax({
        url: homeUrl + "/api/wallet/getAll",
        type: "GET",
        dataType: 'json', headers: {
            'Authorization': sessionStorage.getItem("token"),
        },
        contentType: "application/json",
        success: function (response) {
            var html = "";
            $.each(response.data, function (index, value) {
                html += "<tr>\n" +
                    "            <td>" + (index + 1) + "</td>\n" +
                    "            <td>" + value.createOn + "</td>\n" +
                    "            <td>" + value.typeNetwork + "</td>\n" +
                    "            <td>" + value.cardValue + "</td>\n" +
                    "            <td>" + value.status + "</td>\n" +
                    "        </tr>";
            });
            $("#my-history").html(html);

        }
    });
});