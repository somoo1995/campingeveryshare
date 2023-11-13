<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<style type="text/css">

.button-group {
  display: flex; /* 버튼을 한 줄로 나란히 배열 */
  align-items: flex-end; /* 아랫선을 맞추기 위해 추가 */
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
  height: 50px;
}

.button.active {
  background-color: #2ECC71; /* 활성화된 버튼의 배경색 변경 */
  width: 200px;
  height: 80px;
  font-size: 25px;
  font-weight: bold;
}
</style>


<script type="text/javascript">

function search() {
	
	$.ajax({
        type: "post"
        , url: "/search"
        , data: {
			category: $(".button.active").data("category"),
			query: "${param.query}"
        }
        , dataType: "html"
        , success: function( res ) {
           console.log("AJAX 성공")
			$("#searchResult").html(res)
        }
        , error: function() {
           console.log("AJAX 실패")

        }
	})
}

$(function() {
	search()
	
	$("#btnRent").click(function() {
		$(this).addClass("active")
		$("#btnShare, #btnMarket, #btnGroup").removeClass("active")
		search()
	})
	
	$("#btnShare").click(function() {
		$(this).addClass("active")
		$("#btnRent, #btnMarket, #btnGroup").removeClass("active")
		search()		
	})
	
	$("#btnMarket").click(function() {
		$(this).addClass("active")
		$("#btnRent, #btnShare, #btnGroup").removeClass("active")
		search()
	})

	$("#btnGroup").click(function() {
		$(this).addClass("active")
		$("#btnRent, #btnShare, #btnMarket").removeClass("active")
		search()
	})
	
})

</script>


<div class="container">


<!-- 작성 공간 -->
<div class="pageTitle">
<h3 id="pageTitle">검색어 "${param.query }"에 대한 검색 결과입니다.</h3>
<hr>
</div>

    <div class="button-group mt-5">
	    <a class="button active" id="btnRent" data-category="1">대여</a>
	    <a class="button" id="btnShare" data-category="2">캠핑존공유</a>
	    <a class="button" id="btnMarket" data-category="3">중고장터</a>
	    <a class="button" id="btnGroup" data-category="4">모집</a>
	</div>


	<div class="searchResults" id="searchResult"></div>


</div><!-- .container -->

<c:import url="../layout/footer.jsp" />