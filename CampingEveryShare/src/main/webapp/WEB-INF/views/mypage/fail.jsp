<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<div class="container">

<div class="pageTitle">
<h3 id="pageTitle">이용 안내</h3>
<hr>
</div>

<h3 style="color: red;">로그인 후 이용이 가능합니다</h2>

<!-- <div class="text-center"> -->
	<a href="/member/login" class="btn btn-info">로그인</a>
	|
	<a href="/member/join" class="btn btn-primary">회원가입</a>
<!-- </div> -->

</div><!-- .container -->

<c:import url="../layout/footer.jsp" />