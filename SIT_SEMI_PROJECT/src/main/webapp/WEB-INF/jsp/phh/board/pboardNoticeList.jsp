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
function boardNoticeWrite(){
	location.href = '<c:out value="pboardNoticeWrite.do"/>';
}


$( document ).ready(function() {
	
	
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
  <table class="table table-striped">
  <h2> <a href = "pboardNoticeList.do" style="color: inherit; text-decoration: none;" >공지사항</a> </h2>
	<colgroup>
		<col style="width:10%" >
		<col style="width:40%" >
		<col style="width:15%" >
		<col style="width:20%" >
		<col style="width:15%" >
	</colgroup>  
    <thead>
      <tr>
        <th>NO</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일자</th>
        <th style='text-align : center' >조회수</th>
      </tr>
    </thead>
    <tbody>
	<c:forEach var="vo" items="${list}" varStatus="status">
	<tr onclick="location.href='pboardContent.do?no=${vo.no}'" style="cursor: pointer;">
<!-- 	<tr> -->
		<td>${status.index + 1}</td>
		<td>${vo.title}</td>
		<td>${vo.name}</td>
		<td>${vo.creDate}</td>
		<td style='text-align : center' >${vo.count}</td>
	</tr>
	</c:forEach>    
    </tbody>
  </table>
  <div align='right'>
      <c:if test="${sessionScope.userId !='admin'}">
      	<button type="button" class="btn btn-primary" onclick="boardNoticeWrite()" disabled="disabled">글 작성</button>
      </c:if>
      <c:if test="${sessionScope.userId =='admin'}">
      	<button type="button" class="btn btn-primary" onclick="boardNoticeWrite()">글 작성</button>
      </c:if>
  </div>

</div>


</body>
</html>