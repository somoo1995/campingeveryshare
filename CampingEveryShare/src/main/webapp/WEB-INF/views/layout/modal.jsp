<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
#DeleteUserOkBtn{
	background-color: #2ECC71;
  	color: white;
  	margin-top: 3px;
    margin-right: 202px;
}

#DeleteBoardOkBtn{
	background-color: #2ECC71;
	width: 100px;
}
#DeleteBoardNoBtn{
	background-color: #dedd4d;
	width: 100px;
}
#delete_board_body {
	margin : 1.5em 0;
	margin-bottom: 30px;
}
#delete_board_button{
	text-align: center;
	color: white;
}


</style>
<!-- 신고하기 모달 나중에 바꿔야함! 경욱 작성 (Share)-->
<div class="modal fade" id="deleteUserModal" aria-hidden="true" aria-labelledby="deleteUserModal" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="deleteUserModal">신고하기</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <%@ include file="/WEB-INF/views/share/report.jsp" %>
        <button form="reportForm" id="DeleteUserOkBtn" class="btn float-end" data-bs-target="#deleteUserOkModal" data-bs-toggle="modal">확인</button>
     </div>
    </div>
  </div>
</div>
<div class="modal fade" id="deleteUserOkModal" aria-hidden="true" aria-labelledby="deleteUserOkModal" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      신고되었습니다!<br><br>
      <button id="footerDeleteOkBtn" type="button" class="btn float-end" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>
<!-- market 신고 -->
<div class="modal fade" id="deleteUserModal" aria-hidden="true" aria-labelledby="deleteUserModal" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="deleteUserModal">신고하기</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <%@ include file="/WEB-INF/views/market/report.jsp" %>
        <button form="reportForm" id="DeleteUserOkBtn" class="btn float-end" data-bs-target="#deleteUserOkModal" data-bs-toggle="modal">확인</button>
     </div>
    </div>
  </div>
</div>
<div class="modal fade" id="deleteUserOkModal" aria-hidden="true" aria-labelledby="deleteUserOkModal" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      신고되었습니다!<br><br>
      <button id="footerDeleteOkBtn" type="button" class="btn float-end" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>
<!-- group 신고 -->
<div class="modal fade" id="deleteUserModal" aria-hidden="true" aria-labelledby="deleteUserModal" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="deleteUserModal">신고하기</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <%@ include file="/WEB-INF/views/group/report.jsp" %>
        <button form="reportForm" id="DeleteUserOkBtn" class="btn float-end" data-bs-target="#deleteUserOkModal" data-bs-toggle="modal">확인</button>
     </div>
    </div>
  </div>
</div>
<div class="modal fade" id="deleteUserOkModal" aria-hidden="true" aria-labelledby="deleteUserOkModal" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      신고되었습니다!<br><br>
      <button id="footerDeleteOkBtn" type="button" class="btn float-end" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>

<!-- 신고하기 모달 나중에 바꿔야함! -->
<div class="modal fade" id="deleteUserModal" aria-hidden="true" aria-labelledby="deleteUserModal" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="deleteUserModal">신고하기</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <%@ include file="/WEB-INF/views/layout/reportdetail.jsp" %>
        <button id="DeleteUserOkBtn" class="btn float-end" data-bs-target="#deleteUserOkModal" data-bs-toggle="modal">확인</button>
     </div>
    </div>
  </div>
</div>
<div class="modal fade" id="deleteUserOkModal" aria-hidden="true" aria-labelledby="deleteUserOkModal" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      신고되었습니다!<br><br>
      <button id="footerDeleteOkBtn" type="button" class="btn float-end" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>


<!-- 글 삭제 모달  -->
<div class="modal fade" id="deleteBoardModal" aria-hidden="true" aria-labelledby="deleteBoardModal" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="deleteBoardModal">글 삭제</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <div id="delete_board_body">
      해당 글을 삭제하시겠습니까?
      </div>
      <div id="delete_board_button">
        <button id="DeleteBoardOkBtn" class="btn" data-bs-target="#deleteBoardOkModal" data-bs-toggle="modal">응!</button>
        <button id="DeleteBoardNoBtn" class="btn" data-bs-dismiss="modal">아니?</button>
      </div>
     </div>
    </div>
  </div>
</div>
<div class="modal fade" id="deleteBoardOkModal" aria-hidden="true" aria-labelledby="deleteBoardOkModal" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      삭제되었습니다!<br><br>
      <button id="footerDeleteOkBtn" type="button" class="btn float-end" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>



<!-- 회원 삭제 모달  -->
<div class="modal fade" id="deleteModal" aria-hidden="true" aria-labelledby="deleteBoardModal" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="deleteBoardModal">글 삭제</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <div id="delete_board_body">
      해당 글을 삭제하시겠습니까?
      </div>
      <div id="delete_board_button">
        <button id="DeleteBoardOkBtn" class="btn" data-bs-target="#deleteBoardOkModal" data-bs-toggle="modal">응!</button>
        <button id="DeleteBoardNoBtn" class="btn" data-bs-dismiss="modal">아니?</button>
      </div>
     </div>
    </div>
  </div>
</div>
<div class="modal fade" id="deleteBoardOkModal" aria-hidden="true" aria-labelledby="deleteBoardOkModal" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      삭제되었습니다!<br><br>
      <button id="footerDeleteOkBtn" type="button" class="btn float-end" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>