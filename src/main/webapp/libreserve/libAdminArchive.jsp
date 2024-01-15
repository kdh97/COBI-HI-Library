<%@page import="java.util.List"%>
<%@page import="egov.libreserve.service.LibrsService"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<c:set var="session_id" value="${sessionScope.SessionUserID }" />

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>열람실 기록관리</title>

    <script>
        var session_id = "${session_id}";

        if (session_id == null || session_id.trim() == "" || session_id != 'admin') {
            alert("관리자만 이용가능한 서비스입니다.");
            window.location.href = "/";
        }
    </script>

</head>
<link rel="stylesheet" href="../css/lib.css">
<style>
    a {
        text-decoration: none;
        color: inherit;
    }

    #seatInfo {
        display: none;
        text-align: center;
        margin-top: 20px;
        border: 1px solid #ccc;
        padding: 10px;
        background-color: #f8f8f8;
        width: 100%;
        box-sizing: border-box;
        line-height: 1.5;
    }

    #seatContainer {
        position: relative;
        width: 100%;
    }

    .seatImage {
        z-index: 0;
        width: 100%;
        height: auto;
        /* 기타 스타일 설정 */
    }

    .seatTable {
        position: absolute;
        top: 133px;
        left: 146px;
        z-index: 1;
        /* 테이블이 이미지 위에 오도록 설정 */
        /* 기타 스타일 설정 */
    }

    .seatTable2 {
        position: absolute;
        top: 299px;
        left: 146px;
        z-index: 1;
        /* 테이블이 이미지 위에 오도록 설정 */
        /* 기타 스타일 설정 */
    }

    .seatTable3 {
        position: absolute;
        top: 465px;
        left: 146px;
        z-index: 1;
        /* 테이블이 이미지 위에 오도록 설정 */
        /* 기타 스타일 설정 */
    }

    .page_number_area a {
        text-decoration: none;
        margin: 0 5px;
        color: black;
        /* 기본 링크 색상 */
    }

    .page_number_area a.active {
        color: red;
        /* 클릭된 링크 색상 */
        font-weight: bold;
        /* 클릭된 링크 글씨 굵게 */
    }

    .search-form {
        display: flex;
        justify-content: flex-end;
        /* Align content to the right */
        align-items: center;
        /* Vertically center items */
        margin-bottom: 20px;
    }

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

    .search-button {
        background-color: #007bff;
        color: white;
        border: none;
        cursor: pointer;
        transition: background-color 0.3s;
        height: 36px;
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
                <div class="container" style="border:0px solid black; margin-left:180px;">

                    <!-- 본문 입력 -->

                    <div style="margin-top:20px;margin-bottom:10px;">
                        <!-- 검색 폼 -->
                        <div style="text-align:right;margin-top:10px;">
                            <form name="frm" method="post" action="/libAdminArchive.do?menu=1" class="search-form">
                                <input type="hidden" name="pageIndex" id="pageIndex" value="1">
                                <!-- 검색 조건 선택 -->
                                <select name="searchCondition" class="search-select">
                                    <option value="session_id">ID</option>
                                    <option value="sit_number">좌석번호</option>
                                    <option value="sdate">입실날짜</option>
                                </select>
                                <!-- 검색 키워드 입력 -->
                                <input type="text" name="searchKeyword" class="search-input">
                                <button type="submit" class="search-button">검색</button>
                            </form>
                        </div>
                        <!-- 이용횟수 표시 -->
                        <div style="margin-top:15px;text-align:right;">
                            기록된 열람실 이용횟수 : ${total }
                        </div>

                        <!-- 열람실 이용 기록 테이블 -->
                        <div style="text-align:center;margin-top:30px;">
                            <table border="1" align="center" style="border:1px solid #ccc; border-spacing:10px;">
                                <c:set var="rownumber" value="${vo.recordCountPerPage }" />
                                <c:forEach var="archive" items="${archive}" varStatus="status">
                                    <tr>
                                        <td>${rownumber } - [ ${archive.sessionId }
                                            ( <c:forEach var="name" items="${name }">
                                                <c:if test="${archive.sessionId == name.userid }">${name.name }
                                                </c:if>
                                            </c:forEach> ) ] </td>
                                        <th>${archive.sitNumber }번 좌석 : ${archive.sdate} ~ ${archive.edate }</th>
                                    </tr>
                                    <c:set var="rownumber" value="${rownumber-1 }" />
                                </c:forEach>
                            </table>
                        </div>

                        <!-- 페이지 네이션 영역 -->
                        <div class="page_number_area">
                            <c:set var="itemsPerPage" value="10" />
                            <c:set var="totalItems" value="${total}" />
                            <c:set var="totalPages" value="${(totalItems + itemsPerPage - 1) / itemsPerPage}" />
                            <c:set var="startPage" value="${vo.pageIndex - 4}" />
                            <c:if test="${startPage lt 1}">
                                <c:set var="startPage" value="1" />
                            </c:if>
                            <c:set var="endPage" value="${vo.pageIndex + 4}" />
                            <c:if test="${endPage gt totalPages}">
                                <c:set var="endPage" value="${totalPages}" />
                            </c:if>

                            <!-- 이전 페이지 링크 -->
                            <c:if test="${vo.pageIndex > 1}">
                                <a href="/libAdminArchive.do?menu=1&amp;pageIndex=${vo.pageIndex - 1}&amp;searchCondition=${param.searchCondition}&amp;searchKeyword=${param.searchKeyword}">
                                    이전
                                </a>
                            </c:if>

                            <!-- 페이지 번호 목록 -->
                            <c:forEach var="pageNumber" begin="${startPage}" end="${endPage}">
                                <c:choose>
                                    <c:when test="${pageNumber eq vo.pageIndex}">
                                        <a class="active">${pageNumber}</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="/libAdminArchive.do?menu=1&amp;pageIndex=${pageNumber}&amp;searchCondition=${param.searchCondition}&amp;searchKeyword=${param.searchKeyword}">
                                            ${pageNumber}
                                        </a>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>

                            <!-- 다음 페이지 링크 -->
                            <c:if test="${vo.pageIndex * vo.pageUnit < totalItems }">
                                <a href="/libAdminArchive.do?menu=1&amp;pageIndex=${vo.pageIndex + 1}&amp;searchCondition=${param.searchCondition}&amp;searchKeyword=${param.searchKeyword}">
                                    다음
                                </a>
                            </c:if>
                        </div>
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
        <%@include file="../include/newaside.jsp"%>
    </aside>

</body>

</html>