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
			var price = $('#price').val();
			
			if (title =='' || title == null){
				alert('상품명은 필수요소입니다.');
				return false;
			} else if(contents =='' || contents == null){
				alert('상품설명은 필수요소입니다.');
				return false;
			} else if(price == '' || price == null){
				alert('상품가격은 필수요소입니다.');
			}
			
			if (title.length >= 21){
				alert('상품명의 길이가 너무 깁니다. 20자 이하로 작성해주세요');
				return false;
			}
			if (contents.length >= 1001){
				alert('상품설명의 길이가 너무 깁니다. 1000자 이하로 작성해주세요');
				return false;
			}
			
	        // 줄바꿈 처리 (textarea 에서 개행 처리가 안되는 부분을 해결하기 위함)
	        contents = contents.replace(/(?:\r\n|\r|\n)/g, '<br/>');
	        $('#contents').val(contents);
	        
	        
		});	
})

function listFn(){
	location.href = '<c:out value="pshopdList.do"/>'; 
}

function add(){
	if ($("#file").val() !=''){ // 파일이 첨부 되었을 때
		var formData = new FormData();
		formData.append("file", $("input[name=file]")[0].files[0]);
		$.ajax({
			url : "<c:url value='pupload.do'/>",
			type : "post",
			data : formData,
			// 파일 올릴떈 아래 2개를 추가해줘야함.
			processData : false,
			contentType : false,
			
			success : function(data){ // 업로드된 실제파일 이름을 전달받기
				// 파일이름 가져오기
				var filename = data.filename;
				$('#filename').val(filename);
				alert("사진첨부가 완료되었습니다.");
				$("#submit").removeAttr("disabled");
			},
			error : function(){ alert("error"); }
		});
		
	}else{ // 파일이 첨부 되지 않은 경우
		return false;
	}
}

$( document ).ready(function() {
	
	
});
		
</script>
</head>
<body>

<div class="container">
	<h2>상품 등록</h2>
	<form name="regist" id="regist" action = "pshopInsert.do">
		<input type="hidden" name="userNo" value="${sessionScope.userNo}"/>
		<table class="table">
			<colgroup>
				<col style="width:25%" >
				<col style="width:25%" >
				<col style="width:25%" >
				<col style="width:25%" >
			</colgroup>
			<tr class="boardTitle" >
				<td>상품명</td>
				<td colspan="3">
					<input type="text" id="title" name="title"/>
				</td>
			</tr>
			<tr class="boardContent" >
				<td>상품설명</td>
				<td colspan="3"><textarea id="contents" name="contents" rows="10" cols="50"></textarea></td>
			</tr>
			<tr class="boardTitle" >
				<td>상품가격</td>
				<td colspan="3">
					<input type="text" id="price" name="price"/>
				</td>
			</tr>			
			<tr class="boardTitle" >
				<td>상품사진</td>
				<td colspan="2">
					<input name="file" type="file"  />
				</td>
				<td colspan="1">
					<input type="button" value="사진등록" onclick="add()" />
				</td>
				<input type="hidden" name="filename" id="filename" value="" />
<!-- 				<iframe name="iframe1"></iframe> -->
			</tr>		
			<tr>
				<td colspan="4" align="right">
					<input type="submit" class="btn btn-primary" id="submit" value="작성완료" disabled="disabled"/>
					<input type="button" class="btn btn-warning" value="취소" onclick="listFn()" />
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>