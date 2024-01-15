<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정 상세보기</title>
</head>
<link rel="stylesheet" href="../css/lib.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<style>
.table-style {
	border-collapse: collapse;
	width: 100%;
}

.table-style tr {
	border-top: 1px solid #c8c8c8;
	border-collapse: collapse;
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
</style>

<script>
</script>

<body>
	<header class="header1">
		<%@include file="../include/header1.jsp"%>
	</header>
	<header class="header2">
		<%@include file="../include/header2.jsp"%>
	</header>
	<nav class="nav">
		<%@include file="../include/nav.jsp"%>
	</nav>
	<section class="section1">
		<div class="sec1">
			<aside class="aside">
				<%@include file="../include/aside3.jsp"%>
			</aside>
			<div class="flex-item">
				<div class="container"
					style="border: 0px solid black; margin-left: 300px;">
					<div class="content_area">

						<table align="center" style="width: 800px;" class="table-style">
							<tr>
								<th width="20%" height="40px;">제목</th>
								<td>${vo.title}</td>
							</tr>
							<tr>
								<th height="40px;">일정</th>
								<td>${vo.year}년 ${vo.month }월 ${vo.day }일</td>
							</tr>
							<tr>
								<td height="400px;" colspan="2" style="padding: 30px;">
									<div>
										<c:if test="${vo.file1 != null}">
											<c:set var="imagePath"
												value="${pageContext.request.contextPath}/libImage/${vo.file1}" />
											<img src="${imagePath}" style="width: 500px; height: 650px;">
											<br>
										</c:if>
										${vo.content }
									</div>
								</td>
							</tr>

						</table>

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