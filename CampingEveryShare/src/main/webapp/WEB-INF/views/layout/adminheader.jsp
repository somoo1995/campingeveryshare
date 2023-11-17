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

<style type="text/css">

.wrap {
	width: 1300px;
}

.container {
	width: 1300px;
/* 	margin-left: -10px; */
/* 	margin-right: 0px; */
}

.header-container {
    position: relative;
    display: inline-block;
    width: 1300px;
    height: 310px;
}

.header-image {
    z-index: -1; 
}


#pageTitle {
	color: #2ECC71;
	font-weight: bold;
	font-size: 40px;
}


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

<div class="main-category-menu mt-3">
<a>캠핑카 관리</a>
|
<a href="/admin/list">회원 관리</a>
|
<a>글 작성</a>
|
<a href="/admin/report">신고 관리</a>
|
<a>수익 관리</a>
</div>
</header>

<hr>
</div>
