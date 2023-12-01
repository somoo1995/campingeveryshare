<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<style type="text/css">

.button-group {
  display: flex; 
  align-items: flex-end; 
}

.button {
	background-color: #efefef; 
	color: #3A3A3A; 
	text-align: center; 
	padding: 10px 20px; 
	text-decoration: none; 
	border: none; 
	cursor: pointer; 
	width: 150px;
	height: 50px;
	transition: background-color 0.3s;
}

.button.active {
  background-color: #228b22;
  color: white;
  width: 200px;
  height: 80px;
  font-size: 25px;
  font-weight: bold;
}

.button:hover {
  background-color: #228b22;
  color: white;
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
			$("#resultList").html(res)
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
<!-- <hr> -->
</div>

    <div class="button-group mt-5">
	    <a class="button active" id="btnRent" data-category="1">대여</a>
	    <a class="button" id="btnShare" data-category="2">캠핑존공유</a>
	    <a class="button" id="btnMarket" data-category="3">중고장터</a>
	    <a class="button" id="btnGroup" data-category="4">모집</a>
	</div>


	<div class="resultList" id="resultList"></div>


</div><!-- .container -->

<c:import url="../layout/footer.jsp" />