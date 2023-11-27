<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<c:import url="../layout/header.jsp" />
<style>
.test{
	display: flex;
	height: 1600px;
	width: 1116px;
	justify-content: space-between; /* 자식 요소들을 양 끝에 배치 */
	border: 1px solid red;
}
.left{
	display: flex;
	flex-direction: column;
	width: 744px;
	border: 1px solid blue;
}
.right{
	width: 372px;
	border: 1px solid blue;
}
.title{
	display: flex;
	margin-top: 30px;
	justify-content: space-between;
	border: 1px solid coral;
}
.heart{
}
.heart img{
	margin-top: 5px;
	width: 50px;
	height: 30px;
}
.userNickName{
	border:1px solid orange;
}
.carPhoto{
	margin-top: 30px;
	border:1px solid green;
}
.carPhoto img{
	margin-left: 20px;
	width: 700px;
	height: 300px;
}
.review-wrapper{
	display: flex;
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
    width: 50%; /* 평점에 따라 조절 */
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
	justify-content: space-around;
	margin-top: 30px;
	border-bottom: 1px solid;
}

.category div{
	cursor: pointer; 
}

.refund{
	display: none;
}
.caution{
	display: none;
}


</style>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

<script type="text/javascript">

$(function() {

	console.log("이건 잘 나오나?")
	$(".contentButton").click(function(){
		console.log("content클릭됨")
		$(".content").show()
		$(".refund").hide()
		$(".caution").hide()
	})
		$(".refundButton").click(function(){
		console.log("refund 클릭됨")
		$(".refund").show()
		$(".content").hide()
		$(".caution").hide()
	})
		$(".cautionButton").click(function(){
		console.log("caution 클릭됨")
		$(".caution").show()
		$(".content").hide()
		$(".refund").hide()
	})
	//다누 것들 ------------------------------------------
   $("#btnCal").click(function() {
	   console.log("btnCal click")
      $(".calendar").toggle()   
   })
   
   $("#addOption").change(function() {
      
      var totalPrice = $("#totalPrice").text()
      var addPrice = ${car.extraPrice}
      
//       console.log(addPrice)
      
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
// 			endDate: $("#toDate").val(),
			reservPax: $("#carPax").val(),
			addOption: $("#addOption").is(":checked") ? 1 : 0,
// 			merchantUid: rsp.merchant_uid
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

// function getBookedList() {
   
//    $.ajax({
//         type: "post"
//         , url: "/rent/view"
//         , data: {
//          carNo: ${car.carNo},
//       }
//         , dataType: "json"
//         , success: function( res ) {
//          console.log("AJAX 성공")
//          buildCalendar()
//         }
//         , error: function() {
//            console.log("AJAX 실패")

//         }
//    })
   
// }

function loadReview() {
   
    $.ajax({
        type: "get"
        , url: "/rent/review"
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


function getToken() {
	
	console.log("getToken start")
	
	  axios({
		    url: "https://api.iamport.kr/users/getToken",
		    // POST method
		    method: "post", 
		    // "Content-Type": "application/json"
		    headers: { "Content-Type": "application/json" }, 
		    data: {
		      // REST API키
		      imp_key: "2441044643164541", 
		      // REST API Secret
		      imp_secret: "AMk8jwRgIAFwHVMupLUHozRWEEqGlCaCKfr50qmm7n4QJOpvNVTRlGj1QStriq9ZuzNlGfhOsYELviNX"
		    }
		  }).then((data) => {
				console.log("access_token : " + data.access_token)
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
//          amount: $("#totalPrice").text(),            // 금액, 숫자 타입
         amount: 100,            // text 금액
            
         //주문자 정보
         buyer_email: user.user.email,
         buyer_name: user.user.userName,
         buyer_tel: user.user.phone,
         buyer_addr: user.user.address + user.user.addressDetail,
            
          }, function (rsp) { // callback
            //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
            
//           console.log(rsp)
//           console.log(rsp.success)
//           console.log(rsp.merchant_uid)
          
          if (rsp.success) {   
            
           		$.ajax({
					type: "POST"
					, url: "/verifyiamport/" + rsp.imp_uid

           		}).done(function(data) {
					
					if(rsp.paid_amount == data.response.amount){
						console.log("결제 검증")
						console.log("rsp.paid_amount : " + rsp.paid_amount)
						console.log("data.response.amount : " + rsp.paid_amount)
						
						submitBook(rsp)
// 						submit(rsp)
						sendNotification()				
						
						alert("예약이 완료되었습니다")
						
					} else {
						console.log("검증 실패")
					}
				})          
            
          } else {
            alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg)
          }
          
//           if( rsp.success ) {
             
//              sendNotification()
//              submitBook(rsp)
//              alert("예약 완료")
             
//           } else {
//              alert(rsp.error_msg)
//           }
          
          buildCalendar()
         
      })
   })
   

}

</script>


<div class="container">

<!-- 작성 공간 -->
<div class="pageTitle">
<h3 id="pageTitle">대여 상세 보기</h3>
<hr>
</div>
<div class="test">
<div class="left">
<span>왼쪽</span>
<div class="title">
<h2>캠핑카 제목</h2>
<div class="heart">
<img alt="이미지없음" src="/resources/img/heart.png">
</div>
</div>
<div class="userNickName">
<h6>유저닉네임</h6>
</div>
<div class="carPhoto">
<img alt="이미지없음" src="/resources/img/sample-car-photo.png">
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
<span>평균별점 : 00점</span>
</div>
<div class="reviewNum">
<span>리뷰00건</span>
</div>
</div>
<div class="category">
<div class="contentButton">
<span>캠핑카 소개</span>
</div>
<div class="refundButton">
<span>환불 정책</span>
</div>
<div class="cautionButton">
<span>유의 사항</span>
</div>
<div class="reviewButton">
<span>이용후기</span>
</div>

</div>
<div class="content">
콘텐트
</div>
<div class="refund">
환불정책
</div>
<div class="caution">
유의 사항
</div>



</div>

<div class="right">
<span>오른쪽</span>

</div>

</div>

<br>

<hr>

<button id="btnCal" class="btn btn-outline-success">날짜 선택</button>
<div class="calendar" style="display: none;">
<!-- <div class="calendar"> -->
<c:import url="./book.jsp"></c:import>
</div>


<!-- <hr> -->

<%-- <c:forEach items="${list }" var="list"> --%>
<!-- <ul> -->
<%--    <li>대여 게시글 번호 : ${list.rentNo }</li> --%>
<%--    <li>대여 상태 : ${list.rentStatus }</li> --%>
<%--    <li>출발일 : ${list.startDate }</li> --%>
<%--    <li>도착일 : ${list.endDate }</li> --%>
<!-- </ul> -->
<%-- </c:forEach> --%>

<div>
인원 선택 :
<input type="number" name="carPax" id="carPax">

<!-- <select name="carPax" id="carPax"> -->
<!--    <option value="1">1</option> -->
<!--    <option value="2">2</option> -->
<!--    <option value="3">3</option> -->
<!--    <option value="4">4</option> -->
<!--    <option value="5">5</option> -->
<!--    <option value="6">6</option> -->
<!--    <option value="7">7</option> -->
<!--    <option value="8">8</option> -->
<!--    <option value="9">9</option> -->
<!-- </select> -->

</div>

<div>
추가 옵션 : <input type="checkbox" name="addOption" id="addOption" > <p> 6시간 연장 (+ ${car.extraPrice } 원)
</div>


<hr>

출발일 : 
<!-- <span id="fromDate"></span><br> -->
<input type="text" id="fromDate" readonly="readonly" style="border: none;"></input><br>
도착일 : 
<!-- <span id="toDate"></span> -->
<input type="text" id="toDate" readonly="readonly" style="border: none;"></input><br>

<div id="betweenDates">
총 결제 금액 : 
<span id="totalPrice"></span> 원
 ( <span id="totalNights"></span> 박 )
</div>

<hr>

<button class="btn btn-success">문의하기</button> 
<button class="btn btn-success" onclick="requestPay()">결제하기</button> 

<hr>

<div id="reviewList">리뷰 보일곳</div>

</div><!-- .container -->

<c:import url="../layout/footer.jsp" />