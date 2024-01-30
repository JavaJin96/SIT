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

$(function(){
	$('form').submit(function(){		
		
		var pass = $('#pass').val();
		var repass = $('#repass').val();
		
		if (pass != repass){
			alert('비밀번호가 다릅니다. 다시 입력해주세요.')
			return false;
			e.preventDefault();
		}
		
		});	
})	

$( document ).ready(function() {
	
	
});
		
</script>
<body>

<div class="container text-center">
<div class="col-sm-8 col-sm-offset-3 text-center">
  <h2>회원가입</h2>
  <form class="form-horizontal" action="puserInsert.do">
    <div class="form-group">
      <label class="control-label col-sm-3" for="id">아이디 : </label>
      <div class="col-sm-6">
        <input type="text" class="form-control" id="id" placeholder="아이디를 입력해주세요" name="id">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-3" for="pass">비밀번호 : </label>
      <div class="col-sm-6">          
        <input type="password" class="form-control" id="pass" placeholder="비밀번호를 입력해주세요" name="pass">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-3">비밀번호 재입력 : </label>
      <div class="col-sm-6">          
        <input type="password" class="form-control" id="repass" placeholder="비밀번호를 한 번 더 입력해주세요">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-3" for="name">닉네임 : </label>
      <div class="col-sm-6">          
        <input type="text" class="form-control" id="name" placeholder="닉네임을 입력해주세요" name="name">
      </div>
    </div>        
    <div class="form-group text-right">        
      <div class="col-sm-offset-2 col-sm-6">
        <button type="submit" class="btn btn-primary">회원가입</button>
      </div>
    </div>        
  </form>        
</div>
</div>

</body>
</html>