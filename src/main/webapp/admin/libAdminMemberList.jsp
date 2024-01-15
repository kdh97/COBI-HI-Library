<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="session_id" value="${sessionScope.SessionUserID }" />    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 회원관리</title>
</head>
<link rel="stylesheet" href="../css/lib.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<script>
function fn_page(pageIndex) {
	$("#pageIndex").val(pageIndex);
	document.searchFrm.submit();
	//$("#searchFrm").submit();
}

function fn_previous() {
    var currentPage = parseInt("${vo.pageIndex}");
    var newPage = currentPage - 10;
    if (newPage < 1) {
        newPage = 1;
    }
    fn_page(newPage);
}

function fn_next() {
    var currentPage = parseInt("${vo.pageIndex}");
    var newPage = currentPage + 10;
    var lastPage = parseInt("${vo.lastPage}");
    if (newPage > lastPage) {
        newPage = lastPage;
    }
    fn_page(newPage);
}

var session_id = "${session_id}";

if (session_id == null || session_id.trim() == "" || session_id != 'admin') {
    alert("관리자만 이용가능한 서비스입니다.");
    window.location.href = "/";
}
</script>

<style>
.container {
  width: 1000px;
  margin: 50px auto;
  margin-right:80px;
  background-color: #fff;
  border: 1px solid #ccc;
  border-radius: 5px;
  padding: 20px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}
.table {
    width: 100%;
    border-collapse: collapse;
  }

  .table th, .table td {
    padding: 5px;
    text-align: center;
    border: 1px solid #c8c8c8;
  }

  .table th {
    background-color: #f5f5f5;
  }

  .page_number_area {
    text-align: center;
    margin-top: 20px;
  }

  .page_number_area a {
    padding: 5px 10px;
    margin: 0 5px;
    border: 1px solid #ccc;
    border-radius: 3px;
    text-decoration: none;
  }
.search-form {
  display: flex;
  align-items: right;
  float:right;
  margin-bottom: 20px;
}

.search-select, .search-input, .search-button {
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

.search-select {
  margin-right: 10px;
  height:36px;
}

.search-input {
  margin-right: 10px;
  height:14px;
}

.search-button {
  background-color: #007bff;
  color: white;
  border: none;
  cursor: pointer;
  transition: background-color 0.3s;
  height:36px;
}

.search-button:hover {
  background-color: #555;
}
</style>

<body>
	<header class="header1">
		<%@include file = "../include/header1.jsp" %>
	</header>
	<header class="header2">
		<%@include file = "../include/header2.jsp" %>
	</header>
	
	<nav class="nav2">
		<%@include file = "../include/nav2.jsp" %>
	</nav>
	
	<section class="section1">
		<div class="sec1">
			
			<div class="flex-item">
			
			<div class="container" style="border:0px solid black;" >
				     
			<!-- 본문 입력 -->
			
			<form id="searchFrm" name="searchFrm" method="post" action="/libAdminMemberList.do" class="search-form">
			  <input type="hidden" name="pageIndex" id="pageIndex" value="1">
			  <select name="searchCondition" class="search-select">
			    <option value="name" <c:if test="${vo.searchCondition=='name'}">selected</c:if>>이름</option>
			    <option value="userid" <c:if test="${vo.searchCondition=='userid'}">selected</c:if>>아이디</option>
			  </select>
			  <input type="text" name="searchKeyword" value="${vo.searchKeyword}" class="search-input" placeholder="검색어를 입력하세요">
			  <button type="submit" class="search-button">검색</button>
			</form>
			
			<table class="table">
				<tr>
					<th>번호</th>
					<th>아이디</th>
					<th>이름</th>
					<th>생년월일</th>
					<th>핸드폰번호</th>
					<th>이메일</th>
					<th>가입일</th>
					<th>탈퇴유무</th>
				</tr>
				<c:set var="rownumber" value="${vo.recordCountPerPage }"/>
				<c:forEach var="list" items="${list }" varStatus="status">
					<tr>
						<td>${list.rn }</td>
						<td>${list.userid }</td>
						<td><a href="libAdminMemberModify.do?userid=${list.userid }">${list.name }</a></td>
						<td>${list.birth }</td>
						<td>${list.phone }</td>
						<td>${list.email }</td>
						<td>${list.rdate }</td>
						<td>${list.state }</td>
					</tr>
				<c:set var="rownumber" value="${rownumber-1 }"/>	
				</c:forEach>
			</table><br>
			<div class="page_number_area">
			    <a href="javascript:fn_previous()">이전</a>  
			    <c:set var="startPage" value="${firstPage }" />
			    <c:set var="endPage" value="${startPage + 9}" />
			    <c:choose>
			        <c:when test="${endPage > vo.lastPage}">
			            <c:set var="endPage" value="${vo.lastPage}" />
			        </c:when>
			    </c:choose>
			    <c:forEach var="i" begin="${startPage}" end="${endPage}">
			        <a href="javascript:fn_page('${i }')">${i }</a>  
			    </c:forEach>
			    <a href="javascript:fn_next()">다음</a>
			</div>
			
			<!-- 본문 입력 -->
			
			</div>
			
			</div>
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