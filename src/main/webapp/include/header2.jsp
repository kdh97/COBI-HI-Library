<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>


<div class="libtitle" >
<a href="/">하이도서관</a>
&nbsp;





<form id="searchFrm" method="post" action="/bookRent.do" style="display: inline;">
  <input type="hidden" name="searchCondition" id="searchCondition" value="title">
  
  <div class="input-container">
    <div class="icon-container">
      <img src="../icon/inputsearch.gif" class="input-icon">
    </div>
    <input type="text" id="searchKeyword" name="searchKeyword" class="search" onfocus="clearIcon()">
  </div>
  <input type="submit" id="search" name="search" class="button" style="position: relative; bottom: 9px;" value="검색">
</form>

	    <a href="/"><img src="../icon/main.gif" alt="search 아이콘" class="mainicon" style="vertical-align: middle;"></a>
</div>