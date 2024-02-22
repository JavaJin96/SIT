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
	<script>
	
	function prodDelete(num){
		if (confirm("상품을 삭제하시겠습니까?") == true){
			location.href = '<c:out value="deleteProduct.do?num="/>'+num
		} else { }
	}
	
	/*
	function suserpoi() {
		location.href = '<c:out value="suserpoi.do"/>';
	}
	*/
	
	</script>
</head>

<body>
<div class="container">
  <h2>상품 관리</h2>
  <!-- 
  <input type="button" class="btn btn-outline-warning" name="userDatapoi" id="userDatapoi" value="유저 데이터 Excel 다운로드" onclick="suserpoi()" />   
   -->
  <table class="table table-hover">
    <thead>
      <tr>
        <th>상품 고유번호</th>
        <th>상품명</th>
        <th>판매자</th>
        <th>가격</th>
        <th>등록일자</th>
        <th>관리</th>
      </tr>
    </thead>
    
    <tbody>
	<c:forEach var="vo" items="${list}" varStatus="status">
	<tr>
		<td>${vo.num}</td>
		<td><h5><a href="<c:url value='regProductContent.do?num=${vo.num}'/>">${vo.prodTitle}</a></h5></td>
		<td>${vo.name}</td>
		<td><fmt:formatNumber value="${vo.price}" /> 원</td>
		<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.regdate}"/></td>
		<td>
			<!-- 마감은 상품을 삭제하진 않으나 구입이 불가능하고 조회 시 "마감된 상품입니다"를 출력 하게끔 하기 -->
			<button type="button" class="btn btn-secondary">마감</button>
			<button type="button" class="btn btn-danger" onclick="prodDelete(${vo.num})">삭제</button>
		</td>
	</tr>
	</c:forEach>    
    </tbody>
  </table>
</div>
</body>
</html>