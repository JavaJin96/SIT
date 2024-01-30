<%--
  Class Name : EgovIncTopnav.jsp
  Description : 상단메뉴(include)
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2011.08.31   JJY       경량환경 버전 생성
 
    author   : 실행환경개발팀 JJY
    since    : 2011.08.31 
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import ="egovframework.com.cmm.LoginVO" %>

<script type="text/javascript">

</script>
<style>
	#topnav_div{
		width:100%;
		text-align: center;
		font-size:2.5em;
		margin: auto;
	}
</style>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> -->
<!--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
</head>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Ssoho</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="#" onclick="location.href='/SIT/main/main.do'">SIT_MAIN</a></li>
      <li><a href="#">공지사항</a></li>
      <li><a href="#">자유게시판</a></li>
      <li><a href="#">관리자</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
<!--     현재 로그아웃이면 -->
      <li><a href="/SIT/phh/puserGoLogin.do"><span class="glyphicon glyphicon-user"></span> 로그인</a></li>
<!--       현재 로그인이면 -->
      <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> 로그아웃</a></li>
    </ul>
  </div>
</nav>
