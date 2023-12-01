<%@page import="java.util.Date"%>
<%@ page import="java.sql.Timestamp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<link rel="stylesheet" href="../resources/css/group.css?after">

<style>
.btn_write {
    background-color: forestgreen;
    color: white;
    border: none;
    cursor: pointer;
    font-weight: bold;
    font-size: 20px;
    border-radius: 10px;
    padding: 5px;
}

.btn_write:hover {
    background-color: #1d731d;
    color: white;
}

.btn_write:active {
    background-color: #1d731d; 
    color: white;
}

</style>

<div class="container">

<!-- 작성 공간 -->
<div class="pageTitle">
<h3 id=pageTitle>중고장터 게시판</h3>
<hr>
<div class="select">
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
<a href="/market/write?boardCate=3"><button class="btn_write">글쓰기</button></a>
</div>

<c:forEach items="${list}" var="board" varStatus="loop">
  <c:if test="${loop.index % 3 == 0}">
    <div class="row">
  </c:if>
     
  <div class="write-container">
	
	<div style="margin-bottom : 10px;">
	</div>
	<div class="info">
    <h6>${board.USER_NICK }</h6>
	<h6>${board.price }</h6>
	</div><!-- .info -->
	
    <c:if test="${not empty board.THUMBNAIL_NAME}">
      <div>
        <a href="/market/view?boardNo=${board.BOARD_NO}&boardCate=${board.BOARD_CATE}">
          <img class="preview" src="/upload/${board.THUMBNAIL_NAME}"/>
        </a>
      </div>
    </c:if>
    <c:if test="${empty board.THUMBNAIL_NAME}">
      <div>
        <a href="/market/view?boardNo=${board.BOARD_NO}&boardCate=${board.BOARD_CATE}">
          <img class="preview" src="/resources/img/noimg.png"/>
        </a>
      </div>
    </c:if>
    <div style="width: 354px;">
    <a href="/market/view?boardNo=${board.BOARD_NO}&boardCate=${board.BOARD_CATE}">
      <h6 class="title">제목 : ${board.TITLE }</h6>
    </a>

    </div>
    <div class="info">
    <h6 class="location">🗺️  ${board.LOCATION_NAME }</h6>
    <h6 class="good">❣️  ${board.RECOM }</h6>
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






</div><!-- .container -->
<c:import url="../layout/pagination.jsp" />
<c:import url="../layout/footer.jsp" />