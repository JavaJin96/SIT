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

function signup(){
	window.location.href = '<c:out value="puserSignup.do" />';
}

$( document ).ready(function() {


});
		
</script>
<body>

<div class="container text-center">
<div class="col-sm-12 text-center">
  <h2>로그인</h2>
  <form class="form-horizontal" action="puserDoLogin.do">
    <div class="form-group">
        <c:if test="${loginFailed}">
            <div class="alert alert-danger" role="alert">
                로그인에 실패했습니다. 아이디와 비밀번호를 확인해주세요.
            </div>
        </c:if>    
      <label class="control-label col-sm-4" for="id">아이디 : </label>
      <div class="col-sm-6">
        <input type="text" class="form-control" id="id" placeholder="아이디를 입력해주세요" name="id">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-4" for="pass">비밀번호 : </label>
      <div class="col-sm-6">          
        <input type="password" class="form-control" id="pass" placeholder="비밀번호를 입력해주세요" name="pass">
      </div>
    </div>
    <div class="form-group text-right">        
      <div class="col-sm-10">
        <button type="submit" class="btn btn-primary login">로그인</button>
  </form>        
        <button type="button" class="btn btn-success signup" onclick="signup()">회원가입</button>
      </div>
    </div>

</div>
</div>

</body>
</html>