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
<!-- <form action="/admin/report" method="post"> -->
   <div>
   <input class="reportBtn" id="reportBtn1" type="submit" value="허위 사실 유포" name="reportType" >
   </div>
   
   <div>
   <input class="reportBtn" id="reportBtn2" type="submit" value="음란성 및 선정성" name="reportType" >
   </div>
   
   <div>
   <input class="reportBtn" id="reportBtn1" type="submit" value="지나친 욕설 포함" name="reportType" >
   </div>
   
   <div>
   <input class="reportBtn" id="reportBtn2" type="submit" value="지나친 혐오성" name="reportType">
   </div>
   
   <div>
   <input class="reportBtn" id="reportBtn1" type="submit" value="저치관련 게시물" name="reportType" >
   </div>
   
    <div>
   <input class="reportBtn" id="reportBtn2" type="submit" value="상업적 광고 홍보" name="reportType">
   </div>
   
   <div>
   <input class="reportBtn" id="reportBtn1" type="submit" value="기타 사유" name="reportType" >
   </div>
   
   
<!-- </form> -->
</div><!-- .reportIn -->

</div><!-- .report -->

</body>
</html>