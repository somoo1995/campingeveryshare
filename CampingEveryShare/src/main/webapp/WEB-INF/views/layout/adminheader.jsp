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

<link rel="stylesheet" href="../resources/css/adminheader.css">

<!-- 어도비 본고딕 폰트 불러오기! -->
<script>
  (function(d) {
    var config = {
      kitId: 'nhb2qxu',
      scriptTimeout: 3000,
      async: true
    },
    h=d.documentElement,t=setTimeout(function(){h.className=h.className.replace(/\bwf-loading\b/g,"")+" wf-inactive";},config.scriptTimeout),tk=d.createElement("script"),f=false,s=d.getElementsByTagName("script")[0],a;h.className+=" wf-loading";tk.src='https://use.typekit.net/'+config.kitId+'.js';tk.async=true;tk.onload=tk.onreadystatechange=function(){a=this.readyState;if(f||a&&a!="complete"&&a!="loaded")return;f=true;clearTimeout(t);try{Typekit.load(config)}catch(e){}};s.parentNode.insertBefore(tk,s)
  })(document);
</script>

<script type="text/javascript">
$(document).ready(function () {
    // 서버에서 로그인 여부 확인
    var isLogin = <%= session.getAttribute("isLogin") %>;

    // 만약 로그인 상태라면 메뉴를 보이도록 설정
    if (isLogin) {
        $("#adminMenu").show();
    }
});
</script>

</head>
<body>

<div class="wrap mx-auto">

<header class="header text-center my-4">
<div class="header-container">
	<img alt="header" class="header-img" src="/resources/img/header_blue.png" width="1300" height="250">
</div>

<!--  style="display: none;" -->
<div id="adminMenu" class="main-category-menu mt-3">

<!-- 캠핑카 관리 링크 이후 수정 -->
<a href="admin/test">🩵캠핑카 관리</a>

<a href="/admin/list">🩵회원 관리</a>

<!-- 글 작성 링크 이후 수정 -->
<a href="/admin/notice">🩵공지사항</a>

<a href="/admin/qna">🩵고객문의</a>

<a href="/admin/report">🩵신고 관리</a>

<a href="/admin/income">🩵수익 관리</a>

<a href="/">🩵사용자 페이지</a>

</div>
</header>

</div>
