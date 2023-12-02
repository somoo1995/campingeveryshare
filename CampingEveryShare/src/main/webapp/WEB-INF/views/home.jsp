<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="./layout/header.jsp" />

<!-- js 시작 -->
<script type="text/javascript">


$(function(){
  $('#slider-main').slick({
      slide: 'div',        //슬라이드 되어야 할 태그 ex) div, li 
      infinite : true,     //무한 반복 옵션     
      slidesToShow : 1,        // 한 화면에 보여질 컨텐츠 개수
      slidesToScroll : 1,        //스크롤 한번에 움직일 컨텐츠 개수
      speed : 300,     // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
      arrows : true,         // 옆으로 이동하는 화살표 표시 여부
      dots : true,         // 스크롤바 아래 점으로 페이지네이션 여부
      autoplay : true,            // 자동 스크롤 사용 여부
      autoplaySpeed : 5000,         // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
      pauseOnHover : true,        // 슬라이드 이동    시 마우스 호버하면 슬라이더 멈추게 설정
      vertical : false,        // 세로 방향 슬라이드 옵션
//       prevArrow : "<button type='button' class='slick-prev'>Previous</button>",        // 이전 화살표 모양 설정
//       nextArrow : "<button type='button' class='slick-next'>Next</button>",        // 다음 화살표 모양 설정
      prevArrow:"<img class='a-left control-c prev slick-prev' src='/resources/img/left.png'>",
      nextArrow:"<img class='a-right control-c next slick-next' src='/resources/img/right.png'>",
      dotsClass : "slick-dots",     //아래 나오는 페이지네이션(점) css class 지정
      draggable : true,     //드래그 가능 여부 
 
  });
})

$(function(){
  $('#slider-middle').slick({
      slide: 'div',        //슬라이드 되어야 할 태그 ex) div, li 
      infinite : true,     //무한 반복 옵션     
      slidesToShow : 1,        // 한 화면에 보여질 컨텐츠 개수
      slidesToScroll : 1,        //스크롤 한번에 움직일 컨텐츠 개수
      speed : 300,     // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
      arrows : true,         // 옆으로 이동하는 화살표 표시 여부
      dots : true,         // 스크롤바 아래 점으로 페이지네이션 여부
      autoplay : true,            // 자동 스크롤 사용 여부
      autoplaySpeed : 5000,         // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
      pauseOnHover : true,        // 슬라이드 이동    시 마우스 호버하면 슬라이더 멈추게 설정
      vertical : false,        // 세로 방향 슬라이드 옵션
//       prevArrow : "<button type='button' class='slick-prev'>Previous</button>",        // 이전 화살표 모양 설정
//       nextArrow : "<button type='button' class='slick-next'>Next</button>",        // 다음 화살표 모양 설정
      prevArrow:"<img class='a-left control-c prev slick-prev' src='/resources/img/left.png'>",
      nextArrow:"<img class='a-right control-c next slick-next' src='/resources/img/right.png'>",
      dotsClass : "slick-dots",     //아래 나오는 페이지네이션(점) css class 지정
      draggable : true,     //드래그 가능 여부 
 
  });
})

$(function(){
  $('#slider-car').slick({
      slide: 'div',        
      infinite : true,        
      slidesToShow : 1,       
      slidesToScroll : 1,        
      speed : 100,     
      arrows : true,         
      dots : false,         //페이지네이션 제외
      autoplay : true,            
      autoplaySpeed : 10000,        
      pauseOnHover : true, 
      vertical : false,
      prevArrow:"<img class='a-left control-c prev slick-prev' src='/resources/img/left.png'>",
      nextArrow:"<img class='a-right control-c next slick-next' src='/resources/img/right.png'>",
      draggable : true,     //드래그 가능 여부 
  });
})

$(function(){
  $('#slider-zone').slick({
      slide: 'div',        
      infinite : true,        
      slidesToShow : 1,       
      slidesToScroll : 1,        
      speed : 100,     
      arrows : true,         
      dots : false,         //페이지네이션 제외
      autoplay : true,            
      autoplaySpeed : 10000,        
      pauseOnHover : true, 
      vertical : false,
      prevArrow:"<img class='a-left control-c prev slick-prev' src='/resources/img/left.png'>",
      nextArrow:"<img class='a-right control-c next slick-next' src='/resources/img/right.png'>",
      draggable : true,     //드래그 가능 여부 
  });
})

$(function(){
  $('#slider-market').slick({
      slide: 'div',        
      infinite : true,        
      slidesToShow : 1,       
      slidesToScroll : 1,        
      speed : 100,     
      arrows : true,         
      dots : false,         //페이지네이션 제외
      autoplay : true,            
      autoplaySpeed : 10000,        
      pauseOnHover : true, 
      vertical : false,
      prevArrow:"<img class='a-left control-c prev slick-prev' src='/resources/img/left.png'>",
      nextArrow:"<img class='a-right control-c next slick-next' src='/resources/img/right.png'>",
      draggable : true,     //드래그 가능 여부 
  });
})

$(function(){
  $('#slider-recruit').slick({
      slide: 'div',        
      infinite : true,        
      slidesToShow : 1,       
      slidesToScroll : 1,        
      speed : 100,     
      arrows : true,         
      dots : false,         //페이지네이션 제외
      autoplay : true,            
      autoplaySpeed : 10000,        
      pauseOnHover : true, 
      vertical : false,
      prevArrow:"<img class='a-left control-c prev slick-prev' src='/resources/img/left.png'>",
      nextArrow:"<img class='a-right control-c next slick-next' src='/resources/img/right.png'>",
      draggable : true,     //드래그 가능 여부 
  });
})
</script>
<!-- js 끝 -->

<!-- css 시작 -->
<style type="text/css">

/* 이미지 크기*/
.image {
	width: 1300px;
	height: 300px;
    max-width: 100%; /* 이미지가 부모 요소를 벗어나지 않도록 설정 */
    height: auto;    /* 가로 세로 비율 유지 */
}

.image_sm {
	width: 600px;
	height: 400px;
    max-width: 100%; /* 이미지가 부모 요소를 벗어나지 않도록 설정 */
    height: auto;    /* 가로 세로 비율 유지 */
}

.slick-prev {
	left: 25px;
	z-index: 1;
	width: 50px;
	height: 40px;
	opacity: 0.5;
}
.slick-next {
	right: 25px;
	z-index: 1;
	width: 50px;
	height: 40px;
	opacity: 0.5;
}

/* 슬라이드 페이지네이션*/
.slick-dots {
        bottom: 25px;
        z-index: 1;
    }
/* 현재 페이지*/
.slick-dots li.slick-active button:before {
	opacity: 0.5;
	color: #00ff89;
}
/* 다른 페이지*/
.slick-dots li button:before {
	font-size: 15px;
/* 	투명도 */
	opacity: 0.5; 
	color: #E0E0E0;
}

#slider-main {
    width: 100%; /* 슬라이드의 고정된 너비 */
    max-width: 1300px; /* 화면이 작아질 때 슬라이드가 가로로 축소되지 않도록 설정 */
    margin: 0 auto; /* 가운데 정렬을 위한 마진 설정 */
   	width: 1300px;
}

#slider-middle {
    width: 100%; /* 슬라이드의 고정된 너비 */
    max-width: 1300px; /* 화면이 작아질 때 슬라이드가 가로로 축소되지 않도록 설정 */
    margin: 0 auto; /* 가운데 정렬을 위한 마진 설정 */
   	width: 1300px;
}

#slider-car {
    width: 100%; /* 슬라이드의 고정된 너비 */
    max-width: 600px; /* 화면이 작아질 때 슬라이드가 가로로 축소되지 않도록 설정 */
    margin: 0 auto; /* 가운데 정렬을 위한 마진 설정 */
   	width: 600px;
}

#slider-zone {
    width: 100%; /* 슬라이드의 고정된 너비 */
    max-width: 600px; /* 화면이 작아질 때 슬라이드가 가로로 축소되지 않도록 설정 */
    margin: 0 auto; /* 가운데 정렬을 위한 마진 설정 */
   	width: 600px;
}

#slider-market {
    width: 100%; /* 슬라이드의 고정된 너비 */
    max-width: 600px; /* 화면이 작아질 때 슬라이드가 가로로 축소되지 않도록 설정 */
    margin: 0 auto; /* 가운데 정렬을 위한 마진 설정 */
   	width: 600px;
}

#slider-recruit {
    width: 100%; /* 슬라이드의 고정된 너비 */
    max-width: 600px; /* 화면이 작아질 때 슬라이드가 가로로 축소되지 않도록 설정 */
    margin: 0 auto; /* 가운데 정렬을 위한 마진 설정 */
   	width: 600px;
}

.car {
	background-color: #fff;
	min-height: 500px;
	min-width: 400px;
	margin-top: 30px;
	margin-bottom: 30px;
/* 	box-shadow: 5px 5px 20px 0px #5e5e5e; */
}

.zone {
	background-color: #fff;
	min-height: 500px;
	min-width: 400px;
/* 	box-shadow: 5px 5px 20px 0px #5e5e5e; */
	
}

.market {
	background-color: #fff;
	min-height: 500px;
	min-width: 400px;
/* 	box-shadow: 5px 5px 20px 0px #5e5e5e; */
}

.recruit {
	background-color: #fff;
	min-height: 500px;
	min-width: 400px;
/* 	box-shadow: 5px 5px 20px 0px #5e5e5e; */
}

.main {
	padding: 0px;
	width: 1300px;
	max-height: 300px;
}

.container {
	background-color: #fff;
	margin-left: 0px;
	margin-right: 0px;
	padding: 0px;
/* 	width: 1300px; */
	min-width: 1300px;
	max-height: 1600px;
	margin-bottom: 100px;
	align-items: center;
	justify-items: center;
	
	display: grid;
	grid-template-columns: repeat(2, 1fr);
	grid-template-rows: repeat(4, 1fr);
/* 	column-gap: 25px; */
}


.main:nth-child(1) {
 	grid-column: 1 / 3; 
 	grid-row: 1 / 2; 
}


p {
	font-size: 30px;
	font-weight: bold;
	text-align: center;
	margin-top: 10px;
	margin-bottom: 10px;
	color: #3da903;
}

.middle {
  grid-column: 1 / 3; /* 두 번째 행 전체를 차지하도록 설정 */
  grid-row: 2 / 3; /* 두 번째 행에 해당하는 위치로 설정 */
  text-align: center; /* 텍스트 중앙 정렬 */
  margin-top: 40px;
  min-width: 1300px;
/*    box-shadow: 5px 5px 20px 0px #5e5e5e;  */
  
}

</style>
<!-- css 끝 -->

<div class="container">

	<div class="main">
		<div class="slider-main" id="slider-main">
		<div class="image"><img alt="camp1" src="/resources/img/aboutus0.png"></div>
		<div class="image"><img alt="camp2" src="/resources/img/aboutus1.png"></div>
		<div class="image"><img alt="camp3" src="/resources/img/aboutus2.png"></div>
		<div class="image"><img alt="camp4" src="/resources/img/aboutus3.png"></div>
		<div class="image"><img alt="camp5" src="/resources/img/aboutus4.png"></div>
		<div class="image"><img alt="camp5" src="/resources/img/aboutus5.png"></div>
		<div class="image"><img alt="camp5" src="/resources/img/aboutus6.png"></div>
		<div class="image"><img alt="camp5" src="/resources/img/mainme.png"></div>
		</div><!-- slider-div -->
	</div><!-- .main -->

	<div class="middle">
		<div class="slider-middle" id="slider-middle">
		<div class="image"><img alt="camp1" src="/resources/img/notice1.png"></div>
		<div class="image"><img alt="camp1" src="/resources/img/notice2.png"></div>
		<div class="image"><img alt="camp1" src="/resources/img/notice3.png"></div>
		<div class="image"><img alt="camp1" src="/resources/img/notice4.png"></div>
		<div class="image"><img alt="camp1" src="/resources/img/notice5.png"></div>
		<div class="image"><img alt="camp1" src="/resources/img/notice6.png"></div>
		<div class="image"><img alt="camp1" src="/resources/img/notice7.png"></div>
		</div><!-- slider-div -->
	</div>
	
	<div class="car">
	<div>
	<a href="/rent/list" style="text-decoration: none;">
	<p>이런 캠핑카 어때요?</p>
	<p style="font-size: 15px; color: #8c9095;">캠핑카 대여하러 가기</p>
	</div>
	</a>
		<div class="slider-car" id="slider-car">
			<div class="image_sm"><img alt="camp1" src="/resources/img/camcar1.png"></div>
			<div class="image_sm"><img alt="camp1" src="/resources/img/camcar2.png"></div>
			<div class="image_sm"><img alt="camp1" src="/resources/img/camcar3.png"></div>
			<div class="image_sm"><img alt="camp1" src="/resources/img/camcar4.png"></div>
			<div class="image_sm"><img alt="camp1" src="/resources/img/camcar5.png"></div>
		</div><!-- .slider-car -->
	</div><!-- .car -->

	<div class="zone">
	<div>
	<a href="/share/list" style="text-decoration: none;">
	<p>이런곳은 어때요?</p>
	<p style="font-size: 15px; color: #8c9095;">캠핑존 구경하러 가기</p>
	</div>
	</a>
		<div class="slider-zone" id="slider-zone">
			<div class="image_sm"><img alt="camp1" src="/resources/img/share1.png"></div>
			<div class="image_sm"><img alt="camp1" src="/resources/img/share2.png"></div>
			<div class="image_sm"><img alt="camp1" src="/resources/img/share3.png"></div>
			<div class="image_sm"><img alt="camp1" src="/resources/img/share4.png"></div>
			<div class="image_sm"><img alt="camp1" src="/resources/img/share5.png"></div>
		</div>
	</div><!-- .zone -->

	<div class="market">
	<div>
	<a href="/market/list" style="text-decoration: none;">
	<p>아직 쓸만합니다!</p>
	<p style="font-size: 15px; color: #8c9095;">장비 구매하러 가기</p>
	</div>
	</a>
		<div class="slider-market" id="slider-market">
			<div class="image_sm"><img alt="camp1" src="/resources/img/market1.png"></div>
			<div class="image_sm"><img alt="camp1" src="/resources/img/market2.png"></div>
			<div class="image_sm"><img alt="camp1" src="/resources/img/market3.png"></div>
			<div class="image_sm"><img alt="camp1" src="/resources/img/market4.png"></div>
			<div class="image_sm"><img alt="camp1" src="/resources/img/market5.png"></div>
		</div>
	</div><!-- .market -->

	<div class="recruit">
	<div>
	<a href="/group/list" style="text-decoration: none;">
	<p>같이 가실래요?</p>
	<p style="font-size: 15px; color: #8c9095;">파티원 구하러 가기</p>
	</div>
	</a>
		<div class="slider-recruit" id="slider-recruit">
			<div class="image_sm"><img alt="camp1" src="/resources/img/group1.png"></div>
			<div class="image_sm"><img alt="camp1" src="/resources/img/group2.png"></div>
			<div class="image_sm"><img alt="camp1" src="/resources/img/group3.png"></div>
			<div class="image_sm"><img alt="camp1" src="/resources/img/group4.png"></div>
			<div class="image_sm"><img alt="camp1" src="/resources/img/group5.png"></div>
		</div>
	</div><!-- .recruit -->

	
</div> <!-- .container -->


<c:import url="./layout/footer.jsp" />