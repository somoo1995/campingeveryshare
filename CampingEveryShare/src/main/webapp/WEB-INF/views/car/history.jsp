<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
.noneHistory{
	text-align: center;
	margin-top: 150px;
}
.noneHistory h4{
	color: gray;
}

.history-wrap{
	border: 1px solid #D8D8D8;
	width: 1250px;
	height: 300px;
	display: flex;
	background-color: #D8D8D8;
	margin-bottom: 20px;
}
.left-wrap{
	display: flex;
	flex-direction: column;
}
.carStatusHistory{
	width: 150px;
	height: 50px;
	text-align: center;

}
.carStatusHistory span{
	color: gray;
	font-weight: bold;
	font-size: 1.7em;
}
.carImgHistory{
	border: 1px solid;
	width: 230px;
	height: 230px;
	margin-top: 15px;
	background-color: blue;
	text-align: center;
}
.carImgHistory img{
	width: 230px;
	height: 230px;
}


.userProfile{
	position: relative;
	width: 250px;
	height: 299px;
	margin-left: auto;
	background-color: #1ABA00;
}
.userImg{
	position: absolute;
	left: 25px;
	top: 0;

	
}
.userImg img{
	width: 200px;
	height: 200px;
	border-radius: 70%;
	margin-top: 20px;
}
.userNick{
	position: absolute;
	top: 230px;
	left: 0;
	width: 100%;
	text-align: center;
}
.userNick span{
	font-size: 1.7em;
	font-weight: bold;
	color: white;
}

.middle-wrap{
	display: flex;
	flex-direction: column;
}
.carDate{
	width: 650px;
	height: 50px;
	margin-left: 35px;
	text-algin: center;
}

.carDate span{
	font-weight: bold;
	font-size: 1.2em;
	color: gray;
	margin-left: 20px;
}
.carNumber{
	width: 200px;
	height: 50px;
	margin-top: 30px;
	margin-left: 30px;
}
.carNumber span{
	font-weight: bold;
	font-size: 1.9em;
	color: black;
}
.carPrice{
	width: 200px;
	height: 50px;
	margin-left: 30px;
	margin-top: 30px;
}
.carPrice span{
	font-weight: 500;
	font-size: 1.3em;
}
.carPrice-wrap {
  position: relative;
}
.messageSend {
  position: absolute;
  left: 275px; /* 오른쪽으로 100px 떨어진 위치 */
  top: 100px; /* 위쪽으로 100px 떨어진 위치 */
  width: 200px;
  height: 50px;
}

.messageSend button{
	background-color: #04B404;
	width: 130px;
	border: none;
}

.messageSend button:hover{
	background-color: #088A08;
}
.cancel {
  position: absolute;
  left: 430px; /* 오른쪽으로 100px 떨어진 위치 */
  top: 100px; /* 위쪽으로 100px 떨어진 위치 */
  width: 200px;
  height: 50px;
}

.cancel button{
	background-color: #FF0000;
	width:130px;
	border: none;
}
.cancel button:hover{
	background-color: #DF0101;
}

.carNumber-wrap {
  display: flex;
  align-items: center; /* 중앙 정렬을 위해 추가 */
}

.carTitle {
  width: 450px;
  height: 50px;
  margin-left: 50px;
  margin-top: 30px;
  /* 필요하다면 margin-left를 추가하여 간격을 조정할 수 있습니다. */
}
.carTitle span{
	font-weight: 600;
	font-size: 1.4em;
}



     
</style>

<script type="text/javascript">
function sendNotification(userId, rentNo) {
	   
//  console.log(userid)
//  console.log(rentno)
 
  $.ajax({
      type: "post"
      , url: "/alert/sendnotification"
      , data: {
         userId: userId,
         boardCate: 1,
         boardNo: rentNo,
         content: 5
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


$(document).ready(function () {
	  $(".cancel-button").click(function() {
	      console.log("취소버튼 클릭됨")
	      console.log($(this).attr("data-uid")) // 머천트 아이디
	      console.log($(this).attr("data-id")) //사는놈 아이디
	      var button = $(this); // 'this'를 button 변수에 저장
	      
	      var userId = $(this).attr("data-id")
	      var rentNo = $(this).attr("data-no")
	      
	      console.log(rentNo)
	      console.log(userId)
	      
	      $.ajax({
	         type: "post"
	         , url: "/cancel"
	         , data: {
	            merchantUid: $(this).attr("data-uid"),
	            rentNo: $(this).attr("data-no")
	         }
	         , dataType: "json"
	         , success: function( data ) {
	            console.log("AJAX 성공")
	            sendNotification(userId, rentNo)
	            
	            alert("취소가 완료되었습니다")
	            
	            button.text("취소됨").prop("disabled", true);
	            
	         }
	         , error: function(xhr, status, error) {
	            console.log("AJAX 실패", status, error)
	         }
	      })
})
})



</script>
<br>

<div class="noneHistory" style="display: none;">
<h1>아직 판매한 내역이 없습니다!</h1>
</div>
<div class="historyList">


<c:forEach items="${rentList }" var="list">
<div class="history-wrap"> <!-- 전체 div -->
<div class="left-wrap"> <!-- left-wrap div --><!-- flex container -->
<div class="carStatusHistory"> <!-- carStatusHistory div -->
<c:choose>
<c:when test="${list.RENT_STATUS == 0 }"> <!-- 거래 상태에 따라 다르게 표시해주는 조건문 -->
<span>거래중</span> <!-- 거래중 표시 -->
</c:when>
<c:when test="${list.RENT_STATUS == 1 }">
<span>이전내역</span> <!-- 이전내역표시 -->
</c:when>
<c:when test="${list.RENT_STATUS == 2 }">
<span>취소내역</span> <!-- 이전내역표시 -->
</c:when>
</c:choose>
</div> <!-- carStatusHistory div end -->
<div class="carImgHistory"> <!-- carImgHistory div -->
<img alt="이미지없음" src="${pageContext.request.contextPath}/upload/${list.STORED_NAME}">
</div> <!-- carImgHistory div end -->
</div> <!-- left-wrap div end -->



<div class="middle-wrap"> <!-- middle-wrap div -->
  <div class="carDate"> <!-- carDate div -->
    <span>이용 일자 ${list.START_DATE } ~ ${list.END_DATE } | 예약주문 날짜 ${list.BOOKING_DATE }</span>
  </div> <!-- carDate div end -->

  <div class="carNumber-wrap"> <!-- 새로운 carNumber-wrap div -->
    <div class="carNumber"> <!-- carNumber div -->
      <span>${list.CAR_NUMBER }</span>
    </div> <!-- carNumber div end -->
    <div class="carTitle">
      <span>${list.CAR_NAME }</span>
    </div> <!-- newDivAdjacentToCarNumber div end -->
  </div> <!-- carNumber-wrap div end -->

  <div class="carPrice-wrap"> <!-- carPrice-wrap div -->
    <div class="carPrice"> <!-- carPrice div -->
      <span>거래금액 : ${list.AMOUNT }</span>
    </div> <!-- carPrice div end -->
    <div class="messageSend">
      <button class="btn btn-primary message-button">메세지</button>
    </div> <!-- newDivNearCarPrice div end -->
    <c:if test="${list.RENT_STATUS == 0 }">
    <div class="cancel">
      <button class="btn btn-primary cancel-button" data-uid="${list.MERCHANT_UID }" data-id="${list.CUSTOM_ID }" data-no="${list.RENT_NO }">취소</button>
    </div> <!-- cancel div end -->    
    </c:if>

  </div> <!-- carPrice-wrap div end -->
</div> <!-- middle-wrap div end -->


<div class="userProfile"> <!-- userProfile div -->
<div class="userImg">
<img alt="이미지 없음" src="/resources/img/profile${list.PROFILE}.png">
</div>
<div class="userNick">
<span>${list.USER_NICK }</span>
</div>
</div> <!-- userProfile div end -->
</div><!-- 전체 div end -->
</c:forEach>
<c:import url="../layout/pagenationAjaxSeongGwon.jsp" />

</div>