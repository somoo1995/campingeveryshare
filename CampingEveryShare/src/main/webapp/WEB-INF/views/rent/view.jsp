<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<style type="text/css">
.star-box {
	/* 별과 별 사이 공백 제거 */
    font-size: 0;
}

.star {
	/* width,height 적용가능하도록 변경 */
	display: inline-block;

	/* 별이 표현되는 영역 크기 */
	width: 25px;
    height: 50px;

	/* 투명한 별 표현 */
	background-image: url(/resources/img/star_empty.png);
	background-repeat: no-repeat;
}

.star_left {
	/* 왼쪽 별 */
	background-position: 0 0;
	background-size: 200%;
/* 	border: 1px solid #ccc; */
}

.star_right {
	/* 오른쪽 별 */
	background-position: 100% 0;
	background-size: 200%;
}

.on {
	/* 채워진 별로 이미지 변경 */
	background-image: url(/resources/img/star_full.png);
}
</style>

<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

<script type="text/javascript">
$(function() {
	
	var idx = 0;
	var rate = 0;	
	
	//별 클릭 이벤트
	$(".star").click(function() {
		
		//클릭된 별이 몇 번째 칸인지 알아내기
		idx = $(this).index();
		
		//모두 투명하게 만들기
		$(".star").removeClass("on")
		
		//클릭이 된 곳까지 채워진 별로 만들기
		for(var i=0; i<=idx; i++) {
			$(".star").eq(i).addClass("on");
		}
		
		rate = (idx+1)/2
		
		console.log("클릭된 별의 위치 : " + idx)
		console.log("점수로 변환 : " + (idx+1)/2)
	})
	
	$("#btnReview").click(function() {
		
		console.log("review click - rate : " + rate)
		
	      $.ajax({
	          type: "post"
	          , url: "/rent/review/write"
	          , data: {
				carNo: ${car.carNo },
	      		content: $("#content").val(),
	      		rate: rate
	          }
	          , dataType: "json"
	          , success: function(  ) {
	             console.log("AJAX 성공")
				$("#content").val('')
				
	          }
	          , error: function() {
	             console.log("AJAX 실패")

	          }
	       })
	})
	
})
</script>


<script type="text/javascript">

$(function() {
	$("#btnCal").click(function() {
		$(".calendar").show()	
	})
	
	$("#addOption").change(function() {
		
		var totalPrice = $("#totalPrice").text()
		var addPrice = 70000
		
		if($(this).is(':checked')){
			console.log("checked")
			
			$("#totalPrice").text(totalPrice *1 + addPrice)
			
		} else {
			console.log("unchecked")
			$("#totalPrice").text(totalPrice*1 - addPrice)
		}
	})
	
})

$(function() {
	
})

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
			value: 2
		})
	).append(
		$("<input>").attr({
			type: "hidden",
			name: "addOption",
			value: 0
		})
	).append(
			$("<input>").attr({
				type: "hidden",
				name: "merchantUid",
				value: rsp.merchant_uid
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
	
// 	$.ajax({
//         type: "post"
//         , url: "/rent/view"
//         , data: {
// 			carNo: ${car.carNo},
// 		}
//         , dataType: "json"
//         , success: function( res ) {
// 			console.log("AJAX 성공")
// 			buildCalendar()
//         }
//         , error: function() {
//            console.log("AJAX 실패")

//         }
// 	})
	
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



IMP.init('imp83448842')

function requestPay() {
	
	var payDate = new Date().toISOString().slice(0, 19).replace(/[-T:/]/g, '')
	console.log(payDate)
	
	getGuestInfo(function(user) {
		
		IMP.request_pay({
			
			pg: "html5_inicis",		//결제 pg 선택
			pay_method: "card",	//결제 방식
	
			merchant_uid: "RC" + "${car.carNo}" + "-" + "payDate",   // 고유 주문 번호
		      
			name: "${car.carName }",	//주문 상품 이름
// 			amount: $("#totalPrice").text(),				// 금액, 숫자 타입
			amount: 1000,				// text 금액
		      
			//주문자 정보
			buyer_email: user.user.email,
			buyer_name: user.user.userName,
			buyer_tel: user.user.phone,
			buyer_addr: user.user.address + user.user.addressDetail,
		      
		    }, function (rsp) { // callback
		      //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
		      
// 		    console.log(rsp)
// 		    console.log(rsp.success)
// 		    console.log(rsp.merchant_uid)
		    
		    if (rsp.success) {   
		      // axios로 HTTP 요청
		      axios({
		        url: "/rent/payment",
		        method: "post",
		        headers: { "Content-Type": "application/json" },
		        data: {
		          impUid: rsp.imp_uid,
		          merchantUid: rsp.merchant_uid
		        }
		      }).then((data) => {
		        // 서버 결제 API 성공시 로직
		      })
		    } else {
		      alert(`결제에 실패하였습니다. 에러 내용: ${rsp.error_msg}`);
		    }
		    
		    
		    
// 		    if( rsp.success ) {
		    	
// 	 			sendNotification()
// 	 			submitBook(rsp)
// 	 			alert("예약 완료")
	 			
// 		    } else {
// 		    	alert(rsp.error_msg)
// 		    }
		    
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

게시글 번호 : ${car.carNo } <br>
차이름 : ${car.carName } <br>
호스트 : ${car.userId } <br>
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

<button id="btnCal" class="btn btn-outline-success">날짜 선택</button>
<div class="calendar" style="display: none;">
<!-- <div class="calendar"> -->
<c:import url="./book.jsp"></c:import>
</div>


<!-- <hr> -->

<%-- <c:forEach items="${list }" var="list"> --%>
<!-- <ul> -->
<%-- 	<li>대여 게시글 번호 : ${list.rentNo }</li> --%>
<%-- 	<li>대여 상태 : ${list.rentStatus }</li> --%>
<%-- 	<li>출발일 : ${list.startDate }</li> --%>
<%-- 	<li>도착일 : ${list.endDate }</li> --%>
<!-- </ul> -->
<%-- </c:forEach> --%>

<div>
인원 선택 :
<select name="carPax">
	<option value="1">1</option>
	<option value="2">2</option>
	<option value="3">3</option>
	<option value="4">4</option>
	<option value="5">5</option>
	<option value="6">6</option>
	<option value="7">7</option>
	<option value="8">8</option>
	<option value="9">9</option>
</select>
</div>

<div>
추가 옵션 : <input type="checkbox" name="addOption" id="addOption"> <p> 6시간 연장 (+70,000원)
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

<div class="col-8 mx-auto" id="review">

<div class="form-group mb-3">

	<div class="star-box">
	<span class="star star_left"></span>
	<span class="star star_right"></span>
	<span class="star star_left"></span>
	<span class="star star_right"></span>
	<span class="star star_left"></span>
	<span class="star star_right"></span>
	<span class="star star_left"></span>
	<span class="star star_right"></span>
	<span class="star star_left"></span>
	<span class="star star_right"></span>
	</div>

<%-- 	<label class="form-label mb-0" for="content" style="font-weight: bold;">${loginId }</label><br> --%>
	<textarea class="form-control" rows="4" name="content" id="content" placeholder="리뷰 작성하세요" style="resize: none;"></textarea>
	<div class="text-center mt-3"><button class="btn btn-dark btn-sm" id="btnReview">작성</button></div>
</div>

</div>

<div id="reviewList"></div>

</div><!-- .container -->

<c:import url="../layout/footer.jsp" />