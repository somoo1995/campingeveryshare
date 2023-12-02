<%@page import="web.dto.Car"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="web.dto.Rent"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
    List<Rent> list = (List<Rent>) request.getAttribute("list");
	Car car = (Car) request.getAttribute("car");
%>

<style type="text/css">

.wrap-calendar {
    background-color : white;
    height: auto;
    width: 340px;
    padding: 20px;
    padding-left: 25px;
    margin: 0 auto;
    border-radius:5px;
    box-shadow:0px 4px 12px -1px rgba(0,0,0,0.3);
    margin-left: 0px;
    margin-top: 2px;
}

.arrCal {
	cursor: pointer;
}

td {
    width: 30px;
    height: 30px;
}

.tb-calendar {
     text-align: center; 
}

.tb-calendar>thead>tr:first-child>td {
/*     font-family: 'Questrial', sans-serif; */
    font-size: 1.1em;
    font-weight: bold;
}

.tb-calendar>thead>tr:last-child>td {
/*     font-family: 'Questrial', sans-serif; */
    font-weight: 600;     
}

.tb-calendar>tbody>tr>td>p {
    font-family: 'Montserrat', sans-serif;
    height: 35px;
    width: 35px;
    border-radius: 45px;
    transition-duration: .2s;
    line-height: 35px;
    margin: 2.5px;
    display: block;
    text-align: center;
}        

.pastDay {
    color: lightgray;
	cursor: default;
}

.today {
    background-color: green;            
    color: #fff;
    font-weight: 600;
    cursor: pointer;
}

.futureDay {
    background-color: #FFFFFF;
    cursor: pointer;
}

.futureDay:hover {
    background:#eee;
}

.futureDay.choiceDay,
.today.choiceDay {
    background: #0A174E;
    color: #fff;
    font-weight: 600;
    cursor: pointer;
}

.choiceDay {
    background: #0A174E;
    color: #fff;
    font-weight: 600;
    cursor: pointer;
}

.bookedDay {
    color: lightgray;
    cursor: default;
}

</style>


<script type="text/javascript">

$(function() {
	buildCalendar()

})	

// list 변수를 JavaScript에서 사용할 수 있도록 정의
var list = <%= new Gson().toJson(list) %>
var car = <%= new Gson().toJson(car) %>

// 달력 생성
var today = new Date()
var thisMonth = new Date()

var excludedDates = []

today.setHours(0, 0, 0, 0)

function buildCalendar() {

    var firstDate = new Date(thisMonth.getFullYear(), thisMonth.getMonth(), 1)
    var lastDate = new Date(thisMonth.getFullYear(), thisMonth.getMonth() + 1, 0)
    
    var tbodyCal = document.querySelector(".tb-calendar > tbody")
    
    document.getElementById("calYear").innerText = thisMonth.getFullYear()
    document.getElementById("calMonth").innerText = leftPad(thisMonth.getMonth() + 1)

    while (tbodyCal.rows.length > 0) {
        tbodyCal.deleteRow(tbodyCal.rows.length - 1)
    }

    var nowRow = tbodyCal.insertRow()

    for (var i = 0; i < firstDate.getDay(); i++) {
        var nowColumn = nowRow.insertCell()
    }

    for (var nowDay = firstDate; nowDay <= lastDate; nowDay.setDate(nowDay.getDate() + 1)) {

    	var nowColumn = nowRow.insertCell()
        var newDIV = document.createElement("p")
        newDIV.innerHTML = leftPad(nowDay.getDate())
        newDIV.setAttribute("id", parseInt(newDIV.innerText))
        nowColumn.appendChild(newDIV)

        if (nowDay.getDay() == 6) {
            nowRow = tbodyCal.insertRow()
        }
    	
        if (nowDay < today) {
            newDIV.className = "pastDay"
            newDIV.onclick = function () { alert("지난 날짜는 선택할 수 없습니다") } 
        } else if (nowDay.getFullYear() == today.getFullYear() && nowDay.getMonth() == today.getMonth() && nowDay.getDate() == today.getDate()) {
            newDIV.className = "today"
            newDIV.onclick = function () { choiceDate(this) }
        } else if (nowDay.getMonth() == today.getMonth() + 1 || nowDay.getMonth() == today.getMonth() + 2) {
            newDIV.className = "futureDay"
            newDIV.onclick = function () { choiceDate(this) }
        } else {
            newDIV.className = "futureDay"
            newDIV.onclick = function () { choiceDate(this) }
        }
        
        var isBooked = false
        
    	// 각 Dto에서 startDate와 endDate 값을 추출하여 클래스를 적용
//     	console.log("list.length : " + list.length)
        for (var i = 0; i < list.length; i++) {
            var dtoStartDate = new Date(list[i].startDate);
            var dtoEndDate = new Date(list[i].endDate);

            if (isDateInRange(nowDay, dtoStartDate, dtoEndDate)) {
//             	console.log(typeof dtoStartDate)
//             	console.log("nowDay : " + nowDay)
//             	excludedDates.push(new Date(nowDay.toString()))
//             	excludedDates.push(new Date(nowDay))
            	excludedDates.push(nowDay.toString())
//             	console.log("excludedDates : " + excludedDates)
            	
                newDIV.classList.add("bookedDay")
                newDIV.classList.remove("futureDay")

                isBooked = true
                break
            }
        }
                
    }
} // buildCalendar() end


//startDate와 endDate가 주어진 날짜를 포함 여부 확인
function isDateInRange(date, startDate, endDate) {
    return date.getTime() >= startDate.getTime() && date.getTime() <= endDate.getTime();
}

function leftPad(value) {
    if (value < 10) {
        value = "0" + value
        return value
    }
    return value
}

var firstSelectedDate = null
var secondSelectedDate = null
// var selectedDates = []
var betweenDates = []


function choiceDate(newDIV) {
	
// 	betweenDates.splice(0, betweenDates.length)
	
//     console.log("selectedDates st : " + selectedDates) // 선택된 날짜 확인
    console.log("betweenDates st : " + betweenDates) // 두 날짜 사이의 모든 날짜 확인
    console.log("excludedDates st : " + excludedDates) 

    var date = new Date(thisMonth.getFullYear(), thisMonth.getMonth(), parseInt(newDIV.innerText))
    var allDays = document.querySelectorAll(".tb-calendar tbody td p")
    console.log("선택 날짜 : " + date)
    
    if(newDIV.classList.contains("bookedDay")){
    	alert("예약 가능한 날짜를 선택해주세요")
    	return
    }

	if(firstSelectedDate == null || firstSelectedDate > date) {
// 	if(firstSelectedDate === null) {
		firstSelectedDate = date
		betweenDates = []
		betweenDates.push(firstSelectedDate)
		newDIV.classList.add("choiceDay")
		secondSelectedDate = null
		$("#toDate").val('')
		$("#totalPrice").text('')
		$("#totalNights").text('')
		
	} else if (secondSelectedDate != null && (secondSelectedDate <= date || secondSelectedDate >= date)) {
		firstSelectedDate = date
		newDIV.classList.add("choiceDay")
		secondSelectedDate = null
		betweenDates = []
		betweenDates.push(firstSelectedDate)
		$("#toDate").val('')
		$("#totalPrice").text('')
		$("#totalNights").text('')
		
	} else {
		secondSelectedDate = date
		betweenDates = []
		newDIV.classList.add("choiceDay")
		var currentDate = new Date(firstSelectedDate)
		
		while (currentDate <= secondSelectedDate) {
			console.log("currentDate : " + currentDate)
			console.log(excludedDates.includes(currentDate.toString()))
			
			if(excludedDates.includes(currentDate.toString())) {
				alert("예약 불가한 날짜가 포함되어 있습니다")
				betweenDates = []
				firstSelectedDate = null
				secondSelectedDate = null
				$("#fromDate").val('');
				continue
			} else {
				betweenDates.push(new Date(currentDate))
				currentDate.setDate(currentDate.getDate()+1)
			}
						
		}
	   
   }
   
   console.log("첫 선택 날짜 : " + firstSelectedDate)
   console.log("두번째 선택 날짜 : " + secondSelectedDate)
   console.log("betweenDates 중간 : " + betweenDates)

   
	allDays.forEach(function(day) {
		var dateDIV = new Date(thisMonth.getFullYear(), thisMonth.getMonth(), parseInt(day.innerText))
		
		var isDateInBetween = betweenDates.some(function(bDate) {
			return bDate.getTime() === dateDIV.getTime()
		})
		
		if (isDateInBetween) {
			day.classList.add("choiceDay")
		} else {
			day.classList.remove("choiceDay")
		}
		
	})
	
	updateSelectedDatesInfo()
	
//     console.log("selectedDates fin : " + selectedDates) // 선택된 날짜 확인
    console.log("betweenDates fin : " + betweenDates) // 두 날짜 사이의 모든 날짜 확인
}

function updateSelectedDatesInfo() {
	if (firstSelectedDate != null) {
		var formatFromDate = firstSelectedDate.toLocaleDateString('ko-KR', { weekday: 'short', year: 'numeric', month: '2-digit', day: '2-digit' })
		$("#fromDate").val(formatFromDate);
	}

	if (secondSelectedDate != null) {
        var formatToDate = secondSelectedDate.toLocaleDateString('ko-KR', { weekday: 'short', year: 'numeric', month: '2-digit', day: '2-digit' })
        $("#toDate").val(formatToDate);

        var nights = betweenDates.length - 1;
        var price = car.price * nights;

        $("#totalPrice").html(price);
        $("#totalNights").html(nights);
    }
}	
	
	
function prevCalendar() {
	thisMonth = new Date(thisMonth.getFullYear(), thisMonth.getMonth()-1, thisMonth.getDate())
	buildCalendar()
}

function nextCalendar() {
	thisMonth = new Date(thisMonth.getFullYear(), thisMonth.getMonth()+1, thisMonth.getDate());
	buildCalendar()
}


</script>

<div class="wrap-calendar">
<table class="tb-calendar">
	<thead>
		<tr>
			<td onclick="prevCalendar()" class="arrCal"> ◀ </td>
			<td colspan="5">
			<span id="calYear"></span>년
			<span id="calMonth"></span>월
			</td>
			<td onclick="nextCalendar()" class="arrCal"> ▶ </td>
		</tr>
		<tr>
			<td>일</td>
			<td>월</td>
			<td>화</td>
			<td>수</td>
			<td>목</td>
			<td>금</td>
			<td>토</td>
		</tr>
	</thead>
	<tbody>
	</tbody>
</table>
</div><!-- .warp-calendar end -->

<div>



</div>

