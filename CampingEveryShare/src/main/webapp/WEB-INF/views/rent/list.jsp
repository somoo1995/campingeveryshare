<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<div class="container">


<!-- 작성 공간 -->
<div class="pageTitle">
<h3 id="pageTitle">대여</h3>
<hr>
</div>

<c:forEach items="${list}" var="board" varStatus="loop">
  
  <c:if test="${loop.index % 3 == 0}">
    <div class="row">
  </c:if>
     
  <div class="write-container">
    <h6 class="no">번호 : ${board.BOARD_NO}</h6>
    <h6>작성자 : ${board.USER_NICK }</h6>
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
    <a href="/share/view?boardNo=${board.BOARD_NO}&boardCate=${board.BOARD_CATE}">
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

<a  href="/share/write?boardCate=${board.boardCate }"><button>글쓰기</button></a>



</div><!-- .container -->

<c:import url="../layout/footer.jsp" />