<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="reportForm" action="/report/report" method="post" >
<div>
<c:if test="${board.boardCate eq 2 }"> 캠핑존 공유의 </c:if>[${board.title }] 게시물의 신고 이유를 적어주세요.<br>
( 허위 신고시 사이트의 온전한 기능을 사용할 수 없습니다.)
</div>
<div>
<select name="reason" id="reason">
     <option>선택</option>
     <option value="1">허위 사실 유포</option>
     <option value="2">음란성 및 선정성</option>
     <option value="3">지나친 욕설 포함</option>
     <option value="4">지나친 혐오성</option>
     <option value="5">정치관련 게시물</option>
     <option value="6">상업적 광고 홍보</option>
 </select>
</div>
<div>
	<textarea class="form-control" name="reasonDetail" id="reasonDetail" placeholder="기타 사유를 적어주세요"></textarea>
</div>

</div>
</form>
</body>
</html>