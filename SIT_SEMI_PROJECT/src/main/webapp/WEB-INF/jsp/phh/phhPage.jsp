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
<title>Insert title here</title>
<script>
$( document ).ready(function() {

	
});
		
</script>
</head>
<body>

<div>

	
<div class="container">
  <div class="row">
    <div class="col-sm-4">
      <h2>게시판</h2>
	<c:forEach var="test" items="${test}" varStatus="status">
		<div>
			${test.no}
			${test.content}
		</div>
	</c:forEach>
    </div>
    <div class="col-sm-4">
      <h2>공지사항</h2>
	<c:forEach var="test" items="${test}" varStatus="status">
		<div>
			${test.no}
			${test.content}
		</div>
	</c:forEach>
    </div>
    <div class="col-sm-4">
      <h2>회원가입</h2>        
	<c:forEach var="test" items="${test}" varStatus="status">
		<div>
			${test.no}
			${test.content}
		</div>
	</c:forEach>
    </div>
  </div>
</div>	
</div>


</body>
</html>