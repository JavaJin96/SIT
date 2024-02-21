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
	function regProduct() {
		location.href = '<c:out value="regProductPage.do"/>';
	}

</script>

</head>
<body>
	<h2>안녕하세요. <br> 여기는 SYH SHOP 페이지 입니다..!!</h2>
	<input type="button" class="btn btn-primary" value="등록" onclick="regProduct()">
</body>
</html>