<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--
	<%
		int total = 0;
		for(int i=0;i<=100;i++){
			total += i;
		}
	%>
	<%= total %>
 --%>
 	<!-- begin은 시작값 end는 끝값(포함됨>=) step은 증가량, var은 태그에 쓸 변수명 -->
 	<c:forEach begin="1" end="100" step="1" var="number">
 		<c:set var="total" value="${total+number}"/>
 	</c:forEach>
 	<c:out value="${total }"/>
 	<hr/>
 	<!-- 구구단 -->
 	<c:forEach begin="1" end="9" step="1" var="dan">
 		<c:forEach begin="1" end="9" step="1" var="sum">
 			<c:set var="value" value="${sum * dan}"/>
 			<c:out value="구구단 ${dan }단의 값 ${dan } * ${sum} = ${value}"></c:out><br/>
 		</c:forEach>
 		<hr/>
 	</c:forEach>
</body>
</html>