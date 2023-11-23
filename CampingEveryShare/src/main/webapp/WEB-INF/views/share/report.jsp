<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* 버튼 크기 */
:root {
  --button-width: 400px;
  --button-height:50px;
}

/* 바깥 div */
#report{
   margin: 0 auto;
   border: 3px solid #2ECC71;
   width: calc(var(--button-width) + 13px);
   height: calc(var(--button-height)*5 + 169px);
   border-radius: 5px; 
}
/* 안쪽 div */
#reportIn{
   margin: 0 3px;
   margin-top: 8px;
}

/* 버튼 스타일 */
#reportBtn1, #reportBtn2{
   border-radius: 5px;
   width: var(--button-width);
   height: var(--button-height);
   border: 0;
   font-size: 25px;
   margin-bottom: 8px;
}
/* 버튼 2번 색깔 */
#reportBtn2{
   background-color: #2ECC71;
   color: white;
}

</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">


</script>

</head>
<body>

<div id="report">
<div id="reportIn">
<form id="reportForm" action="/share/report" method="post">
<div>
<input type="hidden" value="${board.boardNo }" name="boardNo">
<input type="hidden" value="${board.userId }" name="userId">
<input type="hidden" value="${board.boardCate }" name="boardCate">

	<c:if test="${board.boardCate eq 2 }">
	캠핑존 공유의 
	</c:if>
	[${board.title }] 게시물의 신고 이유를 적어주세요.<br>
	( 허위 신고시 사이트의 온전한 기능을 사용할 수 없습니다.)
</div>
<div>
<select name="reason" id="reason">
     <option value="1">허위 사실 유포</option>
     <option value="2">음란성 및 선정성</option>
     <option value="3">지나친 욕설 포함</option>
     <option value="4">지나친 혐오성</option>
     <option value="5">정치 관련 게시물</option>
     <option value="6">상업적 광고 홍보</option>
     <option value="7">기타</option>
</select>
</div>
<div>
	<textarea class="form-control" name="reasonDetail" id="reasonDetail" placeholder="기타 사유를 적어주세요"></textarea>
</div>
 
   
</form>
</div><!-- .reportIn -->

</div><!-- .report -->

</body>
</html>