<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/adminheader.jsp" />

<style>
#admin_loginfail_body {
  width : 400px;
  height : 120px;

}
#loginButton {
	width: 1268px;
    height: 37.6px;
}
#loginFailDiv {
	width: 400px;
	text-align: center;
	margin: 0px auto 50px;
}
</style>

<div class="container">

<div id="adminpageTitle" class="adminpageTitle">
	<h3 id="adminpageTitle">관리자 로그인</h3>
</div>

<div id="loginFailDiv">
<div id="admin_loginfail_body">
	<h5>접속코드 / 비밀번호 분실 안내</h5>
	<h6>홈페이지 개발자에게 연락하세요</h6>
	<h6>연락처: 010-0000-0000</h6>
	<h6>이메일: abcd@helloKHworld.com</h6>
</div><!-- #admin_loginfail_body -->
</div><!-- #loginFailDiv -->
	
<div id="admin_loginfail_button">
	<a href="/admin/login">
	<button id="loginButton" class="btn btn-outline-success">로그인 페이지로 돌아가기</button>
	</a>
</div><!-- #admin_loginfail_button -->

</div><!-- .container -->

<c:import url="../layout/footer.jsp" />