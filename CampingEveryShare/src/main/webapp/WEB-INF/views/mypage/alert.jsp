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
	top: 100px;
	left: 0;
	width: 100%;
	height: 100%;
	overflow: scroll;
}


</style>

<script type="text/javascript">

$(function() {
    $(".alert-back").css("cursor","pointer").click(function () {
    	$("#alert").css("left", "0px")
		$("#alert").attr("style", "visibility:hidden")
    	
    });
})

</script>

<!-- <div class="container"> -->

<div class="wrap-alert">

<img class="alert-back" alt="close" src="/resources/img/back.png" width="40px" height="40px">

<div class="wrap-content text-center">
	<c:forEach var="list" items="${list }">
	<ul>
		<li>${list.content }</li>
		<li> 
<%-- 		<fmt:parseDate value="${list.post_date }" var="post" pattern="yyyy-MM-dd HH:mm"/> --%>
		<fmt:formatDate value="${list.postDate }" pattern="yyyy-MM-dd HH:mm"/>
		</li>
	</ul>
	</c:forEach>
</div>

</div>

<!-- </div>.container -->