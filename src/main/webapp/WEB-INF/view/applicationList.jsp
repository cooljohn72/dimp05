<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>지원현황</title>
<link rel="stylesheet" type="text/css" href="#">
<!--[if IE]> <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script> <![endif]-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/layoutV2.css"/>">


</head>
<body>

<jsp:include page="/WEB-INF/view/shared/topV3.jsp" flush="true"/>

<form method="POST" action="">

<div class="container" style="overflow: scroll; margin-bottom: 100px; z-index:0" id="mainContent">
	<div class='row'>
		<div class='col-md-8'>
			<div id='breadCrumb'>
				<a href='JavaScript:location.href="#";'>&lt; 다른 프로젝트[기술자문?프로젝트? ] 둘러보기</a> 
			</div>
			
			<div id='postTitle'>
				<h1>${article.getTitle() }</h1>
			</div>
		</div>
		<div class='col-md-4'>
		
		</div>
	</div>
	<hr>
	
	<div class='row'>		
		<div class='col-md-8'>			
			<h3>지원 현황 보기</h3>					
		</div>
		<div class='col-md-4' id='postDateInfo'>		
			<label>${article.getRegdate() }</label>		
		</div>
		
	</div>
	
	<div class='row'>
		<!-- left spacer -->
		<!-- <div class="col-md-2" id='spacer'></div> -->
		<!-- end of left spacer -->
		<div class='col-md-8' id='applicationList'>	
			<c:if test="${fn:length(applicationList)>0}">
				<c:forEach items="${applicationList}" var="aList">
					<div id='aId_${aList.getIdx()}'>
						<input type="radio" name='negoTarget' id='negoTarget' value='${aList.getIdx()}'/>					
						<label>${article.getTitle() }</label>
						idx; ${aList.getIdx()} ||
						이름; <a href="${contextPath}/post/${article.getIdx()}/a/${aList.getIdx()}" target='_blank'>${aList.getWriterName()}</a> ||
						학력; ${aList.getWriterSchool()}/${aList.getWriterDegree()} | |
						Period; ${aList.getExpectingDays()} ||
						Cost; ${aList.getExpectingCost()} ||
						Record; 
					</div>			 
				</c:forEach>
			</c:if>
			
		</div>
		
		<div class='col-md-4' id='rightSideBar'>
		<a href="#" class='btn btn-default'>보관함에 임시 저장</a>
		<br>
		<br>
		<a href="#" class='btn btn-primary'>협의 대상자로 선정합니다.</a>
		</div>		
		<!-- right spacer -->
		<!-- <div class="col-md-2" id='spacer'></div> -->
		<!-- end of right spacer -->
	
	</div>
</div>
</form>

<jsp:include page="/WEB-INF/view/shared/footerV2.jsp" flush="true"/>



</body>
</html>