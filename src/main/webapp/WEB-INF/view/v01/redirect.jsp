<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="#">
<!--[if IE]> <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script> <![endif]-->

<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script> -->
<script type="text/javascript">
function redirectPage(url){
	location.href=url;
}

redirectPage("${url}");
/* 
$.ajax({
	   type:'post',
	   url:'${url}',
	   success:function(data){
		 $('#content').html(data);
	   }
});
 */
</script>


</head>
<body>

 
</body>
</html>