<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />
<script src="https://code.jquery.com/jquery-latest.min.js"></script>


<style>
.container{
	width: 1300px;
}
.msgmain {
  display: flex; /* 자식 요소들을 나란히 배치하도록 설정 */
  border: 1px solid;
  width: 1300px;
  min-height: 800px; /* 내용에 따라 늘어나도록 최소 높이 설정 */		 	
}
.msglist {
  display: flex; /* flex 컨테이너 설정 */
  flex-direction: column; /* 자식 요소들을 세로로 정렬 */
  justify-content: space-between; /* 시작점과 끝점 사이의 여백을 균등하게 분배 */
  border: 1px solid;
  width: 400px; /* 필요에 따라 너비 조절 */
  flex-shrink: 0; /* div가 줄어들지 않도록 설정 */
}
.msgcontent {
  display: flex; /* flex 컨테이너 설정 */
  flex-direction: column; /* 자식 요소들을 세로로 정렬 */
  justify-content: space-between; /* 시작점과 끝점 사이의 여백을 균등하게 분배 */
  border: 1px solid;
  width: 600px;
  min-height: 800px; /* msgcontent의 높이를 설정하고, 필요에 따라 조정 */
  flex-shrink: 0;
}
.msgprofile{
border: 1px solid;
flex-grow: 1; /* 남은 공간을 모두 차지하도록 설정 */


}
.container{
	width: 1300px;
	margin-left: -10px;
	margin-right: 0px;
}

.msginput {
  width: 100%; /* msgcontent의 너비에 맞춤 */
  border: 1px solid;
  margin-top: auto; /* 나머지 요소들 위에 자동으로 여백을 줘서 아래쪽에 위치하게 함 */
  height: 150px;
}
.msgSendContent, .msgRecevierContent {
  background-color: #f1f1f1; /* 메시지 배경색 */
  margin: 10px 0; /* 메시지 간 간격 */
  padding: 10px; /* 내부 여백 */
  border-radius: 10px; /* 둥근 모서리 */
  max-width: 80%; /* 최대 너비 */
}
.msgSendContent {
  align-self: flex-end; /* 오른쪽 정렬 */
  background-color: #dcf8c6; /* 보내는 사람 메시지 색상 */
}
.msgRecevierContent {
  align-self: flex-start; /* 왼쪽 정렬 */
}
.msginput {
  /* 기존 스타일 유지 */
  margin-top: auto; /* 입력 필드를 아래쪽에 위치 */
}
.msgFilter {
  display: flex;
  justify-content: space-between;
  padding: 10px;
  border-bottom: 1px solid #ccc; /* 하단 테두리 추가 */
}
</style>
<!-- 작성 공간 -->
<div class="container">

<div class="pageTitle">
<h3 id="pageTitle">메세지</h3>
<hr style="width: 1300px;">
</div>
<div class="msgmain">
<div class="msglist">
  <div class="msgFilter">
    <!-- 필터 메뉴 -->
    <select name="filter" style="float: left; padding: 10px; margin-right: 10px;">
      <option value="rent">대여</option>
      <option value="recruit">모집</option>
      <option value="market">중고장터</option>
    </select>
    
    <!-- 검색창 -->
    <input type="text" placeholder="검색" style="float: right; padding: 10px; margin-left: 10px; border-radius: 5px; border: 1px solid #ccc;">
  </div>
  <!-- 나머지 msglist 내용 -->
</div>
<div class="msgcontent">
 <div class="msgRecevierContent">
    <span>받는사람 테스트 메시지</span>
  </div>

  <!-- 보내는 사람 메시지 -->
  <div class="msgSendContent">
    <span>보내는사람테스트메시지</span>
  </div>
<div class="msginput">
  <form method="post"> <!-- 나중에 action 속성 추가 예정 -->
    <input type="text" placeholder="메세지를 입력해주세요" name="message" style="width: 80%; padding: 10px; margin-right: 10px; border-radius: 5px; border: 1px solid #ccc;
    height: 140px;">
    <button type="submit" style="padding: 10px 20px; border-radius: 5px; border: none; background-color: #4CAF50; color: white;">보내기</button>
  </form>
</div>
</div>
<div class="msgprofile">
</div>
</div>


</div><!-- .container -->

<c:import url="../layout/footer.jsp" />