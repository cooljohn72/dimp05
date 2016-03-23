<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%
/* check login id and target user id
if they are different, do not show the nav. */

%>
<%-- 
<div class='row'>
	<div class='col-md-12 col-sm-12 col-xs-12'>		
		<ul class="nav">			  
			<li><a href="${contextPath }/user/44/a">활동</a></li>
			<li><a href="${contextPath }/user/44/f">보관함</a></li>
			<li><a href="${contextPath }/user/44/p">개인정보</a></li>
			<li><a href="${contextPath }/user/44/n">알림 </a></li>
		</ul>
	</div>				
</div>
 --%>
<div class='row'>
	<div class='col-md-12 col-sm-12 col-xs-12'>
	<ul class="nav nav-tabs">			  
		<li><a href="${contextPath }/user/${targetUserIdx}/a">활동</a></li>
		<li><a href="${contextPath }/user/${targetUserIdx}/f">보관함</a></li>
		<li><a href="${contextPath }/user/${targetUserIdx}/p">개인정보</a></li>
		<li><a href="${contextPath }/user/${targetUserIdx}/n">알림 </a></li>
	</ul>
	</div>				
</div>


 <ul>
  <li><a href="#section1">개인 기본 </a></li>
  <li><a href="#section2">세부 항목 </a></li>
  <!-- 
  <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Section 4 <span class="caret"></span></a>
    <ul class="dropdown-menu">
      <li><a href="#section41">Section 4-1</a></li>
      <li><a href="#section42">Section 4-2</a></li>
    </ul>
  </li>
   -->
</ul>


</body>
</html>