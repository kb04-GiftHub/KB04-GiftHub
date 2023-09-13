<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:if test="${Msg ne null}">
	<script>
		alert('${Msg}');
		location.href="${path}/${loc}";

	</script>
</c:if>
<c:if test="${Msg eq null}">
	<script>
		location.href="${path}/${loc}";
	</script>
</c:if>