<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>

<style>
	#main_Div{
		font-size:1.4em;
		width: 100%;
		height: 1500px;
		padding-top: 25px;
	}
	#leftTopDiv{
		display:inline-block;
		width:70%;
		height:750px;
		margin-bottom: 30px;
	}
	#leftDownDiv{
		display:inline-block;
		width:70%;
		height:750px;
	}
	#rightDiv{
		display:inline-block;
		width:29.5%;
		float:right;
		height:1500px;
	}
	#loginBox,#boadrDiv{
		width:100%;
		height:400px;
		text-align: center;
	}
	#loginForm{
		width:100%;
	}
	.loginIpb{
		display: inline-block;
		width: 150px;
	}
	#loginForm input[type=button],#loginForm input[type=submit]{
		margin-top: 30px;
	}
	#newBdBtn{
		float:right;
		margin-bottom: 10px;
	}
	#leftIf{
		width:100%;
		height:750px;
		border : 1px solid rgb(224, 224, 235);
		border-radius: 3%;
		overflow: hidden;
	}
	#loginBox{
		padding-top : 40px;
		height:300px;
		border : 1px solid rgb(224, 224, 235);
		border-radius: 3%;
		margin-bottom: 20px;
	}
	#loginBox input[type=text], #loginBox input[type=password]{
		width:200px;
		display: inline-block;
	}
	#calendar{
		height:390px;
		font-size: 0.4em;
		border : 1px solid rgb(224, 224, 235);
		border-radius: 3%;
	}
	.img{
	    width: 15%;
	    height: 60px;
	    margin-right: 30px;
        margin-left: 30px;
	}
	#homePageInfoDiv{
		margin-top : 69px;
		padding-left : 30px;
		border : 1px solid rgb(224, 224, 235);
		border-radius: 3%;
	}
	#comeCountChartDiv{
		width:100%;
		height:500px;
		font-size: 0.8em;
	}
	#boadrDiv{
		padding-top:30px;
		padding-left:10px;
		padding-right:10px;
		border : 1px solid rgb(224, 224, 235);
		border-radius: 3%;
		height : 558px;
	}
	#boadrDiv th{
		color : white;
		height: 50px;
		font-size: 0.8em;
		font-weight: bold;
	}
</style> 
<script>
$( document ).ready(function() {

	
});
		
</script>

<div id="main_Div">

</div>
