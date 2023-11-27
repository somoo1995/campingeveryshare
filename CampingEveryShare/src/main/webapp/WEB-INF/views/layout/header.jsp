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

<link rel="stylesheet" href="../resources/css/header.css?after">
<!-- Slick 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">

<!-- 폰트 목록 불러오기 -->
<link rel="stylesheet" href="../resources/css/font.css?after">

<!-- 어도비 본고딕 폰트 불러오기 -->
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

<!-- Line Awesome Icon 불러오기-->
<link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">


<style type="text/css">

</style>

<script type="text/javascript">

$(function() {
   $('.fade').slick({
        dots: true,
        infinite: true,
        speed: 500,
        fade: true,
        cssEase: 'linear'
      });
})

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
        $("#menu").css("left", "-360px")
        $("#alert").css("left", "-360px")
        $("#alert").attr("style", "visibility:hidden")
        $("#search").css("top", "-200px")
    });
    
    $(".alert-open").css("cursor", "pointer").click(function () {
       
       if( $("#alert").css("left") === "360px" ){
           $("#alert").css("left", "0px")
          $("#alert").attr("style", "visibility:hidden")
       } else {
         $("#alert").attr("style", "visibility:visible")
          $("#alert").css("left", "360px")
      }
       
      loadAlert()
       
    });
    
    $(document).on("click", function (event) {
        if (!$(event.target).closest("#alert, #menu, .menu-icon, .search-icon, #search-query, #btnSearch").length) {
              $("#menu").css("left", "-360px") 
           $("#alert").css("left", "-360px")
           $("#alert").attr("style", "visibility:hidden")
           $("#search").css("top", "-200px")
        }
    });
   
   $(".search-icon").css("cursor", "pointer").click(function () {
       $("#search").css("top", "0px")
   });
   
   $("#btnSearch").click(function() {
//       console.log("btnSearch click")
//       console.log($("#search-query").val())
      
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
   
    $(".toggleSwitch").click(function() {
        // 토글 버튼 클릭 시 호스트와 게스트 교체
        $("#host, #guest").toggleClass("userStatus");
        var isChecked = $("#toggle_test").prop("checked");
        var userStatusContainer = $("#userStatusContainer");
        
        if (isChecked) {
            // 게스트
            userStatusContainer.html('<div id="guest" class="userStatus_g">게스트</div>');
            $("#campStatus").html("내 예약").attr("camp-data", "/booking/main");
            $(".reservation_icon").click(function() {
                location.href = "/booking/main";
            });
            
        } else {
            // 호스트
            userStatusContainer.html('<div id="host" class="userStatus_h">호스트</div>');
            $("#campStatus").html("내 캠핑카").attr("camp-data", "/car/list");
         	// 추가 코드: 호스트인 경우 예약 이미지 클릭 시 /car/list로 이동
            $(".reservation_icon").click(function() {
                location.href = "/car/list";
            });
        }
    });

    $("#campStatus").click(function() {
        var campData = $("#campStatus").attr("camp-data");
        console.log(campData);
        location.href = campData;
    });
    
    console.log("Setting user status and camp data");
    var userStatusContainer = $("#userStatusContainer");
    userStatusContainer.html('<div id="guest" class="userStatus_g">게스트</div>');
    
    if (isLoggedIn) {
        //로그인한 경우
         userStatusContainer.html('<div id="guest" class="userStatus_g">게스트</div>');
         $("#campStatus").html("내 예약").attr("camp-data", "/booking/main");
     }
     else {
        //로그인하지 않은 경우
        campStatusIcon.html("내 캠핑").attr("camp-data", "/mypage/fail");
     }
    
});

</script><!-- script 끝 -->

</head>
<body><!-- body 시작 -->

<div class="wrap mx-auto">

<header class="header text-center my-4">
<div class="header-container">
   
   <div id="alertWrap">
   <div id="new-icon"><div id="new-icon-text">NEW</div></div>
   <img alt="menu" class="menu-icon" src="/resources/img/menu_white.png" width="40" height="40">
<!--     <span class="visually-hidden">New alerts</span> -->
   
    </div><!-- alertWrap -->
    
   <a href="/"><img alt="header" class="header-img" src="/resources/img/header_green.png" width="1300" height="250"></a>
   <img alt="search" class="search-icon" src="/resources/img/search_white.png" width="40" height="40">
</div><!-- header-container -->

<div class="main-category-menu mt-3">
   <a href="/rent/list">🌿캠핑카 대여</a>
   
   <a href="/share/list">🌿캠핑존 공유</a>
   
   <a href="/market/list">🌿중고장터</a>
   
   <a href="/group/list">🌿캠핑모집</a>
</div><!-- main-category-menu -->

<div class="search" id="search">
   <img class="menu-back" alt="close" src="/resources/img/back.png" width="40px" height="40px">
   <div class="input-group mt-5" style="flex: 0; width: 800px; margin-left: 239px;">
   <input class="form-control col-1" type="text" name="query" id="search-query">
   <button class="btn btn-outline-secondary" id="btnSearch">검색</button>
   </div><!-- input-group -->
</div><!-- .search -->

</header><!-- .header end -->

<div id="menu" class="menu">
   
   <div class="mypage_background">
<!--    <img alt="mypage_background" src="/resources/img/mypage_background_2.png"></div>mypage_background -->
   <img alt="mypage_background" src=""></div><!-- mypage_background -->
   
   <aside id="all_mymenu" role="navigation" style="left: 0px; margin: 0 auto;" >
   
   <img class="menu-back" alt="close" src="/resources/img/back.png" width="40px" height="40px">
   
   <div class="wrap-menu text-center">
   
      <div class="profile-info">
      <c:choose>
         <c:when test="${empty isLogin or not isLogin }">
         <div class="profile_box">
         <div class="box">
         <img class="profile" alt="profile" src="/resources/img/profile2.png">
         </div><!-- .box -->
         </div><!-- .profile_box -->
         
         <div class="mb-5"> <span style="font-weight: 500;">환영합니다!</span></div>
         
            <div class="before_login">
            <span onclick="location.href='/user/login'">로그인</span>
            
            <span onclick="location.href='/user/join'">회원가입</span>
            </div>
         </c:when>
         <c:when test="${not empty isLogin and isLogin }">
            
            <!-- 선택한 프로필에 따라 사진 변경 필요 -->
            <!-- 프로필 사진 규격: 150px 150px -->
            <div class="profile_box">
            <div class="box">
            <img class="profile" alt="profile" src="/resources/img/profile2.png">
            </div><!-- .box -->
            </div><!-- .profile_box -->
            
            <div class="mb-5"> <span style="font-weight: 500;">${loginNick }</span>님</div>
            
            <c:if test="${not empty isLogin and isLogin }">
            <div class="mt-5"></div>
            
            <div class="btn_test">

               <div id="userStatusContainer"></div>
               
               <input type="checkbox" id="toggle_test" hidden class="tglStatus"> 
               
               <label for="toggle_test" class="toggleSwitch">
                 <span class="toggleButton"></span>
               </label>
            </div><!-- .btn_test -->

            </c:if>
            
            <div class="sm_menu">
            <span onclick="location.href='/user/view'" class="myInfo">내 정보</span>
            
            <span onclick="location.href='/user/logout'" class="logout">로그아웃</span>
            </div>
            
         </c:when>
      </c:choose>
      <hr class="hr_info">
      </div> <!-- .profile-info end -->
   
      <div class="mt-5 my_list"><!-- grid 사용 -->
   
      <!-- 예약 아이콘 -->
      
      <!-- 예약 아이콘 -->
      <div class="reservation_container">
      <c:choose>
         <c:when test="${empty isLogin or not isLogin }">
          <div class="reservation">
          <img class="reservation_icon" onclick="location.href='/mypage/fail'" alt="reservation_icon" src="/resources/img/reservation_2.png" width="50px" height="50px">
            </div>
         </c:when>
         
         <c:when test="${not empty isLogin and isLogin }">
          <div class="reservation">
          <img class="reservation_icon" alt="reservation_icon" src="/resources/img/reservation_2.png" width="50px" height="50px">
            </div>
         </c:when>
      </c:choose>
      
      <!-- 내 캠핑 /예약 문구 -->
      <c:choose>
         <c:when test="${empty isLogin or not isLogin }">
            <span class="special" id="campStatus" camp-data="/mypage/fail">내 캠핑</span>
         </c:when>
         
         <c:when test="${not empty isLogin and isLogin }">
         <div class="reservation">
<!--             <img class="reservation_icon" alt="reservation_icon" src="/resources/img/reservation_2.png" width="50px" height="50px"> -->
            <span class="reservation_letter" id="campStatus" camp-data="/booking/main">내 예약</span>
         </div>
         </c:when>
      </c:choose>
      </div><!-- .reservation_container -->
      
      <div class="message_container">
      
      <!-- 메세지 아이콘 -->
      <c:choose>
         <c:when test="${empty isLogin or not isLogin }">
         <div class="message">
          <img class="message_icon" onclick="location.href='/message/list'" alt="message_icon" src="/resources/img/message_2.png" width="50px" height="50px">
          </div><!-- .message -->
         </c:when>
         
         <c:when test="${not empty isLogin and isLogin }">
          <div class="message">
          <img class="message_icon" onclick="location.href='/message/list'" alt="message_icon" src="/resources/img/message_2.png" width="50px" height="50px">
          </div><!-- .message -->
       </c:when>
      </c:choose>
      
      <!-- 메세지 문구 -->
      <span class="message_letter" onclick="location.href='/message/list'">메세지</span>
      </div><!-- .message_container -->
      
      <div class="heart_container">
      
      <!-- 하트 아이콘 -->
       <c:choose>
         <c:when test="${empty isLogin or not isLogin }">
         <div class="heart">
            <img class="heart_icon" onclick="location.href='/mypage/fail'" alt="heart_icon" src="/resources/img/heart_2.png" width="50px" height="50px">
            </div><!-- .heart -->
         </c:when>
         
         <c:when test="${not empty isLogin and isLogin }">
         <div class="heart">
            <img class="heart_icon" onclick="location.href='/heart/main'" alt="heart_icon" src="/resources/img/heart_2.png" width="50px" height="50px">
            </div><!-- .heart -->
       </c:when>
      </c:choose>
      
      <!-- 찜 문구 -->
       <c:choose>
         <c:when test="${empty isLogin or not isLogin }">
         <span class="heart_letter" onclick="location.href='/mypage/fail'">찜</span>
         </c:when>
         
         <c:when test="${not empty isLogin and isLogin }">
         <span class="heart_letter" onclick="location.href='/heart/main'">찜</span>
       </c:when>
      </c:choose>
      </div><!-- .heart_container -->
      
      <div class="alarm_container">
      
      <!-- 알림 아이콘 -->
       <c:choose>
         <c:when test="${empty isLogin or not isLogin }">
            <div class="alarm">
            <img class="alarm_icon" onclick="location.href='/mypage/fail'" alt="alarm_icon" src="/resources/img/alarm_2.png" width="50px" height="50px">
            </div><!-- .alarm -->
         </c:when>
         
         <c:when test="${not empty isLogin and isLogin }">
            <div class="alarm">
            <img class="alert-open alarm_icon" alt="alarm_icon" src="/resources/img/alarm_2.png" width="50px" height="50px">
            </div><!-- .alarm -->
       </c:when> 
      </c:choose>
         
      <c:if test="${not empty isLogin and isLogin }">
      <div class="alert-open alarm_letter">알림
      </div><!-- <span> alert-open .alarm_letter -->

      <div id="new-alert"></div>
      <!-- .new_alert -->

      <!-- 알림 리스트 -->
      <div id="alert" class="alert-list"></div>
      <!-- .alert-list -->
      </c:if>
      <c:if test="${empty isLogin or not isLogin }">
      <!-- grid 12번째 : 알림 -->
      <span class="alert-open" onclick="location.href='/mypage/fail'">알림</span>
      <!-- .alert-open -->
      </c:if>
      </div><!-- .alarm_container -->
      
      </div><!-- .mt-5 my_list -->
      
      <hr class="hr_simple">
      <div class="fin">
      <span class="information" onclick="location.href='/notice/list'">공지사항</span>
      
      <span>고객문의</span>

      <span class="goToAdmin" onclick="location.href='/admin/login'">
      관리자 페이지로 이동
      </span>
      </div><!-- .fin -->
      
      </div><!-- .wrap-menu -->
      </aside> <!-- #all_mymenu end -->
      
   </div><!-- .menu -->
   </div><!-- .wrap mx-auto -->