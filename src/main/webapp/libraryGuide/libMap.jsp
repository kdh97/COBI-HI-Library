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
<br>
<h1>※ 하이도서관 약도 및 오는길 안내 ※</h1>
<br>
<br>
<div id="map" style="width:800px;height:600px;"></div>
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3ca739bc306250237e298c204ba7b553"></script>
   <script>
    var container = document.getElementById('map');
    var options = {
        center: new kakao.maps.LatLng(37.605046, 127.140480),
        level: 2
    };

    var map = new kakao.maps.Map(container, options);

    var markerPosition = new kakao.maps.LatLng(37.605046, 127.140480);
    var marker = new kakao.maps.Marker({
        position: markerPosition
    });

    marker.setMap(map);

    // 마커 클릭 이벤트 리스너 추가
    kakao.maps.event.addListener(marker, 'click', function() {
        // 링크를 여기에 설정
        window.location.href = 'http://kko.to/V-qXjE0I00';
    });
</script>

※ 핀 클릭시 해당 주소 카카오맵 링크로 이동합니다. ※
<br>
<br>
<br>
<br>
		<div class="btitle">주소 및 연락처</div>
<ul class="dot-list ml">
	<li><strong>주소</strong> : 경기 구리시 건원대로 44 태영빌딩 (인창동)</li>
	<li><strong>연락처</strong> : 031-550-1004</li>
</ul>

<br>
<div class="btitle">교통 안내</div>
<ul class="dot-list ml">
	<li><strong>도보나 자가용 이용시</strong>
		<ul class="dash-list">
			<li>구리역에서 우체국방향으로 직진 후 우체국 지나서 좌회전 150m 후 우회전 직진 후 좌측 카이저병원 건물</li>
		</ul>
	</li>
	<li><strong>버스 이용시</strong>
		<ul class="dash-list">
			<li>마을버스 : 2번, 3번, 8번 이용시 구리고용복지플러스센터 정류장에서 하차</li>
			<li>시내버스 : 92번, 96번 이용시 구리고용복지플러스센터 정류장에서 하차</li>
		</ul>
	</li>
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