<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />


<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">

$(function() {
	$("#btnCal").click(function() {
		$(".calendar").show()
	})
})

IMP.init('imp83448842')

function requestPay() {
	
	IMP.request_pay({
		
		pg: "html5_inicis",		//결제 pg 선택
		pay_method: "card",	//결제 방식

		merchant_uid: "ord0001",   // 고유 주문 번호
	      
		name: "노르웨이 회전 의자",	//주문 상품 이름
		amount: 64900,				// 금액, 숫자 타입
	      
		//주문자 정보
		buyer_email: "gildong@gmail.com",
		buyer_name: "홍길동",
		buyer_tel: "010-4242-4242",
		buyer_addr: "서울특별시 강남구 신사동",
		buyer_postcode: "01181"
	      
	    }, function (rsp) { // callback
	      //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
	      
	      console.log(rsp)
	      
	      // 결제 정보를 이용하여 우리가 개발한
	      //서버로 전송해주어야 한다
	      //	-> 결제 후 처리
	      
	})
}

</script>


<div class="container">

<!-- 작성 공간 -->
<div class="pageTitle">
<h3 id="pageTitle">대여 상세 보기</h3>
<hr>
</div>

게시글 번호 : ${car.carNo } <br>
차이름 : ${car.carName } <br>
금액 : ${car.price } / 1박 <br>
지역 : ${car.location } ${car.area } ${car.areaDetail } <br>
크기 : ${car.carSize } <br>
인원 : ${car.carPax } (침대 : ${car.carSpax }) <br>
<br>
전기 : ${car.carElec } <br>
물 : ${car.carWater } <br>
테이블 : ${car.carTable } <br>
카운터 : ${car.carCounter } <br>
주방 : ${car.carKitchin } <br>
온도 : ${car.carTemp } <br>
샤워 : ${car.carShower } <br>
화장실 : ${car.carToilet } <br>
<br>
애완동물 : ${car.carPet } <br>
흡연 : ${car.carSmoke } <br>

내용 : ${car.content } <br>
<br>

<hr>

<!-- <table id="calendar" align="center"> -->
<button id="btnCal" class="btn btn-outline-success">날짜 선택</button>
<!-- <div class="calendar" style="display: none;"> -->
<div class="calendar">
<c:import url="./book.jsp"></c:import>
</div>


<hr>

<c:forEach items="${list }" var="list">
<ul>
	<li>대여 게시글 번호 : ${list.rentNo }</li>
	<li>대여 상태 : ${list.rentStatus }</li>
	<li>출발일 : ${list.startDate }</li>
	<li>도착일 : ${list.endDate }</li>
</ul>
</c:forEach>

<hr>

<div id="betweenDates">
총 결제 금액 : 
<span id="totalPrice"></span> 원
</div>

<hr>

<button class="btn btn-success">문의하기</button> 
<button class="btn btn-success" onclick="requestPay()">결제하기</button> 

</div><!-- .container -->

<c:import url="../layout/footer.jsp" />