<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%-- taglib prefix="sec" uri="http://www.springframework.org/security/tags" --%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- bootstrap js: jquery load 이후에 작성할것.-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<!-- bootstrap css -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

<!-- 사용자작성 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" />

<script>
$(() => { <%-- onload 함수--%>
	$("#loginModal")
		.modal()
		.on('hide.bs.modal', e => { // 'hide.bs.modal' 모달이 비활성화될때 발생하는 이벤트
			location.href = '${empty header.referer || fn:contains(header.referer, '/member/memberLogin.do') ? pageContext.request.contextPath : header.referer}';
			//모달을 비활성화하면 이전의 페이지로 돌아간다.
		});
});
</script>
</head>
<body>
	<!-- Modal시작 -->
	<!-- https://getbootstrap.com/docs/4.1/components/modal/#live-demo -->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
		aria-labelledby="loginModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="loginModalLabel">로그인</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<!--로그인폼 -->
				<!-- https://getbootstrap.com/docs/4.1/components/forms/#overview -->
				<!-- Spring-security는 모든 POST요청에 대해 csrf공격대비 token을 발행, 인증해야 한다. -->
				<!-- CSRF : Cross-Site Request Forgery : 사용자가 공격자의 의도대로 CRUD를 실행하게 만듬.-->
				<form:form
					action="${pageContext.request.contextPath}/member/memberLogin.do"
					method="post">
					<div class="modal-body">
					<%--아이디나 비밀번호를 틀렸을때 url 마지막에 ?error 라는 파라미터가 붙는다. --%>
						<c:if test="${param.error != null}"> 
							<span class="text-danger">아이디 혹은 비밀번호가 틀렸습니다.</span>
						</c:if>
						<input type="text" class="form-control" name="uid"
							placeholder="아이디" required> <br /> <input
							type="password" class="form-control" name="upwd"
							placeholder="비밀번호" required>
					</div>
					<div class="modal-footer justify-content-between">
						<div>
							<button type="submit" class="btn btn-outline-success">로그인</button>
							<button type="button" class="btn btn-outline-success" data-dismiss="modal">취소</button>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	<!-- Modal 끝-->
</body>
</html>
