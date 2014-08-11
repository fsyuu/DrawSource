<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
window.onload = function(){
	document.form1.ID.onblur = IDcheck;
};

function IDcheck(){
	var ID = document.form1.ID.value;
	var str = /^(.*[\/"#\$%&'\(\)=~\|\\\^:;\*\+\?<>,'\[\]{}].*|.*[^A-Za-z0-9]@.*|.*[\._]{2}.*|[^@]+|.*@.*@.*|@.*|.*@)$/;
	if(str.test(ID)){
		document.getElementById("wrong").style.display="block";
	}else{
		document.getElementById("wrong").style.display="none";
	}
}

function check(){
	var flag = 0;
	var ID =document.form1.ID.value
	
	if(ID == ""){
		flag = 1;
	}
	else if(document.form1.password.value == ""){
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
</script>
</head>
<body>
<h3><img src="icon/auc.jpg" width="300" height="150"  alt="オークション">へようこそ!!</h3>
<br>
<form method="POST" action="/1232099_1/AucDB" name="form1" onSubmit="return check()">
<font size="4">会員ログイン</font><font color="#777777">&lt;半角英数字で入力してください&gt;</font><br>
メールアドレス(30字以内)<input type="text" size="30" maxlength="30" style="ime-mode:disabled" name="ID" />
<div style="display:none" id="wrong"><font size=2 color="#ff0033">メールアドレスが不正です。正しく入力してください。</font></div>
<br>
パスワード(16字以内)<input type="password" size="16" maxlength="16" style="ime-mode:disabled" onKeyup="this.value=this.value.replace(/[^0-9a-z]+/i,'')" name="password" /><br>
<input type="hidden" name="command" value="次へ">
<input type="image" src="icon/next.png" style="cursor:pointer">


</form>
<br>

<font size="4">新規登録の方</font><br>
<input type="image" src="icon/next.png" value="次へ" style="cursor:pointer" onClick="location.href='/1232099_1/11/dbAuc.jsp'" />

<br><br>


<a href="/1232099_1/index.html">戻る</a>
</body>
</html>