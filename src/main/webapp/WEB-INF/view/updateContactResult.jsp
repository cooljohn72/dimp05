<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%

%>
<c:if test="${fn:length(contactList)>0 }">
	<c:forEach items="${contactList}" var="ctList" begin="0" end="${fn:length(contactList)-1 }">
	contactIdx; ${ctList.getIdx() } / isMain? ${ctList.isMain() } / contactNumber ; ${ctList.getContactNumber()}<br>
	</c:forEach>
</c:if>

<c:if test="${fn:length(contactList)<=0 }">
	저장된 연락처가 없습니다.
</c:if>