<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<script type="text/javascript">

$(document).ready(function(){
	$("#comment").keydown(function(){
		var x = event.keyCode;
		
		if (x==13){
			// submit...
			alert("adding comment...");
			var data

			$.ajax({
				  type: "POST",
				  url: "/post/${idx}/comment",
				  data: data,
				  success: success,
				  dataType: dataType
				});			
		}
	});
});

</script>
 


<div id='commentList'></div>


<div id='commentInputGroup'>
<input type="text" name='comment' id='comment' placeholder='write a Comment'/>
</div>
