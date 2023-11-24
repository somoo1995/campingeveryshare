<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

<div class="mt-5 mb-5">

<%-- ${paging.category } --%>

<c:choose>

	<c:when test="${empty hasData or not hasData }">
		<div class="wrap-result text-center mb-5">
			<strong style="color: #ccc;">검색 결과가 없습니다</strong><br>
		</div>
	</c:when>
</c:choose>

<c:forEach items="${list}" var="board" varStatus="loop">
  <c:if test="${loop.index % 3 == 0}">
    <div class="row">
  </c:if>
     
  <div class="write-container">
	
	<div style="margin-bottom : 10px;">
	</div>
	<div class="info">
    <h6>👤 : ${board.WRITERNICK }</h6>
    <h6>❣️ : ${board.HEART }  </h6>
    
    <c:set var="formattedPrice" value="${board.PRICE}" />
	<fmt:formatNumber value="${formattedPrice}" pattern="#,###" var="price" />
	<h6 style="color:
	    <c:choose>
	        <c:when test="${formattedPrice >= 100000}">
	            #C71585
	        </c:when>
	        <c:when test="${formattedPrice > 50000}">
	            #3232FF
	        </c:when>
	        <c:when test="${formattedPrice >= 10000}">
	            #6ED746
	        </c:when>
	        <c:otherwise>
	            #000000 <!-- 기본값 -->
	        </c:otherwise>
	    </c:choose>
	;">
	🪙 : ${price } 원
	</h6>
	</div>
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
    <h6 class="good">💬  ${board.RECOM }</h6>
    <h6 class="view">🔭  ${board.HIT}</h6>
    <h6 class="write">✏️
      <fmt:formatDate value="<%=new Date() %>" pattern="yyyyMMdd" var="current"/>
      <fmt:formatDate value="${board.POST_DATE }" pattern="yyyyMMdd" var="write"/>
      <c:choose>
         <c:when test="${write lt current }">
            <fmt:formatDate value="${board.POST_DATE }" pattern="yyyy-MM-dd"/>
         </c:when>
         <c:when test="${write eq current }">
            <fmt:formatDate value="${board.WRITE_DATE }" pattern="HH:mm"/>
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

<c:import url="../layout/paginationSearch.jsp" />