<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
 
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>DIMP - Open innovation</title>
<link rel="stylesheet" type="text/css" href="#">
<!--[if IE]> <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script> <![endif]-->
<link rel="stylesheet" type="text/css" 
		href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
		
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/layoutV2.css"/>">
</head>

<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/view/shared/topV3.jsp" flush="true"/>

<div class="container text-center">	
	<div class='row'>
		<h1>DIMP</h1>
		<h3>Esteem for your technology</h3>
		<div class='text-center' id='profilePicture'>
			<img src="<c:url value="/resources/userUpload/pp/pp_44.jpg"/>" class="img-circle" alt="Cinque Terre" width="240" height="200">
		</div>
		<div class=''>
			<h4>DIMP는 기술 자문 및 프로젝트 매칭 플랫폼입니다.</h4>
			<h5>기술인의 잠재된 가치와 가능성을 믿습니다.</h5>
			<h5>벅찬 마음으로 여러분의 기술을 연결합니다.</h5>			
		</div>
	</div>			
</div>

<div class="container-fluid text-center">
	<h3>Some reasons</h3>
	<h3>Why you should use the DIMP service</h3>
	<h3>(Process / Benefits)</h3>
</div>

<div class="container-fluid text-center">
	<h3>Best Practices</h3>	
</div>

<div class="container-fluid text-center">
	<h3>Dimp's Slogan</h3>	
</div>

<div class="container-fluid text-center">
	<h3>more about the DIMP</h3>
	<!-- 
	<a href='#' class='btn btn-danger'>딤프에 대해 더 알고 싶어요</a>
	 -->	
	 <button type='button' class='btn btn-primary'>딤프에 대해 더 알고 싶어요</button>
</div>




<jsp:include page="/WEB-INF/view/shared/footerV2.jsp" flush="true"/>
</body>
</html>