<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<script src="https://code.jquery.com/jquery-latest.min.js"></script>
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
  width: 150px;
}

.button.active {
  background-color: #2ECC71; /* 활성화된 버튼의 배경색 변경 */
}

.rentList {
    height: 500px;
    text-align: center;
    padding: 20px; /* 패딩 추가 */
    margin-top: 20px; /* 상단 여백 추가 */
    display: flex; /* flexbox 레이아웃 사용 */
    flex-direction: column; /* 아이템을 수직으로 정렬 */
    justify-content: center; /* 세로 방향 가운데 정렬 */
}

.rentList span {
    display: block; /* 각 span을 블록 요소로 만듦 */
    margin-bottom: 5px; /* 아래쪽 여백 추가 */
}

.rentList strong {
    font-size: 24px; /* 글자 크기 조정 */
    margin-bottom: 10px; /* 아래쪽 여백 추가sy */
}

.rentList a {
    background-color: #2ECC71; /* 버튼 배경색 */
    color: white; /* 글자색 */
    padding: 10px 20px; /* 상하 10px, 좌우 20px의 패딩 */
    text-decoration: none; /* 텍스트 밑줄 제거 */
    border: none; /* 테두리 없음 */
    border-radius: 4px; /* 버튼 모서리 둥글게 */
    margin-top: 15px; /* 상단 여백 추가 */
    width: 200px; /* 버튼 너비 설정 */
    display: block; /* 블록 요소로 만듦 */
    margin-left: auto; /* 왼쪽 여백 자동 조정 */
    margin-right: auto; /* 오른쪽 여백 자동 조정 */
    transition: background-color 0.3s; /* 호버 효과 부드럽게 */
}
.rentList a:hover {
    background-color: #45a049; /* 버튼 호버시 색상 변경 */
}
</style>


<div class="container">
    <div id="pageTitle">
         <h3 style="color: #2ECC71; font-weight: bold;">내예약</h3>
        <hr>
    </div >
    
    <div class="button-group">
        <!-- param.status가 now, history 또는 설정되지 않았을 때 now로 간주 -->
	    <a href="./list?status=now" class="button ${empty param.status || param.status == 'now' ? 'active' : ''}" id="currentBtn">진행 중</a>
	    <a href="./list?status=history" class="button ${param.status == 'history' ? 'active' : ''}" id="historyBtn">이전 내역</a>
	</div>
	
	<div>
	<c:choose>
	<c:when test="${param.status == 'now' || empty param.status}">
		<div class="rentList">
			<strong>아직 예약된 캠핑카가 없습니다!</strong><br>
			<span>캠핑카를 찾으시나요?</span><br>
			<a  "href="링크URL" class="exploreButton">살펴보기</a>
		</div>
	</c:when>
	<c:when test="${param.status == 'history' }">
		<div class="rentList">
			<h5>이전 진행내역</h5>
		</div>
	</c:when>

</c:choose>
	</div>


    <!-- 예약 목록을 여기에 추가하세요. -->

    <!-- 페이지네이션 -->


</div><!-- .container -->

<c:import url="../layout/footer.jsp" />
