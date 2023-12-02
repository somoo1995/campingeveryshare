
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
$(()=>{	
	$(".btnUserStatus").click(function (){
		
		var userId = $(this).attr('data-userid')
	    var status = $(this).attr('data-status')
	    var isConfirmed = confirm("해당 회원을 탈퇴시키겠습니까?");
	    
		console.log(userId)
		console.log(status)
		
		if (isConfirmed) {
		$.ajax({
			type: "get"
			, url: "./userstatus"
			, data: { 
				userId: userId,
	             userStatus: status
 			}
			, dataType: "json"
			, success: function( data ) {
	//				console.log("성공");
					
				if( data.result ) { //탈퇴 성공
					$(".btnUserStatus[data-userid='" + userId + "']")
					.removeClass("btn-danger")
					.addClass("btn-warning")
					.html('회원 복구');
				
				} else { //복구 성공
					$(".btnUserStatus[data-userid='" + userId + "']")
					.removeClass("btn-warning")
					.addClass("btn-danger")
					.html('회원 탈퇴');
				} //if end
				
	//			location.reload(true);
				
			}
			, error: function() {
				console.log("실패");
			}
		}); //ajax end
	  }
	}) //$(".btnUserStatus").click() end
	
}); //function end
</script>


<div class="container">

<div class="adminpageTitle">
<h3 id=adminpageTitle>관리자 회원관리</h3>

<div id="searchDiv">
    <select id="typeCategory" class="form-select">
        <option value="0">--전체--</option>
        <option value="1">아이디</option>
        <option value="2">이름</option>
        <option value="3">이메일</option>
    </select>
    
   <input class="form-control" type="text" id="searchInput" value="${param.search }" placeholder="조회"/>
   <button id="btnSearch" class="btn btn-primary">검색</button>
</div>

<table class="table table-striped table-hover table-sm" >
<colgroup>
   <col width="10%">
   <col width="20%">
   <col width="20%">
   <col width="20%">
   <col width="10%">
   <col width="10%">
   <col width="10%">
</colgroup>

<thead id="head">
   <tr>
      <th>No.</th>
      <th>아이디</th>
      <th>이름</th>
      <th>이메일</th>
      <th>회원상태</th>
      <th>수정</th>
      <th>탈퇴</th>
   </tr>
</thead>
<tbody>
<c:forEach var="user" items="${list }">
   <tr id="body"> 
      <td>${user.RNUM }</td>
      <td>${user.USER_ID }</td>
      <td>${user.USER_NAME }</td>
      <td>${user.EMAIL }</td>
      <c:choose>
      <c:when test="${user.USER_STATUS == 0 }">
         <td>가입</td>
      </c:when>
      <c:when test="${user.USER_STATUS == 1 }">
         <td>탈퇴</td>
      </c:when>
      </c:choose>
      <td>
         <a href="/user/update?userId=${user.USER_ID }">
         <button type="button" class="btn btn-info">수정</button>
         </a>
      </td>
	  <td id="table_body">
	  <c:choose>
        <c:when test="${user.USER_STATUS eq 0 }">
   		 <button class="btn btn-danger btnUserStatus" data-userid="${user.USER_ID }" data-status="${user.USER_STATUS }">회원 탈퇴</button>
		</c:when>
		<c:when test="${user.USER_STATUS eq 1 }">
   			 <button class="btn btn-warning btnUserStatus" data-userid="${user.USER_ID }" data-status="${user.USER_STATUS }">회원 복구</button>
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
    <c:param name="url" value="./list" />
</c:import>

<c:import url="../layout/footer.jsp" />