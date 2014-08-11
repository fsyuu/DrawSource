<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
window.onunload = function(){};
history.forward();
</script>

</head>
<body>
<form name="form1" method="post" action="/1232099_1/AucDB">

ようこそ
<c:forEach items="${rlist}" var="A">
<c:out value="${A.user}" />
<input type="hidden" name="ID" value=<c:out value="${A.ID}" />>
さん
<a href="?command=mypage&ID=<c:out value="${A.ID}" />" >マイページ</a>
<br>
<hr>

完了しました。
<br>

<a href="?command=top&ID=<c:out value="${A.ID}" />" onClick="document.form1.submit();" >トップへ</a>


</c:forEach>

</form>
</body>
</html>