<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		
<script>
window.addEventListener("load", function() {
	  var scrollTimeout;

	  function showScrollTopImage() {
	    clearTimeout(scrollTimeout);
	    var scrollImg = document.querySelector(".scroll-top-img");
	    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
	      scrollImg.classList.add("visible");
	    } else {
	      scrollTimeout = setTimeout(function() {
	        scrollImg.classList.remove("visible");
	      }, 300);
	    }
	  }

	  window.onscroll = showScrollTopImage;

	  document.querySelector(".scroll-top-img").addEventListener("click", function() {
	    document.body.scrollTop = 0;
	    document.documentElement.scrollTop = 0;
	  });
	});
</script>

<!-- 이미지를 클릭하여 위로 이동하는 링크 -->
<a href="javascript:void(0);" onclick="scrollToTop()" class="scroll-top-img">
  <img src="../icon/up.gif" alt="up 아이콘" class="icon"><br>
  위로가기
</a>





