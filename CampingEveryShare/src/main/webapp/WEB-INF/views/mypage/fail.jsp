<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<div class="container">

<!-- <div id="pageTitle"> -->
<!-- <h3>이용 안내</h3> -->
<!-- <hr> -->
<!-- </div> -->

<div class="text-center mt-5">
<h4>로그인이 필요한 서비스입니다</h4>

	<div class="mt-5 mb-5">
	<a href="/user/login" class="btn btn-outline-success">로그인</a>
	|
	<a href="/user/join" class="btn btn-outline-success">회원가입</a>
	</div>
	
</div>

</div><!-- .container -->

<c:import url="../layout/footer.jsp" />