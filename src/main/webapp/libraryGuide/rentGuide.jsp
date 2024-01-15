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

<h3 class="htitle">※ 대출/반납 안내 ※</h3>

<table class="tbl">
	
	<colgroup>
		<col style="width:20%" />
		<col />
	</colgroup>
	<thead>
		<tr>
			<th scope="col">구분</th>
			<th colspan="2">내용</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th scope="row">대상</th>
			<td class="ta_l dataPl">하이도서관 대출회원</td>
		</tr>
		<tr>
			<th scope="row">권수/기간</th>
			<td class="ta_l dataPl">1회 1권, 7일(1회 연장,7일)<br />
			
			</td>
		</tr>
		<tr>
			<th scope="row">이용방법</th>
			<td class="ta_l dataPl">하이도서관에서 발급한 회원카드로 관내 도서관에서 대출/반납 가능</td>
		</tr>
		<tr>
			<th scope="row">대출제한</th>
			<td class="ta_l dataPl">연체도서 중 가장 오래된 도서의 연체일수만큼 대출불가</td>
		</tr>
		<tr>
			<th scope="row">유의사항</th>
			<td class="ta_l dataPl">
			<ul class="dot-list">
				<li>회원 본인인 경우에만 대출 가능</li>
				<li>대출도서 분실 또는 훼손 시 동일도서로 변상하여야 함</li>
				<li>도서 반납 후 동일도서 재대출은 3일 후에 가능</li>
			</ul>
			</td>
		</tr>
	</tbody>
</table>
<br>
<br>
<br>
<br>


<h3 class="htitle">※ 반납연기 안내 ※</h3>

<table class="tbl">
	<colgroup>
		<col style="width:20%" />
		<col />
	</colgroup>
	<thead>
		<tr>
			<th scope="col">구분</th>
			<th colspan="2">내용</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th scope="row">횟수 및 기간</th>
			<td class="ta_l dataPl">1회 반납예정일로부터 7일 연기 가능</td>
		</tr>
		<tr>
			<th scope="row">방법</th>
			<td class="ta_l dataPl">도서관 직접 방문 또는 유선으로 연기 가능</td>
		</tr>
		<tr>
			<th scope="row">제한사항</th>
			<td class="ta_l dataPl">
			<ul class="dot-list">
				<li>다른이용자가 대출예약한 경우</li>
				<li>반납일이 경과했거나 반납일이 경과한 다른 연체도서가 있는 경우</li>
			</ul>
			</td>
		</tr>
	</tbody>
</table>
<br>
<div>
<button type="button" onclick="window.location.href='/bookRent.do'" class="custom-button">도서 대출하러 가기</a></button>
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