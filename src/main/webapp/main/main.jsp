<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="../include/slideShow.js"></script>
<script src="../include/calMain.js"></script>
</head>
<link rel="stylesheet" href="../css/lib.css">

<script>
var alertMessage = "${param.alertMessage}";
if (alertMessage && alertMessage.trim() !== "") {
alert(decodeURIComponent(alertMessage));
location.href = "libLoginWrite.do";
}

$(function(){ 
	
	$("#button1").click(function(){
		let userid   = $("#userid").val();
		let userpass = $("#userpass").val();
		
		if(userid == "" || userpass == "") {
			alert("아이디 또는 암호를 확인해주세요.");
			return false;
		}
		
		var datas = {"userid":userid,"userpass":userpass}; // json 형식으로 작성
		$.ajax({
			type : "POST",
			data : datas,
			url : "/loginSession.do",
			
			datatype : "text",
			success 	 : function(data) {
				 	 if(data == "1") {
						alert("이미 탈퇴한 회원입니다.");
					 } else if(data == "2") {
						 alert("존재하지 않는 아이디 입니다.");
					 } else if(data != "" && data != "1" && data != "2") {
						alert(data+"님 환영합니다. \n로그인 되었습니다.");
						location = "/"; // 메인화면으로 이동
					 } else {
						 alert("아이디 또는 암호가 일치하지 않습니다.");
					 }
				 },
   			error 		 : 	function() {
   				 alert("전송실패");
   			 }
		});
		
	});
});

</script>

<script>

function fn_logout() {
	$.ajax({
		type : "POST",
		data : "", //  전송되는 데이터 값은 없다.
		url : "/libLogout.do", 
		
		datatype : "text",
		success 	 : function(data) {
			 if(data == "1") {
					alert("로그아웃 되었습니다.");
					location = "/"; // 메인화면으로 이동
				 }
			 },
			error 		 : 	function() {
				 alert("전송실패");
			 }
	});
}

</script>

<style>

.icon {
    width: 60px; /* 원하는 너비로 조정 */
    height: 60px; /* 원하는 높이로 조정 */
}
.icon:hover {
    transform: scale(1.1); /* 아이콘을 약간 확대 */
    /* 다른 스타일도 추가 가능 */
}

.book-cell {
    width: 25%;
    text-align: center;
    padding: 20px;
    background-color: #f8f8f8;
    box-shadow: 0px 2px 6px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
    transition: transform 0.3s, box-shadow 0.3s;
}

.book-cell:hover {
    transform: scale(1.05);
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
}

.book-cell a {
    text-decoration: none;
    color: #333;
}

.book-cell img {
    width: 150px;
    height: 200px;
    object-fit: cover;
    border-radius: 5px;
}

.plus-link {
	display: inline-block;
	width: 20px;
	height: 20px;
	background-color: #6799FF;
	color: white;
	text-align: center;
	line-height: 18px;
	border-radius: 50%;
	cursor: pointer;
	transition: background-color 0.3s, transform 0.3s;
}

.plus-link:hover {
	background-color: #3366CC;
	transform: scale(1.1);
}

.custom-table {
	border-collapse: collapse; /* 테이블 셀 경계 병합 */
	width: 95%;
	margin: 0 auto; /* 가운데 정렬 */
	border: 1px solid #ccc;
}

.custom-table th, .custom-table td {
	border: 1px solid #ccc; /* 모든 셀 테두리 설정 */
	padding: 5px;
	text-align: left;
}

.custom-table th {
	color: #333;
	background-color: #f7f7f7; /* 헤더 배경색 설정 */
}

.table-container {
	margin-top: 10px; /* 테이블 위 여백 추가 */
	background-color: white;
	border: 1px solid #ccc;
	box-shadow: 0px 0px 5px #ccc;
	border-radius: 5px;
	padding: 10px;
	width: 100%;
}

.table-header {
	font-size: 24px; /* 폰트 크기 조정 */
	color: #333; /* 색상 변경 */
	text-align: center;
	padding: 20px;
}

.third {
	flex: 1;
	margin: 10px;
	padding: 10px;
	border: 1px solid #E4E4E4;
}
.one-third {
    width: calc(25% - 10px); 
    text-align: center;
    padding: 5px;
    box-sizing: border-box;
}
.two-third {
    width: calc(45% - 10px); 
    text-align: center;
    padding: 5px;
    box-sizing: border-box;
    margin-right:15px;
}
.three-third {
    width: calc(30% - 10px); 
    text-align: center;
    padding: 5px;
    box-sizing: border-box;
}
.third-content {
	height:280px;
    flex: 1;
    margin: 10px;
    padding: 10px;
    border: 1px solid #E4E4E4;
    text-align : center;
}
.third-content a {
    text-decoration: none; /* 밑줄 제거 */
    color: inherit; /* 기본 색상 상속 */
}
.content {
	display: flex;
	flex-direction: column; /* 세로 정렬로 설정 */
	align-items: center; /* 가로 중앙 정렬 */
	justify-content: space-between; /* 위 아래 사이 여백을 최대화 */
	height: 100%;
}

.blue-circle {
	background-color: #6799FF; /* 배경색을 파란색 계통으로 지정 */
	color: white; /* 글자색을 흰색으로 지정 */
	border-radius: 50%; /* 동그라미 모양으로 둥글게 */
	width: 28px; /* 너비와 높이 설정으로 크기 지정 */
	height: 28px;
	text-align: center; /* 내용 가운데 정렬 */
	line-height: 28px; /* 내용 수직 가운데 정렬 */
	font-size: 14px; /* 폰트 크기 설정 */
	font-weight: bold; /* 글자 굵기 설정 */
	display: inline-block; /* 인라인 블록 요소로 표시 */
	margin-right: 10px; /* 오른쪽 여백 설정 */
	box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.3); /* 그림자 추가 */
}

/* 행사 및 휴관 빨간색 동그라미 스타일 */
.red-circle {
	background-color: #F15F5F; /* 배경색을 빨간색 계통으로 지정 */
	color: white; /* 글자색을 흰색으로 지정 */
	border-radius: 50%; /* 동그라미 모양으로 둥글게 */
	width: 28px; /* 너비와 높이 설정으로 크기 지정 */
	height: 28px;
	text-align: center; /* 내용 가운데 정렬 */
	line-height: 28px; /* 내용 수직 가운데 정렬 */
	font-size: 14px; /* 폰트 크기 설정 */
	font-weight: bold; /* 글자 굵기 설정 */
	display: inline-block; /* 인라인 블록 요소로 표시 */
	margin-right: 10px; /* 오른쪽 여백 설정 */
	box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.3); /* 그림자 추가 */
}
</style>

<style>
/* Slideshow container */
.slideshow-container {
  max-width: 600px;
  max-height: 430px;
  position: relative;
}
.slideshow-container .mySlides img {
  height: 750px;
}

/* Hide the images by default */
.mySlides {
  display: none;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  margin-top: -22px;
  padding: 16px;
  color: grey;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4}
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4}
  to {opacity: 1}
}


</style>

<style>

.logintable {
  width: 100%;
  height:120px;    
  border-collapse: collapse;
}

.logintable th,
.logintable td {
  padding: 10px;
  border-top: 1px solid #ccc;
  text-align: left;
}

.logintable tr:first-child th,
.logintable tr:first-child td {
  border-top: none; /* Remove top border for the first row */
}

.logintable th {
  width: 30%;
}

.logintable td input[type="text"],
.logintable td input[type="password"] {
  width: 100%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
  box-sizing: border-box;
}

.btn_login {
  width: 100%;
  padding: 10px;
  background-color: #007bff;
  color: #fff;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.btn_login:hover {
  background-color: #0056b3;
}
.btn1 {
  width: 48%;
  padding: 10px;
  background-color: #007bff;
  color: #fff;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.btn1:hover {
  background-color: #0056b3;
}
.memberQR {
	width:90px; 
	height:90px;
	margin: auto;
    display: block;
}
</style>

<style>
.notice-icon {
   display: inline-block;
   width: 44px; /* Adjust size as needed */
   height: 27px; /* Adjust size as needed */
   background-color:  #369DE2; /* Background color of the circle */
   border-radius: 10%; /* Creates the circle shape */
   text-align: center;
   line-height: 26px; /* Centering vertically */
   color: white;
}

.noticetable {
    width: 100%;
    border-collapse: collapse;
    border-top: 1px solid white;
    border-left: none;
    border-right: none;
    border-bottom: 1px solid #c8c8c8;
}

/* 테이블 헤더 스타일 */
.noticetable th {
   padding: 10px;
   text-align: center;
   border-left: none; 
   border-right: none; 
   background: linear-gradient(to bottom, #ffffff, #f0f0f0);
   color: black;
}

.noticetable td {
    padding: 10px;
    text-align: center;
    border-top: 1px solid #c8c8c8;
    border-left: none;
    border-right: none;
    border-bottom: none;
    white-space: nowrap; /* 텍스트 줄바꿈 방지 */
    overflow: hidden; /* 넘치는 텍스트 숨김 */
    text-overflow: ellipsis; /* 텍스트가 넘칠 때 말줄임표 (...) 표시 */
    max-width: 200px; /* 필요한 경우 최대 너비 조정 */
}
</style>

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


    <section class="section1main">
        <div class="sec1main">

            <!-- one-third 시작 -->
            <div class="one-third">
                <div class="third-content">

                    <c:if test="${s_userid == null }">
                        <div>
                            <form style="margin: 0; padding: 0; border: 0;" name="frm">
                                <table class="logintable">
                                    <tr>
                                        <th>ID</th>
                                        <td><input type="text" autofocus id="userid" maxLength="20" name="userid"></td>
                                    </tr>
                                    <tr>
                                        <th>PW</th>
                                        <td><input type="password" id="userpass" maxLength="50" name="userpass"></td>
                                    </tr>
                                    <tr style="height:150px; vertical-align: bottom;">
                                        <td colspan="2"><input class="btn_login" type="submit" value="로그인" id="button1" onclick="return false;"></td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                    </c:if>

                    <c:if test="${s_userid != null }">
                        <fieldset style="height:260px;">
                            <legend>회원정보</legend>

                            <table class="logintable">
                                <tr>
                                    <th>${memberVO.name }님<br> 방문을 환영합니다.</th>
                                </tr>
                                <tr>
                                    <th>
                                        <img src="memberQR/${s_userid}.png" class="memberQR">
                                    </th>
                                </tr>
                                <tr style="height:60px; vertical-align: bottom;">
                                    <th>
                                        <c:if test="${s_userid == 'admin' }">
                                            <button type="button" class="btn1" onclick="location='/bookInput.do'">관리자모드</button>
                                        </c:if>
                                        <c:if test="${s_userid != 'admin' }">
                                            <button type="button" class="btn1" onclick="location='/libMemberDetail.do'">내정보</button>
                                        </c:if>
                                        <button type="button" class="btn1" onclick="fn_logout(); return false;">로그아웃</button>
                                    </th>
                                </tr>
                            </table>

                        </fieldset>

                    </c:if>


                </div>
            </div>
            <!-- one-third 끝 -->

            <!-- two-third 시작 -->
            <div class="two-third">
                <div class="third-content">
                    <table width="480">
                        <colgroup>
                            <col width="33%" />
                            <col width="*" />
                            <col width="33%" />
                        </colgroup>
                        <tr height="130px;">
                            <td>
                                <a href="/bookSearch.do"><img src="../icon/search.png" alt="search 아이콘" class="icon"><br>
                                    도서검색</a>
                            </td>
                            <td>
                                <a href="/libReserve.do"><img src="../icon/열람실.png" alt="열람실 아이콘" class="icon"><br>
                                    열람실현황</a>
                            </td>
                            <td>
                                <a href="/libMap.do"><img src="../icon/map.png" alt="map 아이콘" class="icon"><br>
                                    찾아오는길</a>
                            </td>

                        </tr>
                        <tr height="130px;">
                            <td>
                                <a href="/popularBook.do"><img src="../icon/popular.png" alt="popular 아이콘" class="icon"><br>
                                    인기도서</a>
                            </td>
                            <td>
                                <a href="/bookRent.do"><img src="../icon/rent.png" alt="rent 아이콘" class="icon"><br>
                                    대출하기</a>
                            </td>
                            <td>
                                <a href="/newBook.do"><img src="../icon/new.png" alt="new 아이콘" class="icon"><br>
                                    신착도서</a>
                            </td>
                        </tr>
                    </table>

                </div>
            </div>
            <!-- two-third 끝 -->

            <!-- three-third 시작 -->
            <div class="three-third">
                <div class="content">


                    <div class="table-container">
                        <table class="custom-table">
                            <tr>
                                <th colspan="2" class="table-header"><span id="currentMonth"></span>의 일정
                                    <a href="/libCalendar.do">
                                        <div class="plus-link">+</div>
                                    </a></th>
                            </tr>
                            <tr>
                                <th width="20%">정기<br>휴관일</th>

                                <td width="80%">
                                    <a href="/libCalendar.do">
                                        <div class="blue-circle"><span id="secondSaturday"></span></div>
                                    </a>
                                    <a href="/libCalendar.do">
                                        <div class="blue-circle"><span id="fourthSaturday"></span></div>
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <th>행사 및 휴관</th>
                                <td>
                                    <!-- JSTL을 이용하여 리스트의 각 항목 출력 -->
                                    <c:forEach var="list" items="${list}">
                                        <a href="/libCalDetail.do?unq=${list.unq }">
                                            <div class="red-circle">${list.day}</div>
                                        </a>
                                    </c:forEach>
                                </td>
                            </tr>
                        </table>

                    </div>
                    <span style="margin-bottom:30px;">
                        둘째, 넷째 토요일 정기휴관일<br>
                        평일 : 09:00 ~ 22:00<br>
                        토,일요일 : 09:00 ~ 17:00
                    </span>




                </div>

            </div>
            <!-- three-third 끝 -->


        </div>
    </section>

    <section class="section2">

        <div style="text-align:center; width:620px; float:left; margin-top:20px;">
            <table class="noticetable" border="1" style="margin-left: 40px;">
                <caption style="font-size:20px; margin-bottom:10px;">최신 공지사항 &nbsp;&nbsp;<a href="${pageContext.request.contextPath}/libNoticeList2.do" style="font-weight:bold;">+</a></caption>

                <colgroup>
                    <col width="11%" />
                    <col width="*" />
                    <col width="15%" />
                    <col width="20%" />
                </colgroup>
                <c:set var="rownumber" value="${defaultVO.recordCountPerPage }" />
                <c:forEach var="notice" items="${noticeList }" varStatus="status" begin="0" end="8">
                    <tr>
                        <td>
                            <c:if test="${notice.emps=='Y' }">
                                <div class="notice-icon">공지</div>
                            </c:if>
                            <c:if test="${notice.emps=='N' }">${rownumber }</c:if>
                        </td>
                        <td style="text-align:left;"> <a href="/libNoticeDetail2.do?unq=${notice.unq}">${notice.title}</a></td>
                        <td>${notice.name}</td>
                        <td>${notice.rdate}</td>
                    </tr>
                    <c:set var="rownumber" value="${rownumber-1 }" />
                </c:forEach>

            </table>
        </div>
        <div style=" margin-top:20px; width:400px; text-align:center; font-size:20px; float:right; margin-right:60px; margin-bottom:10px;">문화행사</div>
        <div class="slideshow-container" style="border:1px solid #c8c8c8; clear:right; float:right; margin-right:60px;">

            <!-- Full-width images with number and caption text -->
            <c:forEach var="file" items="${eventList }" varStatus="status">
                <div class="mySlides fade">
                    <div class="numbertext">${status.count } / 4</div>
                    <a href="/libEventDetail2.do?unq=${file.unq}"><img src="../libImage/${file.file1}" style="width:400px; height:430px;"></a>
                </div>
            </c:forEach>

            <!-- Next and previous buttons -->
            <a class="prev" onclick="moveSlides(-1)">&#10094;</a>
            <a class="next" onclick="moveSlides(1)">&#10095;</a>
        </div>
        <br />

        <!-- The dots/circles -->
        <div style="text-align:center; width:400px; float:right; clear:right; margin-top:5px; margin-right:60px;">
            <span class="dot" onclick="currentSlide(0)"></span>
            <span class="dot" onclick="currentSlide(1)"></span>
            <span class="dot" onclick="currentSlide(2)"></span>
            <span class="dot" onclick="currentSlide(3)"></span>
        </div>

    </section>

    <section class="section3" style="margin-top:30px; border-top:1px solid #EAEAEB;">
        <div class="sec3">
            <div style="text-align: center;">
                <h3> 인기 도서 목록 </h3>
            </div>

            <table style="width:1200px; height:420px;">
                <tr>
                    <c:forEach var="book" items="${bookList}" varStatus="status">
                        <c:choose>
                            <c:when test="${status.index % 4 == 0}">
                </tr>
                <tr>
                    </c:when>
                    </c:choose>
                    <td class="book-cell">
                        <img src="${book.thumbnail}" alt="표지 이미지" style="width: 230px; height: 270px;"><br><Br>
                        <a href="/bookDetail.do?unq=${book.unq}">${book.title}</a>
                    </td>
                    </c:forEach>
                </tr>
            </table>
        </div>
    </section>

    <footer class="footer">
        <%@include file = "../include/footer.jsp" %>
    </footer>
    <aside class="new-aside">
        <%@include file = "../include/newaside.jsp" %>
    </aside>

</body>

</html>