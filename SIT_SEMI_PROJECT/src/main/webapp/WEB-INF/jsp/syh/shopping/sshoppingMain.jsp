<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SYH SHOP</title>
	<script>
		function regProduct() {
			location.href = '<c:out value="regProductPage.do"/>';
		}
	
	</script>
</head>
<body>
	<h2>안녕하세요. <br> 여기는 SYH SHOP 페이지 입니다..!!</h2>
	
	<table class='table table-striped'>
		<thead>
			<tr>
				<th width="15%">이미지</th>
				<th width="15%">상품명</th>
				<th width="30%">상세설명</th>
				<th width="15%">판매자</th>
				<th width="15%">가격</th>
			</tr>
		</thead>  
		<tbody>
		<c:forEach var="list" items="${list}" varStatus="status">
		<tr>
			<td><img src="<c:out value='/SIT/download/${list.fileName}'/>" width="200px" height="200px" ></td>
			<td><h5>${list.prodTitle}</h5></td>
			<td>${list.prodContents}</td>
			<td>${list.name}</td>
			<td><h4>${list.price} 원</h4></td>
		</tr>
		</c:forEach>
		</tbody>
	</table>
	<div align='right'>
	      <c:if test="${sessionScope.userId==null || sessionScope.userId==''}">
	      	<button type="button" class="btn btn-primary" onclick="regProduct()" disabled="disabled">등록</button>
	      </c:if>
	      <c:if test="${sessionScope.userId!=null && sessionScope.userId!=''}">
	      	<button type="button" class="btn btn-primary" onclick="regProduct()">등록</button>
	      </c:if>
	</div>
</body>
</html>