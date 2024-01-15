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
					<%@include file = "../include/aside4.jsp" %>
				</aside>
			
					<div class="container" style="border:0px solid red; margin-left:300px; padding-bottom: 50px;" >
				     
				     <!-- 본문 입력 -->

<h2 align="left">※ 자원봉사 운영안내 – 학생 자원봉사 ※</h2>
  <ul>
<li>대상 : 중학생~고등학생</li>
<li>운영시간 : 오전 09:00~13:00 , 오후 14:00~18:00</li>
<li>활동시간 : 1일 1회 4시간 이내 (최대 월 2회 참여)</li>
<li>신청인원 : 오전 1명, 오후 1명</li>
<li>신청기간 : 매월 26일 ~ 말일</li>
<li>활동내용 : 도서정리, 도서 배가 작업, 도서관 환경정비 등</li>
    <li>첫 번째 항목</li>
    <li>두 번째 항목</li>
    <li>세 번째 항목</li>
  </ul>
  <br>

<h2 align="left">※ 자원봉사 운영안내 – 성인 자원봉사 ※</h2>
<ul>
<li>대상 : 성인</li>
<li>운영시간 : 09:00~18:00</li>
<li>활동시간 : 1일 1회 4시간 이내 (최대 월 2회 참여)</li>
<li>신청인원 : 1일 최대 2명</li>
<li>신청기간 : 수시 접수(봉사희망일 10일 전 신청)</li>
<li>활동내용 : 도서정리, 도서 배가 작업, 훼손도서 수리, 도서관 환경정비 등</li>
</ul>
 <br>


<h2 align="left">※ 유의사항 ※</h2>
<ul>
<li>불성실한 자 및 무단 불참자는 이후 1개월간 봉사활동 접수가 제한됩니다.</li>
</ul>


				     
				     
				     
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