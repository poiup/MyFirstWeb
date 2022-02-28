<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- c태그라이브러리 쓸수있도록 지시자(디렉티브)를 작성해주세요 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- jstl_form2.jsp를 만들어 목적지를 여기로 해주시고
실제로 보낸 데이터가 여기서 출력되도록 만들어주세요. -->
<c:choose>
	<c:when test="${param.lang eq '자바'}">
		<c:out value="당신은 자바로 웹개발을 합니다."/>
	</c:when>
	
	<c:when test="${param.lang eq '파이썬'} ">
		<c:out value="당신은 파이썬로 웹개발을 합니다."/>
	</c:when>
	
	<c:otherwise>
		<c:out value="당신은 php로 웹개발을 합니다."/>
	</c:otherwise>
</c:choose>

</body>
</html>