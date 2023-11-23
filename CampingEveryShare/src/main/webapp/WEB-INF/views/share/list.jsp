<%@page import="java.util.Date"%>
<%@ page import="java.sql.Timestamp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />


<style type="text/css">

.row {
    text-align: center;
}

.write-container {
    height: 440px;
    width: 380px;
    margin: 1em auto; 
    text-align: center; 
    border-radius: 15px;
    overflow: hidden;
    border: 1px solid #D3D3D3;
    border-right: 1px solid #D3D3D3;
}

.write-container:hover {
    border-color: #82EB5A;
}

.col-md-4 {
    margin-right: 30px;
}

.preview {
	margin: 15px auto 15px auto;
	width: 350px;
	height: 300px;
	display: flex;
	object-fit: cover;
	justify-content: center;
	align-items: center;
	background-size: cover; 
	background-repeat: no-repeat;
	background-position: center center;
}

.no {
   margin-top: 10px;
}

.title {
    margin-top: 10px;
    color: black;
    font-weight: bold;
    font-size: 25px;
    text-align: left;
    overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}
.view {
	font-size: 15px;
}
.write{
	font-size: 15px;
}

.info {
    display: flex; /* Flexbox를 사용하여 내부 요소를 가로로 나열 */
    justify-content: space-between; /* 요소 간에 공간을 균등하게 배치 */
    align-items: center; /* 수직 가운데 정렬 */
   	margin: 15px auto 15px auto;
    
}

.info h6 {
    margin: 0; /* 기본 마진 제거 */
}

.select {
    display: flex; /* Flexbox를 사용하여 내부 요소를 가로로 나열 */
    justify-content: right;
    align-items: center; /* 수직 가운데 정렬 */
   	margin: 15px auto 15px auto;
    
}

label{
	margin : 5px;
}

select {
	width: 100px;
	text-align: center;
}
</style>


<div class="container">


<!-- 작성 공간 -->
<div class="pageTitle">
<h3 id=pageTitle>캠핑존 공유 게시판</h3>
<hr>
<div class="select">
<label><input type="radio" id="paid" name="paid" value="1" checked="checked">전체</label>
<label><input type="radio" id="paid" name="paid" value="2">무료</label>
<label><input type="radio" id="paid" name="paid" value="3">유료</label>
<select name="locCate" id="locCate">
     <option>지역</option>
     <option value="10">강원</option>
     <option value="9">경기</option>
     <option value="16">경남</option>
     <option value="15">경북</option>
     <option value="5">광주</option>
     <option value="6">대구</option>
     <option value="3">대전</option>
     <option value="4">부산</option>
     <option value="1">서울</option>
     <option value="8">세종</option>
     <option value="7">울산</option>
     <option value="2">인천</option>
     <option value="14">전남</option>
     <option value="13">전북</option>
     <option value="17">제주</option>
     <option value="12">충남</option>
     <option value="11">충북</option>
 </select>
</div>
<hr>
<div style="text-align: right; margin-bottom: 10px;">
<a href="/share/write?boardCate=2"><button>글쓰기</button></a>
</div>

<div class="board">

<c:forEach items="${list}" var="board" varStatus="loop">
  <c:if test="${loop.index % 3 == 0}">
    <div class="row">
  </c:if>
     
  <div class="write-container">
	
	<div style="margin-bottom : 10px;">
	</div>
	<div class="info">
    <h6>👤 : ${board.USER_NICK } </h6>
    <h6>❣️ : ${board.HEART }  </h6>
    <h6>
    <c:choose>
	    <c:when test="${board.PAID eq 2}">
	        <h6 style="color: #78E150 ; font-weight: bold;">🪙 : 무료</h6>
	    </c:when>
	    <c:when test="${board.PAID eq 3}">
	        <h6 style="color: #FF8E99 ; font-weight: bold;">🪙 : 유료</h6>
	    </c:when>
	</c:choose>
    </h6>
	</div>
    <c:if test="${not empty board.THUMBNAIL_NAME}">
      <div>
        <a href="/share/view?boardNo=${board.BOARD_NO}&boardCate=${board.BOARD_CATE}">
          <img class="preview" src="/upload/${board.THUMBNAIL_NAME}"/>
        </a>
      </div>
    </c:if>
    <c:if test="${empty board.THUMBNAIL_NAME}">
      <div>
        <a href="/share/view?boardNo=${board.BOARD_NO}&boardCate=${board.BOARD_CATE}">
          <img class="preview" src="/resources/img/noimg.png"/>
        </a>
      </div>
    </c:if>
    <div style="width: 354px;">
    <a href="/share/view?boardNo=${board.BOARD_NO}&boardCate=${board.BOARD_CATE}">
      <h6 class="title">🏕️ ${board.TITLE }</h6>
    </a>

    </div>
    <div class="info">
    <h6 class="location">🗺️  ${board.LOCATION_NAME }</h6>
    <h6 class="good">🎖️  ${board.RECOM }</h6>
    <h6 class="view">🔭  ${board.HIT}</h6>
    <h6 class="write">✏️
      <fmt:formatDate value="<%=new Date() %>" pattern="yyyyMMdd" var="current"/>
      <fmt:formatDate value="${board.POST_DATE }" pattern="yyyyMMdd" var="write"/>
      <c:choose>
         <c:when test="${write lt current }">
            <fmt:formatDate value="${board.POST_DATE }" pattern="yyyy-MM-dd"/>
         </c:when>
         <c:when test="${write eq current }">
            <fmt:formatDate value="${board.POST_DATE }" pattern="HH:mm"/>
         </c:when>
      </c:choose>      
    </h6>
    </div>
  </div><!-- .write-container -->
    
  <c:if test="${loop.index % 3 == 2 || loop.index + 1 == yourList.size()}">
    </div> <!-- .class="row" -->
  </c:if>
</c:forEach>
</div>





</div><!-- .container -->
<c:import url="../layout/pagination.jsp" />
<c:import url="../layout/footer.jsp" />