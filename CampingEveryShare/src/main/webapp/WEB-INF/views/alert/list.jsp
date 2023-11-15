<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
.alert-back {
	position: absolute;
	top: 10px;
	right: 15px;
	z-index: 999;
}

.wrap-alert {
/* 	top:0px; */
	width: 100%;
	height:100%;
}

.wrap-content {
	position: absolute;
	top: 68px;
 	left: -1px; 
	width: 362px;
	height: 94%;
	overflow-y: auto;
	overflow-x: hidden; 
}

ul {
	border-bottom: 1px solid #4E4134;
}

ul:hover {
	font-weight: bold;
	cursor: pointer;
}

li {
	margin-left: -25px;
	color: #4E4134;
}

#newIcon {
	color: white;
	font-size: 10px;
	border: 1px solid green;
	background-color: green;
	border-radius: 3px;
	width: 32px;
	height: 20px;
	display: inline-block;
	z-index: 2;
	vertical-align: middle;
}
#newIcon1{
	display: inline-block;
	margin-top: 2px;
}

</style>

<script type="text/javascript">

$(function() {
	
	$(".alert-back").css("cursor","pointer").click(function () {
    	$("#alert").css("left", "0px")
		$("#alert").attr("style", "visibility:hidden")
    	
    });
    
    $(".alertData").click(function() {
    	
		$.ajax({
			type: "post"
			, url: "/alert/read"
			, data: {
				alertNo: $(this).data("alert")
			}
			, dataType: "json"
			, success: function( res ) {
				console.log("AJAX 성공")
				loadAlert()
				hasNew()
			}
			, error: function() {
				console.log("AJAX 실패")
			}
		})
				
	})
	
})



</script>

<!-- <div class="container"> -->

<div class="wrap-alert">

<img class="alert-back" alt="close" src="/resources/img/back.png" width="40px" height="40px">

<div class="wrap-content">
<!-- 	<div id="alerts"></div> -->
	<c:forEach var="list" items="${list }">	
	<ul class="alertData" id="alertData" data-alert="${list.alertNo }">
		<li>
			<c:if test="${list.alertStatus eq 0 }"> <div id="newIcon"><div id="newIcon1">NEW</div></div> </c:if>
			<c:if test="${list.boardCate eq 1 }">[대여]</c:if>
			<c:if test="${list.boardCate eq 7 }">[캠핑카]</c:if>
			${list.alertNo }
		</li>
		<li>
			<c:if test="${list.content eq 1 }">신규 캠핑카 승인 완료</c:if>
			<c:if test="${list.content eq 2 }">신규 캠핑카 승인 보류</c:if>
			<c:if test="${list.content eq 3 }">신규 캠핑카 승인 불가</c:if>
			<c:if test="${list.content eq 4 }">캠핑카 신규 예약</c:if>
			<c:if test="${list.content eq 5 }">캠핑카 예약 취소</c:if>
		</li>

	</ul>
	</c:forEach>
</div>

</div>

<!-- </div>.container -->