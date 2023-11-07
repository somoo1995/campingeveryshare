<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<div class="container">

<div id="pageTitle">
<h1>마이 메뉴</h1>
<hr>
</div>

<aside id="all_mymenu" role="navigation" style="left: 0px;" >

<div class="scroll_wrap">

<article class="profile">

<a href="/member/main">뒤로</a>

<div>
<a href="/member/login">로그인</a>
<a href="/member/join">회원가입</a>
</div>

<div>
<a>내캠핑</a>
<a href="/mypage/message">메시지</a>
<a>찜</a>
<a href="/mypage/alert">알림</a>
</div>

<div>
<a>공지사항</a>
<a>고객문의</a>
</div>


</article> <!-- .profile end -->

</div> <!-- .scroll_wrap end -->

</aside> <!-- #all_mymenu end -->

</div><!-- .container -->

<c:import url="../layout/footer.jsp" />