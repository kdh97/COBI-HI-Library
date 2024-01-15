<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="session_id" value="${sessionScope.SessionUserID }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정 추가하기</title>
</head>
<link rel="stylesheet" href="../css/lib.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
	var session_id = "${sessionScope.SessionUserID}";

	if (session_id !== "admin") {
		alert("관리자만 접근할 수 있습니다.");
		window.location.href = "/"; // 접근이 차단되었을 때 이동할 페이지 주소
	}

	$(document).ready(function() {
		var currentDate = new Date();
		var currentYear = currentDate.getFullYear();
		var currentMonth = currentDate.getMonth() + 1;
		var currentDay = currentDate.getDate();

		// Set selected values for year, month, and day
		$("#year").val(currentYear);
		$("#month").val(currentMonth);
		$("#day").val(currentDay);
	});

	$(function() {

		$("#btn_submit").click(function() {
			var year = $("#year").val();
			var month = $("#month").val();
			var day = $("#day").val();
			var title = $("#title").val();
			var content = $("#content").val();
			var file1 = $("#file1").val();

			if (!title || !content) {
				alert("제목과 내용을 입력하세요.");
				return;
			}

			var form = new FormData(document.getElementById('frm'));

			$.ajax({
				method : "POST",
				data : form,
				url : "/libCalInputSave.do",
				processData : false, // 파일이 전송되는 경우의 설정
				contentType : false, // 파일이 전송되는 경우의 설정
				datatype : "text",
				success : function(msg) {
					if (msg === "true") {
						alert("일정이 등록되었습니다.");
						location.href = "/adminCalendar.do";
					} else {
						alert("저장실패.");
					}
				},
				error : function() {
					alert("전송실패.");
				}
			});
		});
	});
</script>




<style>
button {
	border: none;
	background-color: #007BFF;
	color: white;
	border-radius: 5px;
	padding: 10px 20px;
	cursor: pointer;
	margin: 0 10px;
}

#title {
	width: 80%; /* 제목 입력 필드 너비 조정 */
}

#content {
	width: 98%; /* 내용 입력 필드 너비 조정 */
	height: 98%; /* 높이 늘리기 */
}

#contentTable {
	width: 800px;
	border-collapse: collapse;
	margin: 0 auto;
	padding: 5px; /* 해당 테이블에만 패딩 추가 */
}

#contentTable th, #contentTable td {
	padding: 5px; /* 해당 테이블에만 패딩 추가 */
	border: 1px solid #666;
}

#contentTable th {
	background-color: #f2f2f2;
}

#contentTable td {
	background-color: #fff;
}
</style>
<body>

	<header class="header1">
		<%@include file="../include/header1.jsp"%>
	</header>
	<header class="header2">
		<%@include file="../include/header2.jsp"%>
	</header>
	<nav class="nav2">
		<%@include file="../include/nav2.jsp"%>
	</nav>
	<section class="section1">
		<div class="sec1">

			<div class="flex-item">
				<div class="container"
					style="border: 0px solid black; margin-left: 180px;">
					<div class="content_area">
						<form id="frm" name="frm" enctype="multipart/form-data">
							<table id="contentTable" align="center" height="400px;"
								border="1" style="width: 800px;">

								<tr height="30px;">
									<th>일정</th>
									<td align="left"><select id="year" name="year">
											<c:forEach var="i" begin="2020" end="2030">
												<option value="${i}">${i}</option>
											</c:forEach>
									</select> <span>년</span> <select id="month" name="month">
											<c:forEach var="i" begin="1" end="12">
												<option value="${i}">${i}</option>
											</c:forEach>
									</select> <span>월</span> <select id="day" name="day">
											<c:forEach var="i" begin="1" end="31">
												<option value="${i}">${i}</option>
											</c:forEach>
									</select> <span>일</span></td>
								</tr>
								<tr height="30px;">
									<th width="20%">제목</th>
									<td align="left"><input type="text" id="title"
										name="title"></td>
								</tr>
								<tr>
									<th>내용</th>
									<td height="400px;"><textarea id="content" name="content"
											rows="5" required style="resize: none;"></textarea></td>
								</tr>
								<tr>
									<th>이미지파일</th>
									<td><input type="file" name="file1" id="file1"
										style="width: 50%" accept="image/*"></td>

								</tr>

							</table>
						</form>

						<button type="button" id="btn_submit" onclick="return false;"
							style="margin-top: 15px;">일정등록</button>
						<button type="button" onclick="history.back();"
							style="margin-top: 15px;">뒤로가기</button>

					</div>
				</div>
			</div>
		</div>
	</section>

	<footer class="footer">
		<%@include file="../include/footer.jsp"%>
	</footer>
	<aside class="new-aside">
		<%@include file="../include/newaside.jsp"%>
	</aside>

</body>
</html>