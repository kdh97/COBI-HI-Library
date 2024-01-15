
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>도서 검색</title>
</head>
<link rel="stylesheet" href="../css/lib.css">

<style>
    .container {
        border: 1px solid #ddd;
        padding: 20px;
        margin-left: 300px;
    }

    label,
    input,
    select,
    button {
        margin: 5px;
    }

    button {
        cursor: pointer;
    }

    h3 {
        margin-top: 20px;
    }

    p {
        line-height: 1.6;
        text-align: left;
    }

    .book-list {
        list-style: none;
        padding: 0;
    }

    .book-list li {
        display: flex;
        align-items: center;
        /* 세로 가운데 정렬 */
        margin-bottom: 20px;
        border: 1px solid #ddd;
        padding: 10px;
    }

    .thumbnail {
        width: 150px;
        /* 이미지 폭 설정 */
        height: auto;
        /* 이미지 높이 자동 조정 */
        margin-right: 20px;
        margin-left: 20px;
        margin-bottom: 10px;

    }

    .book-info {
        flex: 1;
        text-align: left;
        margin-left: 20px;
    }

    .book-contents {
        flex: 4;
        text-align: left;
        overflow: hidden;
    }

    .book-summary {
        flex: 1;
    }

    .search-form {
        display: flex;
        align-items: right;
        float: right;
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
        height: 15px;
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
        <%@include file="../include/header1.jsp" %>
    </header>
    <header class="header2">
        <%@include file="../include/header2.jsp" %>
    </header>
    <nav class="nav">
        <%@include file="../include/nav.jsp" %>
    </nav>
    <section class="section1">
        <div class="sec1">
            <aside class="aside">
                <%@include file="../include/aside2.jsp" %>
            </aside>
            <div class="flex-item">
                <div class="container">
                    <h3>[ 도서검색프로그램 ]</h3>
                    <label for="searchType">검색 유형:</label>
                    <select id="searchType" class="search-select">
                        <option value="title">제목</option>
                        <option value="authors">저자</option>
                        <option value="isbn">ISBN</option>
                    </select>
                    <label for="bookSearch">검색어:</label>
                    <input type="text" id="bookSearch" placeholder="검색어를 입력하세요" class="search-input">
                    <button id="searchButton" class="search-button">검색</button>
                    <h3>도서 검색 결과</h3>
                    <div id="bookSearchArea">
                        <ul class="book-list">
                            <!-- 검색 결과가 여기에 동적으로 추가됩니다 -->
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <footer class="footer">
        <%@include file="../include/footer.jsp" %>
    </footer>
    <aside class="new-aside">
        <%@include file="../include/newaside.jsp"%>
    </aside>
</body>

<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous">
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
                data: {
                    target: searchType,
                    query: keyword
                },
                headers: {
                    Authorization: "KakaoAK 17277a95dd97fdc1056945e7eb59c526"
                }
            })
            .done(function(msg) {
                var bookList = msg.documents;
                var bookListHtml = "";

                if (bookList.length === 0) {
                    bookListHtml = "<p>검색 결과가 없습니다.</p>";
                } else {
                    bookListHtml += "<ul class='book-list'>";
                    for (var i = 0; i < bookList.length; i++) {
                        var book = bookList[i];
                        var isbn = book.isbn;
                        var extractedIsbn = isbn.slice(-13);
                        bookListHtml += "<li>";
                        bookListHtml += "<img src='" + book.thumbnail + "' alt='표지 이미지' class='thumbnail'>";
                        bookListHtml += "<div class='book-info'>";
                        bookListHtml += "<h4>" + book.title + "</h4>";
                        bookListHtml += "<p><strong>저자:</strong> " + book.authors + "</p>";
                        bookListHtml += "<p><strong>출판사:</strong> " + book.publisher + "</p>";
                        bookListHtml += "<p><strong>ISBN:</strong> " + extractedIsbn + "</p>";
                        bookListHtml += "<p>" + book.contents + "...</p>";
                        bookListHtml += "<p><strong>출판일:</strong> " + book.datetime.split('T')[0] + "</p>";
                        bookListHtml += "</div>";
                        bookListHtml += "</li>";
                    }
                    bookListHtml += "</ul>";
                }

                $("#bookSearchArea").html(bookListHtml);
            })
            .fail(function() {
                alert("검색 중 오류가 발생했습니다.");
            });
    }

    $(function() {
        $("#searchButton").on("click", function() {
            searchBook();
        });

        $("#bookSearch").on("keyup", function(event) {
            if (event.key === "Enter") {
                searchBook();
            }
        });
    });
</script>

</html>