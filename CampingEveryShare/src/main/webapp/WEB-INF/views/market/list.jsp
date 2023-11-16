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
    height: 530px;
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
}
</style>


<div class="container">


<!-- 작성 공간 -->
<div class="pageTitle">
<h3 id=pageTitle>캠핑존 공유 게시판</h3>
<c:forEach items="${list}" var="board" varStatus="loop">
  <c:if test="${loop.index % 3 == 0}">
    <div class="row">
  </c:if>
     
  <div class="write-container">
    <h6 class="no">번호 : ${board.BOARD_NO}</h6>
    <h6>작성자 : ${board.USER_NICK }</h6>
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
    <a href="/market/view?boardNo=${board.BOARD_NO}&boardCate=${board.BOARD_CATE}">
      <h6 class="title">제목 : ${board.TITLE }</h6>
    </a>
    <h6>조회수 : ${board.HIT}</h6>
    <h6>작성일 :
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
    <h6>추천수 :  ${board.RECOM }</h6>
    <h6>지역  ${board.LOCATION_NAME }</h6>
  </div><!-- .write-container -->
    
  <c:if test="${loop.index % 3 == 2 || loop.index + 1 == yourList.size()}">
    </div> <!-- .class="row" -->
  </c:if>
</c:forEach>

<a  href="/market/write?boardCate=${board.boardCate }"><button>글쓰기</button></a>





</div><!-- .container -->

<c:import url="../layout/footer.jsp" />