<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
	
	function home(){
		location.href = '<c:out value="sboardMain.do" />';
	}
	
	$(document).ready(function() {
	
		
	});
			
	</script>
</head>
<body>
	안녕하세요~
	<br>
	<br>
	홈페이지 바로가기 >>
	<button type="button" class="btn btn-primary" onclick="home()">홈페이지</button>
</body>
</html>