<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="web.dto.Rent"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
    // 컨트롤러에서 전달받은 list 모델
    List<Rent> list = (List<Rent>) request.getAttribute("list");
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

</style>


<script type="text/javascript">

$(function() {
	buildCalendar()
})	

    // list 변수를 JavaScript에서 사용할 수 있도록 정의
    var list = <%= new Gson().toJson(list) %>;

// 달력 생성
var today = new Date()
var thisMonth = new Date()

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
    	
    	// 각 Dto에서 startDate와 endDate 값을 추출하여 클래스를 적용
        for (var i = 0; i < list.length; i++) {
            var dtoStartDate = new Date(list[i].startDate);
            var dtoEndDate = new Date(list[i].endDate);

            if (isDateInRange(nowDay, dtoStartDate, dtoEndDate)) {
            	newDIV.className = "choiceDay"
//                 newDIV.classList.add("choiceDay")
//                 break;  // 날짜가 한 번이라도 범위에 포함되면 나머지 Dto에 대한 체크는 중단
            }
        }
    	

        if (nowDay < today) {
            newDIV.className = "pastDay"
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
    }
} // buildCalendar() end


//startDate와 endDate가 주어진 날짜를 포함하는지 확인하는 함수
function isDateInRange(date, startDate, endDate) {
    return date >= startDate && date <= endDate;
}

function leftPad(value) {
    if (value < 10) {
        value = "0" + value
        return value
    }
    return value
}

var firstSelectedDate = null
var selectedDates = []
var betweenDates = []

function choiceDate(newDIV) {
	
// 	betweenDates.splice(0, betweenDates.length)
	
    console.log("selectedDates st : " + selectedDates) // 선택된 날짜 확인
    console.log("betweenDates st : " + betweenDates) // 두 날짜 사이의 모든 날짜 확인

    var date = new Date(thisMonth.getFullYear(), thisMonth.getMonth(), parseInt(newDIV.innerText))
    var allDays = document.querySelectorAll(".tb-calendar tbody td p")
    console.log("선택 날짜 : " + date)
    
	var index = selectedDates.findIndex(function(d) {
        return d.getTime() === date.getTime()
    });
    
    console.log("index : " + index)
    
    if( index !== -1 ) {
    	betweenDates.splice(0, betweenDates.length)
    	selectedDates.push(date)
//     	selectedDates.splice(index, 1)
//     	betweenDates.splice(index, betweenDates.length)
    	newDIV.classList.remove("choiceDay")
    	
    	allDays.forEach(function(day) {
		var dateDIV = new Date(thisMonth.getFullYear(), thisMonth.getMonth(), parseInt(day.innerText))
		

	})
    	
    	
    } else {
    	selectedDates.push(date)
		newDIV.classList.add("choiceDay")
	}
    
    selectedDates.sort(function (a, b) {
		return a.getTime() - b.getTime()
	})
    
	console.log("selectedDates - sort : " + selectedDates)
    
	if( selectedDates.length === 2 ) {
		var startDate = new Date(selectedDates[0])
		var endDate = new Date(selectedDates[1])
		
		var currentDate = new Date(startDate)
		
        while (currentDate <= endDate) {
            betweenDates.push(new Date(currentDate))
            currentDate.setDate(currentDate.getDate() + 1)
        }
		
	}
	
	allDays.forEach(function(day) {
		var dateDIV = new Date(thisMonth.getFullYear(), thisMonth.getMonth(), parseInt(day.innerText))
		betweenDates.forEach(function(bDate) {
			
			if ( betweenDates.length > 0 && bDate.getTime() === dateDIV.getTime() ) {
				day.classList.add("choiceDay")
				selectedDates = betweenDates
			}
			
		})

	})
	
	
    console.log("selectedDates fin : " + selectedDates) // 선택된 날짜 확인
    console.log("betweenDates fin : " + betweenDates) // 두 날짜 사이의 모든 날짜 확인
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
