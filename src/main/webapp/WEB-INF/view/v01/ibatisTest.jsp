<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <title>DIMP</title>
    <link rel="stylesheet" type="text/css" href="#">
	<!--[if IE]> <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script> <![endif]-->
 	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/layout.css"/>">
 	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/smoothness/jquery-ui-1.9.2.custom.css"/>">
 	<%-- 
 	<script src="<c:url value="">" type="text/javascript" charset="utf-8"></script>
 	 --%>
 	 
 	<script src="<c:url value="/resources/js/jquery-1.8.3.js"/>" type="text/javascript" charset="utf-8"></script>
 	
 	<script>
	$(document).ready(function(){
		$("#submit-button").click(function(){
	        alert("The paragraph was clicked.");
	    });
		
		$("#email").blur(function(){
	        alert("The paragraph was changed");
	    });
	});
</script>
 	
</head>
<body>
<div id="top_container">
	<div id="top_layer_fixed">
    	<jsp:include page="/WEB-INF/view/shared/top.jsp" flush="true"/>      
    </div>
</div>
<div id="content">
	<div id="centerContent">
		<form>
		
			<h3>iBatisTest</h3>
			
			<div>
				${msg }
			</div>
		
			<div id="openid-buttons">
				<div class="major-provider   facebook-login" data-provider='facebook' data-oauthserver='https://www.facebook.com/v2.0/dialog/oauth' data-oauthversion='2.0'>
					<div class="icon-container"><span class="icon" style=""></span></div>
					<div class="text"><span>Facebook</span></div>
					<!-- 
					<br class="cbt"/>
					 -->
				</div>
				
				<div class="major-provider   google-login" data-provider='google' data-oauthserver='https://accounts.google.com/o/oauth2/auth' data-oauthversion='2.0'>
					<div class="icon-container"><span class="icon" style=""></span></div>
					<div class="text"><span>Google</span></div>
					<!-- 
					<br class="cbt"/>
					 -->
				</div>
				
           	</div>
		
			
			
			<ul>
				<li><a href='#'>Facebook</a></li>
				<li><a href='#'>Google+</a></li>
			</ul>
			
			or<br>
			
			<label for="email">Email</label><br />
			<input type="text" name="email" id="email" placeholder="example@domain.com" /><br />
			
			<label for="pword">Password</label><br />
			<input type="password" name="pword" id="pword" placeholder="" /><br />
			
			<label for="pwordConfirm">Confirm Password</label><br />
			<input type="password" name="pwordConfirm" id="pwordConfirm" placeholder="" /><br />
			
		
			<div id='passwordAlert' class='alertText'>alert....오류!!!</div>
			
			<input class="fr" type="button" id="submit-button" name="submit-button" value="Sign up" />
		
		</form>
		
	
		
	</div>
	
</div>
<div id='footer_container'>
	<div id='footer'>
		<jsp:include page="/WEB-INF/view/shared/footer.jsp" flush="true"/>
	</div>
</div>
</body>
</html>