<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="datatable-bottom" style="align-self: center">
	<nav class="datatable-pagination">
		<ul class="datatable-pagination-list">
			<li class="datatable-pagination-list-item">
				<c:if test="${ pageMaker.prev }">
					<a href="${ pageContext.servletContext.contextPath }/admin/adminUserBlock?pageNum=${ pageMaker.startPage -1}"
						class="datatable-pagination-list-item-link">‹</a>
				</c:if>
			</li>
			<c:forEach begin="${ pageMaker.startPage }" end="${ pageMaker.endPage }" varStatus="status">
				<c:choose>
					<c:when test="${ status.index == pageMaker.cri.pageNum }">
						<c:set scope="page" var="selectedBgColor"
							value="style='background-color:#0d6efd;'"></c:set>
					</c:when>
					<c:otherwise>
						<c:set scope="page" var="selectedBgColor" value=""></c:set>
					</c:otherwise>
				</c:choose>
				<li class="datatable-pagination-list-item">
					<a href="${pageContext.servletContext.contextPath}/admin/adminUserBlock?pageNum=${status.index}"
						class="datatable-pagination-list-item-link"
						<c:if test="${ status.index == pageMaker.cri.pageNum }">${pageScope.selectedBgColor }
						</c:if>>${ status.index }</a>
				</li>
			</c:forEach>
			<li class="datatable-pagination-list-item">
				<c:if test="${ pageMaker.next }">
					<a href="${pageContext.servletContext.contextPath}/admin/adminUserBlock?pageNum=${pageMaker.endPage + 1}"
					class="datatable-pagination-list-item-link">›</a>
				</c:if>
			</li>
		</ul>
	</nav>
</div>