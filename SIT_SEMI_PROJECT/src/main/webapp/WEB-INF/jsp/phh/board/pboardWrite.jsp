<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	$('form[name="regist"]').submit(function(){
			
			var title = $('#title').val();
			var contents = $('#contents').val();
			
			if (title =='' || title == null){
				alert('글 제목은 필수요소입니다.');
				return false;
			} else if(contents =='' || contents == null){
				alert('글 내용은 필수요소입니다.');
				return false;
			}
			
			if (title.length >= 21){
				alert('글 제목의 길이가 너무 깁니다. 20자 이하로 작성해주세요');
				return false;
				e.preventDefault();
			}
			if (content.length >= 1001){
				alert('글 내용의 길이가 너무 깁니다. 1000자 이하로 작성해주세요');
				return false;
				e.preventDefault();
			}		
			
	        // 줄바꿈 처리 (textarea 에서 개행 처리가 안되는 부분을 해결하기 위함)
	        contents = contents.replace(/\n/g, '<br/>');
	        $('#contents').val(contents);
		});	
})

function listFn(){
	window.location.href = '<c:out value="pboardList.do"/>'; 
}

$( document ).ready(function() {
	
	
});
		
</script>
</head>
<body>

<div class="container">
	<h2>글 작성</h2>
	<form name="regist" id="regist" action = "pboardInsert.do">
		<input type="hidden" name="count" value=0 />
		<input type="hidden" name="userNo" value="${sessionScope.userNo}"/>
		<table class="table">
			<colgroup>
				<col style="width:25%" >
				<col style="width:25%" >
				<col style="width:25%" >
				<col style="width:25%" >
			</colgroup>
			<tr class="boardTitle" >
				<td>글 제목</td>
				<td colspan="3">
					<input type="text" id="title" name="title"/>
				</td>
			</tr>
			<tr class="boardContent" >
				<td>글 내용</td>
				<td colspan="3"><textarea id="contents" name="contents" rows="10" cols="50"></textarea></td>
			</tr>
			<tr>
				<td colspan="4" align="right">
					<input type="submit" class="btn btn-primary" value="작성완료" />
					<input type="button" class="btn btn-warning" value="취소" onclick="listFn()" />
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>