<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	function listFn(){
		location.href = "pshopList.do";
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
					var fileName = data.fileName;
					$('#fileName').val(fileName);
					alert("사진첨부가 완료되었습니다.");
				},
				error : function(){ alert("error"); }
			});
			
		}else{ // 파일이 첨부 되지 않은 경우
			return false;
		}
	}
	
	$(function(){
		$('form[name="update"]').submit(function(){
				
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
	
</script>  
<style>
	.table input.btn-success {
	text-align: center !important;
	width:40% !important;
	float: right;
	border:none;
	}
</style>
</head>
<body>
<div class="container">
	<h2> <a href = "pshopList.do" style="color: inherit; text-decoration: none;" >상품 수정</a> </h2>
<form name="update" id="update" action = "pshopUpdate.do">
<input type="hidden" name="no" value="${vo.no}" />
<table class="table">
	<colgroup>
		<col style="width:25%" >
		<col style="width:25%" >
		<col style="width:25%" >
		<col style="width:25%" >
	</colgroup>
	<c:if test="${vo!=null}">
		<tr class="boardTitle" >
			<td>상품명</td>
			<td colspan="3" ><input type="text" id="title" name="title" value="${vo.title}" /></td>
		</tr>
		<tr class="boardContent" >
			<td>상품설명</td>
			<td colspan="3" ><textarea id="contents" name="contents" rows="10" cols="50">${vo.contents}</textarea></td>
		</tr>
		<tr class="boardTitle" >
			<td>상품가격</td>
			<td colspan="3"><input type="text" id="price" name="price" value="${vo.price}" /></td>
		</tr>
		<tr class="boardTitle" >
			<td>상품구분</td>
			<td colspan="3"><input type="text" id="gubun" name="gubun" value="${vo.gubun}" /></td>
		</tr>		
			<tr class="boardTitle" >
				<td>상품사진</td>
				<td colspan="2">
					<input name="file" type="file"  />
				</td>
				<td colspan="1">
					<input type="button" class="btn btn-success" value="사진등록" onclick="add()" />
				</td>
				<input type="hidden" name="fileName" id="fileName" value="${vo.fileName}" />
			</tr>
	</c:if>
			<tr>
				<td colspan="4" align="right">
					<input type="submit" class="btn btn-primary" value="수정완료" />
					<input type="button" class="btn btn-warning" value="취소" onclick="listFn()" />
				</td>
			</tr>
</table>
</form>
</div>

</body>
</html>