<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

window.onload = function(){
	document.form2.ID.onblur = IDcheck;
};

function IDcheck(){
	var ID = document.form2.ID.value;
	var str = /^(.*[\/"#\$%&'\(\)=~\|\\\^:;\*\+\?<>,'\[\]{}].*|.*[^A-Za-z0-9]@.*|.*[\._]{2}.*|[^@]+|.*@.*@.*|@.*|.*@)$/;
	if(str.test(ID)){
		document.getElementById("wrong").style.display="block";
	}else{
		document.getElementById("wrong").style.display="none";
		
		for(var i=0; i< ID.length; i++){
			if(ID.charAt(i)=="@"){
				break;
			}
			document.form2.user.value += ID.charAt(i);
		}
	}
}

function check(){
	var flag = 0;
	var ID = document.form2.ID.value;
	
	if(ID == ""){
		flag = 1;
	}
	else if(document.form2.password.value == ""){
		flag = 1;
	}
	else if(document.form2.name.value == ""){
		flag = 1;
	}
	else if(document.form2.barth.value == ""){
		flag = 1;
	}
	else if(document.form2.address.value == ""){
		flag = 1;
	}
	
	
	if(flag){
		window.alert('未入力の項目があります');
		return false;
	}
	else{
		var str = /^(.*[\/"#\$%&'\(\)=~\|\\\^:;\*\+\?<>,'\[\]{}].*|.*[^A-Za-z0-9]@.*|.*[\._]{2}.*|[^@]+|.*@.*@.*|@.*|.*@)$/;
		if(str.test(ID)){
			window.alert('不正なメールアドレスです');
			return false;
		}else{
			return true;
		}
	}
}

window.onunload = function(){};
history.forward();
</script>

</head>
<body>

<h2>会員情報入力</h2>

<h4><font color="#ff0000">メールアドレスが重複しています</font></h4>

<form method="POST" action="/1232099_1/AucDB" name="form2" onSubmit="return check()">
<h3>・メールアドレス/パスワード/ユーザ名</h3>
<font color="#777777">&lt;半角英数字で入力してください&gt;</font>
<br>
メールアドレス(30字以内)<input type="text" size="30" maxlength="100" style="ime-mode:disabled" name="ID" /><br>
					<input type="hidden" name="user" />
					<div style="display:none" id="wrong"><font size=2 color="#ff0033">メールアドレスが不正です。正しく入力してください。</font></div>
					<font color="#777777">※メールアドレスの@マークの前までがユーザ名(入札、出品時などに公開される名前)となります。</font><br>
					
パスワード(16字以内)<input type="text" size="16" maxlength="16" style="ime-mode:disabled" onKeyup="this.value=this.value.replace(/[^0-9a-z]+/i,'')" name="password" /><br>
<br><br>
<h3>・お客様の基本情報</h3>
名前<input type="text" size="20" name="name" /><br>
性別<input type="radio" size="3" name="gender" value="0" checked>男
    <input type="radio" size="3" name="gender" value="1">女
    <br>
生年月日<input type="text" size="16" maxlength="8" style="ime-mode:disabled" onKeyup="this.value=this.value.replace(/[^0-9]+/,'')" name="barth"  /><br>
住所(例 1234567 ハイフンなし)<input type="text" maxlength="7" style="ime-mode:disabled" onKeyup="this.value=this.value.replace(/[^0-9]+/,'')" name="address"><br>

<input type="submit" name="command" style="cursor:pointer" value="完了" />
</form>
<a href="#" onClick="history.go(-1)">戻る</a>
</body>
</html>