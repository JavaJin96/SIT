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
<div id="topnav_div">
	<ul>
		<li><a href="#LINK" onclick="location.href='/SIT/main/main.do'" >MAIN</a></li>
		<li><a href="#LINK" onclick="location.href='/SIT/psj/main.do'" >PSJ</a></li>
		<li><a href="#LINK" onclick="location.href='/SIT/phh/main.do'" >PHH</a></li>
	    <li><a href="#LINK" onclick="location.href='/SIT/ryh/main.do'" >RYH</a></li>
	    <li><a href="#LINK" onclick="location.href='/SIT/syh/main.do'" >SYH</a></li>
	</ul>
</div>