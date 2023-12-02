<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">

.rentList {
    height: 500px;
    text-align: center;
    padding: 20px; 
    margin-top: 20px; 
    display: flex; 
    flex-direction: column; 
    justify-content: center; 
}

.rentList span {
    display: block; 
    margin-bottom: 5px; 
}

.rentList strong {
    font-size: 24px; 
    margin-bottom: 10px; 
}

.rentList a {
    background-color: #228b22; 
    color: white; 
    padding: 10px 20px; 
    text-decoration: none; 
    border: none; 
    border-radius: 4px; 
    margin-top: 15px; 
    width: 200px; 
    display: block; 
    margin-left: auto; 
    margin-right: auto; 
    transition: background-color 0.3s; 
}
.rentList a:hover {
    background-color: #157347; 
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
	cursor: pointer;
	transform: scale(1.1);
    border: 2px solid #D3D3D3;
}

.list-container:active { 
     background-color: #efefef;
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
    display: flex; 
    justify-content: space-between; 
    align-items: center; 
    margin-left: 15px; 
    margin-right: 15px;
    margin-bottom: 5px; 
    
}
.title {
    margin-top: 10px;
    color: black;
    font-weight: bold;
    font-size: 25px;
	white-space: nowrap;
}

.info span {
	color: #06b500;
	font-weight: bold;

}

.carName {
    font-size: 18px;
    width: 180px;
    overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	text-align: left;
}

.option {
/* 	color: #1ABA00; */
	color: #3A3A3A;
	font-weight: bold;
	border-radius:60px;
/* 	background-color: #D7FFE9; */
	background-color: #efefef;
	padding: 5px;
}

/* 하트 버튼 */

.heartClass img{
	width: 25px;
	height: 25px;
}


.btnHeart {
	display: grid;
	grid-template-columns: 1fr 1fr;
	align-items: center;
}

.btnHeart img:hover{
	cursor: pointer;
}

</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>

$(document).ready(function(){
	$('.heartClass').click(function(event){
		event.stopPropagation()
		var clickedImg = $(this).find('img');
		console.log("하트버튼 클릭됨");
		var heartNo = $(this).data("no");
		var userId = $(this).data("id");
		if(!userId){
			alert("로그인이 필요한 서비스입니다.")
			return;
		}
		$.ajax({
			type: "post"
		   ,url: "/rent/heart"
		   ,data:{
			   userId:userId,
			   heartNo: heartNo
		   }
		   ,success:function(res){
			   console.log("/rent/heart AJAX성공");
			   console.log(res);
			   if(res ==='done'){
				   clickedImg.attr("src","/resources/img/heartOn.png")
			   }else if(res==="cancel"){
				   clickedImg.attr("src","/resources/img/heartNone.png")
			   }
			   
		   },error: function(){
			   console.log("/rent/heart AJAX실패");
		   }
		})
		
	})
})
</script>
  <c:choose>
    <c:when test="${empty list}">
      <div class="rentList">
        <strong>아직 찜 한 게시물이 없습니다!</strong><br>
        <span>캠핑카를 찾으시나요?</span><br>
        <a href="/rent/list" class="exploreButton">캠핑카 살펴보기</a>
      </div>
    </c:when>
    <c:otherwise>
		<c:forEach items="${list }" var="car" varStatus="loop">
		  <c:if test="${loop.index % 3 == 0}">
		    <div class="row">
		  </c:if>
			<div class="list-container" onclick="location.href='/rent/view?carNo=${car.CAR_NO }'">
				
		   <c:if test="${not empty car.THUMBNAILNAME }">
		      <div>
		          <img class="preview" src="/upload/${car.THUMBNAILNAME }"/>
		      </div>
		    </c:if>
		    <c:if test="${empty car.THUMBNAILNAME }">
		      <div>
		          <img class="preview" src="/resources/img/noimg.png"/>
		      </div>
		    </c:if>
		    
		    	<div class="info">
		    	
			    	<!-- 가격 -->
				    <c:set var="formattedPrice" value="${car.PRICE }" />
					<fmt:formatNumber value="${formattedPrice}" pattern="#,###" var="price" />
					<h6 class="title">${price } 원 / 1박</h6>	
					
					<!-- 하트 -->
					<div data-no="${car.CAR_NO }" data-id="${sessionScope.loginId }"class="heartClass">
					<c:if test="${car.HEART == 1 }">
					<img src="/resources/img/heartOn.png">						
					</c:if>
					<c:if test="${car.HEART == 0 }">
					<img src="/resources/img/heartNone.png">						
					</c:if>
					</div>
					
				</div>
				
				<div class="info">
				<h6 class="carName">${car.CAR_NAME }</h6>
				<h6><span>호스트</span> | ${car.HOSTNICK }</h6>	
				</div>
				<div class="info">
				<h6><span>위치</span> |
					<c:if test="${car.LOCATION eq 1 }">서울
						<c:if test="${car.AREA eq 1}">강남구</c:if>
						<c:if test="${car.AREA eq 2}">강동구</c:if>
						<c:if test="${car.AREA eq 3}">강북구</c:if>
						<c:if test="${car.AREA eq 4}">강서구</c:if>
						<c:if test="${car.AREA eq 5}">관악구</c:if>
						<c:if test="${car.AREA eq 6}">광진구</c:if>
						<c:if test="${car.AREA eq 7}">구로구</c:if>
						<c:if test="${car.AREA eq 8}">금천구</c:if>
						<c:if test="${car.AREA eq 9}">노원구</c:if>
						<c:if test="${car.AREA eq 10}">도봉구</c:if>
						<c:if test="${car.AREA eq 11}">동대문구</c:if>
						<c:if test="${car.AREA eq 12}">동작구</c:if>
						<c:if test="${car.AREA eq 13}">마포구</c:if>
						<c:if test="${car.AREA eq 14}">서대문구</c:if>
						<c:if test="${car.AREA eq 15}">서초구</c:if>
						<c:if test="${car.AREA eq 16}">성동구</c:if>
						<c:if test="${car.AREA eq 17}">성북구</c:if>
						<c:if test="${car.AREA eq 18}">송파구</c:if>
						<c:if test="${car.AREA eq 19}">양천구</c:if>
						<c:if test="${car.AREA eq 20}">영등포구</c:if>
						<c:if test="${car.AREA eq 21}">용산구</c:if>
						<c:if test="${car.AREA eq 22}">은평구</c:if>
						<c:if test="${car.AREA eq 23}">종로구</c:if>
					</c:if>
					
			  		<c:if test="${car.LOCATION eq 2 }">인천
						<c:if test="${car.AREA eq 1}">중구</c:if>
						<c:if test="${car.AREA eq 2}">남동구</c:if>
						<c:if test="${car.AREA eq 3}">동구</c:if>
						<c:if test="${car.AREA eq 4}">미추홀구</c:if>
						<c:if test="${car.AREA eq 5}">부평구</c:if>
						<c:if test="${car.AREA eq 6}">서구</c:if>
						<c:if test="${car.AREA eq 7}">연수구</c:if>
						<c:if test="${car.AREA eq 8}">계양구</c:if>
					</c:if>
				 </h6>
				 <div>
					<h6 class="option">${car.CAR_PAX }인</h6>
		<%-- 			<h6 class="option">${car.CAR_PAX }명</h6> --%>
		<%-- 			<h6 class="option">${car.CAR_PAX }명</h6> --%>
				 </div>
				</div>		
			</div>
			
		  <c:if test="${loop.index % 3 == 2 || loop.index + 1 == yourList.size()}">
		    </div> <!-- .row end -->
		  </c:if>
			
		</c:forEach>
		 <c:import url="../layout/paginationAjax.jsp" />
    </c:otherwise>
  </c:choose>
<div class="mt-5">
</div>