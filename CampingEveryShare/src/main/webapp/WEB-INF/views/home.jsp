<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="./layout/header.jsp" />

<!-- js 시작 -->
<script type="text/javascript">
$(function(){
  $('#slider-div').slick({
      slide: 'div',        //슬라이드 되어야 할 태그 ex) div, li 
      infinite : true,     //무한 반복 옵션     
      slidesToShow : 1,        // 한 화면에 보여질 컨텐츠 개수
      slidesToScroll : 1,        //스크롤 한번에 움직일 컨텐츠 개수
      speed : 100,     // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
      arrows : true,         // 옆으로 이동하는 화살표 표시 여부
      dots : true,         // 스크롤바 아래 점으로 페이지네이션 여부
      autoplay : true,            // 자동 스크롤 사용 여부
      autoplaySpeed : 10000,         // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
      pauseOnHover : true,        // 슬라이드 이동    시 마우스 호버하면 슬라이더 멈추게 설정
      vertical : false,        // 세로 방향 슬라이드 옵션
//       prevArrow : "<button type='button' class='slick-prev'>Previous</button>",        // 이전 화살표 모양 설정
//       nextArrow : "<button type='button' class='slick-next'>Next</button>",        // 다음 화살표 모양 설정
      prevArrow:"<img class='a-left control-c prev slick-prev' src='/resources/img/left5.png'>",
      nextArrow:"<img class='a-right control-c next slick-next' src='/resources/img/right5.png'>",
      dotsClass : "slick-dots",     //아래 나오는 페이지네이션(점) css class 지정
      draggable : true,     //드래그 가능 여부 
 
  });
})

</script>
<!-- js 끝 -->

<!-- css 시작 -->
<style type="text/css">

.image {
width: 500px;
height: 500px;
}

/* .slick-prev { */
/* 	left: 25px; */
/* } */

/* 이전/이후 버튼*/
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

</style>
<!-- css 끝 -->

<div class="container">
	
	<div style="padding: 0px 50px;">
		<div id="slider-div">
		<div class="image"><img alt="camp1" src="/resources/img/camp1.jpg"></div>
		<div class="image"><img alt="camp2" src="/resources/img/camp2.jpg"></div>
		<div class="image"><img alt="camp3" src="/resources/img/camp3.jpg"></div>
		<div class="image"><img alt="camp4" src="/resources/img/camp4.jpg"></div>
		<div class="image"><img alt="camp5" src="/resources/img/camp5.jpg"></div>
	</div><!-- slider-div -->
	</div><!-- .slick -->

	<div>
	<h1>1. 새로 등록된 캠핑카들을 만나보세요.</h1>
	
	<div>
	<h1>2. 이 달의 캠핑존</h1>
	</div>
	
	<div>
	<h1>3. 중고 장터</h1>
	</div>
	
	<div>
	<h1>4. 우리 모임 자랑</h1>
	</div>	

</div> <!-- .container -->


<c:import url="./layout/footer.jsp" />