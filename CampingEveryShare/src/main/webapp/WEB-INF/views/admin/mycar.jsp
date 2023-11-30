
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
#head, #table_body{
	text-align: center;
}

</style>

<script type="text/javascript">
$(() => {
   //검색 버튼 클릭
   $("#btnSearch").click(() => {
   const searchValue = $("#searchInput").val();
   const typeCategory = $("#typeCategory").val();
   
   if(!typeCategory){
      alert("검색 카테고리를 선택해주세요!");
      return false;
   }
   
   if(!searchValue){
      alert("검색어를 입력해주세요!");
      return false;
   }
   
   console.log("검색어:", searchValue, "검색 카테고리:", typeCategory); // 확인용 로그
   location.href = "./list?search=" + searchValue + "&category=" + typeCategory;
   });

})
</script>

<script type="text/javascript">
$(() => {
     $(".deleteInfoButton").click(function() {
       // 삭제할 사용자의 아이디를 가져옴
       var userId = $(this).data('userid');
       console.log("클릭됨");

       // 확인 대화상자 표시
       var isConfirmed = confirm("정말로 탈퇴시키겠습니까?");

       if (isConfirmed) {
         $.ajax({
           type: "post",
           url: "/admin/delete",
           data: {
             userId: userId
           },
           success: function(response) {
             console.log("서버 응답:", response);
             console.log("파싱된 응답:", response);
			 location.reload(true);
             if (response === "done") {
 //              console.log("회원탈퇴가 성공적으로 이루어졌습니다!");
               alert("회원탈퇴가 성공적으로 이루어졌습니다!");
             } else if (response === "undone") {
 //              console.log("회원탈퇴 실패.");
               alert("회원탈퇴 실패, 비밀번호를 확인해주세요");
             }
           },
           error: function(error) {
             console.log("AJAX 실패")
           }
         });
       }
     });
   });
   
</script>


<div class="container">

<div class="adminpageTitle">
<h3 id=adminpageTitle>관리자 캠핑카관리</h3>

<div id="searchDiv"> 
   <input class="form-control" type="text" id="searchInput" value="${param.search }" placeholder="아이디 조회"/>
   <button id="btnSearch" class="btn btn-primary">검색</button>
</div>

<table class="table table-striped table-hover table-sm" >
<colgroup>
   <col width="5%">
   <col width="7%">
   <col width="13%">
   <col width="10%">
   <col width="7%">
   <col width="5%">
   <col width="7%">
   <col width="9%">
   <col width="9%">
   <col width="18%">
   <col width="10%">
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
      <th>성수기가격</th>
      <th>비수기가격</th>
      <th>내용</th>
      <th>승인</th>
   </tr>
</thead>
<tbody>
<c:forEach var="car" items="${mycarList }">
   <tr> 
      <td id="table_body">${car.RNUM }</td>
      <td id="table_body">${car.USER_ID }</td>
      <td id="table_body">${car.CAR_NAME }</td>
      <td id="table_body">${car.CAR_NUMBER }</td>
      <td id="table_body">${car.CAR_SIZE }</td>
      <td id="table_body">${car.LOCATION }</td>
      <td id="table_body">${car.AREA }</td>
      <td id="table_body">${car.MAX_PRICE }</td>
      <td id="table_body">${car.MIN_PRICE }</td>
      <td>${car.CONTENT }</td>
      <td id="table_body">
		 <c:choose>
         <c:when test="${car.CAR_STATUS eq 1 }">
   			 <button class="btn warning btnCarStatus" data-userid="${car.USER_ID }" data-status="${car.CAR_STATUS }">승인</button>
		</c:when>
		<c:when test="${car.CAR_STATUS eq 2 }">
   			 <button class="btn btn-primary btnCarStatus" data-userid="${car.USER_ID }" data-status="${car.CAR_STATUS }">승인 완료</button>
		</c:when>
		<c:when test="${car.CAR_STATUS eq 3 }">
   			 <button class="btn btn-danger btnCarStatus" data-userid="${car.USER_ID }" data-status="${car.CAR_STATUS }">판매 보류</button>
		</c:when>
		</c:choose>
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