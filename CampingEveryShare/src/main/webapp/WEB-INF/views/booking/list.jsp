<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>내 예약</title>
    <!-- 여기에 CSS 스타일시트 링크를 추가하세요 -->
</head>
<body>

<c:import url="../layout/header.jsp" />
<style>
.button-group {
  display: flex; /* 버튼을 한 줄로 나란히 배열 */
}

.button {
  background-color: gray; /* 버튼 배경색 */
  color: white; /* 글자색 */
  text-align: center; /* 글자 가운데 정렬 */
  padding: 10px 20px; /* 상하 10px, 좌우 20px의 패딩 */
  text-decoration: none; /* 텍스트 밑줄 제거 */
  border: none; /* 테두리 없음 */
  cursor: pointer; /* 마우스 오버 시 커서 변경 */
}

.button.active {
  background-color: darkgreen; /* 활성화된 버튼의 배경색 변경 */
}
</style>
<div class="container">
    <div id="pageTitle">
         <h3 style="color: green; font-weight: bold;">내예약</h3>
        <hr>
    </div >
    <div class="button-group">
	  <a href="link-for-current.html" class="button active">진행 중</a>
	  <a href="link-for-previous.html" class="button">이전 내역</a>
	</div>


    <!-- 예약 목록을 여기에 추가하세요. -->

    <!-- 페이지네이션 -->


</div><!-- .container -->

<c:import url="../layout/footer.jsp" />

</body>
</html>