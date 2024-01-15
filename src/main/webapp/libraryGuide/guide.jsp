<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용시간</title>
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

<style>
        /* 스타일을 추가하여 표를 예쁘게 꾸밀 수 있습니다. */
        body {
            font-family: Arial, sans-serif;
        }
        .tblWrap {
            margin-top: 20px;
        }
        .tbl {
            width: 100%;
            border-collapse: collapse;
        }
        .tbl th, .tbl td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }
        .tbl th {
            background-color: #f2f2f2;
        }
        .btitle {
            font-size: 18px;
            font-weight: bold;
            margin-top: 20px;
        }
        .step-list {
            list-style: none;
            padding: 0;
        }
        .step-list li {
            margin-bottom: 20px;
            border: 1px solid #ddd;
            padding: 10px;
            background-color: #f9f9f9;
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

<div class="btitle"> ※ 이용시간 ※</div>

<div class="tblWrap">
<table class="tbl bd">
	<caption>이용시간 표 : 층별, 실명, 운영시간으로 구성</caption>
	<colgroup>
		<col style="width: 20%;" />
		<col style="width: 20%;" />
		<col />
	</colgroup>
	<thead>
		<tr>
			<th scope="col">층별</th>
			<th scope="col">실명</th>
			<th scope="col">운영시간</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>3층</td>
			<td>디지털자료실</td>
			<td>09:00 ~ 18:00 (토,일 17:00까지)</td>
		</tr>
		<tr>
			<td>2층</td>
			<td>종합자료실</td>
			<td>09:00 ~ 22:00 (토,일 17:00까지)</td>
		</tr>
		<tr>
			<td rowspan="2">1층</td>
			<td>어린이자료실</td>
			<td>09:00 ~ 18:00 (토,일 17:00까지)</td>
		</tr>
		<tr>
			<td>안내데스크</td>
			<td>평일 08:00 ~ 23:00 (토,일 22:00까지)<br />
			※ 회원증 발급은 09:00 ~ 18:00 운영(주말 : 09:00~17:00)</td>
		</tr>
		<tr>
			<td rowspan="2">지하 1층</td>
			<td rowspan="2">열람실</td>
			<td>08:00 ~ 23:00 (토,일 22:00까지)</td>
		</tr>
	</tbody>
</table>
</div>

<div class="btitle">※ 휴관일 ※</div>

<div class="step-list col-3">
<ul>
	<li>
	<div class="tit">매월 둘째, 넷째 월요일 정기휴관</div>

	<div class="txt">
	<p>열람실, 도서대출/반납 등<br />
	<strong>전체 휴관</strong></p>
	</div>
	</li>
	<li>
	<div class="tit">국경일, 정부에서 지정하는 공휴일</div>

	<div class="txt">
	<p>열람실 09:00 ~ 18:00 개방<br />
	(신정, 추석, 설날 당일 휴관)</p>
	</div>
	</li>
	<li>
	<div class="tit">임시휴관일</div>

	<div class="txt">
	<p>도서관의 장서점검 및 도서정리, 시설의 수리ㆍ정리등 기타 도서관장이 필요하다고 인정할 때</p>
	</div>
	</li>
</ul>
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