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

$(function () {
// 	$("#main").hover(function() {
// 		console.log("#main hover")
		
// 	})
	$("#main").css("cursor","pointer").click(function() {
		$(location).attr("href", "/member/main")
	})
})

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
	<a href="/mypage/main"><img alt="menu" class="menu-icon" src="/resources/img/menu_white.png" width="40" height="40"></a>
	<a href="/"><img alt="header" class="header-img" src="/resources/img/header_text.png" width="1300" height="300"></a>
	<img alt="search" class="search-icon" src="/resources/img/search_white.png" width="40" height="40">
</div>

<div class="main-category-menu mt-3">
<a>대여</a>
|
<a>캠핑존공유</a>
|
<a>중고장터</a>
|
<a>모집</a>
</div>

</header>



<hr>

