<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title></title>
<link rel="stylesheet" type="text/css" href="#">
<!--[if IE]> <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script> <![endif]-->

<link rel="stylesheet" type="text/css" 
		href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
		
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/layoutV2.css"/>">

</head>

<script>	
	$(document).ready(function(){	
	
	});
</script>

<body>

<p>session from signInForm.jsp; <%= session.getAttribute("loginUserIdx") %></p>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>


<c:set var="loginUser" value="${loginUser}" scope="request" />
<jsp:include page="/WEB-INF/view/shared/topV3.jsp" flush="true"/>

<div class="container " style="overflow: scroll; margin-bottom: 100px; z-index:0">
	<div class="row">
	
		<!-- spacer -->	
		<div class="col-md-3 col-sm-3 col-xs-1" id='spacer'></div>
	
		<div class='col-md-6 col-sm-6 col-xs-10' id="content">
			<form id='theForm' action="${contextPath }/requestactivation" method="post">
		
				<h3>계정 활성화가 완료되었습니다.</h3>
				<a href="${contextPath}/signin">Sign in</a>
				
				<%-- <button type="submit" class='btn btn-primary btn-block' id='submit-button' name='submit-button'>인증메일 발송 요청</button>
				<input type='hidden' name='requestingUserIdx' id='requestingUserIdx' value='${requestingUserIdx}'/>
				<input type='hidden' name='requestingEmail' id='requestingEmail' value='${registeredEmail}'/> --%>
			
			</form>
		</div>
		
		<!-- spacer -->	
		<div class="col-md-3 col-sm-3 col-xs-1" id='spacer'></div>
		<!-- 
		<div class='col-md-2' style='height:1000px'>
			<p>
				This is the side bar
			</p>
		</div>
		 -->
	</div>
</div>

<jsp:include page="/WEB-INF/view/shared/footerV2.jsp" flush="true"/>

</body>
</html>