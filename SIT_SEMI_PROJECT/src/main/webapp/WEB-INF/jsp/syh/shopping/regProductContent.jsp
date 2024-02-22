<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서윤호 자유게시판</title>
	<script type="text/javascript">
	
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
	
	</script>
</head>

<body>
<div class="container">
  <table class="table">
	<colgroup>
		<col style="width:25%" >
		<col style="width:25%" >
		<col style="width:25%" >
		<col style="width:25%" >
	</colgroup>
	<c:if test="${vo!=null}">
		<tr class="prodTitle" >
			<td colspan="2"><img src="<c:out value='/SIT/download/${vo.fileName}'/>" width="300px" height="300px" ></td>
			
			<td colspan="2">
				<table class="table">
				<colgroup>
					<col style="width:25%" >
					<col style="width:25%" >
					<col style="width:25%" >
					<col style="width:25%" >
				</colgroup>		
					
					<tr class="prodTitle" >
						<td><h4>상품명 :</h4></td>
						<td colspan="3"><h4>${vo.prodTitle}</h4></td>
					</tr>
					
					<tr class="prodContents" >
						<td>상품설명 :</td>
						<td colspan="3"> ${vo.prodContents} </td>
					</tr>
					
					<tr class="seller" >
						<td>판매자 :</td>
						<td colspan="3"> ${vo.name}</td>
					</tr>
					
					<tr class="regdate" >
						<td>등록일 :</td>
						<td colspan="3"> <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.regdate}"/></td>
					</tr>
					
					
				</table>
				<text align="right"><h2>${vo.price} 원</h2></text>
			</td>
		</tr>
	</c:if>
</table>
리뷰 남기는 공간
</div>
</body>
</html>