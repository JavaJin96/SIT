<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
		$(function(){
			$('form[name="regist"]').submit(function(){
				
					var title = $('#title').val();
					var content = $('#content').val();
					
					if (title =='' || title == null){
						alert('글 제목은 필수요소입니다.');
						return false;
					} else if(content =='' || content == null){
						alert('글 내용은 필수요소입니다.');
						return false;
					}
					
					if (title.length >= 50){
						alert('제목은 50자 이하로 작성해주세요');
						return false;
					}
					if (contents.length >= 300){
						alert('내용은 300자 이하로 작성해주세요');
						return false;
					}		
					
			        // 개행처리
			        content = content.replace(/(?:\r\n|\r|\n)/g, '<br/>');
			        $('#content').val(content);
			        
			        
				});	
		})
	
	</script>
</head>
<body>
	<div class="container">
	<h2>공지 등록</h2>
	
	<form name="regist" id="regist" action="snoticeWriteInsert.do" >
		<input type="hidden" name="count" value=0 />
		<input type="hidden" name="type" value=1 />
		<input type="hidden" name="userNum" value="${sessionScope.userNum}"/>
		<table class="table">
			<colgroup>
				<col style="width:25%" >
				<col style="width:25%" >
				<col style="width:25%" >
				<col style="width:25%" >
			</colgroup>
			<tr class="boardTitle" >
				<td><h5>글 제목</h5></td>
				<td colspan="3">
					<input type="text" id="title" name="title" required/>
				</td>
			</tr>
			<tr class="boardContent" >
				<td><h5>글 내용</h5></td>
				<td colspan="3"><textarea id="content" name="content" rows="10" cols="50" required></textarea>
			</tr>
			<tr>
				<td colspan="4" align="right">
					<input type="submit" class="btn btn-primary" value="작성완료" />
					<input type="button" class="btn btn-warning" value="취소" onclick="history.back()" />
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>