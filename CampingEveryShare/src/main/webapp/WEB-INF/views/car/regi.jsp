<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>
#pageTitle{
   color: black;
}
.form-row {
  display: flex;
/*   justify-content: space-between; /* 요소들을 균등하게 분배 */ */
}

.form-wrap {
  display: flex;
  align-items: center;
  margin-bottom: 10px;
  background-color: #F2F2F2;
}

.form-Label {
  flex-basis: 100px; /* 또는 더 긴 레이블에 맞춰 조정할 수 있습니다. */
  text-align: center;
  margin-right: 10px;
}

.form {
  display: flex; /* 체크박스를 가로로 정렬 */
  flex-wrap: wrap; /* 필요하다면 여러 줄로 감싸기 */
  gap: 10px; /* 체크박스 사이의 간격 */
}

label {
  display: flex;
  align-items: center;
}

input[type="checkbox"] {
  margin-right: 5px; /* 체크박스와 텍스트 사이의 간격 */
}


.options {
  display: flex;
  gap: 10px;
}

.option-button {
  display: flex;
  align-items: center;
  gap: 10px; /* 이미지와 텍스트 사이 간격 */
  padding: 5px 10px;
  border: 1px solid #ccc;
  background-color: white;
  color: black;
  cursor: pointer;
  transition: background-color 0.3s ease;
}
.option-button .icon {
  width: 24px; /* 원하는 아이콘 크기로 설정 */
  height: auto;
}
/* 선택된 옵션의 스타일 */
.option-selected {
  background-color: #007bff; /* 예시로 파란색을 사용했습니다. */
  color: white;
  border-color: #007bff;
}
.form-time-selection {
  display: flex;
  align-items: center;
  gap: 10px; /* 요소들 사이에 간격 추가 */
}

.time-selector {
  padding: 5px;
  border: 1px solid #ccc;
}input[type="text"]
input[type="text"],
input[type="number"],
select,
.option-button,
.time-selector {
  border-radius: 4px;
  border: 1px solid #ddd;
  padding: .5rem .75rem;
}

/* 옵션 버튼 스타일 */
.option-button {
  background-color: #f8f9fa;
  color: #495057;
  text-align: left;
}

/* 선택된 옵션 버튼 스타일 */
.option-selected {
  background-color: #007bff;
  color: #fff;
}

/* 픽업 시간 선택 스타일 */
.form-time-selection {
  margin-bottom: 10px;
}

/* 저장 및 승인요청 버튼 스타일 */
.save-button,
.approve-button {
  border: none;
  color: #fff;
  padding: .5rem 1rem;
  font-size: 1rem;
  line-height: 1.5;
  border-radius: .25rem;
  transition: color .15s ease-in-out, background-color .15s ease-in-out, border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}

.save-button {
  background-color: #28a745; /* 녹색 배경 */
}

.save-button:hover {
  background-color: #218838; /* 버튼 호버 시 더 진한 녹색 */
}

.approve-button {
  background-color: #17a2b8; /* 하늘색 배경 */
}

.approve-button:hover {
  background-color: #138496; /* 버튼 호버 시 더 진한 하늘색 */
}

/* 상세 설명 에디터 스타일 */
#summernote {
  border-radius: 4px;
  border: 1px solid #ddd;
}

/* 폼 레이블 스타일 */
.form-Label {
  min-width: 100px; /* 최소 너비 설정 */
  margin-right: .5rem; /* 레이블과 입력 필드 사이 여백 */
  font-size: 18px;
  font-weight: bold;
  border-right: 4px solid #ccc;
}

/* 부트스트랩을 사용한 버튼 스타일 */
.btn {
  display: inline-block;
  font-weight: 400;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  user-select: none;
  border: 1px solid transparent;
  padding: .375rem .75rem;
  font-size: 1rem;
  line-height: 1.5;
  border-radius: .25rem;
  transition: color .15s ease-in-out, background-color .15s ease-in-out, border-color .15s ease-in-out, box-shadow .15s ease-in-out;
  padding: .75rem 1.5rem;
  font-size: 2.2rem;
  margin-right: 10px;
}

.btn-primary {
  color: #fff;
  background-color: #007bff;
  border-color: #007bff;
}

.btn-primary:hover {
  color: #fff;
  background-color: #0069d9;
  border-color: #0062cc;
}

.btn-success {
  color: #fff;
  background-color: #28a745;
  border-color: #28a745;
}

.btn-success:hover {
  color: #fff;
  background-color: #218838;
  border-color: #1e7e34;
}
.carRegiForm{
  background-color: #FAFAFA;
}
.button-container {
  display: flex;
  justify-content: flex-end; /* 오른쪽 정렬 */
  margin-top: 10px; /* 상단 여백 */
}
#summernote {
  width: auto; /* 에디터의 너비를 자동으로 조정 */
  height: 400px; /* 에디터의 높이를 400px로 설정 */
  max-width: 100%; /* 에디터의 최대 너비를 부모 요소의 100%로 제한 */
  margin: 0 auto; /* 상하 여백 없이 좌우 여백을 자동으로 설정하여 중앙 정렬 */
}
</style>
<script>
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}
function getSelectedOptions() {
    var selectedOptions = [];
    $('.option-selected').each(function() {
        selectedOptions.push($(this).data('value'));
    });
    return selectedOptions;
}
$(document).ready(function() {
  $('.option-button').click(function() {
    $(this).toggleClass('option-selected');
  });
  
  $('.btn.btn-success.save-button').click(function(event) {
       event.preventDefault();

       // FormData 객체를 생성하고 폼 데이터를 추가합니다.
        // 여기부분 추가해줘 gpt야
        
        var formData = new FormData();
        $('input[type="text"], input[type="number"], input[type="file"], select, textarea').each(function() {
            var input = $(this);
            if (input.attr('type') == 'file') {
                if (input[0].files.length > 0) {
                    formData.append(input.attr('name'), input[0].files[0]);
                }
            } else {
                formData.append(input.attr('name'), input.val());
            }
        });

        // 라디오 버튼 값 추가
        $('input[type="radio"]:checked').each(function() {
            formData.append($(this).attr('name'), $(this).val());
        });

        // Summernote 내용 추가
        formData.append('content', $('#summernote').summernote('code'));

        // 선택된 옵션 버튼 값 수집 및 추가
        var selectedOptions = getSelectedOptions();
        formData.append('selectedOptions', selectedOptions);

       // AJAX 요청을 보냅니다.
       $.ajax({
           url: '/car/save', // 서버의 엔드포인트 URL
           type: 'POST', // 데이터를 보내는 HTTP 메소드
           data: formData, // 보낼 데이터
           processData: false, // 데이터를 쿼리 스트링으로 변환하지 않도록 설정
           contentType: false, // multipart/form-data로 보내기 위해 컨텐트 타입 설정을 false로 설정
           success: function(response) {
               console.log("서버로부터의 응답:", response);
           },
           error: function(xhr, status, error) {
               console.error("에러 발생:", error);
           }
       });
   });

  $(".btn.btn-primary.approve-button").click(function(event){
     event.preventDefault();
     console.log("승인요청 버튼 클릭됨");
  })
  
  $('#summernote').summernote({
     height: 400
  });
});
</script>

<div class="container">


<div class="pageTitle">
<h3 id="pageTitle">신규 캠핑카 등록</h3>
<hr>
</div>
<div class="carRegiForm">
<form enctype="multipart/form-data" method="post">
<div class="form-wrap">
<div class="form-Label">글 제목</div>
<div class="form">
<input style="width:450px;" type="text" name="carName">
</div>
<div class="form-Label">차량번호</div>
<input style="width:450px;" type="text" name="carNumber">
</div>
<div class="form-wrap">
<div class="form-Label" style="flex-basis:1000px; text-align:center; ">대표 사진을 등록해 주세요.</div>
<div class="form">
<input type="file" name="carFile">
</div>
</div>
<div class="form-wrap">
  <div class="form-Label">차종</div>
  <div class="form">
    <label><input type="radio" name="carSize" value="1">소형</label>
    <label><input type="radio" name="carSize" value="2">중형</label>
  </div>
</div>
<div class="form-row"> <!-- 새로운 flex 컨테이너 추가 -->
  <div class="form-wrap">
    <div class="form-Label">탑승 인원</div>
    <div class="form">
      <input type="number" name="carPax" min="1" max="10" step="1" value="1">
    </div>
  </div>

  <div class="form-wrap">
    <div class="form-Label">취침 인원</div>
    <div class="form">
      <input type="number" name="carSpax" min="1" max="10" step="1" value="1">
    </div>
  </div>

  <div class="form-wrap">
    <div class="form-Label">침대 수</div>
    <div class="form">
      <input type="number" name="carBeds" min="1" max="5" step="1" value="1">
    </div>
  </div>

</div>
<div class="form-wrap">
  <div class="form-wrap">
    <div class="form-Label">가격</div>
    <div class="form">
      <input type="number" name="price" min="0" step="10000" value="0">
    </div>
  </div>
    <div class="form-wrap">
    <div class="form-Label" >추가가격</div>
    <div class="form">
      <input type="number" name="extraPrice" min="0" step="5000" value="0">
    </div>
  </div>
</div>
<div class="form-wrap">
<div class="form-Label" style="margin-left: 500px;
    border-right: none;">보유옵션</div>
</div>

<hr>
<div class="form-wrap options-section">
  <div class="form-Label">연결</div>
  <div class="options">
   <button type="button" class="option-button" data-value="carElec">
        <img src="/resources/img/elec.png" alt="" class="icon" name="carElec"> 전기
   </button>
     <button type="button" class="option-button" data-value="carWater">
        <img src="/resources/img/water.png" alt="" class="icon" name="carWater"> 물
   </button>
  </div>
</div>
<hr>
<div class="form-wrap options-section">
  <div class="form-Label">요리</div>
  <div class="options">
    <button type="button" class="option-button" data-value="carTable">
        <img src="/resources/img/table.png" alt="" class="icon" name="carTable">  식탁
   </button>
        <button type="button" class="option-button" data-value="carSink">
        <img src="/resources/img/sink.png" alt="" class="icon" name="carSink"> 싱크대
   </button>
     <button type="button" class="option-button" data-value="carkitchen">
        <img src="/resources/img/kitchen.png" alt="" class="icon" name="carkitchen"> 주방가전
   </button>
  </div>
</div>
<hr>

<div class="form-wrap options-section">
  <div class="form-Label">온도</div>
  <div class="options">
   <button type="button" class="option-button" data-value="carTemp">
        <img src="/resources/img/hitCool.png" alt="" class="icon" name="carTemp"> 냉/난방
   </button>
  </div>
</div>
<hr>
<div class="form-wrap options-section">
  <div class="form-Label">편의</div>
  <div class="options">
     <button type="button" class="option-button" data-value="carShower">
        <img src="/resources/img/shower.png" alt="" class="icon" name="carShower"> 샤워실
   </button>    
     <button type="button" class="option-button" data-value="carToilet">
        <img src="/resources/img/toilet.png" alt="" class="icon" name="carToilet"> 화장실
   </button>
     </div>
</div>
<hr>
<div class="form-wrap options-section">
  <div class="form-Label">기타</div>
  <div class="options">
     <button type="button" class="option-button" data-value="carPet">
        <img src="/resources/img/pet.png" alt="" class="icon" name="carPet"> 반려동물
   </button>
     <button type="button" class="option-button" data-value="carSmoke">
        <img src="/resources/img/smoke.png" alt="" class="icon" name="carSmoke"> 흡연가능
   </button>  </div>
</div>
<hr>
<div class="form-wrap">
  <div class="form-Label">픽업 시간</div>
  <div class="form-time-selection">
    시작 시간:
    <select name="pickupTimeStart" class="time-selector">
            <option value="01:00">01:00</option>
      <option value="02:00">02:00</option>
      <option value="03:00">03:00</option>
      <option value="04:00">04:00</option>
      <option value="05:00">05:00</option>
      <option value="06:00">06:00</option>
      <option value="07:00">07:00</option>
      <option value="08:00">08:00</option>
      <option value="08:00">09:00</option>
      <option value="10:00">10:00</option>
      <option value="11:00">11:00</option>
      <option value="12:00">12:00</option>
      <option value="13:00">13:00</option>
      <option value="14:00">14:00</option>
      <option value="15:00">15:00</option>
      <option value="16:00">16:00</option>
      <option value="17:00">17:00</option>
      <option value="18:00">18:00</option>
      <option value="19:00">19:00</option>
      <option value="20:00">20:00</option>
      <option value="21:00">21:00</option>
      <option value="22:00">22:00</option>
      <option value="23:00">23:00</option>
      <option value="24:00">24:00</option>
    </select>
    끝 시간:
    <select name="pickupTimeEnd" class="time-selector">
            <option value="01:00">01:00</option>
      <option value="02:00">02:00</option>
      <option value="03:00">03:00</option>
      <option value="04:00">04:00</option>
      <option value="05:00">05:00</option>
      <option value="06:00">06:00</option>
      <option value="07:00">07:00</option>
      <option value="08:00">08:00</option>
      <option value="08:00">09:00</option>
      <option value="10:00">10:00</option>
      <option value="11:00">11:00</option>
      <option value="12:00">12:00</option>
      <option value="13:00">13:00</option>
      <option value="14:00">14:00</option>
      <option value="15:00">15:00</option>
      <option value="16:00">16:00</option>
      <option value="17:00">17:00</option>
      <option value="18:00">18:00</option>
      <option value="19:00">19:00</option>
      <option value="20:00">20:00</option>
      <option value="21:00">21:00</option>
      <option value="22:00">22:00</option>
      <option value="23:00">23:00</option>
      <option value="24:00">24:00</option>
    </select>
  </div>
</div>
<hr>
  <div class="form-wrap">
    <div class="form-Label">픽업 위치</div>
    <div class="form">
       <input type="text" id="sample6_postcode" placeholder="우편번호">
      <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
      <input type="text" id="sample6_address" placeholder="주소"  name="location"><br>
      <input type="text" id="sample6_detailAddress" placeholder="상세주소" name="areaDetail">
      <input type="text" id="sample6_extraAddress" placeholder="참고항목">
    </div>
  </div>
<hr>
<h2>상세설명</h2>
<div id="summernote" >상세설명을 등록해주세요</div>
<div class="button-container">
  <button type="button" class="btn btn-success save-button">저장</button>
  <button type="button" class="btn btn-primary approve-button">승인요청</button>
</div>
</form>
</div>
<br>
<br>
<br>
</div> <!-- container div END  -->