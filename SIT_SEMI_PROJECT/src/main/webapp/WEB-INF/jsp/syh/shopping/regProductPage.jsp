<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SYH SHOP</title>
	<script>
	
	$(function() {
		$('form[name="regProd"]').submit(function() {
			
			var prodTitle = $('#prodTitle').val();
			var prodContents = $('#prodContents').val();
			
			if (prodTitle.length >= 20){
				alert('상품명은 20자 이하로 작성해주세요');
				return false;
			}
			if (contents.length >= 200){
				alert('상품 설명은 200자 이하로 작성해주세요');
				return false;
			}
			
			// 개행처리 
			prodContents = prodContents.replace(/(?:\r\n|\r|\n)/g, '<br/>');
	        $('#prodContents').val(prodContents);
		});
	})
	
	function add(){
		if ($("#file").val() !=''){ // 파일이 첨부 되었을 때
			var formData = new FormData();
			formData.append("file", $("input[name=file]")[0].files[0]);
			
			$.ajax ({
				url : "<c:url value='uploadForm.do'/>",
				type : "post",
				data : formData,
				
				processData : false,
				contentType : false,
				
				success : function(data){ 
					
					var fileName = data.fileName;  // 파일명
					$('#fileName').val(fileName);
					alert("사진첨부가 완료되었습니다.");
					$("#submit").removeAttr("disabled");
				},
				error : function(){ alert("error"); }
			});
			
		} else { // 첨부 X
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
	
	<form name="regProd" id="regProd" action="insertProduct.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="userNum" value="${sessionScope.userNum}"/>
		<table class="table">
			<colgroup>
				<col style="width:25%" >
				<col style="width:25%" >
				<col style="width:25%" >
				<col style="width:25%" >
			</colgroup>
			
			<tr class="prodTitle" >
				<td><h5>상품명</h5></td>
				<td colspan="3">
					<input type="text" id="prodTitle" name="prodTitle" required/>
				</td>
			</tr>
			
			<tr class="prodContents" >
				<td><h5>상품 상세설명</h5></td>
				<td colspan="3"><textarea id="prodContents" name="prodContents" rows="10" cols="50" required></textarea>
			</tr>
			
			<tr class="price" >
				<td><h5>상품 가격</h5></td>
				<td colspan="3">
					<input type="text" id="price" name="price" required/>
				</td>
			</tr>
			
			<tr class="imgfile" >
				<td><h5>상품 이미지</h5></td>
				
				<td colspan = "2">
					<input type="file" name="file" class="btn btn-outline-secondary"/>
				</td>
				<td colspan="1">
					<input type="button" class="btn btn-outline-success" value="사진등록" onclick="add()" />
				</td>
				<input type="hidden" name="fileName" id="fileName" value="" />	
			</tr>
			<tr>
				<td colspan="4" align="right">
					<input type="submit" class="btn btn-primary" id="submit" value="상품 등록" />
					<input type="button" class="btn btn-warning" value="취소" onclick="history.back()" />
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>