<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
/* 
if (session.getAttribute("connecte") == null
        || !((String) session.getAttribute("connecte"))
                .equals("true")) {
    String redirectURL = "/path/ToYour/login.jsp;
    response.sendRedirect(redirectURL);    
	}
 */


 
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<style>
  /* Note: Try to remove the following lines to see the effect of CSS positioning */
  .affix {
      top: 0;
      width: 100%;
  }

  .affix + .container-fluid {
      padding-top: 70px;
  }
  
  #nav {
    z-index:9999;
}

  </style>
  
<div class="container-fluid" style="background-color:#F44336;color:#fff;height:120px;">
  <!-- logo -->
  
  <%-- 
  <img alt="" src="<c:url value="/resources/images/main/logo.png"/>">
   --%>
  <h1 style='color: white;' onClick="javascript:location.href='${contextPath}';">DIMP</h1>
  
  <form class="form-inline">
    <input type="text" class="form-control" size="50" placeholder="Search with Keyword">
    <button type="button" class="btn btn-danger">Search</button>
  </form>
</div>

<nav class="navbar navbar-default" data-spy="affix" data-offset-top="120">
  <div class="container-fluid" id="nav">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
       	<span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span> 
      </button>
    </div>
     <div class="collapse navbar-collapse" id="myNavbar">
	    <ul class="nav navbar-nav">
	      <li class="active"><a href="${contextPath}">Home</a></li>
	      <li><a href="${contextPath}/advisory">기술자문</a></li>
	      <li><a href="${contextPath}/project">프로젝트</a></li> 
	    </ul>
	    
	    <ul class="nav navbar-nav navbar-right">
	      	      
			<%
			/* <!-- when not logged in --> */
			if (session.getAttribute("loginUserIdx") == null) {
				// not logged in yet.
			    /* 
			    String redirectURL = "/path/ToYour/login.jsp;
			    response.sendRedirect(redirectURL); 
			    */
			%>	       
				<li><a href="${contextPath}/signup"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
				<li><a href="${contextPath}/signin"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
	      	<%
			}else{
				/* <!-- when logged in --> */
				%>
				<li><a href="${contextPath}/new/post">DIMP It!</a></li>
				<li><a href="${contextPath}/user/<%=session.getAttribute("loginUserIdx")%>"><%=session.getAttribute("loginUserName")%></a></li>
				<li><a href="${contextPath}/logout"><span class="glyphicon glyphicon-log-out"></span> LogOut</a></li>
			<% 
			}
			%>
	    </ul>
	  </div>	    
  </div>
</nav>
