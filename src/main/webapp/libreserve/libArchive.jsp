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
    <title>열람실 기록</title>

    <script>
        var session_id = "${session_id}";

        if (session_id == null || session_id.trim() == "") {
            alert("로그인이 필요합니다.");
            window.location.href = "libLoginWrite.do"; // 로그인 페이지로 리다이렉트
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
                <%@include file = "../include/aside5.jsp" %>
            </aside>

            <div class="flex-item">
                <div class="container" style="border:0px solid black; margin-left:300px;">

                    <!-- 본문 입력 -->

                    <c:forEach var="archive" items="${archive }">
                        <c:if test="${archive.sessionId == session_id && session_id != null}">
                            <c:set var="hasArchive" value="true" />
                        </c:if>
                    </c:forEach>
                    <!-- 열람실 현황&배정 시작 -->


                    <div style="text-align:center;margin-top:40px;">

                        <c:if test="${session_id != null && hasArchive != null }">
                            <div style="margin-top:20px;margin-bottom:10px;">
                                ${name } 님의 최근 열람실 사용 기록은 ${total } 건 입니다.
                            </div>
                            <table align="center" style="border:1px solid #ccc; border-spacing:10px;">
                                <c:set var="rownumber" value="${vo.recordCountPerPage }" />
                                <c:forEach var="archive" items="${archive}" varStatus="status">
                                    <c:if test="${archive.sessionId == session_id}">
                                        <tr>
                                            <td>${rownumber } - </td>
                                            <th>${archive.sitNumber }번 좌석 : ${archive.sdate} ~ ${archive.edate }</th>
                                        </tr>
                                    </c:if>
                                    <c:set var="rownumber" value="${rownumber-1 }" />
                                </c:forEach>

                            </table>
                        </c:if>

                        <c:if test="${total == 0 }">
                            ${name }님은 열람실 사용기록이 존재하지 않습니다.
                        </c:if>

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

                            <c:if test="${vo.pageIndex > 1}">
                                <a href="/libArchive.do?session_id=${session_id }&pageIndex=${vo.pageIndex - 1}">
                                    이전
                                </a>
                            </c:if>

                            <c:forEach var="pageNumber" begin="${startPage}" end="${endPage}">
                                <c:choose>
                                    <c:when test="${pageNumber eq vo.pageIndex}">
                                        <a class="active">${pageNumber}</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="/libArchive.do?session_id=${session_id }&pageIndex=${pageNumber}">
                                            ${pageNumber}
                                        </a>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>

                            <c:if test="${vo.pageIndex * vo.pageUnit < totalItems }">
                                <a href="/libArchive.do?session_id=${session_id }&pageIndex=${vo.pageIndex + 1}">
                                    다음
                                </a>
                            </c:if>

                        </div>
                        <div style="text-align:right">

                        </div>
                        <div id="seatContainer">

                            <div class="seatTable">
                            </div>
                        </div>
                        <div class="seatInfo" id="seatInfo">

                        </div>


                    </div>

                    <!-- 열람실 현황&배정 끝 -->

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