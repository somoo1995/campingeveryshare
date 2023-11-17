<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">

.wrap-calendar {
    background-color: white;
    height: auto;
    width: 340px;
    padding: 20px;
    padding-left: 25px;
    margin: 0 auto;
    border-radius: 5px;
    box-shadow: 0px 4px 12px -1px rgba(0,0,0,0.3);
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
    font-size: 1.1em;
    font-weight: bold;
}

.tb-calendar>thead>tr:last-child>td {
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
    background: #eee;
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
    buildCalendar();
});

var today = new Date();
var thisMonth = new Date();
today.setHours(0, 0, 0, 0);

// 첫 번째로 선택한 날짜를 저장하는 변수
var firstSelectedDate = null;

function buildCalendar() {
    var tbodyCal = document.querySelector(".tb-calendar > tbody");

    var firstDate = new Date(thisMonth.getFullYear(), thisMonth.getMonth(), 1);
    var lastDate = new Date(thisMonth.getFullYear(), thisMonth.getMonth() + 1, 0);

    document.getElementById("calYear").innerText = thisMonth.getFullYear();
    document.getElementById("calMonth").innerText = leftPad(thisMonth.getMonth() + 1);

    while (tbodyCal.rows.length > 0) {
        tbodyCal.deleteRow(tbodyCal.rows.length - 1);
    }

    var nowRow = tbodyCal.insertRow();

    for (var j = 0; j < firstDate.getDay(); j++) {
        var nowColumn = nowRow.insertCell();
    }

    for (var nowDay = firstDate; nowDay <= lastDate; nowDay.setDate(nowDay.getDate() + 1)) {
        var nowColumn = nowRow.insertCell();
        var newDIV = document.createElement("p");

        newDIV.innerHTML = leftPad(nowDay.getDate());
        nowColumn.appendChild(newDIV);

        if (nowDay.getDay() == 6) {
            nowRow = tbodyCal.insertRow();
        }

        if (nowDay < today) {
            newDIV.className = "pastDay";
        } else if (nowDay.getFullYear() == today.getFullYear() && nowDay.getMonth() == today.getMonth() && nowDay.getDate() == today.getDate()) {
            newDIV.className = "today";
            newDIV.onclick = function () { choiceDate(this); }
        } else if (nowDay.getMonth() == today.getMonth() + 1 || nowDay.getMonth() == today.getMonth() + 2) {
            newDIV.className = "futureDay";
            newDIV.onclick = function () { choiceDate(this); }
        } else {
            newDIV.className = "futureDay";
            newDIV.onclick = function () { choiceDate(this); }
        }       
    }
}

function leftPad(value) {
    if (value < 10) {
        value = "0" + value;
        return value;
    }
    return value;
}



function choiceDate(newDIV) {
    var date = new Date(thisMonth.getFullYear(), thisMonth.getMonth(), parseInt(newDIV.innerText));

    // 첫 번째로 선택한 날짜 저장
    if (firstSelectedDate === null) {
        firstSelectedDate = date;
    }

    // 이미 선택된 날짜라면 선택 해제
    if (newDIV.classList.contains("choiceDay")) {
        newDIV.classList.remove("choiceDay");
        // 배열에서 해당 날짜 제거
        var index = selectedDates.indexOf(date);
        if (index !== -1) {
            selectedDates.splice(index, 1);
        }
    } else {
        // 선택되지 않은 날짜라면 선택
        newDIV.classList.add("choiceDay");

        // 배열에 해당 날짜 추가
        selectedDates.push(date);
        
		// 두 번째 날짜를 선택한 후에 중간 날짜들을 배열에 추가
        if (selectedDates.length === 2) {
            getBetweenDates();
        }
    }

    console.log(selectedDates); // 선택된 날짜 배열 확인용
}

// 두 날짜 사이의 모든 날짜를 배열에 추가
function getBetweenDates() {
    var betweenDates = [];

    if (firstSelectedDate !== null && selectedDates.length === 2) {
        var startDate = firstSelectedDate;
        var endDate = selectedDates[1];

        var currentDate = new Date(startDate);

        while (currentDate <= endDate) {
            betweenDates.push(new Date(currentDate));
            currentDate.setDate(currentDate.getDate() + 1);
        }

        console.log(betweenDates); // 두 날짜 사이의 모든 날짜 배열 확인용
    }
}

function prevCalendar() {
    thisMonth = new Date(thisMonth.getFullYear(), thisMonth.getMonth() - 1, thisMonth.getDate());
    buildCalendar();
}

function nextCalendar() {
    thisMonth = new Date(thisMonth.getFullYear(), thisMonth.getMonth() + 1, thisMonth.getDate());
    buildCalendar();
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
</div><!-- .wrap-calendar end -->