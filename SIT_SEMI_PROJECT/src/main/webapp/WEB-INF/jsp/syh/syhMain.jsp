<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SEO PAGE</title>
<script type="text/javascript">
	function homePage() {
		location.href= '<c:out value="seoBoardMain.do"/>';
	}
	
	$(document).ready(function(){
	
	});

</script>
</head>
<body>
	안녕하세요!!
	<br>
	<br>
	홈페이지 바로가기
	<button type="button" class="btn btn-outline-primary" onclick="homePage()"> 홈페이지 </button>
</body>
</html>