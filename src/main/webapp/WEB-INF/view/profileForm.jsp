<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title></title>
	<link rel="stylesheet" type="text/css" href="#">
	<!--[if IE]> <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script> 
	<![endif]-->
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/layout.css"/>">
	<link rel="stylesheet" type="text/css" 
		href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
 	
</head>
<body>

<div class="container">
	<div class="row" id="top_contatinerV2">
		<div class="col-md-12 col-sm-12" id="top_layer_fixed">
			<jsp:include page="/WEB-INF/view/shared/top.jsp" flush="true"/>
		</div>
	</div>
	
	<div class="row" id="content">
		<div class="col-md-12">
			<h2>Johnathan Wonyoung Song(${idx})(target:${target})의 마이 페이지 입니다. </h2>
			Profile Edit page 입니다.<br/>
						
			<!-- menu in user page -->
			<%
			/*
			본인에게만 노출.
			모든 사용자에게 노출되는 activity는 profile선택 시, 
			default로 표시되기 때문에 아래 링크는 본인에게만 표시되면 됨. 
			*/
			%>
			<ul>
				<li><a href='${contextPath }/user/1/a'>Activity</a></li>				
				<li><a href='${contextPath }/user/1/f'>보관함/scrap</a></li>
				<li><a href='${contextPath }/user/1/p'>Profile</a></li>
				<li><a href='${contextPath }/user/1/n'>Notice</a></li>				
			</ul>
			<!--end of 본인에게만 노출 -->
			<!-- end of menu in user page -->
			
			<p>DIMP says: ${message}</p>
			<p>
			
				<c:choose>				
					<c:when test="${tab=='b' }">
						<!-- basic edit form -->
						<div id="basicForm"> 
						
						<form id="basic" action="${contextPath }/user/${idx}/p/edit/${tab}" method="post">
						
							<h3>기본정보 수정 </h3>
							<div id="modifyLink_user">
								<a href="${contextPath }/user/1/p/edit/c">edit my career</a>
							</div>
							
							<div>
								<input type="submit" class="btn btn-primary" value="Update Profile"/>
							</div>
						</form>						
						</div>
					</c:when>
					<c:when test="${tab=='c' }">
						<!-- career edit form  -->
						<div id="careerForm">
						
						<form id="career" action="${contextPath }/user/${idx}/p/edit/${tab}" method="post">
							<h3>학력 / 경력 수정</h3>  
							<div id="modifyLink_user">
								<a href="${contextPath }/user/1/p/edit/b">edit my basic profile</a>
							</div>
							
							<div>
								<input type="submit" class="btn btn-primary" value="Update Career"/>
							</div>						
						</form>						
						</div>
					</c:when>
				</c:choose>
			</p>
		</div>
	</div>
	
	<div class='row' id="footer_container">
		<div class="col-md-12" id="footer">
			<jsp:include page="/WEB-INF/view/shared/footer.jsp" flush="true"/>
		</div>
	</div>
</div>
 
</body>
</html>