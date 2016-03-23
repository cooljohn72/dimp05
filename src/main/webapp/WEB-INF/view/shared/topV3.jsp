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
<%--   
<div class="container-fluid" style="background-color:#F44336;color:#fff;height:120px;">
   
   
  <img alt="" src="<c:url value="/resources/images/main/logo.png"/>">
    
  <h1 style='color: white;' onClick="javascript:location.href='${contextPath}';">DIMP</h1>
   
   
  <form class="form-inline">
    <input type="text" class="form-control" size="50" placeholder="Search with Keyword">
    <button type="button" class="btn btn-danger">Search</button>
  </form>
</div>
 --%>
 
<nav class="navbar navbar-default navbar-fixed-top" data-spy="affix" data-offset-top="0"  id='naveWrapper'>
  <div class="container" id="nav">
   
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
       	<span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span> 
      </button>
    </div>
  
     <div class="collapse navbar-collapse" id="myNavbar" >
	    <ul class="nav navbar-nav">
	      <li><a href="${contextPath}" style='font-size: 20px'>D!MP</a></li>
	      <li><a href="${contextPath}/advisory" class='gray-anchor'>기술자문</a>
	      		<c:if test="${param.show2ndLevelNavi_postListType=='a'}">
	      			<!--       
					<ul class="nav navbar-nav" style=''>				
					  <li><a href="#">전체</a></li>
					  <li><a href="#">기계</a></li> 
					  <li><a href="#">전자</a></li>
					  <li><a href="#">화학</a></li>
					  <li><a href="#">컴퓨터</a></li>
					  <li><a href="#">에너지 &#38; 환경</a></li>
					  <li><a href="#">건축</a></li>
					  <li><a href="#">기타</a></li>       
					</ul>
					 -->
				</c:if>	      
	      </li>
	      <li><a href="${contextPath}/project" class='gray-anchor'>프로젝트</a>
	      		<c:if test="${param.show2ndLevelNavi_postListType=='p'}">
	      			<!--       
					<ul class="nav navbar-nav" style=''>				
					  <li><a href="#">전체</a></li>
					  <li><a href="#">기계</a></li> 
					  <li><a href="#">전자</a></li>
					  <li><a href="#">화학</a></li>
					  <li><a href="#">컴퓨터</a></li>
					  <li><a href="#">에너지 &#38; 환경</a></li>
					  <li><a href="#">건축</a></li>
					  <li><a href="#">기타</a></li>       
					</ul>
					 -->
				</c:if>
	      </li> 
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
				<li><a href="${contextPath}/signin" class='gray-anchor'>로그인</a></li>       
				<li><a href="${contextPath}/signup" class='gray-anchor'>회원가입</a></li>
				
	      	<%
			}else{
				/* <!-- when logged in --> */
				%>
				<%-- 				
				<li><a href="${contextPath}/user/<%=session.getAttribute("loginUserIdx")%>" class='gray-anchor'><%=session.getAttribute("loginUserName")%></a></li>
				 --%>
				<li><a href="${contextPath}/user/<%=session.getAttribute("loginUserIdx")%>" class='gray-anchor'>
					${loginUser.getNickName()}</a>
					</li>
				<li><a href="${contextPath}/logout" class='gray-anchor'>로그아웃</a></li>
			<% 
			}
			/* remove request proposal button on mobile version */
			%>
			<li><button class='btn btn-default btn-sm' id='btn_dimpIt'>Request Proposals!</button></li>
	    </ul>
	    
	    <form class="navbar-form navbar-right col-md-8" role="search" action="#">
			<div class="form-group" id='search-form'>
				<!-- <input type="text" class="form-control" placeholder="Search"> -->
				<input type="text" class="form-control" placeholder="Search" id='serchInputText'>
			</div>
			<!-- <button type="submit" class="btn btn-default">Submit</button> -->
			<button type="button" id='search-button' class='btn btn-link '><span class='glyphicon glyphicon-search'></span></button>
		</form>
		
	  </div>	    
  </div>
</nav>
<%-- 
loginUser.getNickName()==null? / ${loginUser.getNickName()==null}<br>
${loginUser.getNickName()}<br>
 --%>
<script type='text/javascript'>
      // When your page loads
      $(function(){
    	$("#search-form").toggle();
         // When the toggle areas in your navbar are clicked, toggle them
        $("#search-button, #search-icon").click(function(e){
             e.preventDefault();             
             $("#search-form").toggle();
             $("#serchInputText").focus();
        });
		$("#btn_dimpIt").click(function(e){
			e.preventDefault();
			location.href="${contextPath}/new/post";
		});
		
		$("#serchInputText").keydown(function(e){
			if(e.keyCode==13){
				/* enter.. */
				alert("moving to search result....");
			}else if(e.keyCode==27){
				/* esc */
				$("#search-form").toggle();
			}
			
		});
      })  
</script>
