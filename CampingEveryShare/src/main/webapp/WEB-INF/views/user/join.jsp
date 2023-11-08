<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<script type="text/javascript">
$(function() {
	$("#userId").focus();

	
})
</script>

<div class="container">
<div class="row g-3 align-items-center">
<form action="./join" method="post">

	
	<div class="row g-3 align-items-center">
	  <div class="col-2">
	    <label for="userId" class="col-form-label"></label>
	  </div>
	  <div class="inputPassword6">
	    <input type="text" id="inputPassword6" name="userId" class="form-control" placeholder="아이디*" >
	  </div>
	</div>
	
	<div class="row g-3 align-items-center">
	  <div class="col-auto">
	    <label for="userPw" class="col-form-label"></label>
	  </div>
	  <div class="inputPassword6">
	    <input type="password" id="inputPassword6" name="userPw" class="form-control" aria-describedby="passwordHelpInline" placeholder="비밀번호*">
	    <input type="password" id="inputPassword6" name="userPw" class="form-control" aria-describedby="passwordHelpInline" placeholder="비밀번호 확인*">
	  </div>
	</div>
	
	<div class="row g-3 align-items-center">
	  <div class="col-2">
	    <label for="email" class="col-form-label"></label>
	  </div>
	  <div class="inputPassword6">
	    <input type="text" id="inputPassword6" name="userId" class="form-control" placeholder="이메일* (비밀번호 분실시 확인용 이메일)">
	  </div>
	</div>
	
	<div class="row g-3 align-items-center">
	  <div class="col-2">
	    <label for="email" class="col-form-label"></label>
	  </div>
	  <div class="inputPassword6">
	    <input type="text" id="inputPassword6" name="userId" class="form-control" placeholder="이름*">
	  </div>
	</div>
	
	
	<div class="row g-3 align-items-center">
	  <div class="col-2">
	    <label for="email" class="col-form-label"></label>
	  </div>
	  <div class="inputPassword6">
	    <input type="text" id="inputPassword6" name="userId" class="form-control" placeholder="닉네임*">
	  </div>
	</div>
	
	--중복체크여부--
	<div id="passwordHelpBlock" class="form-text">
		동일하게 작성해주세요
	</div>
	--중복체크여부--
	
	<div class="row g-3 align-items-center">
	  <div class="col-2">
	    <label for="email" class="col-form-label"></label>
	  </div>
	  <div class="inputPassword6">
	    <input type="text" id="inputPassword6" name="userId" class="form-control" placeholder="생년월일 8자리">
	  </div>
	</div>
	
	
	
	<div class="row g-3 align-items-center">
	  <div class="col-2">
	    <label for="email" class="col-form-label"></label>
	  </div>
	  <div class="inputPassword6">
	    <input type="text" id="inputPassword6" name="userId" class="form-control" placeholder="주소">
	  </div>
	</div>
	
	
	
	<div class="row g-3 align-items-center">
	  <div class="col-2">
	    <label for="email" class="col-form-label"></label>
	  </div>
	  <div class="inputPassword6">
	    <input type="text" id="inputPassword6" name="userId" class="form-control" placeholder="상세주소">
	  </div>
	</div>
	
	
	
	<div class="row g-3 align-items-center">
	  <div class="col-2">
	    <label for="email" class="col-form-label"></label>
	  </div>
	  <div class="inputPassword6">
	    <input type="text" id="inputPassword6" name="userId" class="form-control" placeholder="연락처">
	  </div>
	</div>


	<div class="row mb-3 justify-content-center">
		<button class="btn btn-outline-success">캠핑 시작하기</button>
	</div>	



</form>
</div>

</div><!--  container -->
<c:import url="../layout/footer.jsp" />