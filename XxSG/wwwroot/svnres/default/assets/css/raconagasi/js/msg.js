var checknum = '';
var uid = '';
var qu = $('#qu').val();
$('#checknum').change(function() {
    checknum = $(this).val();
});
  $('#uid').change(function(){
	  uid=$.trim($(this).val());
  });
  $('#qu').change(function(){
	  qu=$.trim($(this).val());
  });
function notice() {
	if (checknum == '') {
        layer.msg('Vui lòng nhập mã kiểm tra GM');
        return false;
    }
	  var noticemsg=$('#noticemsg').val();
	  if(noticemsg==''){
		  layer.msg('Vui lòng nhập thông báo');
		  return false;
	  }
	$.ajaxSetup({
		contentType: "application/x-www-form-urlencoded; charset=utf-8"
	});
	$.post("user/gmquery.php", {
		type:'notice',uid:"null",qu:qu,checknum:checknum,noticemsg:noticemsg	
	},
	function(data) {
		
		layer.msg(data);
		
	});
}
function ban() {
	if (checknum == '') {
        layer.msg('Vui lòng nhập mã kiểm tra GM');
        return false;
    }
	if(uid==''){
		  layer.msg('ID nhân vật không thể trống');
		  return false;
	  }
	$.ajaxSetup({
		contentType: "application/x-www-form-urlencoded; charset=utf-8"
	});
	$.post("user/gmquery.php", {
		type:'ban',uid:uid,qu:qu,checknum:checknum	
	},
	function(data) {
		
		layer.msg(data);
		
	});
}
function unban() {
	if (checknum == '') {
        layer.msg('Vui lòng nhập mã kiểm tra GM');
        return false;
    }
	if(uid==''){
		  layer.msg('ID nhân vật không thể trống');
		  return false;
	  }
	$.ajaxSetup({
		contentType: "application/x-www-form-urlencoded; charset=utf-8"
	});
	$.post("user/gmquery.php", {
		type:'unban',uid:uid,qu:qu,checknum:checknum	
	},
	function(data) {
		
		layer.msg(data);
		
	});
}
function chargebtn() {
	if (checknum == '') {
        layer.msg('Vui lòng nhập mã kiểm tra GM');
        return false;
    }
	  if(uid==''){
		  layer.msg('Tên nhân vật không thể trống');
		  return false;
	  } 
	  var chargenum=$('#chargenum').val();
	  if(chargenum=='' || chargenum<=0){
		  layer.msg('Vui lòng nhập số tiền nạp');
		  return false;
	  }
	  var chargetype=$('#chargetype').val();
	  if(chargetype==''){
		  layer.msg('Vui lòng chọn loại hành động');
		  return false;
	  }
	$.ajaxSetup({
		contentType: "application/x-www-form-urlencoded; charset=utf-8"
	});
	$.post("user/gmquery.php", {
		type:'charge',uid:uid,qu:qu,checknum:checknum,chargenum:chargenum,chargetype:chargetype		
	},
	function(data) {
		
		layer.msg(data);
		
	});
}
function send_mail() {
	if (checknum == '') {
        layer.msg('Vui lòng nhập mã kiểm tra GM');
        return false;
    }
	  if(uid==''){
		  layer.msg('Tên nhân vật không thể trống');
		  return false;
	  }
	  var mailid=$('#mailid').val();
	  if(mailid==''){
		  layer.msg('Vui lòng chọn vật phẩm');
		  return false;
	  }
	  var title=$('#title').val();
	  if(title==''){
		  title='Thư GM';
	  }
	  var content=$('#content').val();
	  if(content==''){
		  content='Người chơi thân mến, xin vui lòng kiểm tra thư của bạn!';
	  }
	  var mailnum=$('#mailnum').val();
	  if(mailnum=='' || isNaN(mailnum)){
		  layer.msg('Số lượng không thể trống');
		  return false;
	  }
	  if(mailnum<1 || mailnum>999999999){
		  layer.msg('Phạm vi số lượng đạo cụ: 1-999999999');
		  return false;
	  }
	$.ajaxSetup({
		contentType: "application/x-www-form-urlencoded; charset=utf-8"
	});
	$.post("user/gmquery.php", {
		type:'mail',uid:uid,item:mailid,num:mailnum,qu:qu,checknum:checknum,title:title,content:content	
	},
	function(data) {
		layer.msg(data);
		
	});	
}
function send_allmail() {
	{
	   layer.confirm('<font color="red"><h2>警告！</h2><br/>请确认是否要执行全服邮件操作！该功能响应缓慢，请耐心等待。</font>',
 {
  btn: ['是的','算了'] //按钮
}, function(){
	if (checknum == '') {
        layer.msg('Vui lòng nhập mã kiểm tra GM');
        return false;
    }
	   var title=$('#title').val();
	  if(title==''){
		  title='Thư GM';
	  }
	  var content=$('#content').val();
	  if(content==''){
		  content='Người chơi thân mến, xin vui lòng kiểm tra thư của bạn!';
	  }
	  var mailid=$('#mailid').val();
	  if(mailid==''){
		  layer.msg('Vui lòng chọn vật phẩm');
		  return false;
	  }
	  var mailnum=$('#mailnum').val();
	  if(mailnum=='' || isNaN(mailnum)){
		  layer.msg('Số lượng không thể trống');
		  return false;
	  }
	  if(mailnum<1 || mailnum>999999999){
		  layer.msg('Phạm vi số lượng đạo cụ: 1-999999999');
		  return false;
	  }
	$.ajaxSetup({
		contentType: "application/x-www-form-urlencoded; charset=utf-8"
	});
	$.post("user/gmquery.php", {
		type:'allmail',item:mailid,num:mailnum,qu:qu,checknum:checknum,uid:"86284186",title:title,content:content		
	},
	function(data) {
		layer.msg(data);
		
	});
}, function(){
  layer.msg('Chàng trai nghĩ cho hay rồi quay lại');
});
}}

function shouquanbtn() {
	if (checknum == '') {
        layer.msg('Vui lòng nhập mã kiểm tra GM');
        return false;
    }
	  if(uid==''){
		  layer.msg('Tên nhân vật không thể trống');
		  return false;
	  }
	  var pwd = $('#pwd').val();
	  if(pwd==''){
		  layer.msg('Mật khẩu được ủy quyền trong nền người chơi không thể trống');
		  return false;
	  }	 
	$.ajaxSetup({
		contentType: "application/x-www-form-urlencoded; charset=utf-8"
	});
	$.post("user/gmquery.php", {
		type:'addczvip',uid:uid,pwd:pwd,qu:qu,checknum:checknum		
	},
	function(data) {
		
		layer.msg(data);
		
	});
}
function shouquanbtn1() {
	if (checknum == '') {
        layer.msg('Vui lòng nhập mã kiểm tra GM');
        return false;
    }
	  if(uid==''){
		  layer.msg('Tên nhân vật không thể trống');
		  return false;
	  }
	  var pwd = $('#pwd').val();
	  if(pwd==''){
		  layer.msg('Mật khẩu được ủy quyền trong nền người chơi không thể trống');
		  return false;
	  }	 
	$.ajaxSetup({
		contentType: "application/x-www-form-urlencoded; charset=utf-8"
	});
	$.post("user/gmquery.php", {
		type:'addvip',uid:uid,pwd:pwd,qu:qu,checknum:checknum		
	},
	function(data) {
		
		layer.msg(data);
		
	});
}
function unshouquan() {
	if (checknum == '') {
        layer.msg('Vui lòng nhập mã kiểm tra GM');
        return false;
    }
	  if(uid==''){
		  layer.msg('Tên nhân vật không thể trống');
		  return false;
	  }
	$.ajaxSetup({
		contentType: "application/x-www-form-urlencoded; charset=utf-8"
	});
	$.post("user/gmquery.php", {
		type:'quxiaovip',uid:uid,qu:qu,checknum:checknum		
	},
	function(data) {
		
		layer.msg(data);
		
	});
}
function editpwdbtn() {
	if (checknum == '') {
        layer.msg('Vui lòng nhập mã kiểm tra GM');
        return false;
    }
	  if(uid==''){
		  layer.msg('Tên nhân vật không thể trống');
		  return false;
	  }
	  var pwd = $('#pwd').val();
	  if(pwd==''){
		  layer.msg('Mật khẩu được ủy quyền trong nền người chơi không thể trống');
		  return false;
	  }	
	$.ajaxSetup({
		contentType: "application/x-www-form-urlencoded; charset=utf-8"
	});
	$.post("user/gmquery.php", {
		type:'editpwd',uid:uid,qu:qu,checknum:checknum,pwd:pwd,		
	},
	function(data) {
		
		layer.msg(data);
		
	});
}