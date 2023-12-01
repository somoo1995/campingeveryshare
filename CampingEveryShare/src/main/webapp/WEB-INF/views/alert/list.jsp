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
	border-left: 1px solid #efefef;
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

.alert-data {
/*     border: 1px solid #EFEFEF; */
    border-radius: 3px;
    margin-bottom: 10px;
    margin-left: 5px;
    margin-right: 5px;
    padding-top: 1px;
    padding-bottom: 1px;
    padding-left:5px;
    width: 337px;
/*     box-shadow: 2px 4px 4px 0px rgba(0,0,0,0.3); */
    background-color: #EFEFEF;
}


.data-title {
	font-weight: bold;
	font-size: 20px;
	color: #5C5C5C;
	text-align: left;
}

.data-message {
	font-size: 16px;
	color: #5F5F5F;
	text-align: left;
}

.data-time {
	font-size:12px;
	color: #5f5f5f;
	text-align: right;
}

ul {
	margin: 7px;
	padding-left: 0px;
}

ul:hover {
	font-weight: bold;
	cursor: pointer;
}

li {
/* 	margin-left: -25px; */
	color: #4E4134;
	
}

#newIcon {
	color: white;
	font-size: 10px;
	border: 1px solid #1ABA00;
	background-color: #1ABA00;
	border-radius: 3px;
	width: 32px;
	height: 20px;
	display: inline-block;
	z-index: 2;
	vertical-align: middle;
	text-align: center;
}

#newIcon-text {
	display: inline-block;
	margin-top: 1px;
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

<img class="alert-back" alt="close" src="/resources/img/arrow-left-lightgreen.png" width="40px" height="40px">

<div class="wrap-content">
	<c:forEach var="list" items="${list }">
	<div class="alert-data">
	<ul class="alertData" id="alertData" data-alert="${list.ALERT_NO }">
		<li class="data-title">
		<c:if test="${list.ALERT_STATUS eq 0 }"> <div id="newIcon"><div id="newIcon-text">NEW</div></div> </c:if>
			<c:if test="${list.BOARD_CATE eq 1 }"> 대여</c:if>
			<c:if test="${list.BOARD_CATE eq 7 }"> 캠핑카</c:if>
			| ${list.CARNAME }
		</li>
		<li class="data-time"">
			<fmt:parseDate value="${list.POST_DATE }" var="post" pattern="yyyy-MM-dd HH:mm"/>
			<fmt:formatDate value="${post }" pattern="yyyy-MM-dd HH:mm"/>
		</li>
		<li class="data-message">
			<c:if test="${list.CONTENT eq 1 }">승인 요청이 완료되었습니다</c:if>
			<c:if test="${list.CONTENT eq 2 }">승인 요청이 보류되었습니다</c:if>
			<c:if test="${list.CONTENT eq 3 }">승인 요청이 거절되었습니다</c:if>
			<c:if test="${list.CONTENT eq 4 }">새로운 예약이 생성되었습니다</c:if>
			<c:if test="${list.CONTENT eq 5 }">캠핑카 예약이 취소되었습니다</c:if>
		</li>

	</ul>
	</div>
	</c:forEach>
</div>

</div>

<!-- </div>.container -->