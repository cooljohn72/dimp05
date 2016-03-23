<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

	<div class="row" id="top_contatinerV2">
		<div class="col-md-8 col-sm-8" id="top_layer_fixed">
			<h1><a href="/${contextPath}" >DIMP</a></h1>
		      <ul>
				<li><a href='${contextPath}/write'>글쓰기</a></li>
				<li><a href='${contextPath}/list'>목록 보기</a></li>
				<li><a href='${contextPath}/signUp'>회원 가입</a></li>
				<li><a href='${contextPath}/user/1'>Johnathan Wonyoung Song</a></li>
				<li><a href='${contextPath}/ibatisTest'>iBatisTest</a></li>
		      </ul>
		      <!-- 
		      <span>
		      	<input type='button' class='btn btn-success' id='dimpIt' value='DIMP It!'>
		      </span>
 -->
		</div>
		<div class="col-md-4 col-sm-4">
			<input type='button' class='btn btn-success' id='dimpIt' value='DIMP It!'>
		</div>
	</div>

