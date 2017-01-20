<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link type="text/css" href="https://code.jquery.com/ui/1.11.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet" />
	<link type="text/css" href="css/login.css" rel="stylesheet" />
	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<style>
	#dialog {
		
	}
	.title {	
		margin-top: 3px;
		margin-left: 2px;
	    float: left;
	    width: 140px; 
	    margin-bottom: 4px;	    
	} 
	.field {
		margin-left: 145px;
		width: 115px;
		margin-bottom: 4px;	    
	}
	.field input {		
		width: 115px;	    
	}
	.errorMsg {
		height: 40px;
		line-height: 40px;
		color: red;
		visibility: hidden;
	}
	#buttonRegister {
		float: right;
	}
	#buttonCancel {
		float: right;
	}
</style>
<title>WebSite Login</title>
</head>
<body>
	<form id="login_form" method="POST" action="login.do">
		<table>
				<tr>
					<td><span class="short_label">使用者帳號 : </span></td>
					<td>
						<span class="short_text"><input name="userName" type="text"/></span>
					</td>
				</tr>
				<tr>
					<td><span class="short_text">使用者密碼 : </span></td>
					<td>
						<span class="short_text"><input name="password" type="password"/></span>
					</td>
				</tr>
				<tr>
					<td></td>
					<td><span><input id="loginButton" type="submit" value="登入" /></span><span style="padding-left:20px"><input id="createUserButton" type="button" value="建立新帪號" /></span>${errMsg}</td>
				</tr>
			</table>
	</form>
	<div id="dialog" title="新使用者註冊">	
  		<div class="title">帳號：</div><div class="field"><input id="newAccount" type="text"/></div>
  		<div class="title">密碼：</div><div class="field"><input id="newPassword" type="password"/></div>
  		<div class="title">再次輸入密碼：</div><div class="field"><input id="newConfirm" type="password"/></div>
  		<div class="title">姓名：</div><div class="field"><input id="newName" type="text"/></div>
  		<div class="title">生日：</div><div class="field"><input id="newBirthday" type="text"/></div>
  		<div class="title">電話：</div><div class="field"><input id="newPhone" type="password"/></div>
  		<div class="errorMsg">Show a erroe message</div>
  		<div><input id="buttonCancel" type="button" value="取消" /></div>
  		<div><input id="buttonRegister" type="button" value="註冊" /></div>  		
	</div>
	<div id="registerSuccessDialog" title="註冊成功">   
        <p>感謝你註冊本網站！</p>       
    </div>
    <div id="registerFailedDialog" title="註冊失敗">   
        <p>請稍候再試，或聯絡系統管理員。</p>
    </div>
</body>
<script  type="text/javascript">
$(document).ready(function(){
	$("#dialog").dialog({
	    minHeight: 300,
	    draggable: false,
	    resizable: false,
	    autoOpen: false,
	    show: {
	      effect: "blind",
	      duration: 1000
	    },
	    hide: {
	      effect: "blind",
	      duration: 1000
	    }
	});
	
	$("#registerSuccessDialog").dialog({
		minHeight: 200,
        draggable: false,
        resizable: false,
        autoOpen: false
	});
	
	$("#registerFailedDialog").dialog({
        minHeight: 200,
        draggable: false,
        resizable: false,
        autoOpen: false
    });
	
    $("#loginButton").button();
    $("#buttonRegister").button().click(function() {
    	$("#dialog").dialog("close");
    	$("#dialog").dialog({
    	    close: function( event, ui ) {}
    	});
		var sendData = {
			"newAccount": $("#newAccount").val(),
			"newPassword": $("#newPassword").val(),
			"newConfirm": $("#newConfirm").val(),
			"newName": $("#newName").val(),
			"newBirthday": $("#newBirthday").val(),
			"newPhone": $("#newPhone").val()
		};		
		
		$.ajax({
			"type"  : "post",
		    "url"     : "register.do",
		    "data"    : sendData,
		    "success" : function(data) {
		    	$("#dialog").dialog("close");
		        $("#dialog").dialog({
		            close: function() {
		            	if( data == 1 ) {
		                    $("#registerSuccessDialog").dialog("open");
		                }
		                else {
		                    $("#registerFailedDialog").dialog("open");
		                }
		            }
		        });		    	
		    }
		});
		
    });
    $("#buttonCancel").button().click(function() {
    	$("#dialog").dialog("close");
    });
    $("#createUserButton").button().click(function(event) {
    	$("#dialog").dialog("open");
    });        
    
    $("#newBirthday").datepicker({
    	changeMonth: true,
    	changeYear: true,
    	dayNames:["星期日","星期一","星期二","星期三","星期四","星期五","星期六"],
		dayNamesMin:["日","一","二","三","四","五","六"],
		monthNames:["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"],
		monthNamesShort:["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"],
		prevText:"上月",
		nextText:"次月",
		weekHeader:"週",
		showMonthAfterYear:true,
		dateFormat:"yy-mm-dd"
   	});
});
</script>
</html>