<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용약관</title>
</head>
<link rel="stylesheet" href="../css/lib.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<script>
//모두 동의 체크박스 처리 기능
$(function(){
	$("#agree_all").click(function(){
		var len = $("input[name='agree']").length;
    	var bool = true;
    	if( $("#agree_all").is(":checked") == false ) bool = false;
     	for(var i=0; i<len; i++) {
 			$("input[name='agree']")[i].checked = bool;
 		}
	});
	
	$("#button1").click(function(){
		var len = $("input[name='agree']").length;
		var bool = true;
		
		for(var i=0; i<len; i++) {
			if($("input[name='agree']")[i].checked == false) {            
				bool = false;
			}
		}
		if(bool == false) {
			alert("약관에 모두 동의해주세요.");
			return false;
		}
		location="/libJoinWrite.do";
	});
});
</script>

<style>

.chapter {
    display: block;
    margin-bottom: 10px;
    padding: 5px;
    width: 98%;
    height: 200px;
    border: 1px solid #e9e9e9;
    background: #eaeaeb;
    resize: none;
}
.chapter::-webkit-scrollbar { 
    width: 10px;
}
.chapter::-webkit-scrollbar-thumb {
    background-color: #2f3542;
    border-radius: 10px;
    background-clip: padding-box;
    border: 2px solid transparent;
}
.chapter::-webkit-scrollbar-track {
    background-color: grey;
    border-radius: 10px;
    box-shadow: inset 0px 0px 5px white;
}
textarea,h2{
    font-family: 'Nanum Gothic', sans-serif;
    font-size: 1em;
}
fieldset {
	border:0;
}	
.btn_submit {
    display: inline-block;
    background-color: #007bff;
    color: white;
    border: none;
    padding: 10px 20px;
    font-size: 1em;
    cursor: pointer;
    border-radius: 5px;
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
                <%@include file="../include/aside6.jsp" %>
            </aside>

            <div class="flex-item">
                <div class="container" style="border:0px solid black;">
                    <!-- 본문 입력 -->
                    <div style="margin-bottom: 50px; font-size: 1.8em; font-weight: bold;">
                        회원가입
                    </div>

                    <section style="margin: 0 0 20px; padding: 20px 0;">
                        <h2 style="font-size: 1em; margin: 0 0 20px; text-align: center;">이용약관</h2>
                        <textarea readonly class="chapter">
                            <%@include file="../include/libCondition1.jsp" %>
                        </textarea>
                        <fieldset style="padding: 10px 0 0; text-align: right;">
                            <label for="agree11">회원가입약관의 내용에 동의합니다.</label>
                            <input type="checkbox" name="agree" class="">
                        </fieldset>
                    </section>
                    
                    <section style="margin: 0 0 20px; padding: 20px 0;">
                        <h2 style="margin: 0 0 20px; text-align: center; font-size: 1em;">개인정보 수집 및 이용에 대한 안내</h2>
                        <textarea readonly class="chapter">
                            <%@include file="../include/libCondition2.jsp" %>
                        </textarea>
                        <fieldset class="" style="padding: 10px 0 0; text-align:right;">
                            <label for="agree21">개인정보처리방침안내의 내용에 동의합니다.</label>
                            <input type="checkbox" name="agree" id="agree21" class="">
                        </fieldset>

                        <fieldset class="" style="padding: 30px 0 0; text-align: right;">
                            <label for="agree21">모두 동의합니다.</label>
                            <input type="checkbox" name="agree_all" id="agree_all" class="">
                        </fieldset>
                    </section>
                    
                    <div style="text-align: center;">
                        <input type="submit" class="btn_submit" id="button1" onclick="return false;" value="회원가입" style="cursor: pointer;">
                    </div>
                </div>
            </div>
        </div>
    </section>

    <footer class="footer">
        <%@include file="../include/footer.jsp" %>
    </footer>
    <aside class="new-aside">
        <%@include file = "../include/newaside.jsp" %>
    </aside>
</body>
</html>