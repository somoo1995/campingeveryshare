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
	color: #2ECC71;
	font-weight: bold;
	font-size: 40px;
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
    height: 100%;
    background-color: #F6E2A2; 
/*     color: #fff;  */
    transition: left 0.4s; 
    z-index: 1000;
}

.alert-list {
    position: fixed; 
    top: 0;
    left: -362px; 
    width: 362px; 
    height: 100%;
    border-radius: 0px;
    background-color: #F5E5B4; 
    color: #fff; 
    transition: left 0.4s; 
    z-index: -1;
 	visibility: hidden;
}

.search {
    position: fixed;
    top: -200px;
    width: 1300px; 
    height: 150px;
    background-color: #FFFFFF;
    transition: top 0.4s; 
    z-index: 1000;
}

.userStatus {
	color: green;
	font-weight: bold;
}

.wrap-menu span:hover {
	font-weight: bold;
	color: #4E4134;
	cursor: pointer;
}

ul {
	list-style: none;
}

@import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css);

 * {
 font-family: 'Nanum Gothic', sans-serif;
}

.menu-icon {
    position: inherit; 
    top: 10px;
    left: 10px;
    clear: both;
    z-index: 1;
} 

/* new 알람 */
#new-icon {
	color: white;
	text-align: center;
	font-size: 10px;
	border: 1px solid tomato;
	background-color: tomato;
	border-radius: 3px;
	width: 32px;
	height: 20px;
	margin-left: 38px;
	margin-top: 5px;
	position: inherit;
	display: inline-block;
	z-index: 2;
	display: none;
	vertical-align: middle;
}

#new-icon-text {
	vertical-align: middle;
	margin-top: 1px;
}


/* 빨간 동그라미 알람 */
/* 
#new-icon {
	border: 1px solid tomato;
	background-color: tomato;
	border-radius: 20px;
	width: 15px;
	height: 15px;
	margin-left: 23px;
	margin-top: 5px;
	position: fixed;
	display: inline-block;
	z-index: 2;
}
*/
#alertWrap {
	width: 40px;
	height: 40px;
	display: inline-block;
	float: left;
 	position: absolute; 
}

#new-alert {
	color: white;
	font-size: 13px;
	font-weight: bold;
	text-align: center;
	border: 1px solid tomato;
	background-color: tomato;
	border-radius: 20px;
	width: 20px;
	height: 20px;
  	margin-top: -45px;
  	margin-left: 333px;  
	position: fixed;
	display: inline-block;
	z-index: 2;
/* 	vertical-align: middle; */
  	display: none;  
}

</style>

<script type="text/javascript">

$(function() {
	
	hasNew()
	
	var urlEndPoint = "/alert/get?userId=" + "${loginId}"
	var eventSource = new EventSource(urlEndPoint)
	
	eventSource.onmessage = function (event) {
		console.log(event)
	    var data = JSON.parse(event.data)
	    console.log(data)
	    
	    var hasNew = data.hasNew
	    var alert = data.alert
		
	    console.log("hasNew :" + hasNew)
	    console.log("alert :" + alert)


	    $("#new-icon").show()
	    $("#new-alert").html(hasNew).show()
	    
		loadAlert()
	    
	}
})


$(function() {
	
    $(".menu-icon").css("cursor","pointer").click(function () {
            $("#menu").css("left", "0px")
            $("#alert").css("left", "0px")
            hasNew()
    });
    
    $(".menu-back").css("cursor", "pointer").click(function () {
    	 $("#menu").css("left", "-362px")
    	 $("#alert").css("left", "-362px")
    	 $("#alert").attr("style", "visibility:hidden")
    	 $("#search").css("top", "-200px")
    });
    
    $(".alert-open").css("cursor", "pointer").click(function () {
    	
    	if( $("#alert").css("left") === "362px" ){
        	$("#alert").css("left", "0px")
    		$("#alert").attr("style", "visibility:hidden")
    	} else {
			$("#alert").attr("style", "visibility:visible")
	    	$("#alert").css("left", "362px")
		}
    	
		loadAlert()
    	
    });
    
    $(document).on("click", function (event) {
        if (!$(event.target).closest("#alert, #menu, .menu-icon, .search-icon, #search-query, #btnSearch").length) {
	       	 $("#menu").css("left", "-362px")
	    	 $("#alert").css("left", "-362px")
	    	 $("#alert").attr("style", "visibility:hidden")
	    	 $("#search").css("top", "-200px")
        }
    });
	
	$(".search-icon").css("cursor", "pointer").click(function () {
		 $("#search").css("top", "0px")
	});
	
	$("#btnSearch").click(function() {
// 		console.log("btnSearch click")
// 		console.log($("#search-query").val())
		
		$form = $("<form>").attr({
			action: "/search",
			method: "get"
		}).append(
			$("<input>")
				.attr("name", "query")
				.css("display", "none")
				.attr("value", $("#search-query").val() )
		)
		$(document.body).append( $form )
		$form.submit()
	})
	

});

function loadAlert() {
	
    $.ajax({
        type: "get"
        , url: "/alert/list"
        , data: {
        }
        , dataType: "html"
        , success: function( res ) {
           console.log("AJAX 성공")
			$("#alert").html(res)
			
        }
        , error: function() {
           console.log("AJAX 실패")
        }
     })
}

function hasNew() {
	
	$.ajax({
		type: "get"
		, url: "/alert/new"
		, data: {
		}
		, dataType: "json"
		, success: function( res ) {
			console.log("AJAX 성공")
			
			if( res.hasNew == 0 ) {
				$("#new-alert").hide()
				$("#new-icon").hide()
			} else {
				
				$("#new-alert").text(res.hasNew).show()
				$("#new-icon").show()
			}
		}
		, error: function() {
			console.log("AJAX 실패")
		}
	})
     
}


$(function() {
	
	$(".tglStatus, #host, #guest").css("cursor", "pointer").click(function() {
	    var currentSrc = $(".tglStatus").attr("src");
	    
	    if (currentSrc === "/resources/img/toggle-brown-right.png") {
	    	
	        $(".tglStatus").attr("src", "/resources/img/toggle-brown-left.png");
	        $("#host").removeClass("userStatus")
	        $("#guest").addClass("userStatus")
	        $("#campStatus").html("내 예약").attr("camp-data", "/booking/list")
	        
	    } else {
	        $(".tglStatus").attr("src", "/resources/img/toggle-brown-right.png");
	        $("#guest").removeClass("userStatus")
	        $("#host").addClass("userStatus")
	        $("#campStatus").html("내 캠핑카").attr("camp-data", "/car/list")
	    }
	})
	
	$("#campStatus").click(function() {
		var campData = $("#campStatus").attr("camp-data")
		console.log(campData)
		
		location.href = campData
	})
})

</script>

</head>
<body>

<div class="wrap mx-auto">

<header class="header text-center my-4">
<div class="header-container">
	
	<div id="alertWrap">
	<div id="new-icon"><div id="new-icon-text">NEW</div></div>
	<img alt="menu" class="menu-icon" src="/resources/img/menu_white.png" width="40" height="40">
<!--     <span class="visually-hidden">New alerts</span> -->
   
    </div>
    
    
	<a href="/"><img alt="header" class="header-img" src="/resources/img/header_text.png" width="1300" height="300"></a>
	<img alt="search" class="search-icon" src="/resources/img/search_white.png" width="40" height="40">
</div>

<div class="main-category-menu mt-3">
	<a href="/rent/list">대여</a>
	|
	<a href="/share/list">캠핑존공유</a>
	|
	<a href="/market/list">중고장터</a>
	|
	<a href="/group/list">모집</a>
</div>

<div class="search" id="search">
	<img class="menu-back" alt="close" src="/resources/img/back.png" width="40px" height="40px">
	<div class="input-group mt-5" style="flex: 0; width: 800px; margin-left: 239px;">
	<input class="form-control col-1" type="text" name="query" id="search-query">
	<button class="btn btn-outline-secondary" id="btnSearch">검색</button>
	</div>
</div>

</header><!-- .header end -->

<div id="menu" class="menu">

	<aside id="all_mymenu" role="navigation" style="left: 0px; margin: 0 auto;" >
	
	<img class="menu-back" alt="close" src="/resources/img/back.png" width="40px" height="40px">
	
	<div class="wrap-menu text-center">
	
		<div class="profile-info">
		<c:choose>
			<c:when test="${empty isLogin or not isLogin }">
				<span onclick="location.href='/user/login'">로그인</span>
				|
				<span onclick="location.href='/user/join'">회원가입</span>
			</c:when>
			<c:when test="${not empty isLogin and isLogin }">
				<div class="mb-5"> ${loginNick } 님, 환영합니다 </div>
				<span onclick="location.href='/user/view'">내 정보</span>
				|
				<span onclick="location.href='/user/logout'">로그아웃</span>
			</c:when>
		</c:choose>
		</div> <!-- .profile-info end -->
		
		<c:if test="${not empty isLogin and isLogin }">
		<div class="mt-5"></div>

		<div>
			<span id="guest" class="userStatus">게스트</span>
			<img alt="statusToggle" src="/resources/img/toggle-brown-left.png" width="100px" height="90px" class="tglStatus">
			<span id="host" class="">호스트</span>
		</div>
		</c:if>
		
		<div class="mt-5">
		<c:choose>
			<c:when test="${empty isLogin or not isLogin }">
				<span id="campStatus" camp-data="/mypage/fail">내 캠핑</span>
			</c:when>
			<c:when test="${not empty isLogin and isLogin }">
				<span id="campStatus" camp-data="/booking/main">내 예약</span>
			</c:when>
		</c:choose>
		|
		<span onclick="location.href='/message/list'">메세지</span>
		|
		<span>찜</span>
		|
		<c:if test="${not empty isLogin and isLogin }">
		<span class="alert-open">알림</span><div id="new-alert"></div>
		<!-- 알림 리스트 -->
		<div id="alert" class="alert-list"></div>
		</c:if>
		<c:if test="${empty isLogin or not isLogin }">
		<span class="alert-open" onclick="location.href='/mypage/fail'">알림</span>
		</c:if>
		</div>
		
		<div class="mt-5">
		<span>공지사항</span>
		|
		<span>고객문의</span>
		</div>
		
		<div class="mt-5">
		<span>관리자 페이지로</span>
		</div>
		

	</div> <!-- .wrap-menu end -->
	
	</aside> <!-- #all_mymenu end -->


</div> <!-- .menu end -->


<hr>

