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
/*    margin-left: -10px; */
/*    margin-right: 0px; */
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

.alert {
    position: fixed; 
    top: 0;
    left: -362px; 
    width: 362px; 
    height: 100%;
    border-radius: 0px;
    background-color: green; 
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
    position: relative; /* 이 부분이 중요합니다 */
    top: 10px;
    left: 10px;
    /* 나머지 스타일 */
}

#menu-icon{
    position: absolute;
    top: -7px; /* 이 값을 조절하여 위치를 맞춥니다. */
    right: -7px; /* 이 값을 조절하여 위치를 맞춥니다. */
    z-index: 2; /* .menu-icon보다 높게 설정합니다 */
    border: 1px solid tomato;
    background-color: tomato;
    border-radius: 50%; /* 원형을 만들기 위해 % 단위를 사용합니다 */
    width: 15px;
    height: 15px;
    /* float 및 margin-right, margin-top, display: inline-block 등 필요 없는 속성은 제거 */
}

</style>

<script type="text/javascript">

$(function() {
   
   var urlEndPoint = "/alert/get?userId=" + "${loginId}"
   var eventSource = new EventSource(urlEndPoint)
   
   eventSource.onmessage = function (event) {
      console.log(event)
       var alert = JSON.parse(event.data);
       console.log(alert)
       $("#alertIcon").addClass("position-absolute p-1 bg-danger rounded-circle")
       $("#menu-icon").addClass("position-absolute p-2 bg-danger rounded-circle")
       $("#alerts").append( "<ul>" + "<li>" + alert.boardCate + "</li>" + "<li>" + alert.content + "</li>" + "</ul>" );
//        $("#alerts").html(event.data.);
   }
})


$(function() {
   
    $(".menu-icon").css("cursor","pointer").click(function () {
            $("#menu").css("left", "0px")
            $("#alert").css("left", "0px")
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
       
        $.ajax({
            type: "get"
            , url: "/alert/list"
            , data: {
            userId: "${loginId}"
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
      console.log("btnSearch click")
      console.log($("#search-query").val())
      
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
   
   <div>
   <img alt="menu" class="menu-icon" src="/resources/img/menu_white.png" width="40" height="40">
   <div id="menu-icon"></div>
<!--     <span class="visually-hidden">New alerts</span> -->
   
    </div>
    
    
   <a href="/"><img alt="header" class="header-img" src="/resources/img/header_text.png" width="1300" height="300"></a>
   <img alt="search" class="search-icon" src="/resources/img/search_white.png" width="40" height="40">
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
      <span class="alert-open">알림
         <span id="alertIcon">
          <span class="visually-hidden">New alerts</span></span>
      </span>
         <div id="alert" class="alert"></div>
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
