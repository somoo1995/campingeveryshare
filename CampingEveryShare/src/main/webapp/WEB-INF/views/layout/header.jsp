<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Camping Every Share</title>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<script type="text/javascript">

$(document).ready(function () {
	
    $(".menu-icon").css("cursor","pointer").click(function () {
            $("#menu").css("left", "0px")
            $("#alert").css("left", "0px")
    });
    
    $(".menu-back").css("cursor", "pointer").click(function () {
    	 $("#menu").css("left", "-362px")
    	 $("#alert").css("left", "-362px")
    	 $("#alert").attr("style", "visibility:hidden")
    });
    
    $(".alert-open").css("cursor", "pointer").click(function () {
		$("#alert").attr("style", "visibility:visible")
    	$("#alert").css("left", "362px")
    });
    
    $(".alert-back").css("cursor","pointer").click(function () {
    	$("#alert").css("left", "0px")
		$("#alert").attr("style", "visibility:hidden")
    	
    });
    
});

</script>


<style type="text/css">

.wrap {
	width: 1300px;
}

.header-container {
    position: relative;
    display: inline-block;
    width: 1300px;
    height: 310px;
}

.menu-icon {
    position: absolute;
    top: 10px;
    left: 10px;
}

.search-icon {
	position: absolute;
	top: 10px;
	right: 10px;
}

.header-image {
    z-index: -1; 
}

.main-category-menu {
	text-align: center;
	font-size: 2em;
}

#pageTitle {
	color: green;
	font-weight: bold;
}

.wrap-menu {
	position: absolute;
	top: 100px;
	left: 0;
	width: 100%;
	font-size: 25px;
}

.alert-open:hover {
	font-weight: bold;
	color: green;
}

.menu-back {
	position: absolute;
	top: 10px;
	right: 15px;
}

.menu {
    position: fixed;
    top: 0;
    left: -362px; 
    width: 362px; 
    height: 5000px;
    background-color: #F6E2A2; 
    color: #fff; 
    transition: left 0.4s; 
    z-index: 1000;
}

.alert {
    position: fixed; 
    top: 0;
    left: -362px; 
    width: 362px; 
    height: 5000px;
    border-radius: 0px;
    background-color: green; 
    color: #fff; 
    transition: left 0.4s; 
    z-index: -1;
 	visibility: hidden; 
}



/* 폰트 설정 */

@import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css);

 * {
 font-family: 'Nanum Gothic', sans-serif;
}

</style>
</head>
<body>

<div class="wrap mx-auto">

<header class="header text-center my-4">
<div class="header-container">
	<img alt="menu" class="menu-icon" src="/resources/img/menu_white.png" width="40" height="40">
	<a href="/"><img alt="header" class="header-img" src="/resources/img/header_text.png" width="1300" height="300"></a>
	<img alt="search" class="search-icon" src="/resources/img/search_white.png" width="40" height="40">
</div>


<div id="menu" class="menu">

	<aside id="all_mymenu" role="navigation" style="left: 0px;" >
	
	<img class="menu-back" alt="close" src="/resources/img/back.png" width="40px" height="40px">
	
	<div class="wrap-menu text-center">
	
	<div>
	<c:choose>
		<c:when test="${empty isLogin or not isLogin }">
			<a href="/user/login">로그인</a>
			|
			<a href="/user/join">회원가입</a>
		</c:when>
		<c:when test="${not empty isLogin and isLogin }">
			<a>내 프로필</a>
			|
			<a href="/user/logout">로그아웃</a>
		</c:when>
	</c:choose>
	
	<!--     <ul> -->
	<!--         <li><a href="#">로그인</a></li> -->
	<!--         <li><a href="#">회원가입</a></li> -->
	<!--     </ul> -->
	
	</div>
	
	<div class="mt-5">
	<a>내캠핑</a>
	|
	<a href="./mypage/message">메시지</a>
	|
	<a>찜</a>
	|
	<span class="alert-open">알림</span>
	</div>
	
	<div id="alert" class="alert">
		<jsp:include page="/WEB-INF/views/mypage/alert.jsp" />
	</div>
	
	<div class="mt-5">
	<a>공지사항</a>
	|
	<a>고객문의</a>
	</div>
	
	</div>
	
	</aside> <!-- #all_mymenu end -->

</div>

<div class="main-category-menu mt-3">
<a>대여</a>
|
<a href="/share/list">캠핑존공유</a>
|
<a>중고장터</a>
|
<a>모집</a>
</div>

</header>

<hr>

