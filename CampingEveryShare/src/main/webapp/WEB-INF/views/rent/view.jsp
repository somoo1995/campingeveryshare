<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="../layout/header.jsp" />
<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
.test{
   display: flex;
   width: 1300px;
   border: 1px solid #BDBDBD;
   height: auto; /* 높이를 자동으로 설정 */
   border-radius: 30px;
}
.left{

/*    background-color: pink; */

    display: flex;
    flex-direction: column;
    width: 900px;
    height: auto;
    border-right: 1px solid #BDBDBD;
}

.title{
   display: flex;
/*    margin-top: 10px; */
   justify-content: space-between;

   border-bottom: 1px solid #BDBDBD;

   min-height: 60px;
    padding: 20px; 
/*    margin-left: 20px; */
   font-weight: bold;
   align-items: center;
}
.title h2{
}
.heart{
   margin-right: 10px;
}
.heart img{
   margin-top: 5px;
   width: 30px;
   height: 30px;
   cursor: pointer;
}
/* .userNickName{ */
/* } */
.carPhoto{
   margin-top: 30px;
}
.carPhoto img{
   margin-left: 20px;
   width: 700px;
   height: 300px;
}
.review-wrapper{
   display: flex;
   border-top: 1px solid #BDBDBD;
   padding-top: 10px;
   justify-content: center;
}
.reviewStar img {
    width: 30px; /* 이미지의 너비 */
    height: auto; /* 높이는 비율에 맞게 자동 조절 */
}
.reviewStar {
    position: relative;
    margin-left: 30px;
    width: 150px; /* 별 5개의 총 너비 */
    height: 20px; /* 별 이미지의 높이 */
    font-size: 0;
}

.back-star, .full-star {
    display: flex;
    position: absolute;
    top: 0;
    left: 0;
}

.full-star {
    overflow: hidden;
    width: 0%; /* 평점에 따라 조절 */
    z-index: 2; /* 채워진 별이 빈 별 위에 오도록 z-index 설정 */
}

.back-star {
    z-index: 1; /* 빈 별은 채워진 별보다 낮은 z-index를 가짐 */
}
.reviewNum{
   margin-left: 20px;
   font-size: 1em;
}
.category{
   display: flex;
/*    justify-content: space-around; */
   margin-top: 19px;
   border-bottom: 1px solid #BDBDBD;
   position: sticky;
   top: 0;
   z-index: 999; /* 다른 요소들 위에 표시되도록 함 */
   background-color: white; /* 배경색 지정 */
   padding: 0px; /* 필요에 따라 패딩 추가 */
/*    box-shadow: 0 2px 5px rgba(0,0,0,0.2);  */

	font-size: 24px;
/* 	background-color: #efefef; */
}
.category div{
	width: 900px;
/* 	border-right: 1px solid; */
	height: 50px;
	text-align: center;
	display: flex;
	justify-content: center;
	align-items: center;
	border-top: 1px solid #BDBDBD;
}

.category div{
   cursor: pointer; 
}
.category div span{
   display: block;
   font-weight: 600;
   margin-top: 5px;
   margin-right: 5px;
}

.content{
   height: auto;
   padding: 40px;
   font-size: 20px;   
}
.refund{
   height: auto;
}
.refund p:nth-of-type(1) {
    color: red;
}
.caution{
   height: auto;
}
.right{

   width: 400px;

    /* margin-left: 10px; */
    display: flex;
    flex-direction: column
}
.right h3:nth-of-type(1){
   margin-bottom: -5px;
}
.right ul {
    list-style-type: disc; /* 동그라미 불릿 */
    padding-top: 10px;
}
.carOptions{

	display: flex;
	flex-wrap: wrap;
	padding: 10px;

}
.option {
    text-align: center; /* 텍스트 중앙 정렬 */
    margin : 5px;
}

.option-icon {
    width: 50px; /* 이미지 크기 조절 */
    display: block; /* 블록 요소로 설정하여 줄바꿈 */
    margin: 0 auto; /* 수평 중앙 정렬 */
    
}

.option-text {
    margin-top: 10px; /* 이미지와 텍스트 사이 간격 조절 */
}
.book {
    padding: 20px; /* 패딩 */
    background-color: #f8f9fa; /* 배경색 */
    font-weight: 600;
    font-size: 1.2em;
    border-bottom: 1px solid #BDBDBD;
}

.calendar {
    width: 100%; /* 캘린더 너비 */
}

.passengerSelect, .additionalOptions {
    display: flex;
    align-items: center; /* 세로 중앙 정렬 */
}

input[type="number"] {
    margin-left: 10px; /* 인풋과 레이블 간 간격 */
}

.review-title span{
   font-weight: 600;
   font-size: 1.5em;
   margin-left: 300px;
}
.selectDetail{
   display: flex;
}
.reservation_title h2{

/* 	margin-left: 105px; */
/* 	margin-bottom: -10px; */
/* 	margin-top: -31px; */
	min-height: 97px;

    display: flex;
    justify-content: center;
    align-items: center;
    border-bottom: 1px solid #BDBDBD;
    font-weight: bold;
    border-top: 1px solid #BDBDBD;
    font-size: 40px;
}
.reqButton{

	text-align: center;
	margin-bottom: 20px;

}

.reqButton a {
    text-decoration: none; /* 밑줄 없애기 */
    color: white; /* 링크의 텍스트 색상을 검은색으로 변경 */
    font-size: 20px;
    font-weight: bold;
}

.details {

	min-height: 97px;
	border-bottom: 1px solid #BDBDBD;
	display: flex;
    align-items: center;
	justify-content: center;
	background-color: #ebffeb;
	border-top-right-radius: 30px;
}

/* .head_sm { */
/* 	min-height: 210px; */
/* } */

.option-title {
	min-height: 97px;
	font-weight: bold;
	display: flex;
	justify-content: center;
	align-items: center;
	border-bottom: 1px solid #BDBDBD;
	background-color: #ebffeb;
}

.contentButton .refundButton .cautionButton .reviewButton {
	width: 225px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.contentButton  {
	border-right: 1px solid #BDBDBD;
}

.refundButton {
	border-right: 1px solid #BDBDBD;
}

.cautionButton {
	border-right: 1px solid #BDBDBD;
}

.reviewButton {
	border-right: 1px solid #BDBDBD;
}

.bookInfo {
	padding: 20px;
	font-size: 20px;
}

.content {
	border-bottom: 1px solid #BDBDBD;
}

.p_style {
	padding: 40px;
	font-size: 20px;
}

.rentList {
	display: flex;

    justify-content: center;
    align-items: center;
    padding: 40px;
    font-size: 20px;
}

</style>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8dbde9a5763083fbca31c3f1098a1682&libraries=services"></script>

<script type="text/javascript">

var secondElement;
$(function() {
   loadReview()
   var area = "${car.areaDetail}";
   var parts = area.split("#"); // '#'을 기준으로 문자열을 나눔
   secondElement = parts[1]; // 배열의 두 번째 요소를 선택 (인덱스는 0부터 시작)

   console.log(secondElement); // '서울 성동구 서울숲길 17'이 출력될 것임
   
   console.log(area);   




var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = {
                center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };  

        // 지도를 생성합니다    
        var map = new kakao.maps.Map(mapContainer, mapOption); 

        // 주소-좌표 변환 객체를 생성합니다
        var geocoder = new kakao.maps.services.Geocoder();

        // 주소로 좌표를 검색합니다
        geocoder.addressSearch(secondElement, function(result, status) {

            // 정상적으로 검색이 완료됐으면 
             if (status === kakao.maps.services.Status.OK) {

                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                // 결과값으로 받은 위치를 마커로 표시합니다
                var marker = new kakao.maps.Marker({
                    map: map,
                    position: coords
                });

                // 인포윈도우로 장소에 대한 설명을 표시합니다
                var infowindow = new kakao.maps.InfoWindow({
                    content: '<div style="width:150px;text-align:center;padding:6px 0;">픽업위치</div>'
                });
                infowindow.open(map, marker);

                // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                map.setCenter(coords);
            } 
        }); 
   var reviewAverage = $('.reviewAverage span').data("no");
   console.log("평균 별점 : ",reviewAverage);
   var starWidth = reviewAverage/5 * 100;
   console.log(starWidth);
   $('.full-star').css("width", starWidth + "%");
   
   $(".contentButton").click(function(){
      console.log("content클릭됨")
      var target = $($(this).attr('href'));
      if(target.length){
         var scrollTo = target.offset().top;
      }
      $('body,html').animate({
         scrollTop: scrollTo
      },200);
      $('.contentButton').css("background-color", "forestgreen");
      $('.refundButton').css("background-color", "white");
      $('.cautionButton').css("background-color", "white");
      $('.reviewButton').css("background-color", "white");
   })
      $(".refundButton").click(function(){
      console.log("refund 클릭됨")
      var target = $($(this).attr('href'));
      if(target.length){
         var scrollTo = target.offset().top;
      }
      $('body,html').animate({
         scrollTop: scrollTo
      },200);
      $('.refundButton').css("background-color", "forestgreen");
      $('.contentButton').css("background-color", "white");
      $('.cautionButton').css("background-color", "white");
      $('.reviewButton').css("background-color", "white");

      
   })
      $(".cautionButton").click(function(){
      console.log("caution 클릭됨")
      var target = $($(this).attr('href'));
      if(target.length){
         var scrollTo = target.offset().top;
      }
      $('body,html').animate({
         scrollTop: scrollTo
      },200);
      $('.cautionButton').css("background-color", "forestgreen");
      $('.contentButton').css("background-color", "white");
      $('.reviewButton').css("background-color", "white");
      $('.refundButton').css("background-color", "white");

   })
   $(".reviewButton").click(function(){
      console.log("reivew 클릭됨")
      var target = $($(this).attr('href'));
      if(target.length){
         var scrollTo = target.offset().top;
      }
      $('body,html').animate({
         scrollTop: scrollTo
      },200);
      $('.reviewButton').css("background-color", "forestgreen");
      $('.contentButton').css("background-color", "white");
      $('.cautionButton').css("background-color", "white");
      $('.refundButton').css("background-color", "white");
   })
   
   $(".heart img").click(function(){
      console.log("하트버튼 클릭됨")
      var clickedImg = $(this);
      var parentDiv = $(this).closest('.heart');
      var userId = parentDiv.data("id");
      if(!userId){
         alert("로그인이 필요한 서비스입니다.")
         return;
      }
      var carNo = parentDiv.data("no");
      $.ajax({
         type:"post"
        ,url: "/rent/heart"
        ,data:{
           userId: userId,
           heartNo: carNo
        }
             ,success: function(res){
           console.log("/rent/heart AJAX 성공");
           console.log(res);
           // 여기에서 이미지 src 변경
           if(res === 'done') { // 가정: 서버가 'added' 상태를 반환
               clickedImg.attr("src", "/resources/img/heart.png");
           } else if(res === 'cancel') { // 가정: 서버가 'removed' 상태를 반환
               clickedImg.attr("src", "/resources/img/heart_2.png");
           }
       },error: function(res){
              console.log("/rent/heart AJAX 실패")
           }
      })
   })
   //다누 것들 ------------------------------------------
    $("#btnCal").click(function() {
         console.log("btnCal click")
         $(".calendar").toggle()   
      })
      
      $("#addOption").change(function() {
         
         var totalPrice = $("#totalPrice").text()
         var addPrice = ${car.extraPrice}
         
//          console.log(addPrice)
         
         if($(this).is(':checked')){
            console.log("checked")
            $("#totalPrice").text(totalPrice *1 + addPrice)
            
         } else {
            console.log("unchecked")
            $("#totalPrice").text(totalPrice*1 - addPrice)
         }
      })
      
   })


   function submit(rsp) {
      
      console.log("carNo: " + ${car.carNo })

      $.ajax({
         type: "post"
         , url: "/rent/book"
         , data: {
            carNo: ${car.carNo },
            startDate: startDate,
//             endDate: $("#toDate").val(),
            reservPax: $("#carPax").val(),
            addOption: $("#addOption").is(":checked") ? 1 : 0,
//             merchantUid: rsp.merchant_uid
         }
         , dataType: "json"
         , success: function( res ) {
            console.log("AJAX 성공 - /rent/book")
            $("#carPax").val('')
            addOption: $("#addOption").prop("checked", false)
         }
         , error: function() {
            console.log("AJAX 실패")
         }
      })
      
   }

   function submitBook(rsp) {
      $form = $("<form>").attr({
         action: "/rent/book",
         method: "post"
      }).append(
         $("<input>").attr({
            type: "hidden",
            name: "carNo",
            value: "${car.carNo}"
         })
      ).append(
         $("<input>").attr({
            type: "hidden",
            name: "startDate",
            value: firstSelectedDate
         })
      ).append(
         $("<input>").attr({
            type: "hidden",
            name: "endDate",
            value: secondSelectedDate
         })
      ).append(
         $("<input>").attr({
            type: "hidden",
            name: "reservPax",
            value: $("#carPax").val()
         })
      ).append(
         $("<input>").attr({
            type: "hidden",
            name: "addOption",
            value: $("#addOption").is(":checked") ? 1 : 0
         })
      ).append(
            $("<input>").attr({
               type: "hidden",
               name: "merchantUid",
               value: rsp.merchant_uid
            })
      ).append(
            $("<input>").attr({
                type: "hidden",
                name: "amount",
                value: rsp.paid_amount
             })
       )
      $(document.body).append( $form )
      $form.submit()

   }


   function sendNotification() {
      
       $.ajax({
           type: "post"
           , url: "/alert/sendnotification"
           , data: {
              userId: "${car.userId}",
              boardCate: 1,
              boardNo: ${car.carNo },
              content: 4
           }
           , dataType: "json"
           , success: function(  ) {
              console.log("send Notification - AJAX 성공")

           }
           , error: function() {
              console.log("AJAX 실패")

           }
        })
      
   }

   function loadReview() {
      
       $.ajax({
           type: "get"
           , url: "/review/list"
           , data: {
            carNo: ${car.carNo }
           }
           , dataType: "html"
           , success: function( res ) {
              console.log("AJAX 성공")
            $("#reviewList").html(res)
           }
           , error: function() {
              console.log("AJAX 실패")

           }
        })
   }

   function getGuestInfo(callback) {
      
      $.ajax({
           type: "post"
           , url: "/rent/user"
           , data: {
         }
           , dataType: "json"
           , success: function( res ) {
            console.log("AJAX 성공")
            callback(res)
            
            console.log(res)
            console.log(res.user.userName)
            
           }
           , error: function() {
              console.log("AJAX 실패")

           }
      })
      
   }


   IMP.init('imp83448842')

   function requestPay() {
      
      var payDate = new Date().toISOString().slice(0, 19).replace(/[-T:/]/g, '')
      console.log(payDate)
      
      getGuestInfo(function(user) {
         
         IMP.request_pay({
            
            pg: "html5_inicis",      //결제 pg 선택
            pay_method: "card",   //결제 방식
      
            merchant_uid: "RC" + "${car.carNo}" + "-" + payDate,   // 고유 주문 번호
               
            name: "${car.carName }",   //주문 상품 이름
//             amount: $("#totalPrice").text(),            // 금액, 숫자 타입
            amount: 100,            // text 금액
               
            //주문자 정보
            buyer_email: user.user.email,
            buyer_name: user.user.userName,
            buyer_tel: user.user.phone,
            buyer_addr: user.user.address + user.user.addressDetail,
               
             }, function (rsp) { // callback
               //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
               
//              console.log(rsp)
//              console.log(rsp.success)
//              console.log(rsp.merchant_uid)
             
             if (rsp.success) {   
               
                  $.ajax({
                  type: "POST"
                  , url: "/verify/" + rsp.imp_uid

                    }).done(function(data) {
                  
                  if(rsp.paid_amount == data.response.amount){
                     console.log("결제 검증")
                     console.log("rsp.paid_amount : " + rsp.paid_amount)
                     console.log("data.response.amount : " + rsp.paid_amount)
                     
                     submitBook(rsp)
//                      submit(rsp)
                     sendNotification()            
                     
                     alert("예약이 완료되었습니다")
                     
                  } else {
                     console.log("검증 실패")
                  }
               })          
               
             } else {
               alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg)
             }
                       
             buildCalendar()
            
         })
      })
      

   }


</script>


<div class="container">

<!-- 작성 공간 -->
<div class="pageTitle">
<h3 style="color: forestgreen; font-weight: 600; font-size: 40px; margin-bottom: 20px;">대여 게시글</h3>
<!-- <hr> -->
</div>
<div class="test">
<div class="left">
<!-- <div class="head_sm"> -->
<div class="title">
<h2 style= "font-size: 40px;"><span style="font-weight: 500; color: #008205;">${car.userId }</span>님의 ${car.carName }</h2>
<div 
data-id="${sessionScope.loginId }"
data-no="${car.carNo }" class="heart">
<c:if test="${target.heart == 1}">
<img alt="이미지없음" src="/resources/img/heart.png">
</c:if>
<c:if test="${target.heart == 0}">
<img alt="이미지없음" src="/resources/img/heart_2.png">
</c:if>
</div>
</div>
<!-- <div class="userNickName"> -->
<%-- <h6 style="font-size: 20px; font-weight: bold;"> ${car.userId }</h6> --%>
<!-- </div> -->
<div class="carPhoto">
<img alt="이미지없음" src="${pageContext.request.contextPath}/upload/${target.file.storedName}">
</div>
<div class="review-wrapper">
<div class="reviewStar">
<div class="back-star">
<img alt="이미지없음" src="/resources/img/star_empty.png">
<img alt="이미지없음" src="/resources/img/star_empty.png">
<img alt="이미지없음" src="/resources/img/star_empty.png">
<img alt="이미지없음" src="/resources/img/star_empty.png">
<img alt="이미지없음" src="/resources/img/star_empty.png">
</div>
<div class="full-star" >
<img alt="이미지없음" src="/resources/img/star_full.png">
<img alt="이미지없음" src="/resources/img/star_full.png">
<img alt="이미지없음" src="/resources/img/star_full.png">
<img alt="이미지없음" src="/resources/img/star_full.png">
<img alt="이미지없음" src="/resources/img/star_full.png">
</div>
</div>
<div class="reviewAverage">
<span style="font-size: 20px; margin-left: 10px;" data-no="${target.reviewInfo.AVEARGE_RATE}">평균 별점: ${target.reviewInfo.AVEARGE_RATE}점</span>
</div>
<div class="reviewNum">
<span style="font-size: 20px; margin-left: 10px;">이용 후기: ${target.reviewInfo.REVIEW_NUM}건</span>
</div>
</div>
<div class="category">
<div href="#content" class="contentButton">
<span>캠핑카 소개</span>
</div>
<div href="#refund" class="refundButton">
<span style="font-weight: bold;">환불 정책</span>
</div>
<div href="#caution" class="cautionButton">
<span>유의 사항</span>
</div>
<div href="#reviewList" class="reviewButton">
<span>이용후기</span>
</div>

</div><!-- .category -->

<div id="map" style="width:100%;height:400px;"></div>  
<div style="padding: 0px; overflow: auto;" id="content" class="content">

${car.content }
</div>
<div id="refund" class="refund">
<div>
<h3 style="border-bottom: 1px solid #BDBDBD;

	padding: 20px;
	text-align: center;
	font-weight: bold;
	font-size: 24px;
	background-color: forestgreen;">환불 정책</h3>

<!-- <hr> -->

<div class="p_style">
<p>이용당일(첫 날) 이후에 환불 관련 사항은 호스트에게 직접 문의하셔야 합니다.</p>
<br>
<p>이용 8일 전     총 금액의 100% 환불</p>
<p>이용 7일 전     총 금액의 100% 환불</p>
<p>이용 6일 전     총 금액의 100% 환불</p>
<p>이용 5일 전     총 금액의 100% 환불</p>
<p>이용 4일 전     총 금액의 100% 환불</p>
<p>이용 3일 전     총 금액의 80% 환불</p>
<p>이용 2일 전     총 금액의 50% 환불</p>
<p>이용 전날     총 금액의 30% 환불</p>
<p>이용 당일     총 금액의 10% 환불</p>
</div>
<hr>
</div>
</div>
<div id="caution" class="caution">
<h3 style="border-bottom: 1px solid #BDBDBD;

	padding: 20px;
	text-align: center;
	font-weight: bold;
	font-size: 24px;
	background-color: forestgreen;">유의사항</h3>

<!-- <hr> -->
<div style="padding: 40px; font-size: 20px;">
<ol>
<li>캠핑카 반납시에는 인계 받을때 상태 그대로 반납해야 합니다.(부담금 50000원)</li>
<li>사용중에 문제가 있다면 꼭 차주분께 먼저 전화로 알려주시기 바랍니다.</li>
<li>꼭 사용하시고 쓰레기처리는 깔끔하게 해주세요.</li>
<li>이용중 교통사고 발생시 꼭 CampingEveryShare로 먼저 전화 주십시오.</li>
<li>과도한 중량의 적재물은 사고를 유발합니다 항상 무게분산을 시켜주세요.</li>
</ol>
</div>
</div>
<!-- <hr> -->
<div class="review-title">
<h3 style="border-bottom: 1px solid #BDBDBD;

	padding: 20px;
	text-align: center;
	font-weight: bold;
	font-size: 24px;
	background-color: forestgreen;">이용 후기</h3>

</div>
<div id="reviewList" class="reviewList">
</div>

</div><!-- .left -->

<div class="right">
<div class="detailInfo" style="border-bottom: 1px solid #BDBDBD; min-height: 210px;">
<div class="details">
<h3 style="font-weight: bold; font-size: 40px;">세부사항</h3>
</div>

<div style="font-size: 20px;">
<ul>
<c:set var="areaDetails" value="${fn:split(car.areaDetail, '#')}" />
<li>대여장소: ${areaDetails[1]} ${areaDetails[2]}</li>
<c:if test="${car.carSize == 1 }">
<li>차량 유형 : 소형</li>
</c:if>
<c:if test="${car.carSize == 2 }">
<li>차량 유형 : 중형</li>
</c:if>
<li>탑승 인원 : 최대 ${car.carPax }명</li>
<li>취침 인원 : 최대 ${car.carSpax }명</li>
<li>침대수 : ${car.carBeds }개</li>
</ul>
</div>

</div>
<div class="option-title">
<h3 style="font-weight: bold; font-size: 40px;">보유 옵션</h3>
</div><!-- .option-title -->
<div class="carOptions">
    <c:if test="${car.carElec == 1}">
        <div class="option">
            <img src="/resources/img/elec.png" alt="전기" class="option-icon">
            <span class="option-text">전기</span>
        </div>
    </c:if>
    <c:if test="${car.carWater == 1}">
        <div class="option">
            <img src="/resources/img/water.png" alt="물" class="option-icon">
            <span class="option-text">물</span>
        </div>
    </c:if>
    <c:if test="${car.carTable == 1}">
        <div class="option">
            <img src="/resources/img/table.png" alt="테이블" class="option-icon">
            <span class="option-text">테이블</span>
        </div>
    </c:if>
    <c:if test="${car.carSink == 1}">
        <div class="option">
            <img src="/resources/img/sink.png" alt="싱크대" class="option-icon">
            <span class="option-text">싱크대</span>
        </div>
    </c:if>
    <c:if test="${car.carKitchen == 1}">
        <div class="option">
            <img src="/resources/img/kitchen.png" alt="주방가전" class="option-icon">
            <span class="option-text">주방가전</span>
        </div>
    </c:if>
    <c:if test="${car.carTemp == 1}">
        <div class="option">
            <img src="/resources/img/hitCool.png" alt="난방" class="option-icon">
            <span class="option-text">난방</span>
        </div>
    </c:if>
    <c:if test="${car.carShower == 1}">
        <div class="option">
            <img src="/resources/img/shower.png" alt="샤워" class="option-icon">
            <span class="option-text">샤워</span>
        </div>
    </c:if>
    <c:if test="${car.carToilet == 1}">
        <div class="option">
            <img src="/resources/img/toilet.png" alt="화장실" class="option-icon">
            <span class="option-text">화장실</span>
        </div>
    </c:if>
    <c:if test="${car.carPet == 1}">
        <div class="option">
            <img src="/resources/img/pet.png" alt="애견동반" class="option-icon">
            <span class="option-text">애견동반</span>
        </div>
    </c:if>
    <c:if test="${car.carSmoke == 1}">
        <div class="option">
            <img src="/resources/img/smoke.png" alt="흡연가능" class="option-icon">
            <span class="option-text">흡연가능</span>
        </div>
    </c:if>
</div>
<br>
<div class="reservation_title">
<h2 style="margin: 0px; background-color: #ebffeb;">예약하기</h2>
</div>
<div class="book d-flex flex-column align-items-start">

   <div class="selectDetail">
   <div class="selectDate">
      <button id="btnCal" class="btn btn-outline-success mb-3" style="margin-right:35px;">날짜 선택</button>
   </div>
    <div class="passengerSelect mb-3">
        인원 선택 : <input type="number" name="carPax" id="carPax" class="form-control w-auto" placeholder="0" min="0" max="${car.carSpax }">
    </div>

   </div>
       <div class="calendar mb-3" style="display: none;">
        <c:import url="./book.jsp"></c:import>
    </div>
    
    <div class="mb-3">
        추가 옵션 : 
        <input type="checkbox" name="addOption" id="addOption">
        <span>6시간 연장 (+ ${car.extraPrice} 원)</span>
    </div>
    <hr>
</div>

<div class="bookInfo">
<span>출발일 : <input type="text" id="fromDate" readonly="readonly" style="border: 0.5px solid #F2F2F2;"></input><br></span>
<br>
<span>도착일 : <input type="text" id="toDate" readonly="readonly" style="border: 0.5px solid #F2F2F2;"></input><br></span>
<br>
<div id="betweenDates">
총 결제 금액 : 
<span id="totalPrice"></span> 원
 ( <span id="totalNights"></span> 박 )
</div>

</div>
<div class="reqButton">
<button style="margin-right: 10px;" class="btn btn-success"><a href="/message/list?boardNo=${car.carNo }&boardCate=1&receiverId=${car.userId}&title=${car.carName}&nick=${car.userId}&profile=3">문의하기</a></button> 
<button style="font-weight: bold; font-size: 20px;" class="btn btn-success" onclick="requestPay()">결제하기</button> 

</div>
</div>

</div>




</div><!-- .container -->

<c:import url="../layout/footer.jsp" />