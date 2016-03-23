<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="#">
<!--[if IE]> <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script> <![endif]-->
<style>
#left-sidebar{
	z-index:0;
}

</style>
</head>
<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<div class='col-md-2 col-sm-2 hidden-xs hidden-sm' id="left-sidebar">

	<div class='text-center' id='profilePicture'>
		<img src="<c:url value="/resources/userUpload/pp/pp_44.jpg"/>" class="img-circle" alt="Cinque Terre" width="100" height="100">
	</div>
	
	<div class='text-center' id='nickName'>
		<h3>원빈</h3> 
	</div>
	
	<div class='text-left' id="major">
		<h4>전공 </h4>
		<ul class="ul-noBullet ul-sidebar">
			<li>컴퓨터공학 </li>
			<li>전자공학 </li>
		</ul>
	</div>
	
	<div class='text-left' id="degree">
		<h4>최종 학위 </h4>
		<ul class="ul-noBullet ul-sidebar">
			<li>심리학 박사 </li>					
		</ul>
	</div>
	
	<div class='text-left' id="interestedIn">
		<h4>관심 분야 </h4>
		<ul class="ul-noBullet ul-sidebar">
			<li>컴퓨터공학 asdfasfassdfasdfasd</li>
			<li>설계</li>
			<li>평가</li>
		</ul>
	</div>
	
	<div class='text-center'>
		<h1><button type="button" class="btn btn-warning" style='font-size: 50px'>96</button></h1>
	</div>

</div>



</body>
</html>