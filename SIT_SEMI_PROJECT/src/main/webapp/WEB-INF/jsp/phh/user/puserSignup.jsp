<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

$(function(){
	$('form').submit(function(){		
		
		var id = $('#id').val();
		var name = $('#name').val();
		var pass = $('#pass').val();
		var repass = $('#repass').val();
		$("#id").removeAttr("disabled");
		$("#name").removeAttr("disabled");
		
		if (pass != repass){
			alert('비밀번호가 다릅니다. 다시 입력해주세요.')
			return false;
		}
		
		if (id =='' || id == null){
			alert('아이디는 필수요소입니다.');
			return false;
		} else if(pass =='' || pass == null){
			alert('비밀번호는 필수요소입니다.');
			return false;
		
		} else if(name =='' || name == null){
			alert('닉네임은 필수요소입니다.');
			return false;
		}
		
		if (id.length >= 17){
			alert('아이디는 16자 이하로 작성해주세요');
			return false;
		}
		if (pass.length >= 17){
			alert('비밀번호는 16자 이하로 작성해주세요');
			return false;
		}
		if (name.length >= 11){
			alert('닉네임은 10자 이하로 작성해주세요');
			return false;
		}		
	});	
	
	
})

function updateSignupButton() {
    // isIdAvailable 값에 따라 회원가입 버튼 활성화 또는 비활성화
//     var isIdAvailable = $("#isIdAvailable").val();
//     if (isIdAvailable == 'true') {
//         // 사용 가능한 경우
//         $("button[type='submit']").removeAttr("disabled");
//         $("#id").attr("disabled", "disabled");
//     } else {
//         // 사용 불가능한 경우
//         $("button[type='submit']").attr("disabled", "disabled");
//         $("#id").removeAttr("disabled");
//     }
    
    var isIdAvailable = $("#isIdAvailable").val();
    var isNameAvailable = $("#isNameAvailable").val();
    
    if (isIdAvailable == 'true') {
        // 사용 가능한 경우
        $("#id").attr("disabled", "disabled");
    } else {
        // 사용 불가능한 경우
        $("#id").removeAttr("disabled");
    }    
    
    if (isNameAvailable == 'true') {
        // 사용 가능한 경우
        $("#name").attr("disabled", "disabled");
    } else {
        // 사용 불가능한 경우
        $("#name").removeAttr("disabled");
    }
    
    if (isIdAvailable == 'true' && isNameAvailable == 'true'){
    	$("button[type='submit']").removeAttr("disabled");
    } else{
    	$("button[type='submit']").attr("disabled", "disabled");
    }
    
}	

function checkId() {
    var userId = document.getElementById("id").value;
    
    // 한글문자열 문제해결
    var encodedId = encodeURIComponent(userId);
    $.ajax({
    	url : "<c:url value='puserDbCheck.do' />",
        type: 'GET',
        data: {"id" : userId},
        success: function(data) {
            if (data.dbId !== null && data.dbId === userId) {
                alert("중복된 아이디입니다. 다른 아이디를 사용해주세요.");
            } else {
                alert("사용 가능한 아이디입니다.");
                $("#isIdAvailable").val("true");
                updateSignupButton();
            }          
        },
        error: function() {
            alert('서버와의 통신 중 오류가 발생했습니다.');
        }
    });
}	

function checkName() {
    var userName = document.getElementById("name").value;
    // 한글문자열 문제해결
    var encodedName = encodeURIComponent(userName);
    $.ajax({
    	url : "<c:url value='puserNameCheck.do' />",
        type: 'GET',
        data: {"name" : userName},
        success: function(data) {
            if (data.dbName !== null && data.dbName === userName) {
                alert("중복된 닉네임입니다. 다른 닉네임을 사용해주세요.");
            } else {
                alert("사용 가능한 닉네임입니다.");
                $("#isNameAvailable").val("true");
                updateSignupButton();
            }          
        },
        error: function() {
            alert('서버와의 통신 중 오류가 발생했습니다.');
        }
    });
}	

$( document ).ready(function() {
	updateSignupButton();
});
		
</script>
<body>
<input type="hidden" id="isIdAvailable" value="" />
<input type="hidden" id="isNameAvailable" value="" />
<div class="container text-center">
<div class="col-sm-12 text-center">
  <h2>회원가입</h2>
  <form class="form-horizontal" action="puserInsert.do" method="post">
    <div class="form-group">
        <c:if test="${loginFailed}">
            <div class="alert alert-danger" role="alert">
                로그인에 실패했습니다. 아이디와 비밀번호를 확인해주세요.
            </div>
        </c:if>      
      <label class="control-label col-sm-4" for="id">아이디 : </label>
      <div class="col-sm-6">
      <table>
      <tr>
        <td><input type="text" class="form-control" id="id" placeholder="아이디를 입력해주세요" name="id"></td>
        <td><input type="button" value="중복체크" onclick="checkId()" class="btn btn-warning"></td>    
      </tr>
      </table>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-4" for="pass">비밀번호 : </label>
      <div class="col-sm-6">          
        <input type="password" class="form-control" id="pass" placeholder="비밀번호를 입력해주세요" name="pass">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-4">비밀번호 재입력 : </label>
      <div class="col-sm-6">          
        <input type="password" class="form-control" id="repass" placeholder="비밀번호를 한 번 더 입력해주세요">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-4" for="name">닉네임 : </label>
      <div class="col-sm-6">          
      <table>
      <tr>
        <td><input type="text" class="form-control" id="name" placeholder="닉네임을 입력해주세요" name="name"></td>
        <td><input type="button" value="중복체크" onclick="checkName()" class="btn btn-warning"></td>      
      </tr>
      </table>      
      </div>
    </div>
    <div class="form-group text-right">        
      <div class="col-sm-10">
<!--       	<button type="submit" class="btn btn-primary" disabled="disabled">회원가입</button> -->
			<button type="submit" class="btn btn-primary">회원가입</button>
      </div>
    </div>        
  </form>        
</div>
</div>

</body>
</html>