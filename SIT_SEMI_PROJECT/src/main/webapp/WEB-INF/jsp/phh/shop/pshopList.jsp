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
function shopWrite(){
	location.href = '<c:out value="pshopWrite.do"/>';
}

$( document ).ready(function() {
	var selectSearch = "<c:out value='${selectSearch}' />"
	
	if(selectSearch==null || selectSearch=="" || selectSearch=='undefined' ){
		$("#selectSearch").val('title');
	}else{
		$("#selectSearch").val(selectSearch); 
	}
	
});
		
</script>
</head>
<body>

<div class="container">
  <div class="row">
<!--     <div class="col-md-6"> -->
<!--       <h2> <a href = "pboardList.do" style="color: inherit; text-decoration: none;" >자유게시판</a> </h2> -->
<!--     </div> -->
<!--     <div class="col-md-6 text-right"> -->
<!--       <br> -->
<%--       <c:if test="${sessionScope.userId==null || sessionScope.userId==''}"> --%>
<!--       	<button type="button" class="btn btn-primary" onclick="boardWrite()" disabled="disabled">글 작성</button> -->
<%--       </c:if> --%>
<%--       <c:if test="${sessionScope.userId!=null && sessionScope.userId!=''}"> --%>
<!--       	<button type="button" class="btn btn-primary" onclick="boardWrite()">글 작성</button> -->
<%--       </c:if> --%>
<!--       <br> -->
<!--     </div> -->
  </div>
  <h2> <a href = "pshopList.do" style="color: inherit; text-decoration: none;" >혀노SHOP</a> </h2>
	<div class='search'>
      	<form action="pshopSearch.do" method="post">
			<select id="selectSearch" name="selectSearch">
				<option value="title" selected="selected">상품 제목</option>
				<option value="contents">상품 내용</option>
			</select>
      		<input type="text" id="search" name="search" value="${not empty search ? search : ''}" />
      		<input type="submit" class='btn btn-warning' value='검색'/>
      	</form>
	</div>
  <table class="table table-striped">
	<colgroup>
		<col style="width:33%" >
		<col style="width:33%" >
		<col style="width:33%" >
<%-- 		<col style="width:20%" > --%>
	</colgroup>    
	<c:forEach var="list" items="${list}" varStatus="status">
	<c:if test="${status.index % 3 == 0}">
	<tr>
	</c:if>
		<td onclick="location.href='pshopContent.do?no=${list.no}'" style="cursor: pointer;">
			<div style='text-align : center'><img src="<c:out value='/SIT/download/${list.fileName}'/>" width="200px" height="200px" ></div>
			<div style='text-align : center'>${list.title}</div>
			<div style='text-align : center'>${list.price}원</div>
<%-- 			<div style='text-align : center'>${list.star}</div> --%>
		</td>
	<c:if test="${status.index % 3 == 2}">
	</tr>
	</c:if>		
	</c:forEach>
  </table>

  
  
  <div align='right'>
      <c:if test="${sessionScope.userRole == '1'}">
      	<button type="button" class="btn btn-primary" onclick="shopWrite()">상품 등록</button>
      </c:if>
  </div>

</div>


</body>
</html>