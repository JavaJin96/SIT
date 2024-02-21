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
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="menu">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content=="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Side Menu</title>
    <%--<<link rel="stylesheet" type="text/css" href="/css/rmenu.css"> --%>
    <link rel="stylesheet" type="text/css" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
</head>
<body>
    <nav class="main-menu">
        <ul>
            <li>                                   
                <a href="/SIT/main/main.do">
                    <i class="fa fa-home fa-lg"></i>
                    <span class="nav-text">Home</span>
                </a>
            </li>   
            <li>                                 
                <a href="/SIT/ryh/notice.do">
                    <i class="fa fa-envelope-o fa-lg"></i>
                    <span class="nav-text">공지사항</span>
                </a>
            </li>
            <li>                                 
                <a href="/SIT/ryh/rboardList.do">
                    <i class="fa fa-laptop fa-lg"></i>
                    <span class="nav-text">자유게시판</span>
                </a>
            </li>
            <c:if test="${sessionScope.userRole == '1'}">
                <li>
                    <a href="/SIT/admin/rboard.do">
                        <i class="fa fa-flask fa-lg"></i>
                        <span class="nav-text">관리자</span>
                    </a>
                </li>
            </c:if>
        </ul>
        
        <ul class="logout">
            <c:if test="${sessionScope.userId == null || sessionScope.userId == ''}">
                <li>
                    <a href="/SIT/ryh/ruserLogin.do">
                        <i class="fa fa-power-off fa-lg"></i>
                        <span class="nav-text">로그인</span>
                    </a>
                </li>
            </c:if>
            <c:if test="${sessionScope.userId != null && sessionScope.userId != ''}">
                <li>
                    <a href="/SIT/ryh/logout.do">
                        <i class="fa fa-power-off fa-lg"></i>
                        <span class="nav-text">로그아웃</span>
                    </a>
                </li>
            </c:if>
            <li>
                <a href="/SIT/ryh/ruserRegister.do">
                    <i class="fa fa-heart-o fa-lg"></i>
                    <span class="nav-text">회원가입</span>
                </a>
            </li>
        </ul>
    </nav>
</body>
</html>
