<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="session_id" value="${sessionScope.SessionUserID }"/>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>도서검색</title>
</head>
<link rel="stylesheet" href="../css/lib.css">
<script>
var session_id = "${sessionScope.SessionUserID}";

if (session_id !== "admin") {
     alert("관리자만 접근할 수 있습니다.");
    window.location.href = "/"; // 접근이 차단되었을 때 이동할 페이지 주소
}
</script>
<style>

.return-button {
    background-color: #3498db;
    color: white;
    border: none;
    padding: 6px 10px;
    cursor: pointer;
    transition: background-color 0.3s;
    border-radius:5px;
}

.return-button:hover {
    background-color: #2980b9;
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
                <div class="container" style="border:0px solid black; display: flex; margin-left:180px;">
                    <div style="flex: 1; padding-right: 20px; text-align: left;">
                        <script src="https://code.jquery.com/jquery-3.7.0.js"
                                integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous">
                        </script>
                        <script>
                            function searchBook() {
                                var searchType = $("#searchType").val();
                                var keyword = $("#bookSearch").val();
                                if (!keyword) {
                                    alert("검색어를 입력하세요.");
                                    return;
                                }
                                $.ajax({
                                    method: "GET",
                                    url: "https://dapi.kakao.com/v3/search/book",
                                    data: { target: searchType, query: keyword },
                                    headers: { Authorization: "KakaoAK 17277a95dd97fdc1056945e7eb59c526" }
                                })
                                    .done(function (msg) {
                                        if (msg.documents.length === 0) {
                                            alert("검색 결과를 찾을 수 없습니다.");
                                            return;
                                        }
                                        var bookInfo = "<img src='" + msg.documents[0].thumbnail + "'/><br>" +
                                            "<strong>제목 : " + msg.documents[0].title + "</strong><br>" +
                                            "<strong>저자 : " + msg.documents[0].authors + "</strong><br>" +
                                            "<strong>출판사 : " + msg.documents[0].publisher + "</strong><br>" +
                                            "<strong>ISBN : " + msg.documents[0].isbn + "</strong><br>" +
                                            "<strong>줄거리 : " + msg.documents[0].contents + "...</strong><br>" +
                                            "<strong>출판일 : " + msg.documents[0].datetime.split('T')[0] + "</strong>";

                                        $("#bookInfo").html(bookInfo);

                                        // 검색한 도서 정보를 입력 폼에 자동으로 채워넣기
                                        $("#bookThumbnail").val(msg.documents[0].thumbnail);
                                        $("#bookTitle").val(msg.documents[0].title);
                                        $("#bookAuthors").val(msg.documents[0].authors);
                                        $("#bookPublisher").val(msg.documents[0].publisher);
                                        $("#bookISBN").val(msg.documents[0].isbn);
                                        $("#bookContents").val(msg.documents[0].contents);
                                        $("#bookDatetime").val(msg.documents[0].datetime.split('T')[0]);
                                    })
                                    .fail(function () {
                                        alert("검색 중 오류가 발생했습니다.");
                                    });
                            }

                            function insertBookInfo() {
                                var thumbnail = $("#bookThumbnail").val();
                                var title = $("#bookTitle").val();
                                var authors = $("#bookAuthors").val();
                                var publisher = $("#bookPublisher").val();
                                var isbn = $("#bookISBN").val();
                                var contents = $("#bookContents").val();
                                var datetime = $("#bookDatetime").val();

                                if (!thumbnail || !title || !authors || !publisher || !isbn || !datetime) {
                                    alert("도서 정보를 모두 입력하세요.");
                                    return;
                                }

                                $.ajax({
                                    method: "POST",
                                    url: "/bookInputSave.do",
                                    data: {
                                        thumbnail: thumbnail,
                                        title: title,
                                        authors: authors,
                                        publisher: publisher,
                                        isbn: isbn,
                                        contents: contents,
                                        datetime: datetime
                                    },
                                    success: function (msg) {
                                        if (msg === "duplicate") {
                                            alert("이미 등록된 도서입니다.");
                                        } else if (msg === "true") {
                                            alert("도서 정보가 입력되었습니다.");
                                            $("#bookForm")[0].reset();
                                            $("p").empty();
                                        } else {
                                            alert("도서 정보가 입력되지 않았습니다.");
                                        }
                                    },
                                    error: function () {
                                        alert("도서 정보가 입력되지 않았습니다.");
                                    }
                                });
                            }

                            $(function () {
                                $("#searchButton").on("click", function () {
                                    searchBook();
                                });

                                $("#bookSearch").on("keyup", function (event) {
                                    if (event.key === "Enter") {
                                        searchBook();
                                    }
                                });

                                $("#bookForm").submit(function (event) {
                                    event.preventDefault();
                                    insertBookInfo();
                                });
                            });
                        </script>

                        <h3>[ 도서검색프로그램 ]</h3>
                        <table style="width: 80%; border-collapse: collapse;">
						    <tr>
						        <td style="width: 15%; text-align: right; padding-right: 10px; height: 2em;">
						            <label for="searchType">검색 유형:</label>
						        </td>
						        <td style="width: 30%; height: 2em;">
						            <select id="searchType" style="width: 98%;">
						                <option value="title">제목</option>
						                <option value="authors">저자</option>
						                <option value="isbn">ISBN</option>
						            </select>
						        </td>
						    </tr>
						    <tr>
						        <td style="width: 15%; text-align: right; padding-right: 10px; height: 2em;">
						            <label for="bookSearch">검색어:</label>
						        </td>
						        <td style="width: 20%; height: 2em;">
						            <input type="text" id="bookSearch" placeholder="검색어를 입력하세요" style="width: 94%;">
						        </td>
						    </tr>
						    <tr>
						        <td colspan="2" style="text-align: center; padding-top: 10px; height: 2em;">
						            <button id="searchButton" class="return-button">검색</button>
						        </td>
						    </tr>
						</table>
                        
                        <h3>[ 도서 정보 ]</h3>
                        <p id="bookInfo"></p>
                    </div>

                    <div style="flex: 1; padding-left: 20px; text-align: left;">
                   	<h3>[ 도서 정보 입력 ]</h3>
                       <form id="bookForm" style="width: 100%; border-collapse: collapse;">
					    <table style="width: 100%;">
					        <tr>
					            <td style="width: 20%; text-align: right; padding-right: 10px;">
					                <label for="bookThumbnail">이미지 URL :</label>
					            </td>
					            <td style="width: 80%;">
					                <input type="text" id="bookThumbnail" name="bookThumbnail" required style="width: 90%;">
					            </td>
					        </tr>
					        <tr>
					            <td style="width: 20%; text-align: right; padding-right: 10px;">
					                <label for="bookTitle">제목 :</label>
					            </td>
					            <td style="width: 80%;">
					                <input type="text" id="bookTitle" name="bookTitle" required style="width: 90%;">
					            </td>
					        </tr>
					        <tr>
					            <td style="width: 20%; text-align: right; padding-right: 10px;">
					                <label for="bookAuthors">저자 :</label>
					            </td>
					            <td style="width: 80%;">
					                <input type="text" id="bookAuthors" name="bookAuthors" required style="width: 90%;">
					            </td>
					        </tr>
					        <tr>
					            <td style="width: 20%; text-align: right; padding-right: 10px;">
					                <label for="bookPublisher">출판사 :</label>
					            </td>
					            <td style="width: 80%;">
					                <input type="text" id="bookPublisher" name="bookPublisher" required style="width: 90%;">
					            </td>
					        </tr>
					        <tr>
					            <td style="width: 20%; text-align: right; padding-right: 10px;">
					                <label for="bookISBN">ISBN :</label>
					            </td>
					            <td style="width: 80%;">
					                <input type="text" id="bookISBN" name="bookISBN" required style="width: 90%;">
					            </td>
					        </tr>
					        <tr>
					            <td style="width: 20%; text-align: right; padding-right: 10px; vertical-align: top;">
					                <label for="bookContents">줄거리 :</label>
					            </td>
					            <td style="width: 80%;">
					                <textarea id="bookContents" name="bookContents" rows="5" style="width: 90%;"></textarea>
					            </td>
					        </tr>
					        <tr>
					            <td style="width: 20%; text-align: right; padding-right: 10px;">
					                <label for="bookDatetime">출판일 :</label>
					            </td>
					            <td style="width: 80%;">
					                <input type="text" id="bookDatetime" name="bookDatetime" readonly style="width: 90%;">
					            </td>
					        </tr>
					        <tr>
					            <td colspan="2" style="text-align: center; padding-top: 10px;">
					                <button type="submit" class="return-button">도서 정보 입력</button>
					            </td>
					        </tr>
					    </table>
					</form>
                    </div>
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
