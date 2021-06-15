<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅사이트</title>

<!-- BootStrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

<!-- header.css -->
<link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet">
</head>
<body>

<header>
	<div class="container" id="header-container">
		<div class="row">
			<div class="col" style="background-color: black;">
				<sec:authorize access="isAnonymous()">
					<button type="button" class="btn btn-sm btn-light">로그인</button>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<button type="button" class="btn btn-sm btn-light">로그아웃</button>
				</sec:authorize>
				<button type="button" class="btn btn-sm btn-light" onclick="goJoinForm()">회원가입</button>
			</div>
		</div>
	</div>
</header>

<script>
function goJoinForm(){
	location.href="${pageContext.request.contextPath}/member/memberJoin.do";
}
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/header.js"></script>
<section>