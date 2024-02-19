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
<script type="text/javascript">

function goHome(){
	location.href = '<c:out value="rboardList.do" />';
}

$( document ).ready(function() {

	
});
		
</script>

<style>
	.change{
		font-size : 2rem;
		width:100%;
	}
	
	.ryh_custom{
		background-color: #4CAF50;
		color: white;
		border: none;
		border-radius : 5px;
		padding: 10px 20px;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		font-size: 2rem;
		cursor: pointer;	
	}
	.ryh_custom:hover{
		background-color : #45a049;
	}
	
	.go_center{
		item-align : center;
		text-align : center;
		padding : 10px 10px;
	}
	
</style>
</head>
<body>
	
<div class="go_center">
	<button class="ryh_custom" type="button" onclick="goHome()" >노윤호</button>
</div>	

</body>
</html>