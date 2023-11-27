<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="../resources/css/group.css?after">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">


</script>

</head>
<body>

<div id="report">
<div id="reportIn">
<form id="reportForm" action="/market/report" method="post">
<div>
<input type="hidden" value="${board.boardNo }" name="boardNo">
<input type="hidden" value="${board.userId }" name="userId">
<input type="hidden" value="${board.boardCate }" name="boardCate">
${board }
	<c:if test="${board.boardCate eq 4 }">
	중고장터의 
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