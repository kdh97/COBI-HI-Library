<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인2</title>
</head>
<link rel="stylesheet" href="../css/lib.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<style>

  h2 {
    margin: 0 0 15px;
    font-size: 24px;
    color: #333;
  }

  .button-container {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 10px;
    padding-bottom: 20px;
  }

  button {
    border: none;
    background-color: #007BFF;
    color: white;
    border-radius: 5px;
    padding: 10px 20px;
    cursor: pointer;
    margin: 0 10px;
  }

  #monthYear {
    font-size: 18px;
    margin: 10px 0;
    color: #555;
  }

  .caltable {
    border-collapse: collapse;
    width: 800px;
    margin: auto;
    border: 1px solid gray; /* Updated border color */
    padding: 10px;
    text-align: center;
    background-color: white; /* Updated background color */
  }
    .caltable th, .caltable td {
    border: 1px solid #EAEAEA; /* 1px 회색 테두리 추가 */
    padding: 10px;
    text-align: center;
  }

  .th {
    border: 1px solid black;
    padding: 10px;
    text-align: center;
  }
  
  .td {
    border: 1px solid black;
    padding: 10px;
    text-align: center;
  }

  th {
    background-color: #f2f2f2;
  }

  td.sunday {
    color: red;
  }
  td.saturday {
    color: blue;
  }

  td.today {
    background-color: #4CAF50;
    color: white;
  }

  td.other-month {
    color: #ccc;
  }
</style>

<script>
</script>


<body>
   <header class="header1">
      <%@include file = "../include/header1.jsp" %>
   </header>
   <header class="header2">
      <%@include file = "../include/header2.jsp" %>
   </header>
   <nav class="nav">
      <%@include file = "../include/nav.jsp" %>
   </nav>
   <section class="section1">
      <div class="sec1">
            <aside class="aside">
               <%@include file = "../include/aside3.jsp" %>
            </aside>
            <div class="flex-item">
               <div class="container" style="border:0px solid black; margin-left:300px;" >
               <div class="content_area">
            
	            <script>
				document.addEventListener("DOMContentLoaded", function() {
					
					
					  const calendarBody = document.querySelector("#calendar tbody");
					  const beforeMonthBtn = document.querySelector("#beforeMonth");
					  const nextMonthBtn = document.querySelector("#nextMonth");
					  const monthYearDisplay = document.querySelector("#monthYearDisplay");
				
					  
					  const currentDate = new Date();
					  const currentYear = currentDate.getFullYear();
					  const currentMonth = currentDate.getMonth() + 1; // JavaScript의 월은 0부터 시작하므로 1을 더해줍니다.
					  
					  // resultList 변수를 JavaScript 배열로 초기화
					  const resultList = [
					    <c:forEach var="list" items="${resultList}" varStatus="status">
					      { unq : ${list.unq},
					        year: ${list.year},
					        month: ${list.month},
					        day: ${list.day},
					        title: "${list.title}",
					        
					      },
					    </c:forEach>
					  ];
					  
					  function generateCalendar(year, month) {
					    const firstDay = new Date(year, month, 1);
					    const lastDay = new Date(year, month + 1, 0);
					    const today = new Date();
				
					    calendarBody.innerHTML = "";
				
					    let day = 1;
					    for (let i = 0; i < 6; i++) {
					      const row = document.createElement("tr");
					      for (let j = 0; j < 7; j++) {
					        const cell = document.createElement("td");
				
					        if ((i === 0 && j < firstDay.getDay()) || day > lastDay.getDate()) {
					          cell.textContent = "";
					          cell.classList.add("other-month");
					        } else {
					          cell.textContent = day;
					          if (today.getFullYear() === year && today.getMonth() === month && today.getDate() === day) {
					            cell.classList.add("today");
					          }
					          if (j === 0) {
					            cell.classList.add("sunday");
					          }
					          
					          if (j === 6) {
					            cell.classList.add("saturday");
					          }
					          
					          if ((i === 1  || i === 3 ) && j == 6) {
					              const holidayText = document.createElement("div");
					              holidayText.textContent = "휴관일";
					              cell.appendChild(holidayText);
					            }
					          
					          
					          cell.style.position = "relative"; // 셀 내부의 상대적 위치 설정
					          cell.style.textAlign = "left"; // 내용 왼쪽 정렬
					          cell.style.verticalAlign = "top"; // 내용 위쪽 정렬
					          
					          // resultList를 사용하여 셀 내용을 업데이트
					          for (const item of resultList) {
								    if (year === item.year && month === item.month - 1 && day === item.day) { // JavaScript에서 month는 0부터 시작하기 때문에 -1을 해줘야 함
								        const link = document.createElement("a"); // <a> 태그 생성
								        link.href = "/libCalDetail.do?unq=" + item.unq; // 링크 주소 설정
								        link.style.color = "brown"; // 링크 색상 설정
								        if (item.title.length > 7) {
								            // 일정 제목이 7글자를 넘어가면 7글자로 자르고 "..." 추가
								            link.textContent = item.title.substr(0, 7) + "..";
								        } else {
								            // 일정 제목이 7글자 이하일 때는 그대로 출력
								            link.textContent = item.title;
								        }
								        link.style.fontSize = "13px"; // 링크 폰트 크기
								        link.style.textDecoration = "none"; // 밑줄 없애기
								
								        cell.style.color = "brown";
								
								        cell.innerHTML = item.day; // 기존 내용
								        cell.appendChild(link); // 셀 내에 링크 추가
								
								        const br = document.createElement("br"); // <br> 태그 생성
								        cell.appendChild(br); // <br> 태그 추가
								        cell.appendChild(link); // 셀 내에 링크 추가
								
								        // 다른 데이터들을 같은 셀에 개행하여 출력
								        for (const otherItem of resultList) {
								            if (year === otherItem.year && month === otherItem.month - 1 && day === otherItem.day && otherItem.unq !== item.unq) {
								                const otherLink = document.createElement("a"); // <a> 태그 생성
								                otherLink.href = "/libCalDetail.do?unq=" + otherItem.unq; // 링크 주소 설정
								                otherLink.style.color = "brown"; // 링크 색상 설정
								                if (otherItem.title.length > 7) {
										            // 일정 제목이 7글자를 넘어가면 7글자로 자르고 "..." 추가
										            otherLink.textContent = otherItem.title.substr(0, 7) + "..";
										        } else {
										            // 일정 제목이 7글자 이하일 때는 그대로 출력
										            otherLink.textContent = otherItem.title;
										        }
								                otherLink.style.fontSize = "13px"; // 링크 폰트 크기
								                otherLink.style.textDecoration = "none"; // 밑줄 없애기
								
								                const otherBr = document.createElement("br"); // <br> 태그 생성
								                cell.appendChild(otherBr); // <br> 태그 추가
								                cell.appendChild(otherLink); // 다른 데이터의 링크 추가
								            }
								        }
								
								        break;
								    }
								}
					          
					          day++;
					          cell.style.width = "100px"; // 셀 너비 설정
					          cell.style.height = "100px"; // 셀 높이 설정
					          cell.style.boxSizing = "border-box"; // 셀 크기 계산 시 border와 padding을 포함하도록 설정
					        }
				
					        row.appendChild(cell);
					      }
					      calendarBody.appendChild(row);
					      if (day > lastDay.getDate()) {
					        break;
					      }
					    }
				
					    monthYearDisplay.textContent = year + "년 " + (month + 1) + "월";
					  }
				
					  function updateCalendar() {
					    generateCalendar(currentDate.getFullYear(), currentDate.getMonth());
					  }
				
					  beforeMonthBtn.addEventListener("click", function() {
						    currentDate.setDate(1); // 현재 날짜를 1일로 설정
						    currentDate.setMonth(currentDate.getMonth() - 1); // 이전달로 이동
						    updateCalendar();
						});

						nextMonthBtn.addEventListener("click", function() {
						    currentDate.setDate(1); // 현재 날짜를 1일로 설정
						    currentDate.setMonth(currentDate.getMonth() + 1); // 다음달로 이동
						    updateCalendar();
						});
				
					  updateCalendar();
					});
				</script>
				
				<div data-resultList="${resultList}">
				  <h2>달력</h2>
				  
				  <div id="button-container" class="button-container">
				    <button id="beforeMonth">이전 달</button>
				    <span id="monthYearDisplay"></span>
				    <button id="nextMonth">다음 달</button>
				  </div>
				  
				  <table id="calendar" class="caltable">
				    <thead>
				      <tr>
				        <th>일</th>
				        <th>월</th>
				        <th>화</th>
				        <th>수</th>
				        <th>목</th>
				        <th>금</th>
				        <th class="weekend">토</th>
				      </tr>
				    </thead>
				    <tbody>
				    </tbody>
				  </table>
				 
				</div>
              
               </div>
               </div>
            </div>
      </div>
   </section>
   
   <footer class="footer">
         <%@include file = "../include/footer.jsp" %>
   </footer>
   <aside class="new-aside">
    <%@include file="../include/newaside.jsp"%>
   </aside>

</body>
</html>