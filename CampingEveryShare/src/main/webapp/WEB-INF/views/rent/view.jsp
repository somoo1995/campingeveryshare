<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(function() {
	$("#btnCal").click(function() {
		$(".calendar").show()
	})
	
	$("#datepicker").datepicker('setDate','today')
	
	$("#datepicker").datepicker({
        dateFormat: 'yy-mm-dd' //달력 날짜 형태
            ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
            ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
            ,changeYear: true //option값 년 선택 가능
            ,changeMonth: true //option값  월 선택 가능                
            ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
            ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
            ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
            ,buttonText: "선택" //버튼 호버 텍스트              
            ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
            ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
            ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
            ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
            ,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
            ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
	})
	
})


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

<div class="col-3 mt-3">
<input type="date" class="form-control">
</div>

<input type="text" id="datepicker">

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

<button class="btn btn-success">문의하기</button> 
<button class="btn btn-success">결제하기</button> 

</div><!-- .container -->

<c:import url="../layout/footer.jsp" />