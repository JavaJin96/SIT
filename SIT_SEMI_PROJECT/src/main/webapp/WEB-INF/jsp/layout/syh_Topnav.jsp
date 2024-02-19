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


<style>
	#topnav_div {
		width:50%;
		text-alian: center;
		font-size: 2em;
		margin:auto;	
	}
</style>
<nav id="topnav">
	<ul>
		<li><a href="#" onclick="location.href='/SIT/main/main.do'">SIT_MAIN</a></li>
		<li><a href="#" onclick="location.href='/SIT/syh/sboardNotice.do'">공지사항</a></li>
		<li><a href="#" onclick="location.href='/SIT/syh/sboardFree.do'">자유게시판</a></li>
		
		<c:if test="${sessionScope.userNum == '2'}"> <!-- 관리자일때 -->
			<li><a href="/SIT/syh/suserList.do">회원관리</a></li>
		</c:if>
		
		
		<c:if test="${sessionScope.userId==null || sessionScope.userId==''}"> <!-- 로그인 안된경우로, 로그인 페이지로 이동 -->
			<li><a href="/SIT/syh/slogin.do">로그인</a></li>
		</c:if>
	
		<c:if test="${sessionScope.userId!=null && sessionScope.userId!=''}"> <!-- 로그아웃 기능 -->
      		<li><a href="/SIT/syh/sdoLogout.do">로그아웃</a></li>
      		<li><a>${userId}님 안녕하세요! (닉네임: ${sessionScope.userName})</a></li>
		</c:if>
	</ul>
</nav>