<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Camping Every Share</title>

<!-- 파비콘 -->
<link rel="icon" href="/resources/img/favicon.ico">

<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<!-- 헤더 css 파일 불러오기 -->
<link rel="stylesheet" href="../resources/css/header.css">
<!-- 폰트 css 파일 불러오기 -->
<link rel="stylesheet" href="../resources/css/font.css?after">


<!-- Slick 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">

<!-- Line Awesome Icon 불러오기-->
<link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">


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

// 알림 받기 
$(function() {

   hasNew()
   
   var urlEndPoint = "/alert/get?userId=" + "${loginId}"
   var eventSource = new EventSource(urlEndPoint)
   
   eventSource.onmessage = function (event) {
//       console.log(event)
       var data = JSON.parse(event.data)
//        console.log(data)
       
       var hasNew = data.hasNew
       var alert = data.alert

       $("#new-icon").show()
       $("#new-alert").html(hasNew).show()
       
      loadAlert()
       
   }
})

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
   
// 마이페이지, 알림페이지, 검색 슬라이드 
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
       
    })
    
	$(".search-icon").css("cursor", "pointer").click(function () {
       $("#search").css("top", "0px")
       $("#menu").css("left", "-360px") 
       $("#alert").css("left", "-360px")
       $("#alert").attr("style", "visibility:hidden")
	})
    
    //슬라이드 외부 영역 선택 시, 슬라이드 닫기
    $(document).on("click", function (event) {
        if (!$(event.target).closest("#alert, #menu, .menu-icon, .search-icon, #search-query, #btnSearch").length) {
           $("#menu").css("left", "-360px") 
           $("#alert").css("left", "-360px")
           $("#alert").attr("style", "visibility:hidden")
           $("#search").css("top", "-200px")
        }
    })
   
   //검색
   $("#btnSearch").click(function() {
      
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

})

//마이 페이지 내부
$(function() {
	
    //사용자 프로필
    var userProfile = "${loginProfile}";
	
    console.log("login.profile:", userProfile);

    // 로그인 여부에 따라 다른 프로필 사진을 보여줌
    if (${empty isLogin or not isLogin}) {
        // 로그인하지 않은 경우
    	var targetNumber = 2;
   	 	var $target = $('.box[data-profile-number="' +targetNumber+ '"]');
   	 	$target.show();
    } else {
        // 로그인한 경우
    	 var targetNumber = userProfile;
    	 var $target = $('.box[data-profile-number="' +targetNumber+ '"]');
    	 $target.show();
    }

    
    //게스트,호스트 토글
    var userStatusContainer = $("#userStatusContainer");
    userStatusContainer.html('<div id="guest" class="userStatus_g">게스트</div>');
    
    $(".toggleSwitch").click(function() {
        // 토글 버튼 클릭 시 호스트와 게스트 교체
        $("#host, #guest").toggleClass("userStatus");
        var isChecked = $("#toggle_test").prop("checked");
        var userStatusContainer = $("#userStatusContainer");
        
        if (isChecked) {
            // 게스트
            userStatusContainer.html('<div id="guest" class="userStatus_g">게스트</div>');
            $("#campStatus").html("내 예약").attr("camp-data", "/booking/main");
            
        } else {
            // 호스트
            userStatusContainer.html('<div id="host" class="userStatus_h">호스트</div>');
            $("#campStatus").html("내 캠핑카").attr("camp-data", "/car/main");
        }
    });

    
    $("#campStatus").click(function() {
        var campData = $("#campStatus").attr("camp-data");
        console.log(campData);
        location.href = campData;
    });
    
    $(".heart_container").css("cursor","pointer").click(function () {
   		location.href="/heart/main"
	})
    		
    $(".message_container").css("cursor","pointer").click(function () {
   		location.href="/message/list"
	})
   
});

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
   <img class="menu-back" alt="close" src="/resources/img/arrow-left-lightgreen.png" width="40px" height="40px">
   <div class="input-group mt-5" style="flex: 0; width: 800px; margin-left: 239px;">
   <input class="form-control col-1" type="text" name="query" id="search-query">
   <button class="btn btn-outline-success" id="btnSearch">검색</button>
   </div><!-- input-group -->
</div><!-- .search -->

</header><!-- .header end -->

<div id="menu" class="menu">
  
   <aside id="all_mymenu" role="navigation" style="left: 0px; margin: 0 auto;" >
   
   <img class="menu-back" alt="close" src="/resources/img/arrow-left-lightgreen.png" width="40px" height="40px">
   
   <div class="wrap-menu text-center">
   
      <div class="profile-info">
      <c:choose>
         <c:when test="${empty isLogin or not isLogin }">
         <div class="profile_box">
         <div class="box"  data-profile-number="2">
		   <img src="/resources/img/profile2.png" alt="프로필2" id="profile-img-2" width="150" height="150">
         </div><!-- .box -->
         </div><!-- .profile_box -->
         
         <div class="mb-5"> <span style="font-weight: 500;">환영합니다!</span></div>
         
            <div class="before_login">
            <span onclick="location.href='/user/login'">로그인</span>
            
            <span onclick="location.href='/user/join'">회원가입</span>
            </div>
         </c:when>
         <c:when test="${not empty isLogin and isLogin }">
     
     <!-- 프로필 사진 -->        
    <div class="profile_box">
        <div class="box" data-profile-number="1">
		   <img src="/resources/img/profile1.png" alt="프로필1" id="profile-img-1" width="150" height="150" >
        </div>
        <div class="box"  data-profile-number="2">
		   <img src="/resources/img/profile2.png" alt="프로필2" id="profile-img-2" width="150" height="150">
        </div>
        <div class="box"  data-profile-number="3">
		   <img src="/resources/img/profile3.png" alt="프로필3" id="profile-img-3" width="150" height="150">
        </div>
        <div class="box" data-profile-number="4">
		   <img src="/resources/img/profile4.png" alt="프로필4" id="profile-img-4" width="150" height="150">
        </div>
        <div class="box" data-profile-number="5">
		   <img src="/resources/img/profile5.png" alt="프로필5" id="profile-img-5" width="150" height="150" >
        </div>
	</div>
	
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
		<div class="reservation_container">
		<c:choose>
			<c:when test="${empty isLogin or not isLogin }">
			<div class="reservation">
			<img class="reservation_icon" onclick="location.href='/mypage/fail'" alt="reservation_icon" src="/resources/img/reservation_2.png" width="50px" height="48px">
			</div>
			</c:when>
			         
			<c:when test="${not empty isLogin and isLogin }">
			<div class="reservation">
			<img class="reservation_icon" alt="reservation_icon" src="/resources/img/reservation_2.png" width="50px" height="48px">
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
			<span class="reservation_letter" id="campStatus" camp-data="/booking/main">내 예약</span>
			</div>
			</c:when>
		</c:choose>
		</div><!-- .reservation_container -->

		<!-- 메시지 -->
		<div class="message_container">
			<div class="message">
			<img class="message_icon" alt="message_icon" src="/resources/img/message_2.png" width="50px" height="50px">
			</div>
			<span class="message_letter">메세지</span>
		</div>
	
		<!-- 찜 -->
		<div class="heart_container">
			<div class="heart">
			<img class="heart_icon" alt="heart_icon" src="/resources/img/heart_2.png" width="50px" height="50px">
			</div>
			<span class="heart_letter">찜</span>
		</div>
		
		<!-- 알림 -->
		<div class="alert_container">      
			<!-- 알림 숫자 -->
			<div id="new-alert"></div>
			<!-- 알림 아이콘 -->
			<div class="alarm">
				<img class="alert-open alert_icon" alt="alert_icon" src="/resources/img/alarm_2.png" width="50px" height="50px">
			</div>
		         
			<c:if test="${not empty isLogin and isLogin }">
			<span class="alert-open">알림</span>
			<div id="alert" class="alert-list"></div>
			</c:if>
			
			<c:if test="${empty isLogin or not isLogin }">
			<span class="alert-open" onclick="location.href='/mypage/fail'">알림</span>
			</c:if>
		</div><!-- .alert_container -->
      
	</div><!-- .mt-5 my_list -->
      
      <hr class="hr_simple">
      
      <div class="fin">
	      <span onclick="location.href='/notice/list'">공지사항</span>
	      <span onclick="location.href='/inquiry/list'">고객문의</span>
	      <span onclick="location.href='/admin/login'">관리자 페이지</span>
      </div><!-- .fin -->
      
      </div><!-- .wrap-menu -->
      </aside> <!-- #all_mymenu end -->
      
   </div><!-- .menu -->
   </div><!-- .wrap mx-auto -->