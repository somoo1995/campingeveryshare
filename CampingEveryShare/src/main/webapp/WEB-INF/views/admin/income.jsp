<%@page import="java.util.Date"%>
<%@ page import="java.sql.Timestamp" %>
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
   
   if(!searchValue){
      alert("검색어를 입력해주세요!");
      return false;
   }
   
   console.log("검색어:", searchValue, "검색 카테고리:", typeCategory); // 확인용 로그
   location.href = "./income?search=" + searchValue + "&category=" + typeCategory;
   });

})
</script>

<script type="text/javascript">
$(()=>{	
	$(".btnPermit").click(function (){
		
		var incomeNo = $(this).attr('data-incomeno')
		var incomeStatus = $(this).attr('data-status')
		var isConfirmed = confirm("출금 승인 하시겠습니까?");
	       
		console.log(incomeNo)
 		console.log(incomeStatus)
		
		if (isConfirmed) {
		$.ajax({
			type: "get"
			, url: "./permit"
			, data: { 
				incomeNo: incomeNo,
				incomeStatus: incomeStatus
 			}
			, dataType: "json"
			, success: function( data ) {
					console.log("성공");

					$(".btnPermit[data-incomeno='" + incomeNo + "']")
					.addClass("btn-primary disabled")
					.html('출금 완료');
					
					location.reload(true);
			}
			, error: function() {
				console.log("실패");
			}
		}); //ajax end
	  } //if end
		
	
		
	}) //$(".btnPermit").click() end
	
}); //function end
</script>



<div class="container">

<div class="adminpageTitle">
<h3 id=adminpageTitle>관리자 수익관리</h3>

<div id="searchDiv">
 <select id="typeCategory" class="form-select">
        <option value="1">아이디</option>
    </select>
	<input class="form-control" type="text" id="searchInput" value="${param.search }" placeholder="검색어 입력"/>
	<button id="btnSearch" class="btn btn-primary">검색</button>
</div>


<table class="table table-striped table-hover table-sm" >
<colgroup>
	<col width="15%">
	<col width="20%">
	<col width="30%">
	<col width="20%">
	<col width="15%">
</colgroup>

<thead id="head">
	<tr>
		<th>No.</th>
		<th>신청자ID</th>
		<th>출금예정금액</th>
		<th>신청날짜</th>
		<th>승인 확인</th>
	</tr>
</thead>
<tbody>
<c:forEach var="income" items="${incomeList }">
	<tr id="body"> 
		<td>${income.RNUM }</td>
		<td>${income.USER_ID }</td>
		<td>
		<fmt:formatNumber value="${income.DEDUCT_AMOUNT }" pattern="#,###"/>
		</td>
		<td>
			<fmt:formatDate value="<%=new Date() %>" pattern="yyyyMMdd" var="current"/>
       		<fmt:formatDate value="${income.POST_DATE }" pattern="yyyyMMdd" var="write"/>
        	<c:choose>
        		<c:when test="${write lt current }">
        			<fmt:formatDate value="${income.POST_DATE }" pattern="yyyy-MM-dd"/>
        		</c:when>
        		<c:when test="${write eq current }">
        			<fmt:formatDate value="${income.POST_DATE }" pattern="HH:mm"/>
        		</c:when>
        	</c:choose>  
		</td>
		<td>
		<c:if test="${income.INCOME_STATUS == 1  }">
		<button type="button" class="btn btn-primary btnPermit" data-incomeno="${income.INCOME_NO }" data-status="${income.INCOME_STATUS }">출금 승인</button>
		</c:if>
		<c:if test="${income.INCOME_STATUS == 2  }">
		<button type="button" class="btn btn-primary btnPermit disabled" data-incomeno="${income.INCOME_NO }" data-status="${income.INCOME_STATUS }">출금 완료</button>
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
    <c:param name="url" value="./income" />
</c:import>

<c:import url="../layout/footer.jsp" />