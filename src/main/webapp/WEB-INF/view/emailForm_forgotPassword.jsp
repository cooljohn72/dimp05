<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
<link rel="stylesheet" type="text/css" href="#">
<!--[if IE]> <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script> <![endif]-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/layoutV2.css"/>">

</head>
<body>

<jsp:include page="/WEB-INF/view/shared/topV3.jsp" flush="true"/>

<form action='${contextPath}/password/forgot' method='POST'>
<div class="container " style="overflow: scroll; margin-bottom: 100px; z-index:0; ">
	<div class="row" style='padding-top:100px; padding-bottom:150px'>
		<h3>Forgot password</h3>
	
		<div class=''>					
			<input type="email" name="email" id="email" class="form-control input-lg text-center" placeholder="이메일 주소" />
			<br />
		</div>
		<div>
			<button type="submit" id="btn-submit" class='btn btn-default'>인증메일 요청 </button>
		</div>
	</div>
</div>

</form>



</body>
</html>