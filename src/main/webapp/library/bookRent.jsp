<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 대출</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>
<link rel="stylesheet" href="../css/lib.css">

<script>
//이 함수는 페이지 인덱스를 받아서 해당 페이지로 이동하는 역할을 합니다.
function fn_page(pageIndex) {
    // 페이지 인덱스 값을 페이지 인덱스 필드에 설정합니다.
    $("#pageIndex").val(pageIndex);
    // 검색 폼을 제출합니다.
    //$("#searchFrm").submit();
    document.searchFrm.submit();
}

// 이 함수는 이전 페이지로 이동하는 역할을 합니다.
function fn_previous() {
    // 현재 페이지 인덱스를 가져옵니다.
    var currentPage = parseInt("${vo.pageIndex}");
    // 새로운 페이지 인덱스를 계산합니다 (현재 페이지에서 10을 뺌).
    var newPage = currentPage - 10;
    // 새로운 페이지가 1보다 작으면 최소 페이지로 설정합니다.
    if (newPage < 1) {
        newPage = 1;
    }
    // 계산된 페이지로 이동합니다.
    fn_page(newPage);
}

// 이 함수는 다음 페이지로 이동하는 역할을 합니다.
function fn_next() {
    // 현재 페이지 인덱스를 가져옵니다.
    var currentPage = parseInt("${vo.pageIndex}");
    // 새로운 페이지 인덱스를 계산합니다 (현재 페이지에서 10을 더함).
    var newPage = currentPage + 10;
    // 마지막 페이지 인덱스를 가져옵니다.
    var lastPage = parseInt("${vo.lastPage}");
    // 새로운 페이지가 마지막 페이지보다 크면 최대 페이지로 설정합니다.
    if (newPage > lastPage) {
        newPage = lastPage;
    }
    // 계산된 페이지로 이동합니다.
    fn_page(newPage);
}

</script>

<style>
/* 페이지 번호 스타일 */
.page_number_area a {
    text-decoration: none; /* 링크 밑줄 제거 */
    margin: 0 5px; /* 좌우 여백 설정 */
    color: black; /* 기본 링크 색상 */
}

/* 활성화된 페이지 번호 스타일 */
.page_number_area a.active {
    color: red; /* 클릭된 링크 색상 */
    font-weight: bold; /* 클릭된 링크 글씨 굵게 */
}

/* 책 테이블 스타일 */
.booktable {
    border-top: 3px solid #c8c8c8; /* 상단 경계선 스타일 */
    width: 800px;
    border-collapse: collapse; /* 테이블 경계선 겹침 해제 */
}

.booktable tr {
    border-top: 1px solid #c8c8c8; /* 행 간 경계선 스타일 */
    border-collapse: collapse;
    height: 200px; /* 행 높이 설정 */
}

/* 책 정보 컨테이너 스타일 */
.bookdiv {
    width: 700px;
    height: 170px;
    border: 0px solid black;
    position: relative;
}

/* 책 정보 스타일 */
.bookinfo {
    width: 520px;
    height: 100px;
    display: inline;
    border: 0px solid black;
    position: absolute;
    right: 20px;
}

/* 책 섬네일 스타일 */
.bookthum {
    width: 130px;
    height: 170px;
    float: left;
    padding-left: 30px;
}

/* 링크 스타일 */
.link-style {
    font-size: 22px;
    font-weight: bold;
    text-decoration: none; /* 링크 밑줄 제거 */
    float: left;
    padding: 5px 0 0 5px;
    margin-left: 30px;
}

/* 텍스트 스타일 */
.text-style1 {
    font-size: 15px;
    margin-top: 15px;
    margin-left: 35px;
    float: left;
    clear: left;
}

.text-style2 {
    font-size: 15px;
    margin-top: 15px;
    margin-left: 35px;
    float: left;
    clear: left;
}

/* 검색 폼 스타일 */
.search-form {
    display: flex;
    align-items: right;
    float: right;
    margin-bottom: 20px;
}

/* 검색 입력 필드 스타일 */
.search-select,
.search-input,
.search-button {
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 3px;
}

.search-select {
    margin-right: 10px;
    height: 36px;
}

.search-input {
    margin-right: 10px;
    height: 14px;
}

/* 검색 버튼 스타일 */
.search-button {
    background-color: #007bff;
    color: white;
    border: none;
    cursor: pointer;
    transition: background-color 0.3s;
    height: 36px;
}

/* 검색 버튼 호버 스타일 */
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

    <nav class="nav">
        <%@include file = "../include/nav.jsp" %>
    </nav>

    <section class="section1">
        <div class="sec1">
            <aside class="aside">
                <%@include file = "../include/aside2.jsp" %>
            </aside>

            <div class="flex-item">
                <div class="container" style="border:0px solid black; margin-left:300px;">

                  
                    <p>
                        <form name="searchFrm" id="searchFrm" method="post" action="/bookRent.do" class="search-form">
                            <input type="hidden" name="pageIndex" id="pageIndex" value="1">
                            <select name="searchCondition" class="search-select">
                                <option value="title" <c:if test="${vo.searchCondition=='title' }">selected</c:if> >제목</option>
                                <option value="authors" <c:if test="${vo.searchCondition=='authors' }">selected</c:if> >저자</option>
                                <option value="isbn" <c:if test="${vo.searchCondition=='isbn' }">selected</c:if> >ISBN</option>
                            </select>
                            <input type="text" name="searchKeyword" value="${vo.searchKeyword }" class="search-input">
                            <button type="submit" class="search-button">검색</button>
                        </form>
                    </p>
                    <table class="booktable">

                        <c:set var="rownumber" value="${vo.recordCountPerPage }" />
                        <c:forEach var="list" items="${resultList}" varStatus="status">
                            <c:if test="${list.title.contains(vo.searchKeyword) || list.authors.contains(vo.searchKeyword) || list.isbn.contains(vo.searchKeyword)}">
                                <tr>
                                    <td align="center">${rownumber }</td>
                                    <td>
                                        <div class="bookdiv">
                                            <img src="${list.thumbnail }" alt="표지 이미지" class="bookthum">
                                            <div class="bookinfo">
                                                <a href="/bookDetail.do?unq=${list.unq }" class="link-style">${list.title }</a> <br>
                                                <div class="text-style1">${list.authors } | ${list.publisher } | ${list.datetime }</div> <br>
                                                <div class="text-style2">${list.isbn }</div>
                                            </div>

                                        </div>
                                    </td>
                                    <td>
                                        <c:if test="${list.id == null }">
                                            <span style="color: blue;">대출가능</span>
                                        </c:if>
                                        <c:if test="${list.id != null }">
                                            <span style="color: red;">대출중</span>
                                        </c:if>

                                    </td>
                                </tr>
                                <c:set var="rownumber" value="${rownumber-1 }" />
                            </c:if>
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
                            <a href="javascript:fn_page('${i }')" class="${i == vo.pageIndex ? 'active' : ''}">${i }</a>
                        </c:forEach>
                        <a href="javascript:fn_next()">다음</a>
                    </div>

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
