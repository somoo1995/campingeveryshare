
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/adminheader.jsp" />

<style>
.form-control{
   display: inline-block;
    width: 236px;
    margin-top: 15px;
}
.searchDiv{
   margin-left: 756px;
   margin-bottom: 15px;
}
#type{
   width: 150px;
}
#search{
   width: 300px;
}
#head, #body{
	text-align: center;
}

</style>

<script type="text/javascript">
$(() => {
   //검색 버튼 클릭
   $("#btnSearch").click(() => {
   const searchValue = $("#searchInput").val();
   
   if(!searchValue){
      alert("검색어를 입력해주세요!");
      return false;
   }
   
   console.log("검색어:", searchValue); // 확인용 로그
   location.href = "./mycar?search=" + searchValue;
   });

})
</script>

<script type="text/javascript">
$(()=>{	
	$(".btnAllow").click(function (){
		
		var carNo = $(this).attr('data-carno')
		var carStatus = $(this).attr('data-status')
		var isConfirmed = confirm("승인 하시겠습니까?");
	       
		console.log(carNo)
 		console.log(carStatus)
		
		if (isConfirmed) {
		$.ajax({
			type: "get"
			, url: "./allow"
			, data: { 
				carNo: carNo,
	            carStatus: carStatus
 			}
			, dataType: "json"
			, success: function( data ) {
					console.log("성공");

					$(".btnAllow[data-carno='" + carNo + "']")
					.removeClass("btn-info")
					.addClass("btn-primary disabled")
					.html('승인 완료');
			}
			, error: function() {
				console.log("실패");
			}
		}); //ajax end
	  }
	}) //$(".btnAllow").click() end
	
}); //function end
</script>

<script type="text/javascript">
$(()=>{	
	$(".btnHold").click(function (){
		
		var isConfirmed = confirm("수정 요청을 하시겠습니까?");
				
		if (isConfirmed) {
		$.ajax({
			type: "get"
			, url: "./hold"
			, data: { 
				carNo: carNo,
	            carStatus: carStatus
 			}
			, dataType: "json"
			, success: function( data ) {
					console.log("수정 요청");
				//	location.reload(true);
			}
			, error: function() {
				console.log("실패");
			}
		}); //ajax end
	  }
	}) //$(".btnHold").click() end
	
}); //function end
</script>


<div class="container">

<div class="adminpageTitle">
<h3 id=adminpageTitle>관리자 캠핑카관리</h3>

<div id="searchDiv"> 
   <input class="form-control" type="text" id="searchInput" value="${param.search }" placeholder="아이디 조회"/>
   <!--  <button class="btn"><img src="/resources/img/admin_search.png"></button>-->
   <button class="btn">검색</button>
</div>

<table class="table table-striped table-hover table-sm" >
<colgroup>
   <col width="5%">
   <col width="10%">
   <col width="15%">
   <col width="15%">
   <col width="10%">
   <col width="5%">
   <col width="10%">
   <col width="15%">
   <col width="15%">
</colgroup>

<thead>
   <tr id="head">
      <th>No.</th>
      <th>신청자ID</th>
      <th>차량이름</th>
      <th>차량번호</th>
      <th>차량타입</th>
      <th>지역</th>
      <th>지역구</th>
      <th>승인</th>
      <th>승인 보류</th>
   </tr>
</thead>
<tbody>
<c:forEach var="car" items="${mycarList }">
   <tr id="body"> 
      <td>${car.RNUM }</td>
      <td>${car.USER_ID }</td>
      <td>
      	<a href="/car/mycar?carNo=${car.CAR_NO }">${car.CAR_NAME }</a>
      </td>
      <td>${car.CAR_NUMBER }</td>
      <td>${car.CAR_SIZE }</td>
      <td>${car.LOCATION }</td>
      <td>${car.AREA }</td>
      <td>
      		<c:if test="${car.CAR_STATUS == 1  }">
   		  <button class="btn btn-info btnAllow" data-carno="${car.CAR_NO }" data-status="${car.CAR_STATUS }">승인</button>      		
      		</c:if>
      		<c:if test="${car.CAR_STATUS == 2  }">
   		  <button class="btn btn-info btnAllow disabled" data-carno="${car.CAR_NO }" data-status="${car.CAR_STATUS }">승인완료</button>      		      		
      		</c:if>
   	  </td>
   	  <td>
   	  		<c:if test="${car.CAR_STATUS == 1 or  car.CAR_STATUS == 2 }">
   		  <button class="btn btn-danger btnHold" data-carno="${car.CAR_NO }" data-status="${car.CAR_STATUS }">수정 요청</button>   	  		
   	  		</c:if>
   	  </td>
   </tr>
</c:forEach>
</tbody>

</table>
<small class="float-end mb-3">total : ${paging.totalCount }</small>

</div>

</div><!-- .container -->

<c:import url="/WEB-INF/views/layout/pagination.jsp" >
    <c:param name="url" value="./mycar" />
</c:import>

<c:import url="../layout/footer.jsp" />