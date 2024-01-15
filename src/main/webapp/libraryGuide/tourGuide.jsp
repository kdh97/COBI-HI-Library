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
					<%@include file = "../include/aside4.jsp" %>
				</aside>
			
					<div class="container" style="border:0px solid red; margin-left:300px; padding-bottom: 50px;" >
				     
				     <!-- 본문 입력 -->

<h3 class="htitle"> ※ 신청 안내 ※</h3>
<ol class="dot-list" style="text-align:left">
	<li> 견학대상 : 남양주시민(유아,초등)</li>
	<li> 운영기간 : 연중(이용자가 많은 방학기간 제외)</li>
	<li> 신청방법 : 방문 또는 유선접수</li>
	<li> 신청기간 : 매월 1-10일에 다음달 견학 신청 열림</li>
	<li> 견학내용 : 자유견학, 동극 관람, 동화구연</li>
</ol>
<br><br>


<h3 class="htitle">※ 유의사항 ※</h3>

<ul class="dot-list">
	<li>한 기관에서 주 1회, 최대 월 4회까지 신청할 수 있습니다.</li>
	<li>관리자 승인 후에는 홈페이지에서 취소가 불가능합니다.</li>
</ul>
<br><br>


<h3 class="htitle">※ 문의처 ※</h3>

<ul class="dot-list">
	<li>전화번호 : 031-590-8260</li>
	<li>팩스번호 : 031-590-8549</li>
	
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