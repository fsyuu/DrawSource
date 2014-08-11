<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4><font color="#ff0000">メールアドレスかパスワードが間違っています</font></h4>
<br>

<form method="POST" action="/1232099_1/AucDB">
<font color="#777777">&lt;半角英数字で入力してください&gt;</font><br>
メールアドレス(30字以内)<input type="text" size="30" maxlength="30" style="ime-mode:disabled" name="ID" /><br>
パスワード(16字以内)<input type="password" size="16" maxlength="16" style="ime-mode:disabled" name="password" /><br>
<input type="submit" name="command" value="次へ" />
</form>
<br>

<a href="/1232099_1/11/welAuc.jsp">戻る</a>
</body>
</html>