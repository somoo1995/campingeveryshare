<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">

$(()=>{
	
	$(".btnHeart").click(()=>{
		console.log(${isHeart})
		console.log($(event.currentTarget).attr("data-no"));	
		var targetNo = $(event.currentTarget).attr("data-no");
		console.log(targetNo);
		
		$.ajax({
			type: "get"
			, url: "/heart/heart3"
			, data: { 
				userId : "${loginId}",
                heartNo: $(event.currentTarget).attr("data-no"),
                boardNo: $(event.currentTarget).attr("data-no"),
                boardCate: $(event.currentTarget).attr("data-cate")
 			}
			, dataType: "json"
			, success: function( data ) {
					console.log("성공");
					console.log(data)
	
				if (data.hResult == true) { // 찜 성공
				    console.log("찜성공");
				    var targetImg = $('.btnHeart[data-no="' + targetNo + '"] img');
				    targetImg.attr('src', '/resources/img/heartOn.png');
				} else { // 찜 취소 성공
				    console.log("찜취소");
				    var targetImg = $('.btnHeart[data-no="' + targetNo + '"] img');
				    targetImg.attr('src', '/resources/img/heartNone.png');
				}
				
			}
			, error: function() {
				console.log("실패");
			}
		}); //ajax end
		
	}); //$("#btnHeart").click() end

})

</script>
<style type="text/css">

.heartOn {
    width: 25px; /* 원하는 너비 */
    height: 25px; /* 원하는 높이 */
}

.heartNone {
    width: 25px; /* 원하는 너비 */
    height: 25px; /* 원하는 높이 */
}

.btnHeart img:hover{
	cursor: pointer;
}
.list-container {
    height: 470px;
    width: 380px;
    margin: 1em auto; 
    text-align: center; 
    border-radius: 15px;
	overflow: hidden; 
    border: 1px solid #D3D3D3;
    border-right: 1px solid #D3D3D3;
}

.list-container:hover {
	cursor: #82EB5A;
}

.preview {
	margin: 15px auto 15px auto;
	width: 350px;
	height: 300px;
	display: flex;
	object-fit: cover;
	justify-content: center;
	align-items: center;
	background-size: cover; 
	background-repeat: no-repeat;
	background-position: center center;
}

.info {
    display: flex; /* Flexbox를 사용하여 내부 요소를 가로로 나열 */
    justify-content: space-between; /* 요소 간에 공간을 균등하게 배치 */
    align-items: center; /* 수직 가운데 정렬 */
   	margin: 15px auto 15px auto;
    
}
.title {
    margin-top: 10px;
    color: black;
    font-weight: bold;
    font-size: 25px;
    text-align: left;
    overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}
</style>

<script type="text/javascript">
</script>

<div class="container">


<!-- 작성 공간 -->
<div class="pageTitle">


<div class="clearfix"></div>

<c:forEach items="${list }" var="car" varStatus="loop">
  <c:if test="${loop.index % 3 == 0}">
    <div class="row">
  </c:if>
	<div class="list-container" onclick="location.href='/rent/view?carNo=${car.carNo }'">
		<div class="info">
	    <h6>👤 : ${car.userId}</h6>
	    
    	<c:if test="${board.HEARTID eq 0  }">
			<c:if test="${isLogin }">
				<span class="btnHeart" data-no="${board.BOARD_NO }" data-cate="${board.BOARD_CATE }"><img class="heartOn" id="${board.BOARD_NO }" src="/resources/img/heartNone.png"> : ${board.HEART }</span>
			</c:if>
		</c:if>
		
		<c:if test="${board.HEARTID eq 1  }">
			<c:if test="${isLogin }">
				<span class="btnHeart" data-no="${board.BOARD_NO }" data-cate="${board.BOARD_CATE }"><img class="heartOn" id="${board.BOARD_NO }" src="/resources/img/heartOn.png"> : ${board.HEART }</span>
			</c:if>	
		</c:if>
		
		<c:if test="${empty isLogin}">
		    <h6><img class="heartOn" src="/resources/img/heartOn.png"> : ${board.HEART }</h6>
		</c:if>	
		    <c:set var="formattedPrice" value="${car.price }" />
			<fmt:formatNumber value="${formattedPrice}" pattern="#,###" var="price" />
			<h6 style="color:
			    <c:choose>
			        <c:when test="${formattedPrice >= 250000}">
			            #C71585
			        </c:when>
			        <c:when test="${formattedPrice > 150000}">
			            #3232FF
			        </c:when>
			        <c:when test="${formattedPrice >= 100000}">
			            #6ED746
			        </c:when>
			        <c:otherwise>
			            #000000 <!-- 기본값 -->
			        </c:otherwise>
			    </c:choose>
			;">
			🪙 : 1박 / ${price } 원
			</h6>
			
		</div>
		<div>
		<img class="preview" src="/resources/img/noimg.png"/>
		</div>
		<div class="info">
		
		<h6 class="title">🚗 : ${car.carName }</h6>
		</div>
		<div class="info">
		<h6>🗺️ :
			<c:if test="${car.location eq 1 }">서울
				<c:if test="${car.area eq 1}">강남구</c:if>
				<c:if test="${car.area eq 2}">강동구</c:if>
				<c:if test="${car.area eq 3}">강북구</c:if>
				<c:if test="${car.area eq 4}">강서구</c:if>
				<c:if test="${car.area eq 5}">관악구</c:if>
				<c:if test="${car.area eq 6}">광진구</c:if>
				<c:if test="${car.area eq 7}">구로구</c:if>
				<c:if test="${car.area eq 8}">금천구</c:if>
				<c:if test="${car.area eq 9}">노원구</c:if>
				<c:if test="${car.area eq 10}">도봉구</c:if>
				<c:if test="${car.area eq 11}">동대문구</c:if>
				<c:if test="${car.area eq 12}">동작구</c:if>
				<c:if test="${car.area eq 13}">마포구</c:if>
				<c:if test="${car.area eq 14}">서대문구</c:if>
				<c:if test="${car.area eq 15}">서초구</c:if>
				<c:if test="${car.area eq 16}">성동구</c:if>
				<c:if test="${car.area eq 17}">성북구</c:if>
				<c:if test="${car.area eq 18}">송파구</c:if>
				<c:if test="${car.area eq 19}">양천구</c:if>
				<c:if test="${car.area eq 20}">영등포구</c:if>
				<c:if test="${car.area eq 21}">용산구</c:if>
				<c:if test="${car.area eq 22}">은평구</c:if>
				<c:if test="${car.area eq 23}">종로구</c:if>
			</c:if>
			
	  		<c:if test="${car.location eq 2 }">인천
				<c:if test="${car.area eq 1}">중구</c:if>
				<c:if test="${car.area eq 2}">남동구</c:if>
				<c:if test="${car.area eq 3}">동구</c:if>
				<c:if test="${car.area eq 4}">미추홀구</c:if>
				<c:if test="${car.area eq 5}">부평구</c:if>
				<c:if test="${car.area eq 6}">서구</c:if>
				<c:if test="${car.area eq 7}">연수구</c:if>
				<c:if test="${car.area eq 8}">계양구</c:if>
			</c:if>
		 </h6>
		 <div>
			<h6>👨‍👩‍👧‍👦 : ${car.carPax }명</h6>
		 </div>
		</div>		
	</div>
	
  <c:if test="${loop.index % 3 == 2 || loop.index + 1 == yourList.size()}">
    </div> <!-- .row end -->
  </c:if>
	
</c:forEach>

</div><!-- .container end -->

<c:import url="../layout/pagination.jsp" />
