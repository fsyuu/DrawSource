<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

登録ありがとうございます。
<c:forEach items="${rlist}" var="A">
<c:out value="${A.user}" />
さん
<br>
<hr>

下記URLからログインをお願い致します。<br>
<a href="11/welAuc.jsp" >ログインページへ</a>


</c:forEach>

</form>
</body>
</html>