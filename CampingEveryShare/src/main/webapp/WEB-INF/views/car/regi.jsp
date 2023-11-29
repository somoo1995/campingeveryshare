<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <c:if test="${carModel != null and carModel.carStatus != 1}">
    $('.carRegiForm form').on('change', 'input, select, textarea', function() {
        // 버튼의 disabled 속성 제거
        $('.update-button').prop('disabled', false);
        $('.approve-button').prop('disabled', true)
    });
    
    $('.options-section').on('click', '.option-button', function() {
        // 버튼의 disabled 속성 제거
        $('.update-button').prop('disabled', false);
        $('.approve-button').prop('disabled', true)
    });
    
    </c:if>
  
	
	
	<c:if test="${carModel != null}">
    var options = {
            carElec: ${carModel.carElec},
            carWater: ${carModel.carWater},
            carTable: ${carModel.carTable},
            carSink: ${carModel.carSink},
            carkitchen: ${carModel.carKitchen},
            carTemp: ${carModel.carTemp},
            carShower: ${carModel.carShower},
            carToilet: ${carModel.carToilet},
            carPet: ${carModel.carPet},
            carSmoke: ${carModel.carSmoke}
            // 여기에 다른 옵션들도 추가
        };
    
    var loadedAreaInfo = '${carModel.areaDetail}'
    if(loadedAreaInfo){
    	var parts = loadedAreaInfo.split('#');
    	if(parts.length ===3){
            document.getElementById('sample6_postcode').value = parts[0]; // 우편번호
            document.getElementById('sample6_address').value = parts[1]; // 주소
            document.getElementById('sample6_detailAddress').value = parts[2]; // 상세주소
    	}
    }
    $.each(options, function(key, value) {
        if (value === 1) {
            $('button[data-value="' + key + '"]').addClass('option-selected');
        }
    });
	
	</c:if>
	
	
	

	

  $('.option-button').click(function() {
    $(this).toggleClass('option-selected');
  });
  
  $('.btn.btn-success.save-button').click(function(event) {
       event.preventDefault();

       // FormData 객체를 생성하고 폼 데이터를 추가합니다.
        
    var isValid = true;
    var formData = new FormData();

    // 모든 텍스트, 숫자, 파일 입력, 선택 및 텍스트 영역 검사
        var input = $(this);

        var isValid = true;
        var formData = new FormData();
        
        // 글 제목
        var carName = $('input[name="carName"]').val().trim();
        if (carName === '') {
            alert($('input[name="carName"]').data('error-message') + '을(를) 입력해주세요!');
            isValid = false;
            return;
        } else {
            formData.append('carName', carName);
        }
        
        // 차량번호
        var carNumber = $('input[name="carNumber"]').val().trim();
        if (carNumber === '') {
            alert($('input[name="carNumber"]').data('error-message') + '을(를) 입력해주세요!');
            isValid = false;
            return;
        } else {
            formData.append('carNumber', carNumber);
        }
        
        // 대표 사진
        var carFile = $('input[name="carFile"]')[0].files;
        if (carFile.length === 0) {
            alert($('input[name="carFile"]').data('error-message') + '을(를) 등록해주세요!');
            isValid = false;
            return;
        } else {
            formData.append('carFile', carFile[0]);
        }
        // 라디오 버튼 값 추가 및 검사
        $('input[type="radio"]').each(function() {
            var name = $(this).attr('name');
            if ($('input[type="radio"][name="' + name + '"]:checked').length === 0) {
                alert('차종 선택 체크는 필수입니다!');
                isValid = false;
                return false;
            }
            formData.append(name, $('input[type="radio"][name="' + name + '"]:checked').val());
            return false;
        });
        if(!isValid){
        	return
        }
        
        
        var price = $('input[name="price"]').val().trim();
        console.log("차가격부분")
        if (price === '0') {
            alert($('input[name="price"]').data('error-message') + '을(를) 입력해주세요!');
            isValid = false;
            return;
        } else {
            formData.append('price', price);
        }
        
        var extraPrice = $('input[name="extraPrice"]').val().trim();
        if (extraPrice === '0') {
            alert($('input[name="extraPrice"]').data('error-message') + '을(를) 입력해주세요!');
            isValid = false;
            return;
        } else {
            formData.append('extraPrice', extraPrice);
        }
        var pickupTimeStart = $('select[name="pickupTimeStart"]').val();
        var pickupTimeEnd = $('select[name="pickupTimeEnd"]').val();
        if (pickupTimeStart === pickupTimeEnd) { 
            alert("픽업시작시간과 종료시간을 다르게 선택해주세요!");
            isValid = false;
            return;
        } else {
            formData.append('pickupTimeStart', pickupTimeStart);
            formData.append('pickupTimeEnd', pickupTimeEnd);
        }
        if (pickupTimeStart > pickupTimeEnd) {
            alert("픽업 종료 시간이 시작 시간보다 이전입니다. 올바른 시간을 선택해주세요!");
            isValid = false;
            return;
        }
        
        //주소
        var location = $('input[name="location"]').val().trim();
        if (location === '') {
            alert($('input[name="location"]').data('error-message') + '을(를) 입력해주세요!');
            isValid = false;
            return;
        } else {
        	var arr = $('input[name="location"]').val().split(" ")
        	if(arr[0] != '서울' && arr[0] !='인천'){
        		alert("서울/인천 지역만 등록이 가능합니다!")
        		isValid = false;
        		return;
        	}
            formData.append('location', location);
        }
        
        //상세주소
        var areaDetail = $('input[name="areaDetail"]').val().trim();
        var postCode = $('#sample6_postcode').val().trim();
        if (areaDetail === '') {
            alert($('input[name="areaDetail"]').data('error-message') + '을(를) 입력해주세요!');
            isValid = false;
            return;
        } else {
        	var wholeLocation = postCode+ '#' + location + '#' + areaDetail;
            formData.append('areaDetail', wholeLocation);
        }
        
        //취침,탑승,침대수
        var carPax = $('input[name="carPax"]').val().trim();
        formData.append('carPax', carPax);
        var carSpax = $('input[name="carSpax"]').val().trim();
        formData.append('carSpax', carSpax);
        var carBeds = $('input[name="carBeds"]').val().trim();
        formData.append('carBeds', carBeds);
        
        
        // Summernote 내용 추가
        var summernoteContent = $('#summernote').summernote('code').trim();
        if (summernoteContent === '' || summernoteContent === '<p><br></p>' || summernoteContent === '상세설명을 등록해주세요') {
            alert($('#summernote').data('error-message') + '을(를) 입력해주세요!');
            isValid = false;
            return;
        } else {
            formData.append('content', summernoteContent);
        }
        
        
        
        

	


   
        // 선택된 옵션 버튼 값 수집 및 추가
        var selectedOptions = getSelectedOptions();
        formData.append('selectedOptions', selectedOptions);
        console.log('selectedOptions : ' ,selectedOptions);
        if(!isValid){
        	return;
        }
//         for (let [key, value] of formData.entries()) {
// 		    console.log(key, value);
// 		}
       // AJAX 요청을 보냅니다.
       $.ajax({
           url: '/car/save', // 서버의 엔드포인트 URL
           type: 'POST', // 데이터를 보내는 HTTP 메소드
           data: formData, // 보낼 데이터
           processData: false, // 데이터를 쿼리 스트링으로 변환하지 않도록 설정
           contentType: false, // multipart/form-data로 보내기 위해 컨텐트 타입 설정을 false로 설정
           success: function(response) {
               console.log("서버로부터의 응답:", response);
               if(response === "이미 등록된 차량입니다"){
            	   alert('이미 등록된 차량입니다.');
            	   return;
               }
           },
           error: function(xhr, status, error) {
               console.error("에러 발생:", error);
           }
       });

       $('.approve-button').prop('disabled', false);
   });
  
  $('.btn.btn-success.update-button').click(function(event) {
      event.preventDefault();

      // FormData 객체를 생성하고 폼 데이터를 추가합니다.
       
   var isValid = true;
   var formData = new FormData();

   // 모든 텍스트, 숫자, 파일 입력, 선택 및 텍스트 영역 검사
       var input = $(this);

       var isValid = true;
       var formData = new FormData();
       
       // 글 제목
       var carName = $('input[name="carName"]').val().trim();
       if (carName === '') {
           alert($('input[name="carName"]').data('error-message') + '을(를) 입력해주세요!');
           isValid = false;
           return;
       } else {
           formData.append('carName', carName);
       }
       
       // 차량번호
       var carNumber = $('input[name="carNumber"]').val().trim();
       if (carNumber === '') {
           alert($('input[name="carNumber"]').data('error-message') + '을(를) 입력해주세요!');
           isValid = false;
           return;
       } else {
           formData.append('carNumber', carNumber);
       }
       
       // 대표 사진
       var carFile = $('input[name="carFile"]')[0].files;
       if (carFile.length === 0) {
    	   console.log("파일 첨부 안 함")
       } else {
    	   console.log("파일 첨부 함")
           formData.append('carFile', carFile[0]);
       }
       // 라디오 버튼 값 추가 및 검사
       $('input[type="radio"]').each(function() {
           var name = $(this).attr('name');
           if ($('input[type="radio"][name="' + name + '"]:checked').length === 0) {
               alert('차종 선택 체크는 필수입니다!');
               isValid = false;
               return false;
           }
           formData.append(name, $('input[type="radio"][name="' + name + '"]:checked').val());
           return false;
       });
       if(!isValid){
       	return
       }
       
       
       var price = $('input[name="price"]').val().trim();
       console.log("차가격부분")
       if (price === '0') {
           alert($('input[name="price"]').data('error-message') + '을(를) 입력해주세요!');
           isValid = false;
           return;
       } else {
           formData.append('price', price);
       }
       
       var extraPrice = $('input[name="extraPrice"]').val().trim();
       if (extraPrice === '0') {
           alert($('input[name="extraPrice"]').data('error-message') + '을(를) 입력해주세요!');
           isValid = false;
           return;
       } else {
           formData.append('extraPrice', extraPrice);
       }
       var pickupTimeStart = $('select[name="pickupTimeStart"]').val();
       var pickupTimeEnd = $('select[name="pickupTimeEnd"]').val();
       if (pickupTimeStart === pickupTimeEnd) { 
           alert("픽업시작시간과 종료시간을 다르게 선택해주세요!");
           isValid = false;
           return;
       } else {
           formData.append('pickupTimeStart', pickupTimeStart);
           formData.append('pickupTimeEnd', pickupTimeEnd);
       }
       if (pickupTimeStart > pickupTimeEnd) {
           alert("픽업 종료 시간이 시작 시간보다 이전입니다. 올바른 시간을 선택해주세요!");
           isValid = false;
           return;
       }
       
       //주소
       var location = $('input[name="location"]').val().trim();
       if (location === '') {
           alert($('input[name="location"]').data('error-message') + '을(를) 입력해주세요!');
           isValid = false;
           return;
       } else {
       	var arr = $('input[name="location"]').val().split(" ")
       	if(arr[0] != '서울' && arr[0] !='인천'){
       		alert("서울/인천 지역만 등록이 가능합니다!")
       		isValid = false;
       		return;
       	}
           formData.append('location', location);
       }
       
       //상세주소
       var areaDetail = $('input[name="areaDetail"]').val().trim();
       var postCode = $('#sample6_postcode').val().trim();
       if (areaDetail === '') {
           alert($('input[name="areaDetail"]').data('error-message') + '을(를) 입력해주세요!');
           isValid = false;
           return;
       } else {
       	var wholeLocation = postCode+ '#' + location + '#' + areaDetail;
           formData.append('areaDetail', wholeLocation);
       }
       
       //취침,탑승,침대수
       var carPax = $('input[name="carPax"]').val().trim();
       formData.append('carPax', carPax);
       var carSpax = $('input[name="carSpax"]').val().trim();
       formData.append('carSpax', carSpax);
       var carBeds = $('input[name="carBeds"]').val().trim();
       formData.append('carBeds', carBeds);
       
       
       // Summernote 내용 추가
       var summernoteContent = $('#summernote').summernote('code').trim();
       formData.append('content', summernoteContent);
       
       formData.append('update', true);
       
       
       
       

	


  
       // 선택된 옵션 버튼 값 수집 및 추가
       var selectedOptions = getSelectedOptions();
       formData.append('selectedOptions', selectedOptions);
       console.log('selectedOptions : ' ,selectedOptions);
       if(!isValid){
       	return;
       }
       for (let [key, value] of formData.entries()) {
		    console.log(key, value);
		}
      // AJAX 요청을 보냅니다.
      $.ajax({
          url: '/car/save', // 서버의 엔드포인트 URL
          type: 'POST', // 데이터를 보내는 HTTP 메소드
          data: formData, // 보낼 데이터
          processData: false, // 데이터를 쿼리 스트링으로 변환하지 않도록 설정
          contentType: false, // multipart/form-data로 보내기 위해 컨텐트 타입 설정을 false로 설정
          success: function(response) {
              console.log("서버로부터의 응답:", response);
              if(response === "이미 등록된 차량입니다"){
           	   alert('이미 등록된 차량입니다.');
           	   return;
              }
          },
          error: function(xhr, status, error) {
              console.error("에러 발생:", error);
          }
      });
      <c:if test="${carModel != null and carModel.carStatus != 1}">
      $('.approve-button').prop('disabled', false);
      
      </c:if>
  });
  
  

  $(".btn.btn-primary.approve-button").click(function(event){
     event.preventDefault();
     console.log("승인요청 버튼 클릭됨");
     var carNumberValue = $('input[name="carNumber"]').val();
     console.log(carNumberValue)
     
     $.ajax({
         url: '/car/approve', // 서버의 엔드포인트 URL
         type: 'POST', // 데이터를 보내는 HTTP 메소드
         data: {carNumber : carNumberValue}, // 보낼 데이터
         success: function(response) {
        	 console.log("approve AJAX 성공")
             console.log("서버로부터의 응답:", response);
          
             }
         ,
         error: function(xhr, status, error) {
             console.error("approve AJAX 에러 발생:", error);
         }
     });
     
     
     
     location.href = location.pathname + "?autoClick=btnMyCar";
  })
  
  $('#summernote').summernote({
     height: 400,
     callbacks: {
         onChange: function(contents, $editable) {
        	 <c:if test="${carModel != null and carModel.carStatus != 1}">
             $('.update-button').prop('disabled', false);
             </c:if>
         }
     }
  });
});
</script>

<div class="container">


<div class="pageTitle">
<c:choose>
<c:when test="${carModel != null}">
<h3 id="pageTitle">기존 캠핑카 편집</h3>
</c:when>
<c:otherwise>
<h3 id="pageTitle">신규 캠핑카 등록</h3>
</c:otherwise>
</c:choose>

<c:choose>
<c:when test="${carModel != null}">
<!-- 수정할때 -->
</c:when>
<c:otherwise>
<!-- 기존폼 -->
</c:otherwise>
</c:choose>

<hr>
</div>
<div class="carRegiForm">
<form enctype="multipart/form-data" method="post">
<div class="form-wrap">
<div class="form-Label">글 제목</div>
<div class="form">
<c:choose>
<c:when test="${carModel != null}">
<!-- 수정할때 -->
<input style="width:450px;" type="text" name="carName" data-error-message="글 제목" value="${carModel.carName }">
</c:when>
<c:otherwise>
<!-- 기존폼 -->
<input style="width:450px;" type="text" name="carName" data-error-message="글 제목">
</c:otherwise>
</c:choose>
</div>
<div class="form-Label">차량번호</div>
<c:choose>
<c:when test="${carModel != null}">
<!-- 수정할때 -->
<input style="width:450px;" type="text" name="carNumber" data-error-message="차량 번호" value="${carModel.carNumber }" readonly>
</c:when>
<c:otherwise>
<!-- 기존폼 -->
<input style="width:450px;" type="text" name="carNumber" data-error-message="차량 번호">
</c:otherwise>
</c:choose>
</div>
<div class="form-wrap">
<div class="form-Label" style="flex-basis:1000px; text-align:center; ">대표 사진을 등록해 주세요.</div>
<div class="form">
<c:choose>
<c:when test="${carModel != null}">
<!-- 수정할때 -->
<p>현재 파일: <a href="../upload/${file.storedName} download="${file.originName }>Download ${file.originName }</a></p>
<input type="file" name="carFile" data-error-message="차량사진" >
</c:when>
<c:otherwise>
<!-- 기존폼 -->
<input type="file" name="carFile" data-error-message="차량사진">
</c:otherwise>
</c:choose>
</div>
</div>
<div class="form-wrap">
  <div class="form-Label">차종</div>
  <div class="form">
    <label>
      <input type="radio" name="carSize" value="1" data-error-message="차량 사이즈"
      ${carModel != null && carModel.carSize == 1 ? 'checked' : ''}>소형
    </label>
    <label>
      <input type="radio" name="carSize" value="2" data-error-message="차량 사이즈"
      ${carModel != null && carModel.carSize == 2 ? 'checked' : ''}>중형
    </label>
  </div>
</div>
<div class="form-row"> <!-- 새로운 flex 컨테이너 추가 -->
  <div class="form-wrap">
    <div class="form-Label">탑승 인원</div>
    <div class="form">
      <input type="number" name="carPax" min="1" max="10" step="1"
      value="${carModel != null ? carModel.carPax : '1'}" data-error-message="탑승 인원">
    </div>
  </div>

  <div class="form-wrap">
    <div class="form-Label">취침 인원</div>
    <div class="form">
      <input type="number" name="carSpax" min="1" max="10" step="1"
      value="${carModel != null ? carModel.carSpax : '1'}" data-error-message="취침 인원">
    </div>
  </div>

  <div class="form-wrap">
    <div class="form-Label">침대 수</div>
    <div class="form">
      <input type="number" name="carBeds" min="1" max="5" step="1"
      value="${carModel != null ? carModel.carBeds : '1'}" data-error-message="침대 수">
    </div>
  </div>
</div>

<div class="form-wrap">
  <div class="form-wrap">
    <div class="form-Label">가격</div>
    <div class="form">
      <input type="number" name="price" min="0" step="10000"
      value="${carModel != null ? carModel.price : '0'}" data-error-message="가격">
    </div>
  </div>
  <div class="form-wrap">
    <div class="form-Label">추가가격</div>
    <div class="form">
      <input type="number" name="extraPrice" min="0" step="5000"
      value="${carModel != null ? carModel.extraPrice : '0'}" data-error-message="추가 가격">
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
    <select name="pickupTimeStart" class="time-selector" data-error-message="픽업 시작시간">
      <c:forEach var="hour" begin="1" end="24">
        <c:set var="formattedHour" value="${hour lt 10 ? '0' : ''}${hour}:00" />
        <option value="${formattedHour}" 
                ${carModel != null && carModel.pickupTimeStart eq formattedHour ? 'selected' : ''}>
          ${formattedHour}
        </option>
      </c:forEach>
    </select>
    끝 시간:
    <select name="pickupTimeEnd" class="time-selector" data-error-message="픽업 종료시간">
      <c:forEach var="hour" begin="1" end="24">
        <c:set var="formattedHour" value="${hour lt 10 ? '0' : ''}${hour}:00" />
        <option value="${formattedHour}" 
                ${carModel != null && carModel.pickupTimeEnd eq formattedHour ? 'selected' : ''}>
          ${formattedHour}
        </option>
      </c:forEach>
    </select>
  </div>
</div>
<hr>
  <div class="form-wrap">
    <div class="form-Label">픽업 위치</div>
    <div class="form">
       <input type="text" id="sample6_postcode" placeholder="우편번호" readonly>
      <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
      <input type="text" id="sample6_address" placeholder="주소"  name="location" data-error-message="주소" readonly><br>
      <input type="text" id="sample6_detailAddress" placeholder="상세주소" name="areaDetail" data-error-message="상세 주소" >
      <input type="text" id="sample6_extraAddress" placeholder="참고항목">
    </div>
  </div>
<hr>
<h2>상세설명</h2>
<div id="summernote" data-error-message="상세설명">
<c:if test="${carModel != null }">
${carModel.content }
</c:if>
<c:if test="${carModel == null }">
상세설명을 등록해주세요
</c:if>
</div>
<div class="button-container">
	<c:if test="${carModel != null and carModel.carStatus != 1 }">
  		<button type="button" class="btn btn-success update-button" disabled>변경</button>
	</c:if>
	<c:if test="${carModel != null and carModel.carStatus == 1 }">
  		<button type="button" class="btn btn-success update-button" disabled>승인신청 대기중</button>
	</c:if>
	<c:if test="${carModel == null }">
  		<button type="button" class="btn btn-success save-button">저장</button>
	</c:if>
	<c:if test="${carModel != null and carModel.carStatus == 0}">
  <button type="button" class="btn btn-primary approve-button">승인요청</button>
	</c:if>
	<c:if test="${carModel != null and carModel.carStatus == 2}">
	<button type="button" class="btn btn-primary approve-button" disable>승인요청</button>
	</c:if>
</div>
</form>
</div>
<br>
<br>
<br>
</div> <!-- container div END  -->