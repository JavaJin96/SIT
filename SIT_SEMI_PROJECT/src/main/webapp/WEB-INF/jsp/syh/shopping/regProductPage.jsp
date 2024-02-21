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
</head>
<body>
<div class="container">
	<h2>상품 등록</h2>
	
	<form name="regProd" id="regProd" action="insertProduct.do" >
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
			<%--
			<tr class="imgfile" >
				<td><h5>상품 이미지</h5></td>
				
				<td colspan="1">
					<input type="button" value="이미지 첨부" onclick="imgFileUpload()" />
				</td>
				<input type="hidden" name="fileName" id="fileName" value="" />
			</tr>
			--%>
			<tr>
				<td colspan="4" align="right">
					<input type="submit" class="btn btn-primary" value="등록하기" />
					<input type="button" class="btn btn-warning" value="취소" onclick="history.back()" />
				</td>
			</tr>
			 
		</table>
	</form>
</div>
</body>
</body>
</html>