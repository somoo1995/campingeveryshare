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
	<h3 id="adminpageTitle">접속 불가</h3>
</div>

<div id="loginFailDiv">
<div id="admin_loginfail_body">
	<h3>접속 불가 안내</h3>
	<h6>여기는 관리자 권한이 필요합니다</h6>
	<h6>사용자 페이지로 이용 부탁드립니다</h6>
</div><!-- #admin_loginfail_body -->
</div><!-- #loginFailDiv -->
	

<div id="admin_loginfail_button">
	<a href="/">
	<button id="loginButton" class="btn btn-outline-primary">메인 페이지로 돌아가기</button>
	</a>
</div><!-- #admin_loginfail_button -->

</div><!-- .container -->
<br><br><br><br><br>
<c:import url="../layout/footer.jsp" />