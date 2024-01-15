<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인2</title>
</head>
<link rel="stylesheet" href="../css/lib.css">
<style>

.button-wrapper {
    text-align: center;
    margin-top: 20px;
}

.custom-button {
    display: inline-block;
    padding: 10px 20px;
    background-color: #3498db;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    text-decoration: none;
    transition: background-color 0.3s ease;
}

.custom-button:hover {
    background-color: #2980b9;
}

.tbl {
  width: 100%;
  border-collapse: collapse;
  border: 1px solid #ddd;
  margin-top: 20px;
}

/* 테이블 캡션 스타일 */
.tbl caption {
  font-weight: bold;
  font-size: 1.2em;
  margin-bottom: 10px;
}

/* 테이블 헤더 셀 스타일 */
.tbl th {
  background-color: #f2f2f2;
  text-align: left;
  padding: 10px;
  border: 1px solid #ddd;
}

/* 테이블 데이터 셀 스타일 */
.tbl td {
  padding: 10px;
  border: 1px solid #ddd;
}

ul {
  list-style-type: circle; /* 원 스타일로 설정 */
  padding-left: 20px; /* 좌측 여백 설정 */
  text-align: left;
}

/* 기본 점 모양으로 표시되는 순서가 없는 목록 스타일 */
ul.default {
  list-style-type: disc; /* 점 스타일로 설정 */
  padding-left: 20px; /* 좌측 여백 설정 */
}

.title {
    font-size: 24px; /* 크기 조정 */
    font-weight: bold;
    margin-bottom: 10px;
}

.txt {
    font-size: 16px; /* 크기 조정 */
    line-height: 1.5; /* 줄 간격 조정 */
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
	
	<section class="section1">
		<div class="sec1">
			
				<aside class="aside">
					<%@include file = "../include/aside.jsp" %>
				</aside>
			
					<div class="container" style="border:0px solid red; margin-left:300px; padding-bottom: 50px;" >
				     
				     <!-- 본문 입력 -->

<div class="summaryDesc">
	<div class="innerBox">
		<div class="img icoReadingRoom"></div>
		<div class="desc">
			<p class="title">원하는 좌석을 내 마음대로~</p>
			<p class="txt">
				일반인 및 학생들이 개인 자료를 가지고 지정된 좌석에서 학습을 할 수 있는 공간입니다. <br>도서관 열람실 좌석 현황을 사이트에서 실시간으로 확인 하실수 있습니다.
			</p>
		</div>
	</div>
</div>
<br>
<br>
<div class="btitle">※ 이용안내 ※</div>
<ul class="dot-list ml">
		
			<li>좌석 수 : 총 50석</li>
			<li>이용대상 : 중학생 이상</li>
			<li>지정좌석제 운영</li>
	
	
</ul>
<br>
<div class="btitle">※ 이용방법 ※</div>
<div class="arrStep-list col-4">
	<ul>
		<li>하이도서관 회원가입 후 로그인</li>
		<li>신청서비스 카테고리의 열람실 클릭</li>
		<li>좌석선택</li>
		<li>이용안내, 좌석사용 시작 확인 후<br> 열람실 이용</li>
	</ul>
</div>
<br>
<div class="btitle">※ 퇴실방법 ※</div>
<ul class="dot-list ml mt10">
	
		
			<li>로그인</li>
			<li>신청서비스 카테고리의 열람실 클릭</li>
			<li>본인 사용중인 좌석 선택 후 <br> 열람실 퇴실</li>
		
	
</ul>
<br>
<div class="btitle">※ 이용규정 ※</div>
<ul class="dot-list ml">
	<li>열람실 이용자는 반드시 사용신청 후</li>
	<li>2시간 이상 좌석 공석시 강제 퇴실처리 (좌석만석시 적용)</li>
	<li>음식반입 불가</li>
</ul>

<br>
<br>
<br>
				     
<div>
<button type="button" onclick="window.location.href='/libReserve.do'" class="custom-button">열람실 이용하기</a></button>
</div>				     
				     
				     <!-- 본문 입력 -->
				     
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