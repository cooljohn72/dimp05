<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <title>DIMP</title>
    <link rel="stylesheet" type="text/css" href="#">
	<!--[if IE]> <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script> <![endif]-->
 	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/layout.css"/>">
 	<link rel="stylesheet" type="text/css" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
 	
 	
</head>
<body>

<div class="container">
	<div class="row">
		<div class="col-md-12 col-sm-12" id="top_layer_fixed">
			<jsp:include page="/WEB-INF/view/shared/top.jsp" flush="true"/>
		</div>
	</div>
  	
  	<!-- content starts here -->
  	<div class="row">
  		<div class="col-md-4" id="left_sidebar">
	  		left begins here.<br>		
			<br>end of left
  		</div>
  		<div class="col-md-8" id="right_content">
  			right starts here. <br>
			<br>			
			<br>end of right.
  		</div>
  	</div>
  	
  	<!-- footer -->
  	<div class='row' id="footer_container">
		<div id="footer">
			<jsp:include page="/WEB-INF/view/shared/footer.jsp" flush="true"/>
		</div>
	</div>
  	
</div>

</body>
</html>