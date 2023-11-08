<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<script>
$(function() {
	$("#userId").focus();

	
})
</script>

<div class="container">
<h1>게스트 로그인</h1>
<hr>

<div class="row g-3 align-items-center">
<form action="./login" method="post">

	
	<div class="row g-3 align-items-center">
	  <div class="col-auto">
	    <label for="userId" class="col-form-label"></label>
	  </div>
	  <div class="inputPassword6">
	    <input type="text" id="inputPassword6" name="userId" class="form-control" placeholder="아이디를 입력해주세요.">
	  </div>
	</div>
	<div class="row g-3 align-items-center">
	  <div class="col-auto">
	    <label for="userPw" class="col-form-label"></label>
	  </div>
	  <div class="inputPassword6">
	    <input type="password" id="inputPassword6" name="userPw" class="form-control" aria-describedby="passwordHelpInline" placeholder="비밀번호를 입력해주세요.">
	  </div>
	</div>
	
	

	<div>
		<a href="./idfind" type="button" class="btn btn-outline-success">아이디 찾기</a>
		<a href="./pwfind" type="button" class="btn btn-outline-success">비밀번호 찾기</a>		
	</div>
	
	<div class="row mb-3 justify-content-center">
		<button class="btn btn-outline-success">로그인</button>
	</div>	
	
	<div class="row mb-3 justify-content-center">
		<a>Camping Every Share와 함께 하시겠어요? <a href="./join" type="button" class=" col-3 btn btn-outline-success">회원가입</a></a>
	</div>	
	<div class="row mb-3 justify-content-center">
		<hr align="left">
		<a>또는</a>
		<hr align="right">
	</div>	
</form>
	

	<div>
		<a class="p-2" href="https://kauth.kakao.com/oauth/authorize?client_id=a75bad9d6cd43e60fa8e31d70d2b8625&redirect_uri=http://localhost:8088/user/login&response_type=code">
		<img src="/resources/img/kakao_login_medium_narrow.png" style="height:60px">
		</a>
	</div>
	
		
</div>

</div><!-- .container -->

<c:import url="../layout/footer.jsp" />